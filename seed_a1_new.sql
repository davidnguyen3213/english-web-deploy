-- =====================================================
-- Nội dung A1 bổ sung – Grammar, Topics, Test Bank
-- Chạy file này TRONG Supabase SQL Editor
-- KHÔNG dùng TRUNCATE – chỉ thêm, không xóa dữ liệu cũ
-- =====================================================

-- =====================
-- GRAMMAR LESSONS (A1 – bổ sung)
-- Đã có: Present Simple, To Be, Articles, There is/are
-- Thêm mới: Plural Nouns, Wh- Questions, Possessives, Can/Can't
-- =====================

INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Plural Nouns – Danh Từ Số Nhiều',
'A1',
'📝',
'Quy tắc chuyển danh từ sang số nhiều:

✅ Thêm -s (hầu hết): book → books, cat → cats
✅ Thêm -es (sau ch, sh, s, x, z): bus → buses, box → boxes
✅ Đổi y → ies (sau phụ âm): baby → babies, city → cities
✅ Bất quy tắc: man → men, woman → women, child → children, foot → feet

Ví dụ:
✅ I have two cats.
✅ There are many buses on the road.
✅ The children are playing outside.',
'[{"q": "dog → (số nhiều)", "opts": ["dogs", "doges", "dogies", "dog"], "ans": 0, "exp": "Thêm -s thông thường: dogs"}, {"q": "box → (số nhiều)", "opts": ["boxs", "boxes", "boxies", "boxen"], "ans": 1, "exp": "Kết thúc bằng x → thêm -es: boxes"}, {"q": "baby → (số nhiều)", "opts": ["babys", "babies", "babes", "babyes"], "ans": 1, "exp": "Phụ âm + y → đổi y→ies: babies"}, {"q": "child → (số nhiều)", "opts": ["childs", "childes", "children", "childies"], "ans": 2, "exp": "Bất quy tắc: child → children"}, {"q": "bus → (số nhiều)", "opts": ["buss", "buses", "busis", "busing"], "ans": 1, "exp": "Kết thúc bằng s → thêm -es: buses"}, {"q": "woman → (số nhiều)", "opts": ["womans", "womanes", "womanies", "women"], "ans": 3, "exp": "Bất quy tắc: woman → women"}, {"q": "city → (số nhiều)", "opts": ["citys", "cities", "cityes", "cityi"], "ans": 1, "exp": "Phụ âm + y → đổi y→ies: cities"}, {"q": "Câu nào đúng?", "opts": ["I have two childs.", "She has three child.", "They are my children.", "He has one childrens."], "ans": 2, "exp": "children là dạng số nhiều đúng của child"}]'::jsonb
);

INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Wh- Questions',
'A1',
'❓',
'Câu hỏi với từ để hỏi (Wh-):

• What = Cái gì, Điều gì
• Where = Ở đâu
• When = Khi nào
• Who = Ai
• How = Như thế nào
• Why = Tại sao

Cấu trúc: Wh- + do/does/is/are + S + V?

✅ What is your name?
✅ Where do you live?
✅ Who is that boy?
✅ How are you?',
'[{"q": "___ is your name?", "opts": ["Where", "When", "What", "Who"], "ans": 2, "exp": "Hỏi tên/thứ gì → What"}, {"q": "___ do you live?", "opts": ["What", "Where", "When", "Why"], "ans": 1, "exp": "Hỏi nơi chốn → Where"}, {"q": "___ is your birthday?", "opts": ["Who", "Where", "How", "When"], "ans": 3, "exp": "Hỏi thời gian → When"}, {"q": "___ is that woman? – That''s my teacher.", "opts": ["What", "Where", "Who", "How"], "ans": 2, "exp": "Hỏi về người → Who"}, {"q": "___ are you? – I''m fine, thanks.", "opts": ["What", "Where", "Who", "How"], "ans": 3, "exp": "Hỏi trạng thái/sức khỏe → How"}, {"q": "___ are you late? – Because I missed the bus.", "opts": ["What", "Where", "When", "Why"], "ans": 3, "exp": "Hỏi lý do → Why"}, {"q": "Câu nào đúng?", "opts": ["Where is your name?", "What do you live?", "What is your name?", "Who is your address?"], "ans": 2, "exp": "Hỏi tên: What is your name?"}]'::jsonb
);

INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Possessive Adjectives – Tính Từ Sở Hữu',
'A1',
'👤',
'Tính từ sở hữu đứng trước danh từ, chỉ ai sở hữu:

