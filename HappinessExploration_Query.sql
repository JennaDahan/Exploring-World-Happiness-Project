################################################
-- Task 1: Creating Tables For Each Dataset
################################################

-- 1.1: Create a table to store the 2015 world happiness data. 
CREATE TABLE year_2015 (
    Country_2015 VARCHAR(255),
    Region_2015 VARCHAR(255),
    Rank_2015 INTEGER,
   	Score_2015 NUMERIC,
    Economy_2015 NUMERIC,
    Family_2015 NUMERIC,
    LifeExpectancy_2015 NUMERIC,
    Freedom_2015 NUMERIC,
	Trust_2015 NUMERIC,
    Generosity_2015 NUMERIC
);

-- Ensure table was created
SELECT * FROM year_2015;

-- Load 2015 world happiness data from CSV into the table and then ensure data was inserted
SELECT * FROM year_2015;



-- 1.2: Create a table to store the 2016 world happiness data. 
CREATE TABLE year_2016 (
    Country_2016 VARCHAR(255),
    Region_2016 VARCHAR(255),
    Rank_2016 INTEGER,
  	Score_2016 NUMERIC,
    Economy_2016 NUMERIC,
    Family_2016 NUMERIC,
    LifeExpectancy_2016 NUMERIC,
    Freedom_2016 NUMERIC,
	Trust_2016 NUMERIC,
    Generosity_2016 NUMERIC
);

-- Ensure table was created
SELECT * FROM year_2016;

-- Load 2016 world happiness data from CSV into the table and then ensure data was inserted
SELECT * FROM year_2016;



-- 1.3: Create a table to store the 2017 world happiness data. 
CREATE TABLE year_2017 (
    Country_2017 VARCHAR(255),
	Region_2017 VARCHAR(255), 
    Rank_2017 INTEGER,
    Score_2017 NUMERIC,
    Economy_2017 NUMERIC,
    Family_2017 NUMERIC,
    LifeExpectancy_2017 NUMERIC,
    Freedom_2017 NUMERIC,
	Trust_2017 NUMERIC,
    Generosity_2017 NUMERIC
);

-- Ensure that table has been created:
SELECT * FROM year_2017;

-- Load data from CSV into the table and then ensure data was inserted
SELECT * FROM year_2017;



################################################
-- Task 2: Exploring Each Dataset
################################################

-- 2.1: Inspect the first few rows of each dataset (year_2015, year_2016, year_2017)
SELECT *
FROM year_2015
LIMIT 5;

SELECT *
FROM year_2016
LIMIT 5;

SELECT *
FROM year_2017
LIMIT 5;



-- 2.2: Inspect distinct regions listed for each dataset.
SELECT DISTINCT region_2015
FROM year_2015;

SELECT DISTINCT region_2016
FROM year_2016;

SELECT DISTINCT region_2017
FROM year_2017;
-- Note: There are 10 distinct regions for each dataset.  



-- 2.3: Inspect distinct countries listed for each dataset.
SELECT DISTINCT country_2015
FROM year_2015;
-- Note: There are 158 countries listed in 2015.

SELECT DISTINCT country_2016
FROM year_2016;
-- Note: There are 157 countries listed in 2016.

SELECT DISTINCT country_2017
FROM year_2017;
-- Note: There are 155 countries listed in 2017.



-- 2.4: Explore which country has the highested happiness rank in each year.
SELECT * 
FROM year_2015
ORDER BY rank_2015 ASC 
LIMIT 1;
--In 2015, Switerland is listed at 1 for the happiness rank and has a hapiness score of 7.587.

SELECT * 
FROM year_2016
ORDER BY rank_2016 ASC 
LIMIT 1;
--In 2016, Denmark is listed at 1 for the happiness rank and has a hapiness score of 7.526.

SELECT * 
FROM year_2017
ORDER BY rank_2017 ASC 
LIMIT 1;
--In 2017, Norway is listed at 1 for the happiness rank and has a hapiness score of 7.537.



-- 2.5: Explore which country has the lowest happiness rank in each year. 
SELECT * 
FROM year_2015
ORDER BY rank_2015 DESC
LIMIT 1;
-- In 2015, Togo is listed at 158 for the happiness rank and has a hapiness score of 2.839.

