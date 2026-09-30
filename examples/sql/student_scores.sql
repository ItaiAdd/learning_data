CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    course TEXT NOT NULL,
    score INTEGER
);

INSERT INTO students (student_id, name, course, score) VALUES
    (1, 'Ava', 'Biology', 82),
    (2, 'Noah', 'Physics', 76),
    (3, 'Mina', 'Biology', 91),
    (4, 'Leo', 'Physics', 88),
    (5, 'Zara', 'Biology', 73);

SELECT
    course,
    COUNT(*) AS student_count,
    ROUND(AVG(score), 1) AS average_score
FROM students
GROUP BY course
ORDER BY average_score DESC;
