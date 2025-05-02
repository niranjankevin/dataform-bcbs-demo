SELECT
    *
FROM
    `preston-307021.was_there_extreme_weather`
    LEFT OUTER JOIN `preston-307021.repositories_that_mention_extreme_weather` USING (date)
ORDER BY
    date