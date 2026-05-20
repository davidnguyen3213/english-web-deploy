'use client'

import { useEffect, useState, useCallback } from 'react'
import type { Progress, Vocab } from '@/types'
import { DEFAULT_PROGRESS } from '@/types'
import { nextReview, updateStreak } from '@/lib/models'

type Mode = 'all' | 'due' | 'new' | 'level'
const LEVELS = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2']

function shuffle<T>(arr: T[]): T[] {
  return [...arr].sort(() => Math.random() - 0.5)
}

export default function FlashcardPage() {
  const [vocab, setVocab] = useState<Vocab[]>([])
  const [progress, setProgress] = useState<Progress>(DEFAULT_PROGRESS)
  const [mode, setMode] = useState<Mode>('all')
  const [level, setLevel] = useState('A1')
  const [cards, setCards] = useState<Vocab[]>([])
  const [idx, setIdx] = useState(0)
  const [flipped, setFlipped] = useState(false)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    Promise.all([
      fetch('/api/vocabulary').then((r) => r.json()),
      fetch('/api/progress').then((r) => r.json()),
    ]).then(([v, p]) => {
      setVocab(v)
      setProgress(p)
      setLoading(false)
    })
  }, [])

  const buildCards = useCallback(() => {
    const today = new Date().toISOString().split('T')[0]
    let filtered: Vocab[]
    if (mode === 'all') filtered = vocab
    else if (mode === 'due')
      filtered = vocab.filter((w) => {
        const wp = progress.vocab_progress[w.word]
        return (wp?.next_review ?? today) <= today
      })
    else if (mode === 'new')
      filtered = vocab.filter((w) => !progress.vocab_progress[w.word])
    else filtered = vocab.filter((w) => w.level === level)

    setCards(shuffle(filtered.length ? filtered : [{ word: 'Không có từ', meaning: 'Chọn chế độ khác', phonetic: '', example: '', level: '' }]))
    setIdx(0)
    setFlipped(false)
  }, [vocab, progress, mode, level])

  useEffect(() => {
    if (!loading) buildCards()
  }, [loading, buildCards])

  const current = cards[idx]

  async function rate(rating: number) {
    if (!current) return
    const correct = rating >= 1
    const wp = progress.vocab_progress[current.word] ?? { srs_level: 0, reviews: 0, next_review: '' }
    const { level: newLevel, date } = nextReview(wp.srs_level, correct)
    const updated: Progress = {
      ...progress,
      vocab_progress: {
        ...progress.vocab_progress,
        [current.word]: { srs_level: newLevel, next_review: date, reviews: (wp.reviews ?? 0) + 1 },
      },
    }
    updateStreak(updated)
    setProgress(updated)
    await fetch('/api/progress', { method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(updated) })
    setIdx((i) => (i + 1) % cards.length)
    setFlipped(false)
  }

  function speak() {
    if (!current || !window.speechSynthesis) return
    const u = new SpeechSynthesisUtterance(current.word)
    u.lang = 'en-US'
    window.speechSynthesis.speak(u)
  }

  if (loading) return <div className="p-10" style={{ color: 'var(--muted)' }}>Đang tải...</div>
  if (!current) return null

  const wp = progress.vocab_progress[current.word]

  return (
    <div className="p-10 max-w-2xl">
      <div className="flex items-center gap-3 mb-6">
        <h1 className="text-2xl font-bold flex-1">📚 Flashcard</h1>
        <select
          value={mode}
          onChange={(e) => setMode(e.target.value as Mode)}
          className="rounded-lg px-3 py-1.5 text-sm"
          style={{ background: 'var(--card)', color: 'var(--text)', border: '1px solid var(--border)' }}
        >
          <option value="all">Tất cả từ</option>
          <option value="due">Cần ôn hôm nay</option>
          <option value="new">Chưa học</option>
          <option value="level">Theo cấp độ</option>
        </select>
        {mode === 'level' && (
          <select
            value={level}
            onChange={(e) => setLevel(e.target.value)}
            className="rounded-lg px-3 py-1.5 text-sm"
            style={{ background: 'var(--card)', color: 'var(--text)', border: '1px solid var(--border)' }}
          >
            {LEVELS.map((l) => <option key={l}>{l}</option>)}
          </select>
        )}
      </div>

      <div className="text-sm mb-2" style={{ color: 'var(--muted)' }}>
        {idx + 1} / {cards.length}
      </div>
      <div className="w-full rounded-full h-1.5 mb-6" style={{ background: 'var(--border)' }}>
        <div className="h-1.5 rounded-full transition-all" style={{ width: `${((idx + 1) / cards.length) * 100}%`, background: 'var(--accent)' }} />
      </div>

      <div
        onClick={() => !flipped && setFlipped(true)}
        className="rounded-2xl p-10 text-center mb-5 cursor-pointer select-none transition-all"
        style={{ background: 'var(--card)', border: '1px solid var(--border)', minHeight: 260 }}
      >
        <div className="flex justify-center gap-2 mb-4">
          {current.level && (
            <span className="text-xs px-2 py-0.5 rounded" style={{ background: 'var(--accent)20', color: 'var(--accent)' }}>
              {current.level}
            </span>
          )}
          {wp ? (
            <span className="text-xs px-2 py-0.5 rounded" style={{ background: 'var(--success)20', color: 'var(--success)' }}>
              Lần ôn {wp.reviews} • Tiếp: {wp.next_review}
            </span>
          ) : (
            <span className="text-xs px-2 py-0.5 rounded" style={{ background: 'var(--warning)20', color: 'var(--warning)' }}>
              Từ mới
            </span>
          )}
        </div>

        <div className="text-4xl font-bold mb-2">{current.word.toUpperCase()}</div>
        <div className="text-base mb-4" style={{ color: 'var(--muted)' }}>{current.phonetic}</div>

        {!flipped ? (
          <div className="text-sm" style={{ color: 'var(--muted)' }}>👆 Nhấn để lật thẻ</div>
        ) : (
          <>
            <div className="text-2xl font-semibold mb-2" style={{ color: 'var(--success)' }}>{current.meaning}</div>
            <div className="text-sm italic" style={{ color: 'var(--muted)' }}>{current.example}</div>
          </>
        )}
      </div>

      {flipped && (
        <div className="grid grid-cols-3 gap-3 mb-5">
          {[
            { label: '😕 Khó', bg: 'var(--danger)', rating: 0 },
            { label: '🤔 Ổn', bg: 'var(--warning)', rating: 1 },
            { label: '😊 Dễ', bg: 'var(--success)', rating: 2 },
          ].map((b) => (
            <button
              key={b.label}
              onClick={() => rate(b.rating)}
              className="py-2.5 rounded-xl text-sm font-medium text-white transition-opacity hover:opacity-80"
              style={{ background: b.bg }}
            >
              {b.label}
            </button>
          ))}
        </div>
      )}

      <div className="flex gap-3">
        <button onClick={() => { setIdx((i) => (i - 1 + cards.length) % cards.length); setFlipped(false) }}
          className="px-4 py-2 rounded-xl text-sm" style={{ background: 'var(--card)', border: '1px solid var(--border)', color: 'var(--text)' }}>
          ← Trước
        </button>
        <button onClick={speak}
          className="px-4 py-2 rounded-xl text-sm" style={{ background: 'var(--accent2)', color: '#fff' }}>
          🔊 Nghe
        </button>
        <div className="flex-1" />
        <button onClick={buildCards}
          className="px-4 py-2 rounded-xl text-sm" style={{ background: 'var(--card)', border: '1px solid var(--border)', color: 'var(--text)' }}>
          🔀 Trộn
        </button>
        <button onClick={() => { setIdx((i) => (i + 1) % cards.length); setFlipped(false) }}
          className="px-4 py-2 rounded-xl text-sm text-white" style={{ background: 'var(--accent)' }}>
          Tiếp →
        </button>
      </div>
    </div>
  )
}
