export const dynamic = 'force-dynamic'

import { NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'

export async function GET() {
  const [grammar, topics] = await Promise.all([
    supabase.from('grammar_lessons').select('*').order('level').order('id'),
    supabase.from('topics').select('*').order('level').order('id'),
  ])

  return NextResponse.json({
    grammar: grammar.data ?? [],
    topics: topics.data ?? [],
  })
}
