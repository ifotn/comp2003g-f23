USE lesson12;

-- Select the usernames and email addresses of all users. (sort usernames a-z)
SELECT username, email
FROM users
ORDER BY username;

-- List the titles of all shows along with their categories. (sort titles a-z)
SELECT title, categoryName
FROM shows
INNER JOIN categories ON shows.categoryId = categories.categoryId
ORDER BY title, categoryName;

--    Count the total number of episodes for each show. (sort titles a-z)
SELECT shows.title AS showTitle, COUNT(episodes.showId) AS episodeCount
FROM shows
LEFT JOIN episodes on shows.showId = episodes.showId
GROUP BY shows.title
ORDER BY shows.title;

--    Find the usernames of users who have added shows to their watchlists. (sort usernames a-z)
SELECT username 
FROM users
INNER JOIN watchLists ON users.userId = watchLists.userId
GROUP BY username
ORDER BY username;

--    List the usernames who have completed at least one episode. (use DISTINCT keyword after SELECT to prevent duplicates)
SELECT DISTINCT username
FROM users
INNER JOIN watchHistory ON users.userId = watchHistory.userId
WHERE completed = 1;

INSERT INTO users (username, email, password) 
VALUES ('rich', 'rich@gc.ca', 'pass');

--    Find the total number of episodes watched by each user. (sort usernames a-z, use OUTER JOIN to include users who have never watched any episodes)
SELECT username, COUNT(watchHistoryId) AS showsWatched
FROM users
LEFT JOIN watchHistory ON users.userId = watchHistory.userId
GROUP BY username
ORDER BY username;

--    Select the usernames, show titles, episode titles and watch dates for completed episodes. (sort by username, show title, watchDate)
SELECT username, shows.title AS 'show', episodes.title AS episode, watchDate
FROM watchHistory
INNER JOIN users ON users.userId = watchHistory.userId
INNER JOIN episodes ON episodes.episodeId = watchHistory.episodeId
INNER JOIN shows ON shows.showId = episodes.showId
WHERE completed = 1
ORDER BY username, shows.title, watchDate;

--    For each category, display the category name and the count of shows in that category. (sort by categoryName a-z, use OUTER JOIN to get all categories, even those which may not have any shows)
SELECT categoryName, COUNT(showId) AS totalShows
FROM categories
LEFT JOIN shows ON categories.categoryId = shows.categoryId
GROUP BY categoryName
ORDER BY categoryName;

--    Select the category with the highest number of episodes.
SELECT categoryName, COUNT(episodeId) AS totalEpisodes
FROM categories
LEFT JOIN shows ON categories.categoryId = shows.categoryId
LEFT JOIN episodes ON shows.showId = episodes.showId
GROUP BY categoryName
ORDER BY totalEpisodes DESC
LIMIT 1;


