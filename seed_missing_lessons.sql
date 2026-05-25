-- ================================================================
-- seed_missing_lessons.sql
-- Grammar lessons bổ sung — mỗi bài 15 câu hỏi
-- Dùng INSERT, KHÔNG TRUNCATE — chạy trong Supabase SQL Editor
-- ================================================================

-- ===================== A1 =====================

-- 1. Imperatives (Câu mệnh lệnh)
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Imperatives — Câu Mệnh Lệnh',
'A1',
'📘',
'Câu mệnh lệnh dùng để yêu cầu, ra lệnh, hướng dẫn ai đó làm gì.

Cấu trúc:
✅ Khẳng định: V (nguyên thể) + O
VD: Open the door. — Sit down. — Listen carefully.

✅ Phủ định: Don''t + V (nguyên thể) + O
VD: Don''t touch that. — Don''t be late. — Don''t worry.

✅ Lịch sự hơn: Please + V / V + please
VD: Please sit down. / Sit down, please.

✅ Let''s + V: rủ rê, đề nghị cùng làm
VD: Let''s go! — Let''s eat.

Lưu ý: Câu mệnh lệnh không có chủ ngữ (You được ngầm hiểu).',
'[
  {"q": "___ the door, please.", "opts": ["Open", "Opens", "Opening", "To open"], "ans": 0, "exp": "Câu mệnh lệnh: V nguyên thể — Open"},
  {"q": "___ late for class!", "opts": ["Don''t be", "No be", "Not be", "Aren''t"], "ans": 0, "exp": "Phủ định: Don''t + be: Don''t be late"},
  {"q": "___ worry! Everything will be fine.", "opts": ["No", "Don''t", "Not", "Aren''t"], "ans": 1, "exp": "Don''t worry! = Đừng lo lắng!"},
  {"q": "___ go to the park!", "opts": ["Let", "Let''s", "Lets", "Let us to"], "ans": 1, "exp": "Let''s + V = rủ rê: Let''s go"},
  {"q": "___ your book to page 20.", "opts": ["Open", "Opens", "Opening", "To open"], "ans": 0, "exp": "Mệnh lệnh: Open your book"},
  {"q": "___ quiet! The baby is sleeping.", "opts": ["Be", "To be", "Being", "Is"], "ans": 0, "exp": "Be quiet! = Hãy im lặng!"},
  {"q": "___ that! It''s dangerous.", "opts": ["No touch", "Don''t touch", "Not touch", "Touch not"], "ans": 1, "exp": "Don''t touch = Đừng chạm vào"},
  {"q": "Câu nào là câu mệnh lệnh?", "opts": ["You are nice.", "She sings.", "Close the window.", "He runs fast."], "ans": 2, "exp": "Close the window = mệnh lệnh (V đầu câu)"},
  {"q": "___ eat too much candy!", "opts": ["No", "Don''t", "Not", "Aren''t"], "ans": 1, "exp": "Don''t eat = đừng ăn"},
  {"q": "Please ___ your hand before speaking.", "opts": ["raise", "raises", "raising", "raised"], "ans": 0, "exp": "Please + V: please raise your hand"},
  {"q": "___ your homework before watching TV.", "opts": ["Do", "Does", "Doing", "To do"], "ans": 0, "exp": "Mệnh lệnh: Do your homework"},
  {"q": "___ run in the hallway!", "opts": ["No", "Don''t", "Not", "Doesn''t"], "ans": 1, "exp": "Don''t run = đừng chạy"},
  {"q": "___ me your pencil, please.", "opts": ["Lend", "Lends", "Lending", "To lend"], "ans": 0, "exp": "Lend me = hãy cho tôi mượn"},
  {"q": "Câu phủ định của ''Sit down'' là:", "opts": ["Not sit down.", "No sit down.", "Don''t sit down.", "Doesn''t sit down."], "ans": 2, "exp": "Don''t + V: Don''t sit down"},
  {"q": "___ have a break! We''re tired.", "opts": ["Let", "Let''s", "Lets", "Allow"], "ans": 1, "exp": "Let''s have a break = chúng ta hãy nghỉ giải lao"}
]'::jsonb
);

-- 2. Prepositions of Place (in/on/at)
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Prepositions of Place — in / on / at',
'A1',
'📗',
'Giới từ chỉ nơi chốn: in, on, at.

✅ IN = ở bên trong (không gian lớn, có ranh giới):
   in the room, in the city, in Vietnam, in the box

✅ ON = ở trên bề mặt / địa chỉ đường:
   on the table, on the wall, on the floor, on Page 5

✅ AT = tại một điểm cụ thể / địa chỉ:
   at the door, at the bus stop, at 123 Main Street, at school

Mẹo:
- in = trong (bao quanh)
- on = trên (tiếp xúc bề mặt)
- at = tại (điểm)',
'[
  {"q": "The cat is ___ the box.", "opts": ["in", "on", "at", "under"], "ans": 0, "exp": "in = bên trong hộp"},
  {"q": "The book is ___ the table.", "opts": ["in", "on", "at", "under"], "ans": 1, "exp": "on = trên mặt bàn"},
  {"q": "She is waiting ___ the bus stop.", "opts": ["in", "on", "at", "to"], "ans": 2, "exp": "at = tại một điểm: at the bus stop"},
  {"q": "He lives ___ Hanoi.", "opts": ["in", "on", "at", "of"], "ans": 0, "exp": "in + thành phố: in Hanoi"},
  {"q": "The picture is ___ the wall.", "opts": ["in", "on", "at", "by"], "ans": 1, "exp": "on = trên tường (bề mặt)"},
  {"q": "She is ___ school now.", "opts": ["in", "on", "at", "to"], "ans": 2, "exp": "at school = ở trường (địa điểm)"},
  {"q": "The milk is ___ the fridge.", "opts": ["in", "on", "at", "over"], "ans": 0, "exp": "in = bên trong tủ lạnh"},
  {"q": "My keys are ___ the table.", "opts": ["in", "on", "at", "into"], "ans": 1, "exp": "on = trên bàn"},
  {"q": "She lives ___ 45 Green Street.", "opts": ["in", "on", "at", "by"], "ans": 2, "exp": "at + địa chỉ cụ thể: at 45 Green Street"},
  {"q": "The children are playing ___ the park.", "opts": ["in", "on", "at", "to"], "ans": 0, "exp": "in the park = trong công viên"},
  {"q": "There is a fly ___ the ceiling.", "opts": ["in", "on", "at", "under"], "ans": 1, "exp": "on = trên trần nhà (bề mặt)"},
  {"q": "He is ___ the door.", "opts": ["in", "on", "at", "into"], "ans": 2, "exp": "at the door = ở cửa"},
  {"q": "The pencil is ___ the pencil case.", "opts": ["in", "on", "at", "with"], "ans": 0, "exp": "in = trong hộp bút"},
  {"q": "She is sitting ___ the chair.", "opts": ["in", "on", "at", "under"], "ans": 1, "exp": "on the chair = trên ghế"},
  {"q": "We met ___ the airport.", "opts": ["in", "on", "at", "into"], "ans": 2, "exp": "at the airport = tại sân bay (địa điểm cụ thể)"}
]'::jsonb
);

