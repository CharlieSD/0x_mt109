SELECT COUNT(actor_id) FROM series WHERE name = "Big Sister";

SELECT name FROM director INNER JOIN (
    SELECT director_id, COUNT(director_id)
    FROM episode  GROUP BY director_id
    HAVING COUNT (director_id)=(
        SELECT MAX(episode_count)
        FROM (
            SELECT director_id, COUNT(director_id) episode_count
            FROM episode
            GROUP BY director_id
        )
    )
) ON director.id=director_id;

