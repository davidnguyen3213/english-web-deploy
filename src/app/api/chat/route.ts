export async function POST(request: Request) {
  const apiKey = process.env.GEMINI_API_KEY

  if (!apiKey) {
    return new Response(
      JSON.stringify({ error: 'GEMINI_API_KEY chưa được cấu hình. Thêm vào .env.local để sử dụng chat.' }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    )
  }

  let body: Record<string, unknown>
  try {
    body = await request.json()
  } catch {
    return new Response(
      JSON.stringify({ error: 'Invalid JSON body' }),
      { status: 400, headers: { 'Content-Type': 'application/json' } }
    )
  }
  const { userMessage, lessonTitle, lessonTheory, questions } = body as { userMessage: string; lessonTitle: string; lessonTheory: string; questions?: { q: string; opts: string[]; ans: number; exp: string }[] }

  const questionContext = questions?.length
    ? `\nBài tập của bài học:\n${questions.map((q: { q: string; opts: string[]; ans: number; exp: string }, i: number) =>
        `${i + 1}. ${q.q}\n   Đáp án: ${q.opts[q.ans]}${q.exp ? `\n   Giải thích: ${q.exp}` : ''}`
      ).join('\n')}`
    : ''

  const prompt = `Bạn là trợ giảng tiếng Anh. Học viên đang học bài: "${lessonTitle}".

Lý thuyết bài học:
${lessonTheory}${questionContext}

Trả lời câu hỏi của học viên dựa trên nội dung trên. Giải thích bằng tiếng Việt, ngắn gọn, dễ hiểu, có ví dụ nếu cần.`

  const geminiRes = await fetch(
    `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:streamGenerateContent?alt=sse&key=${apiKey}`,
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        contents: [{ parts: [{ text: prompt }, { text: userMessage }] }],
      }),
    }
  )

  if (!geminiRes.ok) {
    const errText = await geminiRes.text()
    return new Response(JSON.stringify({ error: `Gemini API error: ${geminiRes.status} ${errText}` }), {
      status: 502,
      headers: { 'Content-Type': 'application/json' },
    })
  }

  const encoder = new TextEncoder()
  const decoder = new TextDecoder()

  const stream = new ReadableStream({
    async start(controller) {
      const reader = geminiRes.body?.getReader()
      if (!reader) {
        controller.close()
        return
      }

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
            const text = json.candidates?.[0]?.content?.parts?.[0]?.text
            if (text) {
              controller.enqueue(encoder.encode(`data: ${JSON.stringify({ text })}\n\n`))
            }
          } catch {
            // skip malformed chunks
          }
        }
      }

      if (buffer.trim()) {
        const trimmed = buffer.trim()
        if (trimmed.startsWith('data: ')) {
          try {
            const json = JSON.parse(trimmed.slice(6))
            const text = json.candidates?.[0]?.content?.parts?.[0]?.text
            if (text) {
              controller.enqueue(encoder.encode(`data: ${JSON.stringify({ text })}\n\n`))
            }
          } catch {
            // skip
          }
        }
      }

      controller.close()
    },
  })

  return new Response(stream, {
    headers: {
      'Content-Type': 'text/event-stream',
      'Cache-Control': 'no-cache',
      Connection: 'keep-alive',
    },
  })
}
