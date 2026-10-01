-- session 1 task 2

CREATE DATABASE ipl2023;

USE ipl2023;


CREATE TABLE matches (
    match_no INT PRIMARY KEY,
    city VARCHAR(100),
    date_of_match DATE,
    venue VARCHAR(200),
    Home_team VARCHAR(100),
    Away_team VARCHAR(100),
    toss_winner VARCHAR(100),
    winner VARCHAR(100),
    man_of_the_match VARCHAR(100),
    result VARCHAR(100),
    result_margin INT,
    eliminator VARCHAR(20),
    umpire1 VARCHAR(100),
    umpire2 VARCHAR(100)
);
ALTER TABLE matches
MODIFY date_of_match VARCHAR(20);

SELECT COUNT(*) AS total_matches
FROM matches;

select * from matches;



CREATE TABLE match_scoreboard (
    match_no INT PRIMARY KEY,
    Home_team_run INT,
    Home_team_wickets INT,
    Home_team_over DECIMAL(4,1),
    Away_team_run INT,
    Away_team_wickets INT,
    Away_team_over DECIMAL(4,1)
);

select  * from match_scoreboard;



CREATE TABLE batsman (
    match_no INT,
    Batsman VARCHAR(100),
    team VARCHAR(100),
    Run INT,
    Ball INT,
    4s INT,
    6s INT,
    out_by VARCHAR(100)
);

select * from batsman;
SELECT COUNT(*) AS total_batsman_records
FROM batsman;


CREATE TABLE bowler (
    match_no INT,
    Bowler VARCHAR(100),
    team VARCHAR(100),
    `over` DECIMAL(4,1),
    run INT,
    wicket INT,
    No_ball INT,
    ECO DECIMAL(4,2)
);

select * from bowler;
SELECT COUNT(*) AS total_bowler_records
FROM bowler;

SELECT team, COUNT(*) AS total_matches
FROM (
    SELECT Home_team AS team
    FROM matches

    UNION ALL

    SELECT Away_team AS team
    FROM matches
) AS all_teams
GROUP BY team
ORDER BY total_matches DESC;



-- session 2 ->task 3
-- zomato database
CREATE DATABASE zomatorestaurant;
USE zomatorestaurant;

CREATE TABLE restaurants (
    restaurant_id INT,
    restaurant_name VARCHAR(255),
    country_code INT,
    city VARCHAR(100),
    address TEXT,
    locality VARCHAR(255),
    locality_verbose TEXT,
    longitude DECIMAL(10,6),
    latitude DECIMAL(10,6),
    cuisines TEXT,
    average_cost_for_two INT,
    currency VARCHAR(100),
    has_table_booking VARCHAR(10),
    has_online_delivery VARCHAR(10),
    is_delivering_now VARCHAR(10),
    switch_to_order_menu VARCHAR(10),
    price_range INT,
    aggregate_rating DECIMAL(2,1),
    rating_color VARCHAR(50),
    rating_text VARCHAR(50),
    votes INT
);

SELECT COUNT(*) AS total_restaurants
FROM restaurants;

SELECT * FROM restaurants
LIMIT 5;

SELECT
    COUNT(*) AS total_rows,
    COUNT(restaurant_id) AS restaurant_id,
    COUNT(restaurant_name) AS restaurant_name,
    COUNT(city) AS city,
    COUNT(cuisines) AS cuisines,
    COUNT(aggregate_rating) AS aggregate_rating,
    COUNT(votes) AS votes
FROM restaurants;
