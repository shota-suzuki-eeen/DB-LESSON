-- Q1
CREATE TABLE departments (
department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Q2
ALTER TABLE people
ADD COLUMN department_id INT UNSIGNED NULL AFTER email;

-- Q3
INSERT INTO departments (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, department_id)
VALUES
('A次郎', 1),
('B次郎', 1),
('C次郎', 1),
('D次郎', 2),
('E次郎', 2),
('F次郎', 2),
('G次郎', 2),
('H次郎', 3),
('I次郎', 4),
('J次郎', 5);

INSERT INTO reports (person_id, content)
VALUES
(7, 'A次郎のはじめての日報です'),
(8, 'B次郎のはじめての日報です'),
(9, 'C次郎のはじめての日報です'),
(10, 'D次郎のはじめての日報です'),
(11, 'E次郎のはじめての日報です'),
(12, 'F次郎のはじめての日報です'),
(13, 'G次郎のはじめての日報です'),
(14, 'H次郎のはじめての日報です'),
(15, 'I次郎のはじめての日報です'),
(16, 'J次郎のはじめての日報です');

-- Q4
UPDATE people
SET department_id = 1
WHERE department_id IS NULL;

-- Q5
SELECT name, age
FROM people
WHERE gender = 1
ORDER BY age DESC;

-- Q6
ここまで作成してきたテーブルの`name`, `email`, `age`カラムを対象とし、peopleテーブルから情報を抽出。
条件は`department_id`の値が1(営業)に設定されているレコードのみで、`created_at`カラムの情報をを基準にレコードを昇順に並び替えて表示させることを目的としたSQL文

-- Q7

SELECT name, age, gender
FROM people
WHERE (age BETWEEN 20 AND 29 AND gender = 2)
OR (age BETWEEN 40 AND 49 AND gender = 1);

-- Q8
SELECT *
FROM people
WHERE department_id = 1
ORDER BY age;

-- Q9
SELECT AVG(age)
AS average_age
FROM people
GROUP BY department_id = 2;

-- Q10
SELECT
p.name AS person_name,
d.name AS department_name,
r.content AS report_content
FROM people p
INNER JOIN departments d ON p.department_id = d.department_id
INNER JOIN reports r ON p.person_id = r.person_id;

-- Q11
SELECT p.name
FROM people p
LEFT JOIN reports r ON p.person_id = r.person_id
WHERE r.report_id IS NULL;