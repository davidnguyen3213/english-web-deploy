import type { Progress, VocabProgress, Vocab } from '@/types'

const SRS_INTERVALS = [1, 3, 7, 14, 30]

export function nextReview(level: number, correct: boolean): { level: number; date: string } {
  const newLevel = correct
    ? Math.min(level + 1, SRS_INTERVALS.length - 1)
    : Math.max(level - 1, 0)
  const days = SRS_INTERVALS[newLevel]
  const d = new Date()
  d.setDate(d.getDate() + days)
  return { level: newLevel, date: d.toISOString().split('T')[0] }
}

export function wordsDueToday(vocab: Vocab[], progress: Progress): Vocab[] {
  const today = new Date().toISOString().split('T')[0]
  return vocab.filter((v) => {
    const wp = progress.vocab_progress[v.word]
    const nextR = wp?.next_review ?? today
    return nextR <= today
  })
}

export function updateStreak(progress: Progress): void {
  const today = new Date().toISOString().split('T')[0]
  const yesterday = new Date(Date.now() - 86400000).toISOString().split('T')[0]
  const last = progress.stats.last_study_date
  if (last === today) return
  if (last === yesterday) {
    progress.stats.streak += 1
  } else {
    progress.stats.streak = 1
  }
  progress.stats.last_study_date = today
  progress.stats.total_days += 1
}