• I → my (của tôi)
• You → your (của bạn)
• He → his (của anh ấy)
• She → her (của cô ấy)
• It → its (của nó)
• We → our (của chúng tôi)
• They → their (của họ)

✅ This is my book.
✅ His car is red.
✅ They love their dog.

Lưu ý: không dùng ''the'' hay ''a'' trước danh từ đã có tính từ sở hữu.',
'[{"q": "I have a dog. ___ dog is white.", "opts": ["My", "Your", "His", "Their"], "ans": 0, "exp": "I → my: My dog"}, {"q": "She is a teacher. ___ students love her.", "opts": ["My", "His", "Her", "Their"], "ans": 2, "exp": "She → her: Her students"}, {"q": "We live here. This is ___ house.", "opts": ["my", "your", "our", "their"], "ans": 2, "exp": "We → our: our house"}, {"q": "He is Tom. ___ sister is Anna.", "opts": ["My", "His", "Her", "Their"], "ans": 1, "exp": "He → his: His sister"}, {"q": "The cat sleeps in ___ bed.", "opts": ["my", "its", "their", "our"], "ans": 1, "exp": "The cat (it) → its: its bed"}, {"q": "They are students. I know ___ teacher.", "opts": ["my", "his", "our", "their"], "ans": 3, "exp": "They → their: their teacher"}, {"q": "You have a nice bag. Is that ___ bag?", "opts": ["my", "your", "his", "her"], "ans": 1, "exp": "You → your: your bag"}]'::jsonb
);

INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Can / Can''t – Diễn Tả Khả Năng',
'A1',
'💪',
'Dùng CAN để diễn tả khả năng làm được điều gì.

✅ Khẳng định: S + can + V nguyên thể
✅ Phủ định: S + can''t (cannot) + V nguyên thể
✅ Câu hỏi: Can + S + V?

Ví dụ:
✅ She can swim very well.
✅ I can''t drive a car.
✅ Can you speak English?

Lưu ý: can không thêm -s dù chủ ngữ là he/she/it.',
'[{"q": "She ___ play the piano.", "opts": ["can", "cans", "is can", "does can"], "ans": 0, "exp": "can không bao giờ thêm -s: She can"}, {"q": "I ___ speak French. (không biết)", "opts": ["can", "can''t", "don''t can", "cans''t"], "ans": 1, "exp": "Không thể làm được → can''t"}, {"q": "___ you swim?", "opts": ["Do", "Does", "Can", "Is"], "ans": 2, "exp": "Câu hỏi với can: Can + S + V?"}, {"q": "He ___ drive a car yet. He is only 10.", "opts": ["can", "can''t", "doesn''t can", "isn''t can"], "ans": 1, "exp": "Không đủ tuổi → can''t"}, {"q": "___ she sing well? – Yes, she ___.", "opts": ["Can / can", "Does / does", "Is / is", "Can / does"], "ans": 0, "exp": "Can she? → Yes, she can."}, {"q": "We ___ go to the cinema tonight.", "opts": ["can to", "can", "cans", "be can"], "ans": 1, "exp": "can + V nguyên thể (không có ''to'')"}, {"q": "Câu nào sai?", "opts": ["She can dance.", "He can''t fly.", "They cans swim.", "I can cook."], "ans": 2, "exp": "can không thêm -s: ''cans'' là sai"}]'::jsonb
);

-- =====================
-- TOPICS (A1 – bổ sung)
-- Đã có: Food & Dining, Home & Family
-- Thêm mới: Greetings, Colors & Numbers, Days & Months, Body Parts
-- =====================

