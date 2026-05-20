'use client'

import { useEffect, useState } from 'react'
import { useParams, useRouter } from 'next/navigation'
import type { Topic, Progress } from '@/types'
import { DEFAULT_PROGRESS } from '@/types'
import { updateStreak } from '@/lib/models'

export default function TopicDetailPage() {
  const { id } = useParams<{ id: string }>()
  const router = useRouter()
  const [topic, setTopic] = useState<Topic | null>(null)
  const [progress, setProgress] = useState<Progress>(DEFAULT_PROGRESS)
  const [phase, setPhase] = useState<'theory' | 'quiz' | 'result'>('theory')
  const [answers, setAnswers] = useState<number[]>([])
  const [score, setScore] = useState(0)

  useEffect(() => {
    Promise.all([
      fetch('/api/lessons').then((r) => r.json()),
      fetch('/api/progress').then((r) => r.json()),
    ]).then(([data, p]) => {
      const found = data.topics.find((t: Topic) => String(t.id) === id)
      setTopic(found ?? null)
      setProgress(p)
      setAnswers(new Array(found?.questions.length ?? 0).fill(-1))
    })
  }, [id])

  async function submit() {
    if (!topic) return
    const s = topic.questions.reduce((acc, q, i) => acc + (answers[i] === q.ans ? 1 : 0), 0)
    setScore(s)
    const updated: Progress = {
      ...progress,
      topic_progress: {
        ...progress.topic_progress,
        [topic.title]: {
          completed: true,
          best_score: Math.max(s, progress.topic_progress[topic.title]?.best_score ?? 0),
        },
      },
    }
    updateStreak(updated)
    setProgress(updated)
    await fetch('/api/progress', { method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(updated) })
    setPhase('result')
  }

  if (!topic) return <div className="p-10" style={{ color: 'var(--muted)' }}>Đang tải...</div>

  if (phase === 'theory') return (
    <div className="p-10 max-w-3xl">
      <button onClick={() => router.back()} className="text-sm mb-6" style={{ color: 'var(--muted)' }}>← Quay lại</button>
      <div className="text-3xl mb-2">{topic.icon}</div>
      <h1 className="text-2xl font-bold mb-1">{topic.title}</h1>
      <span className="text-xs px-2 py-0.5 rounded" style={{ background: 'var(--accent)20', color: 'var(--accent)' }}>{topic.level}</span>
      <div className="rounded-2xl p-6 mt-6 text-sm leading-7 whitespace-pre-wrap"
        style={{ background: 'var(--card)', border: '1px solid var(--border)', color: 'var(--text)' }}>
        {topic.theory}
      </div>
      <button onClick={() => setPhase('quiz')} className="mt-6 px-8 py-3 rounded-xl font-semibold text-white" style={{ background: 'var(--accent)' }}>
        Làm bài tập →
      </button>
    </div>
  )

  if (phase === 'quiz') return (
    <div className="p-10 max-w-3xl">
      <h2 className="text-xl font-bold mb-6">Bài tập: {topic.title}</h2>
      <div className="flex flex-col gap-5">
        {topic.questions.map((q, i) => (
          <div key={i} className="rounded-2xl p-5" style={{ background: 'var(--card)', border: '1px solid var(--border)' }}>
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
      <button onClick={submit} className="mt-6 px-8 py-3 rounded-xl font-semibold text-white" style={{ background: 'var(--success)' }}>
        📤 Nộp bài
      </button>
    </div>
  )

  const pct = Math.round((score / topic.questions.length) * 100)
  const grade = pct >= 90 ? '🌟 Xuất sắc!' : pct >= 75 ? '👏 Giỏi!' : pct >= 50 ? '📖 Cần ôn thêm' : '💪 Cố gắng hơn!'

  return (
    <div className="p-10 max-w-3xl">
      <h2 className="text-2xl font-bold mb-6">📊 Kết quả</h2>
      <div className="rounded-2xl p-8 text-center mb-6" style={{ background: 'var(--success)10', border: '1px solid var(--success)30' }}>
        <div className="text-xl font-bold mb-2" style={{ color: 'var(--success)' }}>{grade}</div>
        <div className="text-5xl font-bold mb-1">{score} / {topic.questions.length}</div>
        <div className="text-sm mb-4" style={{ color: 'var(--muted)' }}>{pct}%</div>
        <div className="w-full rounded-full h-2" style={{ background: 'var(--border)' }}>
          <div className="h-2 rounded-full" style={{ width: `${pct}%`, background: pct >= 75 ? 'var(--success)' : pct >= 50 ? 'var(--warning)' : 'var(--danger)' }} />
        </div>
      </div>
      <div className="flex gap-3">
        <button onClick={() => { setAnswers(new Array(topic.questions.length).fill(-1)); setPhase('quiz') }}
          className="px-6 py-2.5 rounded-xl text-sm font-medium text-white" style={{ background: 'var(--accent)' }}>🔄 Làm lại</button>
        <button onClick={() => router.push('/topic')}
          className="px-6 py-2.5 rounded-xl text-sm font-medium" style={{ background: 'var(--card)', border: '1px solid var(--border)', color: 'var(--text)' }}>← Danh sách</button>
      </div>
    </div>
  )
}