-- 3. Have got / Has got
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Have got / Has got',
'A1',
'📙',
''Have got'' và ''has got'' diễn tả sự sở hữu (thường dùng trong tiếng Anh-Anh).

Cấu trúc:
✅ Khẳng định:
   I/You/We/They have got → I''ve got a car.
   He/She/It has got → She has got (She''s got) a cat.

✅ Phủ định:
   haven''t got / hasn''t got → I haven''t got a pen.

✅ Câu hỏi:
   Have/Has + S + got? → Have you got a minute?

Lưu ý: Have got = Have (về nghĩa sở hữu), nhưng thông dụng hơn trong Anh-Anh. Không dùng got với nghĩa ''nhận được'' trong thì hiện tại.',
'[
  {"q": "I ___ got a new phone.", "opts": ["have", "has", "am", "is"], "ans": 0, "exp": "I + have got"},
  {"q": "She ___ got a beautiful voice.", "opts": ["have", "has", "is", "are"], "ans": 1, "exp": "She + has got"},
  {"q": "They ___ got a big house.", "opts": ["have", "has", "are", "is"], "ans": 0, "exp": "They + have got"},
  {"q": "He ___ got a headache.", "opts": ["haven''t", "hasn''t", "isn''t", "aren''t"], "ans": 1, "exp": "He + hasn''t got (phủ định)"},
  {"q": "___ you got a minute?", "opts": ["Do", "Does", "Have", "Has"], "ans": 2, "exp": "Have you got...? (câu hỏi)"},
  {"q": "She ___ got two brothers.", "opts": ["has", "have", "is", "are"], "ans": 0, "exp": "She + has got"},
  {"q": "We ___ got any milk left.", "opts": ["hasn''t", "haven''t", "isn''t", "aren''t"], "ans": 1, "exp": "We + haven''t got (phủ định)"},
  {"q": "I''ve got a dog. = tôi ___ một con chó.", "opts": ["có", "muốn", "thích", "mua"], "ans": 0, "exp": "I''ve got = tôi có"},
  {"q": "___ she got any children?", "opts": ["Have", "Has", "Do", "Does"], "ans": 1, "exp": "Has she got...? (câu hỏi)"},
  {"q": "He ___ got a sister. (He doesn''t have one)", "opts": ["has", "have", "hasn''t", "haven''t"], "ans": 2, "exp": "He hasn''t got a sister = cậu ấy không có chị/em gái"},
  {"q": "I ___ got a cold. I feel terrible.", "opts": ["has", "have", "am", "is"], "ans": 1, "exp": "I have got a cold = tôi bị cảm"},
  {"q": "You ___ got a nice smile!", "opts": ["has", "have", "are", "is"], "ans": 1, "exp": "You have got = bạn có"},
  {"q": "I''ve got = viết tắt của ___", "opts": ["I has got", "I have got", "I am got", "I was got"], "ans": 1, "exp": "I''ve got = I have got"},
  {"q": "We ___ got enough time.", "opts": ["have", "has", "haven''t", "hasn''t"], "ans": 0, "exp": "We have got enough time = chúng tôi có đủ thời gian"},
  {"q": "___ your parents got a car?", "opts": ["Has", "Have", "Do", "Are"], "ans": 1, "exp": "Your parents = They → Have they got?"}
]'::jsonb
);

-- ===================== A2 =====================

-- 4. Quantifiers (some, any, much, many, a lot of)
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Quantifiers — Lượng Từ (some, any, much, many, a lot of)',
'A2',
'📘',
'Lượng từ dùng để chỉ số lượng:

✅ some: dùng trong câu khẳng định, hoặc câu hỏi mời/đề nghị
   — I have some friends. / Would you like some tea?

✅ any: dùng trong câu phủ định và câu hỏi
   — I don''t have any money. / Do you have any questions?

✅ much + danh từ không đếm được (thường phủ định/hỏi)
   — There isn''t much water. / How much time?

✅ many + danh từ đếm được số nhiều
   — How many students? / I don''t have many books.

✅ a lot of / lots of: dùng với cả đếm được và không đếm được (khẳng định)
   — I have a lot of friends. / There is a lot of water.',
'[
  {"q": "I have ___ apples in my bag.", "opts": ["some", "any", "much", "a"], "ans": 0, "exp": "some = một vài (trong câu khẳng định)"},
  {"q": "There isn''t ___ milk in the fridge.", "opts": ["some", "any", "a", "many"], "ans": 1, "exp": "any = dùng trong câu phủ định"},
  {"q": "How ___ eggs do you need?", "opts": ["much", "many", "some", "any"], "ans": 1, "exp": "eggs đếm được → many"},
  {"q": "How ___ sugar do you want?", "opts": ["much", "many", "some", "any"], "ans": 0, "exp": "sugar không đếm được → much"},
  {"q": "She has ___ of friends.", "opts": ["much", "a lot", "many", "any"], "ans": 1, "exp": "a lot of = nhiều"},
  {"q": "Do you have ___ questions?", "opts": ["some", "any", "much", "a"], "ans": 1, "exp": "any = trong câu hỏi"},
  {"q": "Would you like ___ coffee?", "opts": ["some", "any", "much", "many"], "ans": 0, "exp": "some = trong câu hỏi mời, đề nghị"},
  {"q": "I don''t have ___ free time.", "opts": ["some", "much", "many", "a lot"], "ans": 1, "exp": "time không đếm được, câu phủ định → much"},
  {"q": "She bought ___ oranges.", "opts": ["much", "any", "a lot of", "a"], "ans": 2, "exp": "a lot of + danh từ đếm được số nhiều"},
  {"q": "There are too ___ people here.", "opts": ["much", "many", "some", "any"], "ans": 1, "exp": "people đếm được số nhiều → many"},
  {"q": "We don''t have ___ time left.", "opts": ["many", "much", "some", "a few"], "ans": 1, "exp": "time không đếm được → much"},
  {"q": "I need ___ help with my homework.", "opts": ["some", "any", "much", "many"], "ans": 0, "exp": "some = trong câu khẳng định"},
  {"q": "There aren''t ___ chairs in the room.", "opts": ["some", "much", "any", "a lot"], "ans": 2, "exp": "any = trong câu phủ định với chairs"},
  {"q": "How ___ water do you drink every day?", "opts": ["much", "many", "some", "any"], "ans": 0, "exp": "water không đếm được → How much?"},
  {"q": "She doesn''t eat ___ meat.", "opts": ["some", "many", "much", "a few"], "ans": 2, "exp": "meat không đếm được, phủ định → much"}
]'::jsonb
);

-- 5. Adverbs of Frequency
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Adverbs of Frequency — Trạng Từ Chỉ Tần Suất',
'A2',
'📗',
'Trạng từ chỉ tần suất cho biết một hành động xảy ra thường xuyên như thế nào.

