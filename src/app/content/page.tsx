'use client'

import { useEffect, useState } from 'react'
import type { Vocab } from '@/types'

const LEVELS = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2']
const EMPTY: Omit<Vocab, 'id'> = { word: '', meaning: '', phonetic: '', example: '', level: 'A1' }

export default function ContentPage() {
  const [vocab, setVocab] = useState<Vocab[]>([])
  const [form, setForm] = useState(EMPTY)
  const [adding, setAdding] = useState(false)
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')

  async function load() {
    const data = await fetch('/api/vocabulary').then((r) => r.json())
    setVocab(data)
    setLoading(false)
  }

  useEffect(() => { load() }, [])

  async function addWord() {
    if (!form.word.trim() || !form.meaning.trim()) return
    await fetch('/api/vocabulary', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(form),
    })
    setForm(EMPTY)
    setAdding(false)
    load()
  }

  async function deleteWord(id: number) {
    if (!confirm('Xóa từ này?')) return
    await fetch(`/api/vocabulary/${id}`, { method: 'DELETE' })
    setVocab((v) => v.filter((x) => x.id !== id))
  }

  const filtered = vocab.filter(
    (v) =>
      v.word.toLowerCase().includes(search.toLowerCase()) ||
      v.meaning.toLowerCase().includes(search.toLowerCase())
  )

  return (
    <div className="p-10 max-w-4xl">
      <h1 className="text-2xl font-bold mb-1">📂 Quản lý từ vựng</h1>
      <p className="text-sm mb-6" style={{ color: 'var(--muted)' }}>Thêm, xóa từ vựng</p>

      <div className="flex gap-3 mb-6">
        <input
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Tìm kiếm từ..."
          className="flex-1 px-4 py-2 rounded-xl text-sm"
          style={{ background: 'var(--card)', border: '1px solid var(--border)', color: 'var(--text)' }}
        />
        <button
          onClick={() => setAdding(!adding)}
          className="px-5 py-2 rounded-xl text-sm font-medium text-white"
          style={{ background: 'var(--accent)' }}
        >
          + Thêm từ mới
        </button>
      </div>

      {adding && (
        <div className="rounded-2xl p-6 mb-6" style={{ background: 'var(--card)', border: '1px solid var(--border)' }}>
          <h3 className="font-semibold mb-4">Thêm từ mới</h3>
          <div className="grid grid-cols-2 gap-3">
            {[
              { key: 'word', label: 'Từ (bắt buộc)', ph: 'e.g. apple' },
              { key: 'meaning', label: 'Nghĩa (bắt buộc)', ph: 'e.g. quả táo' },
              { key: 'phonetic', label: 'Phiên âm', ph: 'e.g. /ˈæpəl/' },
              { key: 'example', label: 'Ví dụ', ph: 'e.g. I eat an apple.' },
            ].map(({ key, label, ph }) => (
              <div key={key}>
                <label className="text-xs mb-1 block" style={{ color: 'var(--muted)' }}>{label}</label>
                <input
                  value={(form as Record<string, string>)[key]}
                  onChange={(e) => setForm((f) => ({ ...f, [key]: e.target.value }))}
                  placeholder={ph}
                  className="w-full px-3 py-2 rounded-lg text-sm"
                  style={{ background: 'var(--surface)', border: '1px solid var(--border)', color: 'var(--text)' }}
                />
              </div>
            ))}
          </div>
          <div className="mt-3">
            <label className="text-xs mb-1 block" style={{ color: 'var(--muted)' }}>Cấp độ</label>
            <select
              value={form.level}
              onChange={(e) => setForm((f) => ({ ...f, level: e.target.value }))}
              className="px-3 py-2 rounded-lg text-sm"
              style={{ background: 'var(--surface)', border: '1px solid var(--border)', color: 'var(--text)' }}
            >
              {LEVELS.map((l) => <option key={l}>{l}</option>)}
            </select>
          </div>
          <div className="flex gap-3 mt-4">
            <button onClick={addWord} className="px-5 py-2 rounded-xl text-sm font-medium text-white" style={{ background: 'var(--success)' }}>
              Lưu
            </button>
            <button onClick={() => setAdding(false)} className="px-5 py-2 rounded-xl text-sm" style={{ background: 'var(--surface)', border: '1px solid var(--border)', color: 'var(--text)' }}>
              Hủy
            </button>
          </div>
        </div>
      )}

      {loading ? (
        <div style={{ color: 'var(--muted)' }}>Đang tải...</div>
      ) : (
        <div className="flex flex-col gap-2">
          <div className="text-sm mb-2" style={{ color: 'var(--muted)' }}>{filtered.length} từ</div>
          {filtered.map((v) => (
            <div key={v.id} className="flex items-center gap-4 rounded-xl px-5 py-3"
              style={{ background: 'var(--card)', border: '1px solid var(--border)' }}>
              <span className="text-xs px-2 py-0.5 rounded" style={{ background: 'var(--accent)20', color: 'var(--accent)' }}>{v.level}</span>
              <div className="flex-1 min-w-0">
                <span className="font-semibold">{v.word}</span>
                <span className="text-sm ml-2" style={{ color: 'var(--muted)' }}>{v.phonetic}</span>
                <span className="text-sm ml-2" style={{ color: 'var(--success)' }}>{v.meaning}</span>
              </div>
              <button onClick={() => v.id && deleteWord(v.id)}
                className="text-xs px-3 py-1 rounded-lg" style={{ color: 'var(--danger)', border: '1px solid var(--danger)30' }}>
                Xóa
              </button>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
