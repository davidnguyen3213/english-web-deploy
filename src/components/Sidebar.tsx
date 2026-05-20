'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'

const NAV = [
  { href: '/home', icon: '📊', label: 'Tổng quan' },
  { href: '/flashcard', icon: '📚', label: 'Flashcard' },
  { href: '/grammar', icon: '📝', label: 'Grammar' },
  { href: '/topic', icon: '🌍', label: 'Chủ đề' },
  { href: '/test', icon: '🎯', label: 'Kiểm tra' },
  { href: '/content', icon: '📂', label: 'Từ vựng' },
  { href: '/pronunciation', icon: '🎤', label: 'Phát âm' },
]

export default function Sidebar() {
  const pathname = usePathname()
  return (
    <aside
      className="w-56 shrink-0 flex flex-col py-6 px-3 gap-1"
      style={{ background: 'var(--surface)', borderRight: '1px solid var(--border)' }}
    >
      <div className="px-3 mb-6">
        <div className="text-lg font-bold" style={{ color: 'var(--accent)' }}>
          🇬🇧 English App
        </div>
        <div className="text-xs mt-0.5" style={{ color: 'var(--muted)' }}>
          Học tiếng Anh mỗi ngày
        </div>
      </div>

      {NAV.map((item) => {
        const active = pathname.startsWith(item.href)
        return (
          <Link
            key={item.href}
            href={item.href}
            className="flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm font-medium transition-colors"
            style={{
              background: active ? 'var(--accent)20' : 'transparent',
              color: active ? 'var(--accent)' : 'var(--muted)',
              border: active ? '1px solid var(--accent)40' : '1px solid transparent',
            }}
          >
            <span className="text-lg">{item.icon}</span>
            {item.label}
          </Link>
        )
      })}
    </aside>
  )
}