Các trạng từ phổ biến (từ nhiều đến ít):
✅ always (100%) — luôn luôn: I always brush my teeth.
✅ usually (90%) — thường: She usually wakes up early.
✅ often (70%) — hay, thường: He often plays football.
✅ sometimes (50%) — thỉnh thoảng: They sometimes eat out.
✅ occasionally (30%) — đôi khi: I occasionally watch TV.
✅ rarely / seldom (10%) — hiếm khi: She rarely eats meat.
✅ never (0%) — không bao giờ: I never smoke.

Vị trí: trước động từ thường, sau động từ to be.
✅ I always get up at 6. / She is never late.',
'[
  {"q": "She ___ gets up at 6 am. (100%)", "opts": ["always", "never", "sometimes", "rarely"], "ans": 0, "exp": "always = luôn luôn (100%)"},
  {"q": "He is ___ late for school. (0%)", "opts": ["always", "usually", "sometimes", "never"], "ans": 3, "exp": "never = không bao giờ (0%)"},
  {"q": "We ___ go to the cinema on weekends. (90%)", "opts": ["always", "usually", "sometimes", "never"], "ans": 1, "exp": "usually = thường (90%)"},
  {"q": "I ___ eat breakfast. (70%)", "opts": ["always", "never", "often", "rarely"], "ans": 2, "exp": "often = thường xuyên (70%)"},
  {"q": "They ___ visit their grandparents. (50%)", "opts": ["always", "never", "sometimes", "rarely"], "ans": 2, "exp": "sometimes = thỉnh thoảng (50%)"},
  {"q": "She is ___ happy.", "opts": ["always", "never", "sometimes", "usually"], "ans": 0, "exp": "always = luôn luôn vui vẻ"},
  {"q": "I ___ eat meat. I''m vegetarian. (0%)", "opts": ["always", "often", "usually", "never"], "ans": 3, "exp": "never = không bao giờ ăn thịt"},
  {"q": "He ___ drinks coffee in the morning.", "opts": ["is always", "always drinks", "drinks always", "always drink"], "ans": 1, "exp": "Trước động từ thường: always drinks"},
  {"q": "She ___ late for work.", "opts": ["is never", "never is", "never be", "is never be"], "ans": 0, "exp": "Sau to be: is never"},
  {"q": "I ___ watch horror films. Maybe once a year.", "opts": ["always", "often", "rarely", "usually"], "ans": 2, "exp": "rarely = hiếm khi"},
  {"q": "We ___ go on holiday in summer.", "opts": ["always", "usually", "sometimes", "never"], "ans": 1, "exp": "usually = thường (hợp lý)"},
  {"q": "She ___ eats junk food. She hates it.", "opts": ["always", "often", "usually", "never"], "ans": 3, "exp": "never = không bao giờ"},
  {"q": "___ do you exercise?", "opts": ["How often", "How many", "How much", "How long"], "ans": 0, "exp": "How often = hỏi tần suất"},
  {"q": "He ___ forgets his keys. It''s annoying.", "opts": ["always", "never", "rarely", "sometimes"], "ans": 0, "exp": "always = luôn luôn quên (gây khó chịu)"},
  {"q": "Chọn vị trí đúng: ''She ___ to music.''", "opts": ["She listens always to music.", "She always listens to music.", "Always she listens to music.", "She listens to always music."], "ans": 1, "exp": "always đứng trước động từ thường listens"}
]'::jsonb
);

-- ===================== B2 =====================

-- 6. Causative (have/get something done)
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Causative — Thể Nhờ Vả (have / get something done)',
'B2',
'📘',
'Causative (have/get something done) dùng khi ai đó làm việc gì cho bạn (bạn thuê/nhờ họ làm).

Cấu trúc:
✅ have + tân ngữ + V3
✅ get + tân ngữ + V3

VD:
- I had my hair cut. (Tôi đi cắt tóc — người khác cắt)
- She got her car repaired. (Cô ấy mang xe đi sửa)

Khác với tự làm:
❌ I cut my hair. (Tôi tự cắt)
✅ I had my hair cut. (Tôi đi cắt ở tiệm)

Các thì: have/get chia theo thì:
- Present: I have my car washed every month.
- Past: I had my windows cleaned yesterday.
- Future: I will have my house painted.',
'[
  {"q": "I need to ___ my hair cut.", "opts": ["have", "make", "do", "let"], "ans": 0, "exp": "have something done: have my hair cut"},
  {"q": "She ___ her car repaired yesterday.", "opts": ["had", "has", "got", "gets"], "ans": 0, "exp": "Past: had something done"},
  {"q": "I ___ my nails done every two weeks.", "opts": ["get", "make", "do", "let"], "ans": 0, "exp": "get something done: get my nails done"},
  {"q": "He needs to ___ his suit cleaned for the wedding.", "opts": ["have", "make", "do", "let"], "ans": 0, "exp": "have something cleaned"},
  {"q": "They ___ their house painted last month.", "opts": ["had", "has", "got", "gets"], "ans": 0, "exp": "Quá khứ: had their house painted"},
  {"q": "I ___ my photo taken at the studio.", "opts": ["had", "made", "did", "let"], "ans": 0, "exp": "had my photo taken = được chụp ảnh"},
  {"q": "She is going to ___ her dress made by a tailor.", "opts": ["have", "make", "do", "let"], "ans": 0, "exp": "going to have something made"},
  {"q": "We ___ our windows cleaned every month.", "opts": ["have", "make", "are", "let"], "ans": 0, "exp": "have our windows cleaned = thuê lau kính"},
  {"q": "I ___ my watch repaired last week.", "opts": ["had", "has", "made", "got"], "ans": 0, "exp": "had something repaired = mang đi sửa"},
  {"q": "You should ___ your eyes tested.", "opts": ["have", "make", "let", "do"], "ans": 0, "exp": "should have your eyes tested = nên đi khám mắt"},
  {"q": "She ___ her teeth whitened at the dentist.", "opts": ["had", "made", "did", "let"], "ans": 0, "exp": "had her teeth whitened = tẩy trắng răng"},
  {"q": "I need to ___ my computer fixed.", "opts": ["have", "make", "let", "do"], "ans": 0, "exp": "need to have something fixed"},
  {"q": "We are ___ our kitchen renovated next month.", "opts": ["having", "making", "doing", "letting"], "ans": 0, "exp": "are having = thể tiếp diễn của causative"},
  {"q": "She ___ her bag stolen at the station. (bị động, không chủ ý)", "opts": ["had", "got", "made", "let"], "ans": 0, "exp": "had her bag stolen = bị mất cắp (causative bất đắc dĩ)"},
  {"q": "Câu nào đúng thể nhờ vả?", "opts": ["I cut my hair at the salon.", "I had my hair cut at the salon.", "I made my hair cut.", "I let my hair cut."], "ans": 1, "exp": "I had my hair cut = tôi đi cắt tóc (người khác làm)"}
]'::jsonb
);

