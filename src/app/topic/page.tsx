'use client'

import { useEffect, useState } from 'react'
import Link from 'next/link'
import type { Topic, Progress } from '@/types'
import { DEFAULT_PROGRESS } from '@/types'

export default function TopicPage() {
  const [topics, setTopics] = useState<Topic[]>([])
  const [progress, setProgress] = useState<Progress>(DEFAULT_PROGRESS)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    Promise.all([
      fetch('/api/lessons').then((r) => r.json()),
      fetch('/api/progress').then((r) => r.json()),
    ]).then(([data, p]) => {
      setTopics(data.topics)
      setProgress(p)
      setLoading(false)
    })
  }, [])

  if (loading) return <div className="p-10" style={{ color: 'var(--muted)' }}>Đang tải...</div>

  return (
    <div className="p-10 max-w-3xl">
      <h1 className="text-2xl font-bold mb-1">🌍 Bài học theo chủ đề</h1>
      <p className="text-sm mb-6" style={{ color: 'var(--muted)' }}>Học từ vựng và kiến thức theo từng chủ đề</p>
      <div className="flex flex-col gap-3">
        {topics.map((t) => {
          const tp = progress.topic_progress[t.title]
          const done = tp?.completed ?? false
          return (
            <Link
              key={t.id}
              href={`/topic/${t.id}`}
              className="flex items-center gap-4 rounded-2xl px-6 py-4 transition-colors hover:border-blue-500"
              style={{ background: 'var(--card)', border: `1px solid ${done ? 'var(--success)' : 'var(--border)'}` }}
            >
              <span className="text-3xl">{t.icon}</span>
              <div className="flex-1">
                <div className="font-semibold">{t.title}</div>
                <div className="text-sm mt-0.5" style={{ color: done ? 'var(--success)' : 'var(--muted)' }}>
                  {done
                    ? `✅ Hoàn thành • Tốt nhất: ${tp.best_score}/${t.questions.length}`
                    : `Cấp độ: ${t.level} • ${t.questions.length} câu`}
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
