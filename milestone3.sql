USE db_social_platform;

#Seleziona gli utenti che hanno postato almeno un video

SELECT distinct us.username as "utente", me.type
FROM users us
JOIN medias me on me.user_id = us.id
WHERE me.type like "video";

#Seleziona tutti i post senza Like (13)

SELECT *
FROM posts po
LEFT JOIN  likes li on po.id = li.post_id
WHERE li.post_id is null;

#Conta il numero di like per ogni post (152)

SELECT po.id as "posts" , count(li.post_id) as "likes"
FROM posts po
LEFT JOIN likes li on po.id = li.post_id
WHERE li.post_id > 0
GROUP BY po.id
ORDER BY count(li.post_id) desc;

#Ordina gli utenti per il numero di media caricati (25)

SELECT  us.id as "utente", count(me.id) as "media caricati"
FROM users us
JOIN medias me on me.user_id = us.id
GROUP BY us.id
ORDER BY count(me.id) desc;

#Ordina gli utenti per totale di likes ricevuti nei loro posts (25)

SELECT  us.id as "utente", count(li.post_id) as "likes posts"
FROM users us
JOIN likes li on us.id = li.user_id
GROUP BY us.id;