-- 7. Future Perfect & Future Continuous
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Future Perfect & Future Continuous',
'B2',
'📗',
'Future Continuous và Future Perfect dùng để nói về hành động trong tương lai với góc nhìn khác nhau.

✅ Future Continuous (sẽ đang):
   will be + V-ing
   Diễn tả hành động sẽ đang xảy ra tại một thời điểm trong tương lai.
   VD: This time tomorrow, I will be flying to Paris.

✅ Future Perfect (sẽ đã):
   will have + V3
   Diễn tả hành động sẽ hoàn thành trước một thời điểm trong tương lai.
   VD: By 8 pm, I will have finished my homework.

Thường đi với: by + thời gian, by the time, in + khoảng thời gian (cho Future Perfect).',
'[
  {"q": "This time next week, I ___ on the beach. (lie)", "opts": ["will lie", "will be lying", "will have lain", "am lying"], "ans": 1, "exp": "Future Continuous: will be lying = sẽ đang nằm"},
  {"q": "By 2027, she ___ from university. (graduate)", "opts": ["will graduate", "will be graduating", "will have graduated", "graduates"], "ans": 2, "exp": "Future Perfect: will have graduated = sẽ đã tốt nghiệp"},
  {"q": "I ___ dinner by the time you arrive. (cook)", "opts": ["will cook", "will be cooking", "will have cooked", "am cooking"], "ans": 2, "exp": "Hoàn thành trước khi bạn đến: will have cooked"},
  {"q": "At 9 pm tonight, she ___ a movie. (watch)", "opts": ["will watch", "will be watching", "will have watched", "watches"], "ans": 1, "exp": "Đang xem tại 9h tối: will be watching"},
  {"q": "By the end of this year, they ___ in London for 10 years. (live)", "opts": ["will live", "will be living", "will have lived", "live"], "ans": 2, "exp": "Hoàn thành sau 10 năm: will have lived"},
  {"q": "Don''t call at 7 pm — I ___ the news. (watch)", "opts": ["will watch", "will be watching", "will have watched", "watch"], "ans": 1, "exp": "Đang xem lúc 7h: will be watching"},
  {"q": "By next month, I ___ this book. (finish)", "opts": ["will finish", "will be finishing", "will have finished", "finished"], "ans": 2, "exp": "Sẽ hoàn thành trước tháng sau: will have finished"},
  {"q": "This time tomorrow, we ___ to New York. (fly)", "opts": ["will fly", "will be flying", "will have flown", "are flying"], "ans": 1, "exp": "Đang bay vào giờ này ngày mai: will be flying"},
  {"q": "She ___ the report before the meeting starts. (write)", "opts": ["will write", "will be writing", "will have written", "writes"], "ans": 2, "exp": "Hoàn thành trước cuộc họp: will have written"},
  {"q": "At 10 am tomorrow, I ___ a presentation. (give)", "opts": ["will give", "will be giving", "will have given", "give"], "ans": 1, "exp": "Đang thuyết trình lúc 10h: will be giving"},
  {"q": "By the time we arrive, the film ___ . (start)", "opts": ["will start", "will be starting", "will have started", "starts"], "ans": 2, "exp": "Phim đã bắt đầu trước khi ta đến: will have started"},
  {"q": "In two years'' time, I ___ my own business. (run)", "opts": ["will run", "will be running", "will have run", "run"], "ans": 1, "exp": "Đang điều hành (hành động liên tục): will be running"},
  {"q": "I ___ all my exams by Friday. (take)", "opts": ["will take", "will be taking", "will have taken", "take"], "ans": 2, "exp": "Hoàn thành trước thứ 6: will have taken"},
  {"q": "She ___ abroad for 20 years in 2028. (live)", "opts": ["will live", "will be living", "will have been living", "will have lived"], "ans": 3, "exp": "Tính đến 2028 là 20 năm: will have lived"},
  {"q": "___ you ___ your work by 5 pm?", "opts": ["Will, finish", "Will, be finishing", "Will, have finished", "Are, finishing"], "ans": 2, "exp": "Will you have finished? = hỏi về hành động sẽ hoàn thành"}
]'::jsonb
);

-- 8. Articles (Advanced)
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Articles — Advanced (Zero Article, Abstract Nouns)',
'B2',
'📙',
'Mạo từ nâng cao:

✅ Zero article (không mạo từ):
   — Danh từ số nhiều nói chung: Cats are cute.
   — Danh từ không đếm được nói chung: Water is essential.
   — Bữa ăn: have breakfast, at lunch
   — Phương tiện: by bus, by train, on foot
   — Bệnh tật (số nhiều/nói chung): He has diabetes.
   — Môn thể thao/môn học: He plays football. She studies maths.

✅ The + tính từ = nhóm người: the rich, the poor, the elderly

✅ Các trường hợp đặc biệt:
   — the + tên nhạc cụ: play the piano
   — the + tên tờ báo: The Times
   — the + quốc gia số nhiều: The Philippines, The Netherlands',
'[
  {"q": "___ cats are very independent animals.", "opts": ["A", "An", "The", "—"], "ans": 3, "exp": "Danh từ số nhiều nói chung: không mạo từ"},
  {"q": "She goes to school ___ bus.", "opts": ["by the", "by", "on the", "with"], "ans": 1, "exp": "Phương tiện: by bus (không mạo từ)"},
  {"q": "I always have ___ breakfast at 7 am.", "opts": ["a", "the", "—", "an"], "ans": 2, "exp": "Bữa ăn: have breakfast (không mạo từ)"},
  {"q": "___ rich should help the poor.", "opts": ["A", "An", "The", "—"], "ans": 2, "exp": "The + adj = nhóm người: the rich"},
  {"q": "She can play ___ piano beautifully.", "opts": ["a", "an", "the", "—"], "ans": 2, "exp": "The + nhạc cụ: play the piano"},
  {"q": "___ life is full of surprises.", "opts": ["A", "An", "The", "—"], "ans": 3, "exp": "Danh từ trừu tượng chung chung: không mạo từ"},
  {"q": "He was sent to ___ hospital for treatment.", "opts": ["a", "the", "—", "an"], "ans": 2, "exp": "hospital với mục đích y tế: không mạo từ (Anh-Anh)"},
  {"q": "___ Philippines consists of many islands.", "opts": ["A", "An", "The", "—"], "ans": 2, "exp": "The + quốc gia số nhiều: The Philippines"},
  {"q": "She is studying ___ mathematics at university.", "opts": ["a", "the", "—", "an"], "ans": 2, "exp": "Môn học nói chung: không mạo từ"},
  {"q": "I need ___ advice from you.", "opts": ["a", "an", "some", "the"], "ans": 2, "exp": "advice không đếm được: a piece of advice / some advice"},
  {"q": "The government must help ___ unemployed.", "opts": ["a", "an", "the", "—"], "ans": 2, "exp": "The + adj = the unemployed = người thất nghiệp"},
  {"q": "He''s got ___ flu.", "opts": ["a", "the", "—", "an"], "ans": 1, "exp": "the flu / flu (có thể dùng the hoặc không)"},
  {"q": "I usually go to work ___ foot.", "opts": ["by", "on", "with", "by the"], "ans": 1, "exp": "on foot = đi bộ (không mạo từ, idiom)"},
  {"q": "___ knowledge is power.", "opts": ["A", "An", "The", "—"], "ans": 3, "exp": "Khái niệm chung: không mạo từ"},
  {"q": "I read it in ___ Times yesterday.", "opts": ["a", "an", "the", "—"], "ans": 2, "exp": "The + tên báo: The Times"}
]'::jsonb
);

