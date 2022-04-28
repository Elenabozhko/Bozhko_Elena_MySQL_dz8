--- Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека,
который больше всех общался с выбранным пользователем (написал ему сообщений).----

SELECT u.firstname, u.lastname
FROM users u
JOIN
messages m
WHERE m.from_user_id = u.id AND m.to_user_id = 1
GROUP BY u.firstname, u.lastname
ORDER BY count(from_user_id) DESC
LIMIT 1




----Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

SELECT count(*) 'likes count'
FROM likes l
JOIN
profiles p
WHERE p.user_id = l.user_id AND timestampdiff(YEAR, p.birthday, now()) <10
;



-----Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT CASE (gender)
	WHEN 'm' THEN 'мужчин'
	WHEN 'f' THEN 'женщин'
	END AS 'Кого больше', count(*) AS 'лайков'
FROM profiles p
JOIN
likes 1
WHERE l.user_id = p.user_id
GROUP BY gender
LIMIT 1