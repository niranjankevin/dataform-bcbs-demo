# Dataform Project: Stack Overflow Data Pipeline

This repository contains the Dataform project for building a data warehouse based on Stack Overflow data. The pipeline extracts data from various source tables, transforms it through staging and combined layers, and ultimately loads it into a data mart for analysis.

## Overview

The data pipeline consists of the following key stages:

1.  **Source Declarations:** Defines the connections to the raw data sources in Google BigQuery. These include:
    * `posts_answers`: Contains data related to answers posted on Stack Overflow.
    * `vote_types`: Lists the different types of votes cast on Stack Overflow content.
    * `posts_questions`: Contains data related to questions posted on Stack Overflow.
    * `votes`: Stores individual vote records.
    * `badges`: Contains information about badges awarded to users.
    * `users`: Contains details about Stack Overflow users.

2.  **Staging Views:** Creates intermediate views (`stg_*`) on top of the source tables. These views typically involve:
    * Selecting relevant columns.
    * Renaming columns for consistency.
    * Performing basic data type casting or cleaning.
    * Examples include: `stg_posts_answers`, `stg_vote_types`, `stg_posts_questions`, `stg_votes`, `stg_badges`, and `stg_users`.

3.  **Combined Tables:** Joins data from multiple staging views to create more comprehensive tables.
    * `posts_combined`: Likely combines information from `stg_posts_answers` and `stg_posts_questions` to provide a unified view of posts.
    * `user_votes`: Probably joins `stg_votes` with `stg_users` to provide context on who cast which votes.

4.  **Assertion:** Includes data quality checks to ensure the integrity of the data at various stages.
    * `staging_vote_types_...`: An assertion on the `stg_vote_types` view.
    * `datamart_posts_combin...` (two instances): Assertions on the `posts_combined` table, likely checking different aspects of data quality.

5.  **Data Mart Views:** Creates views (`datamart_*`) designed for end-user analysis. These views often involve aggregations, calculations, and business logic.
    * `user_stats`: Likely aggregates data from `user_votes` and `stg_users` (and potentially `stg_badges`) to provide key statistics about users.
    * `datamart_user_stats_ass...` (two instances): Assertions on the `user_stats` view, ensuring the calculated statistics meet certain criteria.

![Screenshot 2025-04-08 at 2 17 30 PM](https://github.com/user-attachments/assets/4d116919-12bb-4088-8e25-532fa02e7402)