-- ===================== C1 =====================

-- 9. Cleft Sentences
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Cleft Sentences — Câu Chẻ',
'C1',
'📘',
'Câu chẻ dùng để nhấn mạnh một phần của câu.

✅ It + is/was + phần được nhấn mạnh + that/who + phần còn lại:
   — Bình thường: Tom bought a car yesterday.
   — Nhấn mạnh chủ ngữ: It was Tom who bought a car yesterday.
   — Nhấn mạnh tân ngữ: It was a car that Tom bought yesterday.
   — Nhấn mạnh thời gian: It was yesterday that Tom bought a car.

✅ What + S + V + is/was + phần được nhấn mạnh:
   — What I need is a cup of coffee.
   — What she did was (to) quit her job.

Cleft sentences thường dùng trong văn nói và viết trang trọng.',
'[
  {"q": "___ was Tom who called you.", "opts": ["It", "That", "What", "This"], "ans": 0, "exp": "It + was + Tom + who: nhấn mạnh chủ ngữ"},
  {"q": "It was yesterday ___ she arrived.", "opts": ["which", "that", "who", "when"], "ans": 1, "exp": "that (who dùng cho người, which cho vật)"},
  {"q": "___ I need is a good rest.", "opts": ["It", "That", "What", "Which"], "ans": 2, "exp": "What + S + V + is: What I need is..."},
  {"q": "It was ___ who helped me.", "opts": ["she", "her", "hers", "herself"], "ans": 0, "exp": "It was she/her who... (she = formal, her = informal)"},
  {"q": "Nhấn mạnh: ''She won the prize.'' → ___", "opts": ["It was the prize that she won.", "It was she who the prize won.", "She won it was the prize.", "That she won the prize."], "ans": 0, "exp": "Nhấn mạnh the prize: It was the prize that she won."},
  {"q": "What she ___ was apologize.", "opts": ["does", "did", "done", "doing"], "ans": 1, "exp": "What she did was = điều cô ấy đã làm là"},
  {"q": "It is ___ that matters, not money.", "opts": ["healthy", "health", "healthily", "healths"], "ans": 1, "exp": "Sức khỏe mới quan trọng: It is health that matters"},
  {"q": "Chọn câu chẻ đúng:", "opts": ["It is I who am wrong.", "It is me who is wrong.", "It is I who is wrong.", "I who am wrong."], "ans": 0, "exp": "Formal: It is I who am wrong (động từ chia theo I)"},
  {"q": "___ we need is more time.", "opts": ["It", "That", "What", "Which"], "ans": 2, "exp": "What we need is = điều chúng tôi cần là"},
  {"q": "It was ___ that I saw at the mall.", "opts": ["him", "he", "himself", "his"], "ans": 0, "exp": "Informal: It was him that I saw (tân ngữ sau that)"},
  {"q": "Nhấn mạnh ''time'': I don''t have enough time.", "opts": ["What I don''t have enough is time.", "It is time that I don''t have enough.", "What I don''t have is enough time.", "Time is what I don''t have enough."], "ans": 2, "exp": "What I don''t have is enough time."},
  {"q": "It was in Paris ___ they first met.", "opts": ["which", "that", "who", "where"], "ans": 1, "exp": "that (không dùng where trong câu chẻ)"},
  {"q": "What I love about her ___ her kindness.", "opts": ["is", "are", "was", "were"], "ans": 0, "exp": "What + S + V + is (số ít)"},
  {"q": "It is the government ___ should take action.", "opts": ["which", "that", "whom", "what"], "ans": 1, "exp": "that (chính phủ là tổ chức, có thể dùng that)"},
  {"q": "Câu chẻ nào nhấn mạnh ''yesterday''?", "opts": ["What happened yesterday.", "It was yesterday that she called.", "Yesterday was the day.", "That yesterday she called."], "ans": 1, "exp": "It was yesterday that she called = chính hôm qua cô ấy gọi"}
]'::jsonb
);

-- 10. Subjunctive Mood
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Subjunctive Mood — Thức Giả Định',
'C1',
'📗',
'Thức giả định dùng sau một số động từ/cấu trúc để diễn tả đề nghị, yêu cầu, khuyến nghị.

✅ Sau suggest/recommend/insist/request/demand/propose/advise + that + S + V (nguyên thể, không chia):
   — I suggest that he study harder.
   — They recommended that she be promoted.

✅ Sau It is essential/important/vital/necessary/urgent that + S + V (nguyên thể):
   — It is important that you be on time.

✅ Sau wish: I wish I were (không dùng was trong formal):
   — I wish I were a bird.

✅ As if/as though + past:
   — He acts as if he were the boss.

Lưu ý: Trong informal English, often dùng should hoặc indicative thay thế.',
'[
  {"q": "I suggest that he ___ a doctor. (see)", "opts": ["sees", "see", "saw", "seeing"], "ans": 1, "exp": "Giả định sau suggest: V nguyên thể (see)"},
  {"q": "It is essential that she ___ present. (be)", "opts": ["is", "be", "was", "being"], "ans": 1, "exp": "It is essential that + S + V (nguyên thể): be"},
  {"q": "The teacher recommended that we ___ the exam.", "opts": ["retake", "retakes", "retook", "retaking"], "ans": 0, "exp": "recommended that + V nguyên thể: retake"},
  {"q": "I insist that he ___ the truth. (tell)", "opts": ["tells", "tell", "told", "telling"], "ans": 1, "exp": "insist that + V nguyên thể: tell"},
  {"q": "It is vital that the package ___ before noon.", "opts": ["arrives", "arrive", "arrived", "arriving"], "ans": 1, "exp": "It is vital that + V nguyên thể: arrive"},
  {"q": "She demanded that he ___ the money back.", "opts": ["give", "gives", "gave", "giving"], "ans": 0, "exp": "demanded that + V nguyên thể: give"},
  {"q": "I wish I ___ rich.", "opts": ["am", "was", "were", "will be"], "ans": 2, "exp": "wish + were (formal subjunctive)"},
  {"q": "It is important that you ___ honest.", "opts": ["are", "be", "will be", "being"], "ans": 1, "exp": "It is important that + be (giả định): that you be honest"},
  {"q": "She acts as if she ___ the queen.", "opts": ["is", "was", "were", "will be"], "ans": 2, "exp": "as if + were (giả định không có thật)"},
  {"q": "The doctor advised that she ___ more water.", "opts": ["drink", "drinks", "drank", "drinking"], "ans": 0, "exp": "advised that + V nguyên thể: drink"},
  {"q": "They proposed that the meeting ___ postponed.", "opts": ["is", "be", "was", "been"], "ans": 1, "exp": "proposed that + be (giả định): be postponed"},
  {"q": "I recommend that you ___ a lawyer.", "opts": ["consult", "consults", "consulted", "consulting"], "ans": 0, "exp": "recommend that + V nguyên thể: consult"},
  {"q": "It is necessary that every student ___ the regulations.", "opts": ["follows", "follow", "followed", "following"], "ans": 1, "exp": "It is necessary that + V nguyên thể: follow"},
  {"q": "He insisted that she ___ the prize.", "opts": ["accept", "accepts", "accepted", "accepting"], "ans": 0, "exp": "insisted that + V nguyên thể: accept"},
  {"q": "If I ___ you, I wouldn''t do that. (subjunctive)", "opts": ["am", "was", "were", "be"], "ans": 2, "exp": "If I were you = nếu tôi là bạn (giả định)"}
]'::jsonb
);

