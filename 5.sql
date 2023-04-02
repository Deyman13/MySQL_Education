USE lesson_4;

"""Представление пользователей не старше 20 лет"""

CREATE OR REPLACE VIEW SHORT_INFO AS
SELECT u.firstname, u.lastname, p.hometown, p.gender
FROM users AS u
JOIN profiles AS p ON u.id = p.user_id
WHERE TIMESTAMPDIFF(YEAR, p.birthday, NOW()) <= 20;

SELECT * FROM SHORT_INFO;
DROP VIEW SHORT_INFO;

"""Ранжированный список пользователей по количеству отправленных сообщений"""

SELECT ,
DENSE_RANK() OVER(ORDER BY SUM_MESSAGES DESC) AS RANG
FROM (
SELECT DISTINCTROW u.firstname, u.lastname, COUNT() OVER(PARTITION BY from_user_id) AS SUM_MESSAGES
FROM users AS u
JOIN messages AS m ON u.id = from_user_id
) AS d;

"""3. Список сообщений с разницей отправки между ними"""

SELECT body AS 'Сообщение',
created_at AS 'Дата отправления',
TIMESTAMPDIFF(MINUTE, LAG(created_at, 1, created_at) OVER(ORDER BY created_at), created_at) AS 'Разница отправки (минуты)'
FROM messages;