INSERT INTO topics (title, level, icon, theory, questions) VALUES (
'Greetings & Introduction',
'A1',
'👋',
'Các cụm từ cơ bản để chào hỏi và tự giới thiệu.

Chào hỏi:
✅ Hello! / Hi! – Xin chào!
✅ Good morning – Chào buổi sáng
✅ Good afternoon – Chào buổi chiều
✅ Good evening – Chào buổi tối
✅ Goodbye / Bye – Tạm biệt
✅ How are you? – Bạn có khỏe không?
✅ I''m fine, thank you! – Tôi khỏe, cảm ơn!

Giới thiệu:
✅ My name is... – Tên tôi là...
✅ I am from... – Tôi đến từ...
✅ Nice to meet you! – Rất vui được gặp bạn!',
'[{"q": "Cách chào vào buổi sáng:", "opts": ["Good night", "Good morning", "Good evening", "Goodbye"], "ans": 1, "exp": "Morning = buổi sáng → Good morning"}, {"q": "''Nice to meet you'' nghĩa là:", "opts": ["Tạm biệt", "Bạn khỏe không?", "Rất vui được gặp bạn", "Chào buổi tối"], "ans": 2, "exp": "Nice to meet you = Rất vui được gặp bạn"}, {"q": "''How are you?'' – Trả lời phù hợp:", "opts": ["My name is Tom", "I''m fine, thank you", "Nice to meet you", "See you later"], "ans": 1, "exp": "Trả lời How are you? → I''m fine, thank you"}, {"q": "Câu nào dùng để tạm biệt?", "opts": ["Hello!", "Nice to meet you", "How are you?", "Goodbye!"], "ans": 3, "exp": "Goodbye / Bye = tạm biệt"}, {"q": "''My name is Anna'' có nghĩa là:", "opts": ["Tôi đến từ Anna", "Tên tôi là Anna", "Tôi gặp Anna", "Anna là bạn tôi"], "ans": 1, "exp": "My name is = Tên tôi là"}]'::jsonb
);

INSERT INTO topics (title, level, icon, theory, questions) VALUES (
'Colors & Numbers 1–10',
'A1',
'🎨',
'Màu sắc:
• red – đỏ | blue – xanh dương | green – xanh lá
• yellow – vàng | orange – cam | purple – tím
• white – trắng | black – đen | pink – hồng

Số đếm 1–10:
• 1 – one | 2 – two | 3 – three | 4 – four | 5 – five
• 6 – six | 7 – seven | 8 – eight | 9 – nine | 10 – ten

✅ I have three red apples.
✅ The sky is blue.
✅ She is seven years old.',
'[{"q": "Màu xanh dương là:", "opts": ["green", "blue", "yellow", "red"], "ans": 1, "exp": "blue = xanh dương (green = xanh lá)"}, {"q": "''eight'' là số:", "opts": ["6", "7", "8", "9"], "ans": 2, "exp": "eight = 8"}, {"q": "Màu vàng trong tiếng Anh là:", "opts": ["orange", "yellow", "white", "purple"], "ans": 1, "exp": "yellow = màu vàng"}, {"q": "Số 5 trong tiếng Anh là:", "opts": ["four", "five", "six", "three"], "ans": 1, "exp": "5 = five"}, {"q": "''The apple is ___'' – Quả táo màu đỏ:", "opts": ["blue", "green", "red", "white"], "ans": 2, "exp": "Quả táo thường màu đỏ = red"}, {"q": "''ten'' là số:", "opts": ["8", "9", "10", "11"], "ans": 2, "exp": "ten = 10"}, {"q": "Màu đen trong tiếng Anh là:", "opts": ["white", "pink", "black", "orange"], "ans": 2, "exp": "black = màu đen"}]'::jsonb
);

INSERT INTO topics (title, level, icon, theory, questions) VALUES (
'Days & Months',
'A1',
'📅',
'Ngày trong tuần:
• Monday – Thứ Hai | Tuesday – Thứ Ba | Wednesday – Thứ Tư
• Thursday – Thứ Năm | Friday – Thứ Sáu
• Saturday – Thứ Bảy | Sunday – Chủ Nhật

Tháng trong năm:
• January – Tháng 1 | February – Tháng 2 | March – Tháng 3
• April – Tháng 4 | May – Tháng 5 | June – Tháng 6
• July – Tháng 7 | August – Tháng 8 | September – Tháng 9
• October – Tháng 10 | November – Tháng 11 | December – Tháng 12

✅ Today is Monday.
✅ My birthday is in July.',
'[{"q": "Thứ Hai trong tiếng Anh là:", "opts": ["Sunday", "Monday", "Tuesday", "Wednesday"], "ans": 1, "exp": "Monday = Thứ Hai"}, {"q": "''Friday'' là:", "opts": ["Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ Bảy"], "ans": 2, "exp": "Friday = Thứ Sáu"}, {"q": "Tháng 7 trong tiếng Anh là:", "opts": ["June", "July", "August", "January"], "ans": 1, "exp": "July = Tháng 7"}, {"q": "''December'' là tháng mấy?", "opts": ["10", "11", "12", "9"], "ans": 2, "exp": "December = Tháng 12 (tháng cuối năm)"}, {"q": "Chủ Nhật trong tiếng Anh là:", "opts": ["Saturday", "Sunday", "Monday", "Friday"], "ans": 1, "exp": "Sunday = Chủ Nhật"}, {"q": "Tháng đầu tiên trong năm là:", "opts": ["February", "March", "January", "April"], "ans": 2, "exp": "January = Tháng 1"}]'::jsonb
);