-- 11. Participle Clauses
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Participle Clauses — Mệnh Đề Phân Từ',
'C1',
'📙',
'Mệnh đề phân từ rút gọn mệnh đề trạng ngữ hoặc mệnh đề quan hệ.

✅ Present Participle (V-ing) — chủ động:
   — Walking home, I met an old friend. (= While I was walking home...)
   — The man sitting there is my boss. (= The man who is sitting there...)

✅ Past Participle (V3) — bị động:
   — Exhausted after the trip, she went straight to bed. (= Because she was exhausted...)
   — The car bought last week broke down. (= The car which was bought...)

✅ Perfect Participle (Having + V3) — hành động hoàn thành trước:
   — Having finished her work, she went home. (= After she had finished...)

Lưu ý: Chủ ngữ của mệnh đề phân từ phải trùng với chủ ngữ câu chính.',
'[
  {"q": "___ home, I realised I forgot my keys.", "opts": ["Arriving", "Arrived", "Having arrived", "Arrive"], "ans": 0, "exp": "Present Participle: Arriving home = When I arrived home"},
  {"q": "___ by the noise, she woke up.", "opts": ["Wake", "Waking", "Woken", "Woke"], "ans": 2, "exp": "Past Participle (bị động): Woken = Because she was woken"},
  {"q": "The girl ___ next to me is my cousin.", "opts": ["sits", "sitting", "sat", "having sat"], "ans": 1, "exp": "Present Participle rút gọn mệnh đề quan hệ: who is sitting"},
  {"q": "___ the report, she submitted it to the boss.", "opts": ["Finish", "Finished", "Having finished", "Finishing"], "ans": 2, "exp": "Perfect Participle: Having finished = After she had finished"},
  {"q": "___ from a long illness, he looked very weak.", "opts": ["Recover", "Recovering", "Recovered", "Having been recovered"], "ans": 2, "exp": "Past Participle: Recovered = Because he had recovered"},
  {"q": "The bridge ___ in 1990 is still strong.", "opts": ["building", "built", "having built", "builds"], "ans": 1, "exp": "Past Participle rút gọn: which was built"},
  {"q": "___ no money, she couldn''t buy the dress.", "opts": ["Have", "Having", "Had", "Has"], "ans": 1, "exp": "Having no money = Because she had no money"},
  {"q": "He sat on the sofa, ___ TV.", "opts": ["watch", "watched", "watching", "having watched"], "ans": 2, "exp": "Present Participle chỉ hành động đồng thời: watching"},
  {"q": "___ by the movie, she cried.", "opts": ["Moved", "Moving", "Move", "Having moved"], "ans": 0, "exp": "Moved by = xúc động bởi (bị động)"},
  {"q": "The students ___ early can leave now.", "opts": ["finish", "finished", "finishing", "having finished"], "ans": 2, "exp": "Rút gọn who finish: finishing = các bạn đã xong"},
  {"q": "___ him before, I recognised him immediately.", "opts": ["Meet", "Met", "Having met", "Meeting"], "ans": 2, "exp": "Having met him before = vì đã gặp trước đây"},
  {"q": "___ tired, she decided to rest.", "opts": ["Feel", "Feeling", "Felt", "Having felt"], "ans": 1, "exp": "Feeling tired = Because she felt tired"},
  {"q": "The document ___ by the manager was urgent.", "opts": ["sign", "signing", "signed", "having signed"], "ans": 2, "exp": "which was signed = signed"},
  {"q": "___ her phone at home, she couldn''t call anyone.", "opts": ["Left", "Leaving", "Having left", "Leave"], "ans": 2, "exp": "Having left her phone = After she had left her phone"},
  {"q": "___ in the rain, I caught a cold.", "opts": ["Walk", "Walking", "Walked", "Having walked"], "ans": 1, "exp": "Walking in the rain = Because I walked in the rain"}
]'::jsonb
);

-- 12. Emphasis (do/does/did, so/such)
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Emphasis — Cách Nhấn Mạnh (do/does/did, so/such)',
'C1',
'📒',
'Các cách nhấn mạnh trong câu:

✅ do/does/did + V (nhấn mạnh động từ):
   — I do like your dress! (Tôi thực sự thích váy của bạn!)
   — She does work hard. (Cô ấy thực sự làm việc chăm chỉ.)
   — He did call me. (Anh ấy đã gọi tôi mà.)

✅ so + adj + that: quá... đến nỗi...
   — The film was so boring that I fell asleep.

✅ such + (a/an) + (adj) + noun + that:
   — It was such a boring film that I fell asleep.
   — She is such a kind person that everyone loves her.

✅ So + adj + be/have + S (đảo ngữ nhấn mạnh):
   — So tired was she that she couldn''t move.',
