-- ==========================================
-- DDL Script: Fitness Center Management System
-- Database: PostgreSQL (Supabase)
-- Created for: Final Project Submission
-- ==========================================

-- 1. СТВОРЕННЯ ТАБЛИЦЬ MVP ВЕРСІЇ

-- Таблиця клієнтів (головна)
CREATE TABLE Members (
member_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone VARCHAR(20),
registration_date DATE DEFAULT CURRENT_DATE
);

-- Таблиця абонементів (зв'язок 1:M до Members)
CREATE TABLE Memberships (
membership_id SERIAL PRIMARY KEY,
member_id INTEGER NOT NULL,
membership_type VARCHAR(20) CHECK (membership_type IN ('monthly', 'yearly', 'premium')),
start_date DATE NOT NULL,
end_date DATE NOT NULL,
FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Таблиця тренерів
CREATE TABLE Trainers (
trainer_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
specialization VARCHAR(100)
);

-- Таблиця занять (зв'язок 1:M до Trainers)
CREATE TABLE Classes (
class_id SERIAL PRIMARY KEY,
class_name VARCHAR(100) NOT NULL,
trainer_id INTEGER,
class_schedule TIMESTAMP,
FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id)
);

-- Таблиця відвідуваності (зв'язок M:M між Members та Classes)
CREATE TABLE Attendance (
attendance_id SERIAL PRIMARY KEY,
member_id INTEGER NOT NULL,
class_id INTEGER NOT NULL,
attendance_date DATE DEFAULT CURRENT_DATE,
FOREIGN KEY (member_id) REFERENCES Members(member_id),
FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- 2. СТВОРЕННЯ ТАБЛИЦЬ FINAL VERSION (РОЗШИРЕННЯ)

-- Таблиця прогресу клієнтів
CREATE TABLE Progress (
progress_id SERIAL PRIMARY KEY,
member_id INTEGER NOT NULL,
weight DECIMAL(5,2),
body_fat_percentage DECIMAL(4,2),
fitness_goals TEXT,
goal_achievement_date DATE,
recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Таблиця інвентарю обладнання
CREATE TABLE Equipment (
equipment_id SERIAL PRIMARY KEY,
equipment_name VARCHAR(100) NOT NULL,
status VARCHAR(50) DEFAULT 'operational',
last_maintenance_date DATE
);

-- Таблиця спеціалізацій тренерів (Many-to-Many навички)
CREATE TABLE TrainerSpecializations (
specialization_id SERIAL PRIMARY KEY,
trainer_id INTEGER NOT NULL,
specialization_name VARCHAR(100) NOT NULL,
certification_level VARCHAR(50),
FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id)
);

-- 3. СТВОРЕННЯ ІНДЕКСІВ ДЛЯ ОПТИМІЗАЦІЇ (як у питанні 8 нашого тесту)
CREATE INDEX idx_member_email ON Members(email);
CREATE INDEX idx_class_schedule ON Classes(class_schedule);                                                                                                                                                                  