SELECT * 
FROM year_2016
ORDER BY rank_2016 DESC
LIMIT 1;
-- In 2016, Burundi is listed at 157 for the happiness rank and has a hapiness score of 2.905.

SELECT * 
FROM year_2017
ORDER BY rank_2017 DESC
LIMIT 1;
-- In 2017, Central African Republic is listed at 155 for the happiness rank and has a hapiness score of 2.693.



-- 2.6: Calculate the average happiness score for each year 
SELECT ROUND(SUM(score_2015)/158, 3) AS AvgScore_2015
FROM year_2015;
-- For 2015, the average happiness score is 5.376.

SELECT ROUND(SUM(score_2016)/157, 3) AS AvgScore_2016
FROM year_2016;
-- For 2016, the average happiness score is 5.382.

SELECT ROUND(SUM(score_2017)/155, 3) AS AvgScore_2017
FROM year_2017;
-- For 2017, the average happiness score is 5.354.


###############################################################################
-- Task 3: Identify The Top 5 Countries That Have The Highest Happiness Score 
-- AND top regions that have the highest happiness scores. 
###############################################################################

-- 3.1: Identify the top 5 countries with the highest happiness score in 2015 and the order of the regions
SELECT Country_2015, rank_2015, score_2015
FROM year_2015
ORDER BY score_2015 DESC
LIMIT 5;
-- In 2015, 1. Switzerland (7.587), 2. Iceland (7.561), 3. Denmark (7.527), 4. Norway (7.522), 5. Canada (7.427)

-- Region happiness score order in 2015
SELECT Region_2015, STRING_AGG(country_2015, ', ') AS Countries, AVG(score_2015) AS avg_2015
FROM year_2015
GROUP BY region_2015
ORDER BY avg_2015 DESC;


-- 3.2: Identify the top 5 countries with the highest happiness score in 2016 and the order of the regions
SELECT Country_2016, rank_2016, score_2016
FROM year_2016
ORDER BY score_2016 DESC
LIMIT 5;
-- In 2016, 1. Denmark (7.526), 2. Switzerland (7.509), 3. Iceland (7.501), 4. Norway (7.498), 5. Finland (7.413)

-- Region happiness score order in 2016
SELECT Region_2016, STRING_AGG(country_2016, ', ') AS Countries, AVG(score_2016) AS avg_2016
FROM year_2016
GROUP BY region_2016
ORDER BY avg_2016 DESC;


-- 3.3: Identify the top 5 countries with the highest happiness score in 2017 and the order of the regions
SELECT Country_2017, rank_2017, ROUND(score_2017, 3)
FROM year_2017
ORDER BY score_2017 DESC
LIMIT 5;
-- In 2017, 1. Norway (7.537), 2. Denmark (7.522), 3. Iceland (7.504), 4. Switzerland (7.494), 5. Finland (7.469)

-- Region happiness score order in 2017
SELECT Region_2017, STRING_AGG(country_2017, ', ') AS Countries, AVG(score_2017) AS avg_2017
FROM year_2017
GROUP BY region_2017
ORDER BY avg_2017 DESC;

-- So far it seems that the regions have stayed consistent in terms of the order of happiness scores. 
-- Additionally, Western Europe seems to be consistent in having the highest happiness scores. 


###############################################################################
-- Task 4: Identify The Top 5 Countries That Have The Lowest Happiness Score
###############################################################################

-- 4.1: Identify the top 5 lowest country happiness scores in 2015
SELECT Country_2015, rank_2015, score_2015
FROM year_2015
ORDER BY score_2015 ASC
LIMIT 5;
-- In 2015, 1. Togo (2.839), 2. Burundi (2.905), 3. Syria (3.006), 4. Benin (3.340), 5. Rwanda (3.465)
-- 1 being the lowest happiness score. 

-- 4.2: Identify the top 5 lowest country happiness scores in 2016
SELECT Country_2016, rank_2016, score_2016
FROM year_2016
ORDER BY score_2016 ASC
LIMIT 5;
-- In 2016, 1. Burundi (2.905), 2. Syria (3.069), 3. Togo (3.303), 4. Afghanistan (3.360), 5. Benin (3.484)