INSERT INTO topics (title, level, icon, theory, questions) VALUES (
'Body Parts',
'A1',
'🧍',
'Các bộ phận cơ thể:

Đầu: head – đầu | eye – mắt | ear – tai | nose – mũi
      mouth – miệng | tooth/teeth – răng | hair – tóc

Thân: neck – cổ | shoulder – vai | arm – cánh tay
      hand – bàn tay | finger – ngón tay | stomach – bụng

Chân: leg – chân | knee – đầu gối | foot/feet – bàn chân

✅ I wash my face every morning.
✅ She has blue eyes.
✅ My feet are tired.',
'[{"q": "''eye'' có nghĩa là:", "opts": ["tai", "mũi", "mắt", "miệng"], "ans": 2, "exp": "eye = mắt"}, {"q": "Bàn tay trong tiếng Anh là:", "opts": ["arm", "finger", "leg", "hand"], "ans": 3, "exp": "hand = bàn tay (arm = cánh tay)"}, {"q": "''She has long ___'' – Cô ấy có tóc dài:", "opts": ["eye", "ear", "hair", "nose"], "ans": 2, "exp": "hair = tóc"}, {"q": "''foot'' (số nhiều) là:", "opts": ["foots", "footes", "feet", "feets"], "ans": 2, "exp": "foot là danh từ bất quy tắc → feet"}, {"q": "Đầu gối trong tiếng Anh là:", "opts": ["leg", "foot", "knee", "shoulder"], "ans": 2, "exp": "knee = đầu gối"}, {"q": "''My ___ hurts.'' – Bụng tôi đau:", "opts": ["back", "stomach", "chest", "shoulder"], "ans": 1, "exp": "stomach = bụng"}]'::jsonb
);

-- =====================
-- TEST BANK (A1 – bổ sung, 10 câu)
-- =====================

INSERT INTO test_bank (type, q, opts, ans, exp) VALUES ('grammar', 'They ___ my best friends.', '["am", "is", "are", "be"]'::jsonb, 2, 'They → are');
INSERT INTO test_bank (type, q, opts, ans, exp) VALUES ('grammar', '___ orange is on the table.', '["A", "An", "The", "—"]'::jsonb, 1, 'orange bắt đầu bằng nguyên âm o → an');
INSERT INTO test_bank (type, q, opts, ans, exp) VALUES ('grammar', 'cat → (số nhiều là)', '["cats", "cates", "caties", "cat"]'::jsonb, 0, 'Thêm -s thông thường: cats');
INSERT INTO test_bank (type, q, opts, ans, exp) VALUES ('grammar', '___ do you live? – I live in Hanoi.', '["What", "Who", "Where", "When"]'::jsonb, 2, 'Hỏi nơi chốn → Where');
INSERT INTO test_bank (type, q, opts, ans, exp) VALUES ('grammar', 'She ___ speak three languages.', '["can", "cans", "is can", "does can"]'::jsonb, 0, 'can không thêm -s dù chủ ngữ là she');
INSERT INTO test_bank (type, q, opts, ans, exp) VALUES ('grammar', 'Tom lost ___ keys.', '["my", "your", "his", "her"]'::jsonb, 2, 'Tom = he → his keys');
INSERT INTO test_bank (type, q, opts, ans, exp) VALUES ('grammar', 'There ___ five students in the classroom.', '["is", "are", "am", "be"]'::jsonb, 1, 'five students = số nhiều → There are');
INSERT INTO test_bank (type, q, opts, ans, exp) VALUES ('vocab', '''eye'' có nghĩa là:', '["tai", "mũi", "mắt", "miệng"]'::jsonb, 2, 'eye = mắt');
INSERT INTO test_bank (type, q, opts, ans, exp) VALUES ('vocab', 'Màu xanh lá cây là:', '["blue", "red", "green", "yellow"]'::jsonb, 2, 'green = xanh lá cây');
INSERT INTO test_bank (type, q, opts, ans, exp) VALUES ('vocab', 'Thứ Hai trong tiếng Anh là:', '["Sunday", "Monday", "Tuesday", "Wednesday"]'::jsonb, 1, 'Monday = Thứ Hai');
