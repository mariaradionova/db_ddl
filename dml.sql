-- ==========================================
-- DML Script: Наповнення бази даних фітнес-центру
-- У кожній таблиці по 10 записів
-- ==========================================

-- 1. Наповнення Members (Клієнти)
INSERT INTO Members (first_name, last_name, email, phone) VALUES
('Олена', 'Ковальчук', 'olena.koval@email.com', '+380501111111'),
('Олександр', 'Коваленко', 'olex@email.com', '+380502222222'),
('Олена', 'Мельник', 'olena.m@email.com', '+380503333333'),
('Дмитро', 'Шевченко', 'dima.sheva@email.com', '+380504444444'),
('Анна', 'Ткаченко', 'anya.tk@email.com', '+380505555555'),
('Ігор', 'Бондар', 'igor.b@email.com', '+380506666666'),
('Світлана', 'Кравченко', 'sveta.kr@email.com', '+380507777777'),
('Артем', 'Лисенко', 'artem.l@email.com', '+380508888888'),
('Наталія', 'Мороз', 'natali.m@email.com', '+380509999999'),
('Віктор', 'Павлов', 'viktor.p@email.com', '+380500000000');

-- 2. Наповнення Trainers (Тренери)
INSERT INTO Trainers (first_name, last_name, specialization) VALUES
('Сергій', 'Петренко', 'Yoga'),
('Юлія', 'Сидоренко', 'Crossfit'),
('Олег', 'Васильєв', 'Bodybuilding'),
('Тетяна', 'Волкова', 'Pilates'),
('Максим', 'Кузнецов', 'Boxing'),
('Вікторія', 'Орлова', 'Zumba'),
('Андрій', 'Соколов', 'Powerlifting'),
('Катерина', 'Нікітіна', 'Aerobics'),
('Павло', 'Григор''єв', 'Swimming'),
('Людмила', 'Козак', 'Stretching');

-- 3. Наповнення Memberships (Абонементи)
-- Використовуємо обмеження CHECK (monthly, yearly, premium)
INSERT INTO Memberships (member_id, membership_type, start_date, end_date) VALUES
(1, 'premium', '2024-01-01', '2024-12-31'),
(2, 'monthly', '2024-05-01', '2024-06-01'),
(3, 'yearly', '2024-02-15', '2025-02-15'),
(4, 'monthly', '2024-05-10', '2024-06-10'),
(5, 'premium', '2024-03-01', '2025-03-01'),
(6, 'yearly', '2024-01-20', '2025-01-20'),
(7, 'monthly', '2024-05-20', '2024-06-20'),
(8, 'premium', '2024-04-12', '2025-04-12'),
(9, 'yearly', '2024-02-01', '2025-02-01'),
(10, 'monthly', '2024-05-05', '2024-06-05');

-- 4. Наповнення Classes (Заняття)
INSERT INTO Classes (class_name, trainer_id, class_schedule) VALUES
('Morning Yoga', 1, '2024-06-01 08:00:00'),
('Intensive Crossfit', 2, '2024-06-01 18:00:00'),
('Power Lifting', 3, '2024-06-02 10:00:00'),
('Advanced Pilates', 4, '2024-06-02 12:00:00'),
('Boxing Basics', 5, '2024-06-03 19:00:00'),
('Zumba Dance', 6, '2024-06-03 17:00:00'),
('Hardcore Bodybuilding', 7, '2024-06-04 09:00:00'),
('Step Aerobics', 8, '2024-06-04 11:00:00'),
('Pool Session', 9, '2024-06-05 07:00:00'),
('Deep Stretching', 10, '2024-06-05 20:00:00');

-- 5. Наповнення Attendance (Відвідуваність)
INSERT INTO Attendance (member_id, class_id, attendance_date) VALUES
(1, 1, '2024-06-01'),
(2, 2, '2024-06-01'),
(3, 3, '2024-06-02'),
(4, 4, '2024-06-02'),
(5, 5, '2024-06-03'),
(6, 6, '2024-06-03'),
(7, 7, '2024-06-04'),
(8, 8, '2024-06-04'),
(9, 9, '2024-06-05'),
(10, 10, '2024-06-05');

-- 6. Наповнення Progress (Прогрес)
INSERT INTO Progress (member_id, weight, body_fat_percentage, fitness_goals) VALUES
(1, 65.5, 22.0, 'Improve flexibility'),
(2, 85.0, 18.5, 'Muscle gain'),
(3, 70.2, 25.0, 'Weight loss'),
(4, 92.0, 20.0, 'Strength endurance'),
(5, 58.0, 19.0, 'Keep fit'),
(6, 80.5, 21.0, 'Better cardio'),
(7, 66.0, 24.0, 'Tone muscles'),
(8, 105.0, 28.0, 'Major weight loss'),
(9, 75.0, 15.0, 'Marathon prep'),
(10, 88.0, 22.5, 'General health');

-- 7. Наповнення Equipment (Обладнання)
INSERT INTO Equipment (equipment_name, status, last_maintenance_date) VALUES
('Treadmill #1', 'operational', '2024-05-01'),
('Bench Press', 'operational', '2024-04-15'),
('Yoga Mat Set', 'operational', '2024-05-20'),
('Dumbbell Set 1-20kg', 'operational', '2024-03-10'),
('Elliptical Trainer', 'under repair', '2024-05-25'),
('Stationary Bike', 'operational', '2024-04-01'),
('Power Rack', 'operational', '2024-02-28'),
('Boxing Bag', 'operational', '2024-05-10'),
('Smith Machine', 'operational', '2024-03-20'),
('Leg Press Machine', 'operational', '2024-04-22');

-- 8. Наповнення TrainerSpecializations (Спеціалізації)
INSERT INTO TrainerSpecializations (trainer_id, specialization_name, certification_level) VALUES
(1, 'Hatha Yoga', 'Master'),
(2, 'HIIT Training', 'Advanced'),
(3, 'Nutritional Coaching', 'Expert'),
(4, 'Rehabilitation', 'Specialist'),
(5, 'Professional Boxing', 'Master'),
(6, 'Latin Dance', 'Instructor'),
(7, 'Olympic Lifting', 'Advanced'),
(8, 'Group Fitness', 'Basic'),
(9, 'Water Polo', 'Coach'),
(10, 'Yoga Therapy', 'Advanced');
