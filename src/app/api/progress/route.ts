export const dynamic = 'force-dynamic'

import { NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'
import { DEFAULT_PROGRESS } from '@/types'

export async function GET() {
  const { data, error } = await supabase
    .from('user_progress')
    .select('*')
    .eq('id', 1)
    .single()

  if (error || !data) {
    return NextResponse.json(DEFAULT_PROGRESS)
  }

  return NextResponse.json({
    vocab_progress: data.vocab_progress ?? {},
    grammar_progress: data.grammar_progress ?? {},
    topic_progress: data.topic_progress ?? {},
    stats: data.stats ?? DEFAULT_PROGRESS.stats,
  })
}

export async function PUT(req: Request) {
  const body = await req.json()
  const { error } = await supabase.from('user_progress').upsert({
    id: 1,
    vocab_progress: body.vocab_progress,
    grammar_progress: body.grammar_progress,
    topic_progress: body.topic_progress,
    stats: body.stats,
  })

  if (error) return NextResponse.json({ error: error.message }, { status: 500 })
  return NextResponse.json({ ok: true })
}
