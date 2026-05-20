export interface Vocab {
  id?: number
  word: string
  meaning: string
  phonetic: string
  example: string
  level: string
}

export interface GrammarQuestion {
  q: string
  opts: string[]
  ans: number
  exp: string
}

export interface GrammarLesson {
  id: number
  title: string
  level: string
  icon: string
  theory: string
  questions: GrammarQuestion[]
}

export interface Topic {
  id: number
  title: string
  level: string
  icon: string
  theory: string
  questions: GrammarQuestion[]
}

export interface TestQuestion {
  id?: number
  type: 'grammar' | 'vocab' | 'reading'
  q: string
  opts: string[]
  ans: number
  exp: string
}

export interface VocabProgress {
  srs_level: number
  next_review: string
  reviews: number
}

export interface GrammarProgress {
  completed: boolean
  best_score: number
}

export interface Stats {
  streak: number
  last_study_date: string
  total_days: number
  total_words_learned: number
  total_correct: number
  total_answered: number
}

export interface Progress {
  vocab_progress: Record<string, VocabProgress>
  grammar_progress: Record<string, GrammarProgress>
  topic_progress: Record<string, GrammarProgress>
  stats: Stats
}

export const DEFAULT_PROGRESS: Progress = {
  vocab_progress: {},
  grammar_progress: {},
  topic_progress: {},
  stats: {
    streak: 0,
    last_study_date: '',
    total_days: 0,
    total_words_learned: 0,
    total_correct: 0,
    total_answered: 0,
  },
}
