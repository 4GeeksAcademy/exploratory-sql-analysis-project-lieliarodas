-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

--  Suggestions:
-- 1) Always end each SQL query with a semicolon ";"
-- 2) Ensure comments are well-formed:
--    - Use "--" for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use "/* */" multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


SELECT regions.name, regions.country , COUNT(DISTINCT species_id) AS total_species
FROM observations
JOIN regions ON regions.id = observations.region_id
JOIN species ON species.id = observations.species_id
GROUP BY regions.name, regions.country
ORDER BY total_species DESC;


SELECT strftime ('%m', observation_date) AS MONTH, COUNT(*) AS Total
FROM observations
GROUP BY month
ORDER BY total DESC;



SELECT scientific_name, common_name, SUM(count) AS total
FROM species
JOIN observations ON observations.species_id = species.id
GROUP BY species.id
HAVING Total < 5
ORDER BY total ASC;



SELECT name, country, COUNT(DISTINCT species_id) AS total
FROM observations
JOIN regions ON regions.id = observations.region_id
GROUP BY name, country
ORDER BY total DESC
LIMIT 1;



SELECT scientific_name , common_name, COUNT(*) AS total
FROM observations
JOIN species ON species.id = observations.species_id
GROUP BY scientific_name
ORDER BY total DESC
LIMIT 10;



SELECT observer, COUNT(*) AS total
FROM observations
GROUP BY observer
ORDER BY total DESC
LIMIT 5;




SELECT scientific_name, common_name
FROM species
LEFT JOIN observations ON species.id = observations.species_id
WHERE species_id IS NULL;




SELECT observation_date, COUNT(DISTINCT species_id) AS total
FROM observations
GROUP BY observation_date
ORDER BY total DESC
LIMIT 5;
