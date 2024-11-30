
 --1) Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

select  DISTINCT city from station where MOD(ID, 2) = 0;

--2) Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

SELECT COUNT(CITY) - COUNT(DISTINCT CITY) difference
FROM station;

--3)Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name).
  --If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically

SELECT CITY, LENGTH(CITY)  name_length
FROM (
    SELECT CITY, LENGTH(CITY)  name_length
    FROM STATION
    ORDER BY LENGTH(CITY) ASC, CITY ASC
    FETCH FIRST 1 ROW ONLY
) AS shortest_city

UNION ALL

-- City with the longest name
SELECT CITY, LENGTH(CITY)  name_length
FROM (
    SELECT CITY, LENGTH(CITY)  name_length
    FROM STATION
    ORDER BY LENGTH(CITY) DESC, CITY ASC
    FETCH FIRST 1 ROW ONLY
) AS longest_city;



