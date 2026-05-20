'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'
import type { GrammarLesson, Progress } from '@/types'
import { DEFAULT_PROGRESS } from '@/types'

export default function GrammarPage() {
  const [lessons, setLessons] = useState<GrammarLesson[]>([])
  const [progress, setProgress] = useState<Progress>(DEFAULT_PROGRESS)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    Promise.all([
      fetch('/api/lessons').then((r) => r.json()),
      fetch('/api/progress').then((r) => r.json()),
    ]).then(([data, p]) => {
      setLessons(data.grammar)
      setProgress(p)
      setLoading(false)
    })
  }, [])

  if (loading) return <div className="p-10" style={{ color: 'var(--muted)' }}>Đang tải...</div>

  return (
    <div className="p-10 max-w-3xl">
      <h1 className="text-2xl font-bold mb-1">📝 Bài học Grammar</h1>
      <p className="text-sm mb-6" style={{ color: 'var(--muted)' }}>
        Chọn chủ điểm để học lý thuyết và làm bài tập
      </p>

      <div className="flex flex-col gap-3">
        {lessons.map((g) => {
          const gp = progress.grammar_progress[g.title]
          const done = gp?.completed ?? false
          return (
            <Link
              key={g.id}
              href={`/grammar/${g.id}`}
              className="flex items-center gap-4 rounded-2xl px-6 py-4 transition-colors hover:border-blue-500"
              style={{ background: 'var(--card)', border: `1px solid ${done ? 'var(--success)' : 'var(--border)'}` }}
            >
              <span className="text-3xl">{g.icon}</span>
              <div className="flex-1">
                <div className="font-semibold">{g.title}</div>
                <div className="text-sm mt-0.5" style={{ color: done ? 'var(--success)' : 'var(--muted)' }}>
                  {done
                    ? `✅ Hoàn thành • Tốt nhất: ${gp.best_score}/${g.questions.length}`
                    : `Cấp độ: ${g.level} • ${g.questions.length} câu bài tập`}
                </div>
              </div>
              <span style={{ color: 'var(--accent)' }}>→</span>
            </Link>
          )
        })}
      </div>
    </div>
  )
}
