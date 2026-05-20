'use client'

import { useEffect, useState, useRef } from 'react'
import type { TestQuestion, Progress } from '@/types'
import { DEFAULT_PROGRESS } from '@/types'
import { updateStreak } from '@/lib/models'

type Phase = 'intro' | 'quiz' | 'result'

const TYPE_COLOR: Record<string, string> = {
  grammar: 'var(--accent)',
  vocab: 'var(--accent2)',
  reading: 'var(--warning)',
}
const TYPE_LABEL: Record<string, string> = {
  grammar: '📝 Grammar',
  vocab: '📚 Vocab',
  reading: '📖 Reading',
}

function shuffle<T>(arr: T[]): T[] {
  return [...arr].sort(() => Math.random() - 0.5)
}

export default function TestPage() {
  const [bank, setBank] = useState<TestQuestion[]>([])
  const [progress, setProgress] = useState<Progress>(DEFAULT_PROGRESS)
  const [phase, setPhase] = useState<Phase>('intro')
  const [questions, setQuestions] = useState<TestQuestion[]>([])
  const [answers, setAnswers] = useState<number[]>([])
  const [timeLeft, setTimeLeft] = useState(0)
  const [timeLimit, setTimeLimit] = useState(0)
  const [score, setScore] = useState(0)
  const timerRef = useRef<ReturnType<typeof setInterval> | null>(null)

  useEffect(() => {
    Promise.all([
      fetch('/api/testbank').then((r) => r.json()),
      fetch('/api/progress').then((r) => r.json()),
    ]).then(([b, p]) => { setBank(b); setProgress(p) })
    return () => { if (timerRef.current) clearInterval(timerRef.current) }
  }, [])

  function start(n: number, tlim: number) {
    const qs = shuffle(bank).slice(0, n)
    setQuestions(qs)
    setAnswers(new Array(qs.length).fill(-1))
    setTimeLimit(tlim)
    setTimeLeft(tlim)
    setPhase('quiz')
    if (tlim > 0) {
      timerRef.current = setInterval(() => {
        setTimeLeft((t) => {
          if (t <= 1) { clearInterval(timerRef.current!); submit(qs, new Array(qs.length).fill(-1)); return 0 }
          return t - 1
        })
      }, 1000)
    }
  }

  async function submit(qs = questions, ans = answers) {
    if (timerRef.current) clearInterval(timerRef.current)
    const s = qs.reduce((acc, q, i) => acc + (ans[i] === q.ans ? 1 : 0), 0)
    setScore(s)
    const updated: Progress = {
      ...progress,
      stats: {
        ...progress.stats,
        total_correct: progress.stats.total_correct + s,
        total_answered: progress.stats.total_answered + qs.length,
      },
    }
    updateStreak(updated)
    setProgress(updated)
    await fetch('/api/progress', { method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(updated) })
    setPhase('result')
  }

  if (phase === 'intro') return (
    <div className="p-10 max-w-3xl">
      <h1 className="text-2xl font-bold mb-1">🎯 Mixed Test</h1>
      <p className="text-sm mb-8" style={{ color: 'var(--muted)' }}>Kiểm tra tổng hợp: Grammar + Từ vựng + Reading</p>
      <div className="flex flex-col gap-4">
        {[
          { icon: '⚡', name: 'Quick Test', desc: '10 câu ngẫu nhiên • 5 phút', n: 10, t: 300 },
          { icon: '📋', name: 'Standard Test', desc: '20 câu hỗn hợp • 10 phút', n: 20, t: 600 },
          { icon: '🏆', name: 'Full Test', desc: `Toàn bộ ${bank.length} câu • Không giới hạn`, n: bank.length, t: 0 },
        ].map((opt) => (
          <div key={opt.name} className="flex items-center gap-4 rounded-2xl px-6 py-5"
            style={{ background: 'var(--card)', border: '1px solid var(--border)' }}>
            <span className="text-3xl">{opt.icon}</span>
            <div className="flex-1">
              <div className="font-semibold">{opt.name}</div>
              <div className="text-sm" style={{ color: 'var(--muted)' }}>{opt.desc}</div>
            </div>
            <button onClick={() => start(opt.n, opt.t)}
              className="px-5 py-2 rounded-xl text-sm font-medium text-white" style={{ background: 'var(--accent)' }}>
              Bắt đầu →
            </button>
          </div>
        ))}
      </div>
    </div>
  )

  if (phase === 'quiz') {
    const m = Math.floor(timeLeft / 60)
    const s = timeLeft % 60
    return (
      <div className="p-10 max-w-3xl">
        <div className="flex items-center mb-6">
          <h2 className="text-xl font-bold flex-1">🎯 Mixed Test — {questions.length} câu</h2>
          {timeLimit > 0 && (
            <span className="font-bold" style={{ color: timeLeft <= 30 ? 'var(--danger)' : 'var(--warning)' }}>
              ⏱ {m.toString().padStart(2, '0')}:{s.toString().padStart(2, '0')}
            </span>
          )}
        </div>
        <div className="flex flex-col gap-5 overflow-y-auto max-h-[70vh] pr-1">
          {questions.map((q, i) => (
            <div key={i} className="rounded-2xl p-5"
              style={{ background: 'var(--card)', borderLeft: `4px solid ${TYPE_COLOR[q.type] ?? 'var(--accent)'}`, border: `1px solid var(--border)`, borderLeftWidth: 4 }}>
              <div className="text-xs font-bold mb-2" style={{ color: TYPE_COLOR[q.type] }}>{TYPE_LABEL[q.type]}</div>
              <div className="font-semibold mb-3">Câu {i + 1}: {q.q}</div>
              {q.opts.map((opt, j) => (
                <label key={j} className="flex items-center gap-2 py-1.5 cursor-pointer text-sm">
                  <input type="radio" name={`q${i}`} checked={answers[i] === j}
                    onChange={() => setAnswers((a) => { const n = [...a]; n[i] = j; return n })} className="accent-blue-500" />
                  {opt}
                </label>
              ))}
            </div>
          ))}
        </div>
        <button onClick={() => submit()} className="mt-6 px-8 py-3 rounded-xl font-semibold text-white" style={{ background: 'var(--success)' }}>
          📤 Nộp bài
        </button>
      </div>
    )
  }

  const pct = Math.round((score / questions.length) * 100)
  const grade = pct >= 90 ? '🌟 Xuất sắc!' : pct >= 75 ? '👏 Giỏi!' : pct >= 50 ? '📖 Cần ôn thêm' : '💪 Cố gắng hơn!'

  return (
    <div className="p-10 max-w-3xl">
      <h2 className="text-2xl font-bold mb-6">📊 Kết quả</h2>
      <div className="rounded-2xl p-8 text-center mb-6" style={{ background: 'var(--success)10', border: '1px solid var(--success)30' }}>
        <div className="text-xl font-bold mb-2" style={{ color: 'var(--success)' }}>{grade}</div>
        <div className="text-5xl font-bold mb-1">{score} / {questions.length}</div>
        <div className="text-sm mb-4" style={{ color: 'var(--muted)' }}>{pct}%</div>
        <div className="w-full rounded-full h-2" style={{ background: 'var(--border)' }}>
          <div className="h-2 rounded-full" style={{ width: `${pct}%`, background: pct >= 75 ? 'var(--success)' : pct >= 50 ? 'var(--warning)' : 'var(--danger)' }} />
        </div>
      </div>
      <div className="flex flex-col gap-3 max-h-96 overflow-y-auto mb-6">
        {questions.map((q, i) => {
          const ok = answers[i] === q.ans
          return (
            <div key={i} className="rounded-xl p-4 text-sm"
              style={{ background: ok ? 'var(--success)10' : 'var(--danger)10', border: `1px solid ${ok ? 'var(--success)' : 'var(--danger)'}30` }}>
              <div className="font-semibold mb-1">{ok ? '✅' : '❌'} Câu {i + 1}: {q.q.slice(0, 70)}{q.q.length > 70 ? '...' : ''}</div>
              {!ok && <div style={{ color: 'var(--danger)' }}>Bạn chọn: {answers[i] >= 0 ? q.opts[answers[i]] : 'Chưa chọn'}</div>}
              {!ok && <div style={{ color: 'var(--success)' }}>Đáp án: {q.opts[q.ans]}</div>}
              <div style={{ color: 'var(--muted)' }}>💡 {q.exp}</div>
            </div>
          )
        })}
      </div>
      <button onClick={() => setPhase('intro')} className="px-8 py-3 rounded-xl font-semibold text-white" style={{ background: 'var(--accent)' }}>
        🔄 Làm lại
      </button>
    </div>
  )
}
