export const dynamic = 'force-dynamic'

import { NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'

const LEVEL_ORDER = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2']

const sortByLevel = (a: { level: string; id: number }, b: { level: string; id: number }) => {
  const diff = LEVEL_ORDER.indexOf(a.level) - LEVEL_ORDER.indexOf(b.level)
  return diff !== 0 ? diff : a.id - b.id
}

export async function GET() {
  const [grammar, topics] = await Promise.all([
    supabase.from('grammar_lessons').select('*'),
    supabase.from('topics').select('*'),
  ])

  return NextResponse.json({
    grammar: (grammar.data ?? []).sort(sortByLevel),
    topics: (topics.data ?? []).sort(sortByLevel),
  })
}
