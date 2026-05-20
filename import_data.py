"""
Chạy script này để generate file import_data.sql
rồi paste vào Supabase SQL Editor để import dữ liệu.

Cách dùng:
  python import_data.py

Output: import_data.sql
"""

import json
import os

DATA_DIR = r"E:\download\english_app_v2_full\english_app_v2\data"
OUT = "import_data.sql"

def esc(s):
    if s is None:
        return "NULL"
    return "'" + str(s).replace("'", "''") + "'"

lines = []

# vocabulary
vf = os.path.join(DATA_DIR, "vocabulary.json")
if os.path.exists(vf):
    vocab = json.load(open(vf, encoding="utf-8"))
    lines.append("-- Vocabulary")
    lines.append("TRUNCATE vocabulary RESTART IDENTITY CASCADE;")
    for v in vocab:
        lines.append(
            f"INSERT INTO vocabulary (word, meaning, phonetic, example, level) VALUES "
            f"({esc(v.get('word'))}, {esc(v.get('meaning'))}, "
            f"{esc(v.get('phonetic'))}, {esc(v.get('example'))}, {esc(v.get('level'))});"
        )

# grammar + topics
lines.append("\n-- Grammar lessons & Topics")
lines.append("TRUNCATE grammar_lessons RESTART IDENTITY CASCADE;")
lines.append("TRUNCATE topics RESTART IDENTITY CASCADE;")

for fname in ["lessons_A1A2.json", "lessons_B1B2.json", "lessons_C1C2.json"]:
    fp = os.path.join(DATA_DIR, fname)
    if not os.path.exists(fp):
        continue
    data = json.load(open(fp, encoding="utf-8"))
    for g in data.get("grammar", []):
        q_json = esc(json.dumps(g.get("questions", []), ensure_ascii=False))
        lines.append(
            f"INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES "
            f"({esc(g.get('title'))}, {esc(g.get('level'))}, {esc(g.get('icon'))}, "
            f"{esc(g.get('theory'))}, {q_json}::jsonb);"
        )
    for t in data.get("topics", []):
        q_json = esc(json.dumps(t.get("questions", []), ensure_ascii=False))
        lines.append(
            f"INSERT INTO topics (title, level, icon, theory, questions) VALUES "
            f"({esc(t.get('title'))}, {esc(t.get('level'))}, {esc(t.get('icon'))}, "
            f"{esc(t.get('theory'))}, {q_json}::jsonb);"
        )

# test bank
tf = os.path.join(DATA_DIR, "test_bank.json")
if os.path.exists(tf):
    bank = json.load(open(tf, encoding="utf-8"))
    lines.append("\n-- Test bank")
    lines.append("TRUNCATE test_bank RESTART IDENTITY CASCADE;")
    for q in bank:
        opts_json = esc(json.dumps(q.get("opts", []), ensure_ascii=False))
        lines.append(
            f"INSERT INTO test_bank (type, q, opts, ans, exp) VALUES "
            f"({esc(q.get('type'))}, {esc(q.get('q'))}, {opts_json}::jsonb, "
            f"{q.get('ans', 0)}, {esc(q.get('exp'))});"
        )

with open(OUT, "w", encoding="utf-8") as f:
    f.write("\n".join(lines))

print(f"Done! Generated {OUT} with {len(lines)} statements.")
print("Paste the contents of import_data.sql into Supabase SQL Editor.")