'[
  {"q": "I ___ like your new haircut! It''s great.", "opts": ["do", "does", "did", "am"], "ans": 0, "exp": "do + V = nhấn mạnh: I do like = tôi thực sự thích"},
  {"q": "She ___ work very hard. She deserves the promotion.", "opts": ["do", "does", "did", "is"], "ans": 1, "exp": "does + V = nhấn mạnh ở hiện tại (she)"},
  {"q": "He ___ call me last night, I promise!", "opts": ["do", "does", "did", "was"], "ans": 2, "exp": "did + V (quá khứ) = anh ấy đã gọi mà"},
  {"q": "The movie was ___ boring that I left early.", "opts": ["so", "such", "too", "very"], "ans": 0, "exp": "so + adj + that: so boring that"},
  {"q": "It was ___ a boring movie that I left early.", "opts": ["so", "such", "too", "very"], "ans": 1, "exp": "such + (a/an) + noun: such a boring movie"},
  {"q": "She is ___ a talented singer that everyone admires her.", "opts": ["so", "such", "too", "very"], "ans": 1, "exp": "such + a + adj + noun: such a talented singer"},
  {"q": "I ___ appreciate your help!", "opts": ["do", "does", "am", "have"], "ans": 0, "exp": "do appreciate = thực sự cảm kích"},
  {"q": "The music was ___ loud that my ears hurt.", "opts": ["so", "such", "too", "enough"], "ans": 0, "exp": "so + adj + that: so loud that"},
  {"q": "He is ___ a good teacher that all students love him.", "opts": ["so", "such", "too", "very"], "ans": 1, "exp": "such + a + adj + noun: such a good teacher"},
  {"q": "She said she ___ love me. (Nhấn mạnh quá khứ)", "opts": ["do", "does", "did", "was"], "ans": 2, "exp": "did love = thực sự yêu (quá khứ)"},
  {"q": "___ beautiful was the music that everyone cried.", "opts": ["So", "Such", "Too", "Very"], "ans": 0, "exp": "Đảo ngữ: So + adj + V + S: So beautiful was the music"},
  {"q": "There were ___ many people that we couldn''t move.", "opts": ["so", "such", "too", "very"], "ans": 0, "exp": "so many + noun: so many people that"},
  {"q": "He spent ___ a long time that he missed the bus.", "opts": ["so", "such", "too", "very"], "ans": 1, "exp": "such + a + adj + noun: such a long time"},
  {"q": "I ___ think you should apologise to her.", "opts": ["do", "does", "am", "have"], "ans": 0, "exp": "do think = thực sự nghĩ (nhấn mạnh)"},
  {"q": "___ was his anger that nobody dared speak.", "opts": ["So", "Such", "Too", "Very"], "ans": 1, "exp": "Such + be + noun + that: Such was his anger that..."}
]'::jsonb
);

-- ===================== C2 =====================

-- 13. Ellipsis & Substitution
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Ellipsis & Substitution — Tỉnh Lược & Thay Thế',
'C2',
'📘',
'Tỉnh lược (Ellipsis) bỏ từ không cần thiết để tránh lặp. Thay thế (Substitution) dùng từ thay thế.

✅ Ellipsis sau các động từ khiếm khuyết:
   — A: Can you help me? B: I can. (bỏ help you)
   — A: Have you finished? B: Yes, I have. (bỏ finished)

✅ Ellipsis trong câu phối hợp:
   — He speaks English and she ___ French. (bỏ speaks)
   — Tom likes tea and Mary ___ coffee. (bỏ likes)

✅ Substitution với so/not sau believe, think, hope, expect:
   — A: Is he coming? B: I think so. / I hope not.

✅ Substitution với one/ones:
   — I don''t like this shirt. I prefer the blue one.
   
✅ Substitution với do/does/did thay cho động từ:
   — She works harder than I do. (= than I work)',
'[
  {"q": "A: Can you swim? B: Yes, I ___.", "opts": ["can swim", "can", "swim", "can do"], "ans": 1, "exp": "Ellipsis: bỏ swim sau can"},
  {"q": "A: Will she come? B: I think ___.", "opts": ["so", "it", "that", "this"], "ans": 0, "exp": "I think so = tôi nghĩ vậy (thay thế cho cả mệnh đề)"},
  {"q": "A: Is he angry? B: I hope ___.", "opts": ["so", "not", "no", "it"], "ans": 1, "exp": "I hope not = tôi hy vọng là không"},
  {"q": "I don''t like this dress. I prefer the blue ___.", "opts": ["one", "ones", "dress", "it"], "ans": 0, "exp": "one thay cho dress (số ít)"},
  {"q": "She sings better than I ___.", "opts": ["sing", "do", "am", "can"], "ans": 1, "exp": "do thay cho sing: than I do = than I sing"},
  {"q": "A: Have you seen the film? B: Yes, I ___.", "opts": ["have seen", "have", "did", "saw"], "ans": 1, "exp": "Ellipsis: bỏ seen the film: Yes, I have."},
  {"q": "John likes coffee and Mary ___ tea.", "opts": ["likes", "—", "like", "does"], "ans": 1, "exp": "Ellipsis: bỏ likes: John likes coffee and Mary tea"},
  {"q": "A: She won''t come. B: I think ___.", "opts": ["so", "not", "no", "it"], "ans": 1, "exp": "I think not = tôi nghĩ là không"},
  {"q": "These apples are fresh, but those ___ are not.", "opts": ["apples", "ones", "one", "—"], "ans": 1, "exp": "ones thay cho apples (số nhiều)"},
  {"q": "A: Can you drive? B: No, I can''t, but my sister ___.", "opts": ["can", "does", "drives", "is"], "ans": 0, "exp": "Ellipsis: my sister can (drive)"},
  {"q": "She works harder than he ___.", "opts": ["does", "works", "do", "is"], "ans": 0, "exp": "does thay cho works: than he does"},
  {"q": "A: Are they coming? B: I believe ___.", "opts": ["so", "not", "that", "it"], "ans": 0, "exp": "I believe so = tôi tin là vậy"},
  {"q": "I''ll take the red ___, please.", "opts": ["one", "ones", "it", "—"], "ans": 0, "exp": "one thay cho danh từ đếm được số ít"},
  {"q": "A: Who broke the window? B: Not ___ (I didn''t).", "opts": ["I", "me", "mine", "myself"], "ans": 1, "exp": "Tỉnh lược trong tiếng Anh nói: Not me = I didn''t"},
  {"q": "She passed the exam and I did ___.", "opts": ["too", "so", "also", "either"], "ans": 0, "exp": "and I did too = và tôi cũng vậy (thay thế cả mệnh đề)"}
]'::jsonb
);

-- 14. Fronting
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Fronting — Đảo Thành Phần Lên Đầu Câu',
'C2',
'📗',
'Fronting là đưa thành phần phụ lên đầu câu để nhấn mạnh, thường dùng trong văn viết trang trọng.

✅ Tân ngữ lên đầu:
   — His money he spent on travel. (thay vì: He spent his money on travel.)

✅ Tính từ / trạng ngữ lên đầu:
   — Happy though she was, she still missed her family.
   — Deep in the forest lives a mysterious creature.

✅ Cụm giới từ lên đầu + đảo ngữ:
   — On the table stood a vase of flowers.
   — Around the corner came a strange man.

✅ Not a + noun + aux + S: nhấn mạnh phủ định:
   — Not a word did he say. (Anh ấy không nói một lời nào.)
   — Not a single person did I see. (Tôi không thấy một ai.)',
