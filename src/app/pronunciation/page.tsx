'use client'

import { useEffect, useState, useRef } from 'react'
import type { Vocab } from '@/types'

interface SpeechRecognitionEvent extends Event {
  results: SpeechRecognitionResultList
}

interface SpeechRecognitionInstance extends EventTarget {
  lang: string
  interimResults: boolean
  maxAlternatives: number
  start(): void
  onstart: ((this: SpeechRecognitionInstance, ev: Event) => void) | null
  onend: ((this: SpeechRecognitionInstance, ev: Event) => void) | null
  onresult: ((this: SpeechRecognitionInstance, ev: SpeechRecognitionEvent) => void) | null
  onerror: ((this: SpeechRecognitionInstance, ev: Event) => void) | null
}

declare global {
  interface Window {
    SpeechRecognition: new () => SpeechRecognitionInstance
    webkitSpeechRecognition: new () => SpeechRecognitionInstance
  }
}

export default function PronunciationPage() {
  const [vocab, setVocab] = useState<Vocab[]>([])
  const [idx, setIdx] = useState(0)
  const [result, setResult] = useState<'idle' | 'correct' | 'wrong'>('idle')
  const [heard, setHeard] = useState('')
  const [listening, setListening] = useState(false)
  const recRef = useRef<SpeechRecognitionInstance | null>(null)

  useEffect(() => {
    fetch('/api/vocabulary').then((r) => r.json()).then((data) => {
      setVocab(data.sort(() => Math.random() - 0.5))
    })
  }, [])

  const current = vocab[idx]

  function speak() {
    if (!current || !window.speechSynthesis) return
    const u = new SpeechSynthesisUtterance(current.word)
    u.lang = 'en-US'
    window.speechSynthesis.speak(u)
  }

  function startListening() {
    const SR = window.SpeechRecognition || window.webkitSpeechRecognition
    if (!SR) {
      alert('Trình duyệt không hỗ trợ nhận dạng giọng nói. Dùng Chrome.')
      return
    }
    const rec: SpeechRecognitionInstance = new SR()
    rec.lang = 'en-US'
    rec.interimResults = false
    rec.maxAlternatives = 1
    rec.onstart = () => setListening(true)
    rec.onend = () => setListening(false)
    rec.onresult = (e) => {
      const spoken = e.results[0][0].transcript.toLowerCase().trim()
      setHeard(spoken)
      setResult(spoken === current.word.toLowerCase() ? 'correct' : 'wrong')
    }
    rec.onerror = () => setListening(false)
    recRef.current = rec
    rec.start()
  }

  function next() {
    setIdx((i) => (i + 1) % vocab.length)
    setResult('idle')
    setHeard('')
  }

  if (!current) return <div className="p-10" style={{ color: 'var(--muted)' }}>Đang tải...</div>

  return (
    <div className="p-10 max-w-2xl">
      <h1 className="text-2xl font-bold mb-1">🎤 Luyện phát âm</h1>
      <p className="text-sm mb-8" style={{ color: 'var(--muted)' }}>Đọc to từ bên dưới — trình duyệt sẽ nhận dạng giọng nói của bạn</p>

      <div className="rounded-2xl p-10 text-center mb-6"
        style={{ background: 'var(--card)', border: `2px solid ${result === 'correct' ? 'var(--success)' : result === 'wrong' ? 'var(--danger)' : 'var(--border)'}` }}>
        <div className="text-5xl font-bold mb-2">{current.word.toUpperCase()}</div>
        <div className="text-base mb-1" style={{ color: 'var(--muted)' }}>{current.phonetic}</div>
        <div className="text-lg mb-6" style={{ color: 'var(--success)' }}>{current.meaning}</div>
        <div className="text-sm italic mb-8" style={{ color: 'var(--muted)' }}>{current.example}</div>

        {result === 'idle' && <div className="text-sm" style={{ color: 'var(--muted)' }}>Nhấn nút mic để bắt đầu nói</div>}
        {result === 'correct' && <div className="text-lg font-bold" style={{ color: 'var(--success)' }}>✅ Chính xác! "{heard}"</div>}
        {result === 'wrong' && (
          <div>
            <div className="text-lg font-bold" style={{ color: 'var(--danger)' }}>❌ Chưa đúng</div>
            <div className="text-sm mt-1" style={{ color: 'var(--muted)' }}>Bạn nói: "{heard}" • Cần: "{current.word}"</div>
          </div>
        )}
      </div>

      <div className="flex gap-3 justify-center">
        <button onClick={speak} className="px-5 py-2.5 rounded-xl text-sm font-medium text-white" style={{ background: 'var(--accent2)' }}>
          🔊 Nghe mẫu
        </button>
        <button onClick={startListening} disabled={listening}
          className="px-5 py-2.5 rounded-xl text-sm font-medium text-white disabled:opacity-50"
          style={{ background: listening ? 'var(--danger)' : 'var(--accent)' }}>
          {listening ? '🎙 Đang nghe...' : '🎤 Nói'}
        </button>
        <button onClick={next} className="px-5 py-2.5 rounded-xl text-sm font-medium"
          style={{ background: 'var(--card)', border: '1px solid var(--border)', color: 'var(--text)' }}>
          Từ tiếp →
        </button>
      </div>

      <div className="mt-4 text-center text-xs" style={{ color: 'var(--muted)' }}>
        {idx + 1} / {vocab.length} • Dùng Chrome để nhận dạng giọng nói tốt nhất
      </div>
    </div>
  )
}
