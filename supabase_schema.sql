-- Run this in Supabase SQL Editor to create tables

CREATE TABLE IF NOT EXISTS vocabulary (
  id SERIAL PRIMARY KEY,
  word TEXT NOT NULL,
  meaning TEXT,
  phonetic TEXT,
  example TEXT,
  level TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS grammar_lessons (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  level TEXT,
  icon TEXT,
  theory TEXT,
  questions JSONB DEFAULT '[]'
);

CREATE TABLE IF NOT EXISTS topics (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  level TEXT,
  icon TEXT,
  theory TEXT,
  questions JSONB DEFAULT '[]'
);

CREATE TABLE IF NOT EXISTS test_bank (
  id SERIAL PRIMARY KEY,
  type TEXT,
  q TEXT NOT NULL,
  opts JSONB,
  ans INTEGER,
  exp TEXT
);

CREATE TABLE IF NOT EXISTS user_progress (
  id INTEGER PRIMARY KEY DEFAULT 1,
  vocab_progress JSONB DEFAULT '{}',
  grammar_progress JSONB DEFAULT '{}',
  topic_progress JSONB DEFAULT '{}',
  stats JSONB DEFAULT '{
    "streak": 0,
    "last_study_date": "",
    "total_days": 0,
    "total_words_learned": 0,
    "total_correct": 0,
    "total_answered": 0
  }'
);

-- Insert initial progress row
INSERT INTO user_progress (id) VALUES (1) ON CONFLICT (id) DO NOTHING;
