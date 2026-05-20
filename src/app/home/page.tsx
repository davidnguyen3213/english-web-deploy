'use client'

import { useEffect, useState } from 'react'
import type { Progress, Vocab } from '@/types'
import { DEFAULT_PROGRESS, } from '@/types'
import { wordsDueToday } from '@/lib/models'

export default function HomePage() {
  const [progress, setProgress] = useState<Progress>(DEFAULT_PROGRESS)
  const [vocab, setVocab] = useState<Vocab[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    Promise.all([
      fetch('/api/progress').then((r) => r.json()),
      fetch('/api/vocabulary').then((r) => r.json()),
    ]).then(([p, v]) => {
      setProgress(p)
      setVocab(v)
      setLoading(false)
    })
  }, [])

  const due = wordsDueToday(vocab, progress)
  const stats = progress.stats
  const learned = Object.keys(progress.vocab_progress).length
  const doneGrammar = Object.keys(progress.grammar_progress).length

  const tasks: string[] = []
  if (due.length) tasks.push(`🔁 Ôn ${due.length} từ vựng đến hạn`)
  if (learned < vocab.length) tasks.push(`📚 Còn ${vocab.length - learned} từ chưa học`)
  if (!tasks.length) tasks.push('🌟 Tuyệt vời! Bạn đã hoàn thành tất cả hôm nay!')
  tasks.push('🎯 Làm 1 bài Mixed Test')

  const cards = [
    { icon: '🔥', val: stats.streak + ' ngày', name: 'Streak', color: 'var(--warning)' },
    { icon: '📚', val: String(due.length), name: 'Cần ôn hôm nay', color: 'var(--accent)' },
    { icon: '✅', val: String(stats.total_correct), name: 'Trả lời đúng', color: 'var(--success)' },
    { icon: '📖', val: String(vocab.length), name: 'Tổng từ vựng', color: 'var(--muted)' },
  ]

  if (loading) return <div className="p-10" style={{ color: 'var(--muted)' }}>Đang tải...</div>

  return (
    <div className="p-10 max-w-4xl">
      <h1 className="text-2xl font-bold mb-1">📊 Tổng quan</h1>
      <p className="text-sm mb-6" style={{ color: 'var(--muted)' }}>
        Hôm nay: {new Date().toLocaleDateString('vi-VN')}
      </p>

      <div className="grid grid-cols-4 gap-4 mb-6">
        {cards.map((c) => (
          <div
            key={c.name}
            className="rounded-2xl p-5"
            style={{ background: 'var(--card)', border: '1px solid var(--border)' }}
          >
            <div className="text-2xl mb-1">{c.icon}</div>
            <div className="text-2xl font-bold" style={{ color: c.color }}>{c.val}</div>
            <div className="text-xs mt-1" style={{ color: 'var(--muted)' }}>{c.name}</div>
          </div>
        ))}
      </div>

      <div
        className="rounded-2xl p-6 mb-5"
        style={{ background: 'var(--accent)10', border: '1px solid var(--accent)30' }}
      >
        <div className="font-semibold mb-3" style={{ color: 'var(--accent)' }}>
          📋 Việc cần làm hôm nay
        </div>
        {tasks.map((t) => (
          <div key={t} className="text-sm py-1" style={{ color: 'var(--text)' }}>{t}</div>
        ))}
      </div>

      <div
        className="rounded-2xl p-5"
        style={{ background: 'var(--card)', border: '1px solid var(--border)' }}
      >
        <div className="font-semibold mb-2" style={{ color: 'var(--warning)' }}>
          💡 Mẹo: Spaced Repetition
        </div>
        <div className="text-sm" style={{ color: 'var(--muted)' }}>
          Từ trả lời đúng → ôn lại sau 3→7→14→30 ngày. Từ sai → ôn lại ngày mai.
        </div>
      </div>
    </div>
  )
}