-- 4.3: Identify the top 5 lowest country happiness scores in 2017
SELECT Country_2017, rank_2017, ROUND(score_2017, 3)
FROM year_2017
ORDER BY score_2017 ASC
LIMIT 5;
-- In 2017, 1. Central African Republic (2.693), 2. Burundi (2.905), 3. Tanzania (3.349), 4. Syria (3.462), 5. Rwanda (3.471)


###############################################################################
-- Task 5: Identify The Correlation Between The Economy and The Happiness 
-- Score in each year
###############################################################################

-- 5.1: Calculate the correlation between the Economy (GDP per capita) and happiness score
SELECT CORR(Economy_2015, score_2015) AS Correlation_2015
FROM year_2015;
-- In 2015, the correlation for economy was 0.781.

SELECT CORR(Economy_2016, score_2016) AS Correlation_2016
FROM year_2016;
-- In 2016, the correlation for economy was 0.790.

SELECT CORR(Economy_2017, score_2017) AS Correlation_2017
FROM year_2017;
-- In 2017, the correlation for economy was 0.812.


###############################################################################
-- Task 6: Identify The Correlation Between Family and The Happiness Score
-- in each year
###############################################################################

-- 6.1: Calculate the correlation between family and happiness score
SELECT CORR(family_2015, score_2015) AS Correlation_2015
FROM year_2015;
-- In 2015, the correlation for family was 0.741.

SELECT CORR(family_2016, score_2016) AS Correlation_2016
FROM year_2016;
-- In 2016, the correlation for family was 0.739.

SELECT CORR(family_2017, score_2017) AS Correlation_2017
FROM year_2017;
-- In 2017, the correlation for family was 0.753.



###############################################################################
-- Task 7: Identify The Correlation Between life expectancy and The Happiness 
-- Score in each year
###############################################################################

-- 7.1: Calculate the correlation between family and happiness score
SELECT CORR(lifeexpectancy_2015, score_2015) AS lifeexpectancy_cor_2015,
CORR(lifeexpectancy_2016, score_2016) AS lifeexpectancy_cor_2016,
CORR(lifeexpectancy_2017, score_2017) AS lifeexpectancy_cor_2017
FROM year_2015
INNER JOIN year_2016
ON year_2015.region_2015 = year_2016.region_2016
INNER JOIN year_2017
ON year_2016.region_2016 = year_2017.region_2017;

-- Note that:
-- In 2015, the correlation for life expectancy (health) was 0.724.
-- In 2016, the correlation for life expectancy (health) was 0.765.
-- In 2017, the correlation for life expectancy (health) was 0.782.


##########################################################################################
-- Task 8: Identify The Correlation Between generosity and The Happiness 
-- Score in each year
##########################################################################################

SELECT CORR(generosity_2015, score_2015) AS generosity_cor_2015,
CORR(generosity_2016, score_2016) AS generosity_cor_2016,
CORR(generosity_2017, score_2017) AS generosity_cor_2017
FROM year_2015
INNER JOIN year_2016
ON year_2015.region_2015 = year_2016.region_2016
INNER JOIN year_2017
ON year_2016.region_2016 = year_2017.region_2017;

-- Note that:
-- In 2015, the correlation for generosity was 0.136.
-- In 2016, the correlation for generosity was 0.108.
-- In 2017, the correlation for generosity was 0.062.


##########################################################################################
-- Task 9: Compare the average happiness score amongst each region in each year
##########################################################################################

-- 9.1 - Use inner join to compare the average happiness score in each region in 2015, 2016, and 2017.
SELECT year_2015.region_2015, STRING_AGG(year_2015.country_2015, ', ') AS countries, 
ROUND((avg(year_2015.score_2015)), 3) AS avg_score_2015, 
ROUND((avg(year_2016.score_2016)), 3) AS avg_score_2016, 
ROUND((avg(year_2017.score_2017)), 3) AS avg_score_2017
FROM year_2015
INNER JOIN year_2016
ON year_2015.country_2015 = year_2016.country_2016
INNER JOIN year_2017
ON year_2016.country_2016 = year_2017.country_2017
GROUP BY year_2015.region_2015
ORDER BY avg_score_2015;

