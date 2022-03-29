SELECT Gender, Code, Prefecture, MD13, FIND_IN_SET(
  MD13, (
    SELECT GROUP_CONCAT(
      MD13 ORDER BY MD13 DESC
    )
    FROM artscore
  )
) AS ranking
FROM artscore;