'[
  {"q": "___ money he spent on travelling, not on clothes.", "opts": ["His", "The", "A", "Some"], "ans": 0, "exp": "Fronting: tân ngữ his money lên đầu"},
  {"q": "On the table ___ a beautiful vase.", "opts": ["stood", "was stood", "were", "did stand"], "ans": 0, "exp": "Đảo ngữ: On the table stood... = ...stood on the table"},
  {"q": "Not a word ___ about the accident.", "opts": ["he said", "did he say", "he did say", "said he"], "ans": 1, "exp": "Not a word + did + S + V: did he say"},
  {"q": "Happy ___ she was, she still felt lonely.", "opts": ["but", "though", "as", "although"], "ans": 1, "exp": "Happy though she was = mặc dù cô ấy hạnh phúc"},
  {"q": "At the end of the street ___ a small café.", "opts": ["stands", "does stand", "standing", "stood"], "ans": 0, "exp": "Đảo ngữ: At the end... stands a café"},
  {"q": "___ a single person did I recognise at the party.", "opts": ["No", "Never", "Not", "None"], "ans": 2, "exp": "Not a single person did I = tôi không nhận ra một ai"},
  {"q": "In the middle of the room ___ a large table.", "opts": ["was", "is", "were", "are"], "ans": 0, "exp": "Đảo ngữ với was: In the middle... was a table"},
  {"q": "His true feelings ___ he never revealed.", "opts": ["—", "that", "which", "them"], "ans": 0, "exp": "Fronting tân ngữ: His true feelings he never revealed"},
  {"q": "___ did I expect to see her there.", "opts": ["Never", "Not", "No", "None"], "ans": 0, "exp": "Never + did + S + V: Never did I expect"},
  {"q": "Bitter ___ the medicine was, he drank it all.", "opts": ["but", "though", "as", "however"], "ans": 1, "exp": "Adj + though + S + V: Bitter though it was"},
  {"q": "Down the hill ___ a group of children.", "opts": ["came", "did come", "comes", "was coming"], "ans": 0, "exp": "Down the hill came = đảo trạng ngữ + động từ"},
  {"q": "Not until the next day ___ the truth.", "opts": ["he discovered", "did he discover", "he did discover", "discovered he"], "ans": 1, "exp": "Not until + did + S + V: did he discover"},
  {"q": "So loudly ___ that the neighbours complained.", "opts": ["he played music", "did he play music", "played he music", "music he played"], "ans": 1, "exp": "So loudly + did + S + V: did he play music"},
  {"q": "___ a single mistake did she make in the test.", "opts": ["Never", "Not", "No", "None"], "ans": 1, "exp": "Not a single mistake did she make = cô ấy không mắc lỗi nào"},
  {"q": "Câu nào dùng fronting đúng?", "opts": ["I did nothing wrong.", "Nothing wrong I did.", "Nothing wrong did I do.", "Wrong I did nothing."], "ans": 2, "exp": "Nothing wrong + did + S + V: Nothing wrong did I do."}
]'::jsonb
);

-- 15. Hedge Language
INSERT INTO grammar_lessons (title, level, icon, theory, questions) VALUES (
'Hedge Language — Ngôn Ngữ Thận Trọng (sort of, arguably, maybe)',
'C2',
'📙',
'Hedging là cách dùng từ ngữ thận trọng, tránh khẳng định quá chắc chắn — thường dùng trong học thuật và giao tiếp lịch sự.

✅ Hedging với động từ:
   — seem, appear, tend, suggest, indicate
   — It seems that the economy is recovering.
   — The data suggests that the theory is correct.

✅ Hedging với trạng từ:
   — arguably, possibly, perhaps, maybe, probably
   — arguably the best solution / probably not correct

✅ Hedging với từ ngữ giảm nhẹ:
   — sort of, kind of, a bit, rather, quite
   — I''m kind of tired. (= rather tired)
   — It''s a bit expensive. (= quite expensive)
   
✅ Hedging với lượng từ:
   — some, several, a number of, a certain amount of

✅ Tác dụng: làm cho câu nói lịch sự, khiêm tốn, tránh khẳng định tuyệt đối.',
'[
  {"q": "The study ___ that there may be a connection.", "opts": ["proves", "confirms", "suggests", "shows absolutely"], "ans": 2, "exp": "suggests = gợi ý (hedging, không khẳng định chắc chắn)"},
  {"q": "It ___ that the situation is improving.", "opts": ["seems", "knows", "proves", "establishes"], "ans": 0, "exp": "It seems that = dường như (hedging verb)"},
  {"q": "This is ___ the most important point in the argument.", "opts": ["definitely", "absolutely", "arguably", "undoubtedly"], "ans": 2, "exp": "arguably = có thể nói là (hedging, thận trọng)"},
  {"q": "I''m ___ tired after the long walk.", "opts": ["absolutely", "completely", "kind of", "totally"], "ans": 2, "exp": "kind of = hơi, khá (giảm nhẹ, hedging)"},
  {"q": "There are ___ reasons to believe this is true.", "opts": ["a certain number of", "several", "exactly three", "precisely"], "ans": 1, "exp": "several = một vài (hedging, không chốt số lượng)"},
  {"q": "The results ___ that our hypothesis was correct.", "opts": ["prove", "indicate", "show conclusively", "confirm"], "ans": 1, "exp": "indicate = chỉ ra (hedging, ít mạnh mẽ hơn prove)"},
  {"q": "It is ___ the best solution we have found so far.", "opts": ["certainly", "definitely", "probably", "undoubtedly"], "ans": 2, "exp": "probably = có lẽ (hedging, không tuyệt đối)"},
  {"q": "She is ___ upset about what happened.", "opts": ["completely", "totally", "a bit", "extremely"], "ans": 2, "exp": "a bit = hơi (giảm nhẹ mức độ)"},
  {"q": "___ speaking, this approach has its limitations.", "opts": ["Strictly", "Broadly", "Absolutely", "Exactly"], "ans": 1, "exp": "Broadly speaking = nói chung (hedging)"},
  {"q": "The weather is ___ cold today, isn''t it?", "opts": ["very", "extremely", "rather", "terribly"], "ans": 2, "exp": "rather = khá (hedging, nhẹ hơn very)"},
  {"q": "I ___ that we should reconsider the plan.", "opts": ["know absolutely", "am certain", "tend to think", "am 100% sure"], "ans": 2, "exp": "tend to think = có xu hướng nghĩ (hedging)"},
  {"q": "This costs ___ more than I expected.", "opts": ["far", "much", "a bit", "enormously"], "ans": 2, "exp": "a bit more = đắt hơn một chút (giảm nhẹ)"},
  {"q": "The patient ___ to recover fully.", "opts": ["will certainly", "is guaranteed to", "is likely", "definitely will"], "ans": 2, "exp": "is likely = có khả năng (hedging, không chắc chắn)"},
  {"q": "___ it will rain later, but I''m not sure.", "opts": ["Definitely", "Certainly", "Maybe", "Undoubtedly"], "ans": 2, "exp": "Maybe = có lẽ (hedging, thể hiện sự không chắc chắn)"},
  {"q": "Câu nào dùng hedging?", "opts": ["The plan will definitely fail.", "This is undoubtedly the best.", "It appears that the plan may need adjustment.", "I am absolutely certain."], "ans": 2, "exp": "''It appears that... may...'' = hedging, thận trọng"}
]'::jsonb
);
