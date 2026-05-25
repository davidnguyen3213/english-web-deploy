'use client'

import { useEffect, useRef, useState, useCallback } from 'react'

interface Message {
  role: 'user' | 'assistant'
  content: string
}

interface ChatWidgetProps {
  lessonTitle: string
  lessonTheory: string
  questions?: { q: string; opts: string[]; ans: number; exp: string }[]
}

export default function ChatWidget({ lessonTitle, lessonTheory, questions }: ChatWidgetProps) {
  const [open, setOpen] = useState(false)
  const [messages, setMessages] = useState<Message[]>([])
  const [input, setInput] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const bottomRef = useRef<HTMLDivElement>(null)
  const inputRef = useRef<HTMLInputElement>(null)
  const inputValueRef = useRef('')

  useEffect(() => {
    if (open) inputRef.current?.focus()
  }, [open])

  useEffect(() => {
    bottomRef.current?.scrollIntoView({ behavior: 'smooth' })
  }, [messages])

  const send = useCallback(async () => {
    const msg = inputValueRef.current.trim()
    if (!msg || loading) return
    setInput('')
    inputValueRef.current = ''
    setError('')
    setMessages((prev) => [...prev, { role: 'user', content: msg }])
    setLoading(true)

    const userMessage = msg
    setMessages((prev) => [...prev, { role: 'assistant', content: '' }])

    try {
      const res = await fetch('/api/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ userMessage, lessonTitle, lessonTheory, questions }),
      })

      if (!res.ok) {
        const err = await res.json()
        throw new Error(err.error || 'Lỗi không xác định')
      }

      const reader = res.body?.getReader()
      if (!reader) throw new Error('Không thể đọc response')

      const decoder = new TextDecoder()
      let buffer = ''
      while (true) {
        const { done, value } = await reader.read()
        if (done) break
        buffer += decoder.decode(value, { stream: true })
        const lines = buffer.split('\n')
        buffer = lines.pop() || ''
        for (const line of lines) {
          const trimmed = line.trim()
          if (!trimmed || !trimmed.startsWith('data: ')) continue
          try {
            const json = JSON.parse(trimmed.slice(6))
            if (json.text) {
              setMessages((prev) => {
                const next = [...prev]
                const last = next[next.length - 1]
                if (last.role === 'assistant') {
                  next[next.length - 1] = { ...last, content: last.content + json.text }
                }
                return next
              })
            }
          } catch {
            // skip
          }
        }
      }
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Lỗi kết nối')
      setMessages((prev) => prev.slice(0, -1))
    } finally {
      setLoading(false)
    }
  }, [loading, lessonTitle, lessonTheory, questions])

  return (
    <>
      <button
        onClick={() => setOpen(true)}
        style={{
          position: 'fixed',
          bottom: 24,
          right: 24,
          width: 56,
          height: 56,
          borderRadius: '50%',
          background: 'var(--accent)',
          border: 'none',
          cursor: 'pointer',
          fontSize: 24,
          zIndex: 1000,
          boxShadow: '0 4px 12px rgba(0,0,0,0.15)',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
        }}
        aria-label="Chat với AI"
      >
        🧠
      </button>

      {open && (
        <div
          style={{
            position: 'fixed',
            bottom: 24,
            right: 24,
            width: 400,
            maxWidth: 'calc(100vw - 48px)',
            height: 560,
            maxHeight: 'calc(100vh - 120px)',
            background: 'var(--bg)',
            border: '1px solid var(--border)',
            borderRadius: 16,
            boxShadow: '0 8px 32px rgba(0,0,0,0.2)',
            zIndex: 1001,
            display: 'flex',
            flexDirection: 'column',
            overflow: 'hidden',
          }}
        >
          <div
            style={{
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'space-between',
              padding: '14px 16px',
              borderBottom: '1px solid var(--border)',
              background: 'var(--card)',
              borderTopLeftRadius: 16,
              borderTopRightRadius: 16,
            }}
          >
            <span style={{ fontWeight: 600, fontSize: 15, color: 'var(--text)' }}>
              🧠 Trợ giảng AI
            </span>
            <button
              onClick={() => setOpen(false)}
              style={{
                background: 'none',
                border: 'none',
                cursor: 'pointer',
                fontSize: 18,
                color: 'var(--muted)',
                padding: 4,
                lineHeight: 1,
              }}
              aria-label="Đóng chat"
            >
              ✕
            </button>
          </div>

          <div
            style={{
              flex: 1,
              overflowY: 'auto',
              padding: '12px 16px',
              display: 'flex',
              flexDirection: 'column',
              gap: 10,
            }}
          >
            {messages.length === 0 && (
              <div style={{ color: 'var(--muted)', fontSize: 14, textAlign: 'center', marginTop: 40, lineHeight: 1.6 }}>
                Hỏi AI về bài học này<br />
                Ví dụ: "Giải thích lại thì hiện tại đơn"
              </div>
            )}
            {messages.map((m, i) => (
              <div
                key={i}
                style={{
                  maxWidth: '85%',
                  padding: '10px 14px',
                  borderRadius: 14,
                  fontSize: 14,
                  lineHeight: 1.5,
                  whiteSpace: 'pre-wrap',
                  wordBreak: 'break-word',
                  alignSelf: m.role === 'user' ? 'flex-end' : 'flex-start',
                  background: m.role === 'user' ? 'var(--accent)' : 'var(--card)',
                  color: m.role === 'user' ? '#fff' : 'var(--text)',
                  border: m.role === 'assistant' ? '1px solid var(--border)' : 'none',
                }}
              >
                {m.content}
                {loading && i === messages.length - 1 && m.content === '' && (
                  <span style={{ display: 'inline-block', animation: 'pulse 1s infinite' }}>...</span>
                )}
              </div>
            ))}
            {error && (
              <div
                style={{
                  padding: '10px 14px',
                  borderRadius: 14,
                  fontSize: 13,
                  background: 'var(--danger)10',
                  color: 'var(--danger)',
                  border: '1px solid var(--danger)30',
                }}
              >
                {error}
              </div>
            )}
            <div ref={bottomRef} />
          </div>

          <div
            style={{
              display: 'flex',
              gap: 8,
              padding: '12px 16px',
              borderTop: '1px solid var(--border)',
              background: 'var(--card)',
              borderBottomLeftRadius: 16,
              borderBottomRightRadius: 16,
            }}
          >
            <input
              ref={inputRef}
              value={input}
              onChange={(e) => { setInput(e.target.value); inputValueRef.current = e.target.value }}
              onKeyDown={(e) => { if (e.key === 'Enter' && !e.shiftKey) { e.preventDefault(); send() } }}
              placeholder="Nhập câu hỏi..."
              disabled={loading}
              style={{
                flex: 1,
                padding: '10px 14px',
                borderRadius: 10,
                border: '1px solid var(--border)',
                background: 'var(--bg)',
                color: 'var(--text)',
                fontSize: 14,
                outline: 'none',
              }}
            />
            <button
              onClick={send}
              disabled={loading || !input.trim()}
              style={{
                padding: '10px 16px',
                borderRadius: 10,
                border: 'none',
                background: loading || !input.trim() ? 'var(--muted)' : 'var(--accent)',
                color: '#fff',
                fontWeight: 600,
                fontSize: 14,
                cursor: loading || !input.trim() ? 'default' : 'pointer',
              }}
            >
              Gửi
            </button>
          </div>
        </div>
      )}

      <style>{`
        @keyframes pulse {
          0%, 100% { opacity: 1; }
          50% { opacity: 0.3; }
        }
      `}</style>
    </>
  )
}
