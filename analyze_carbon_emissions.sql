-  Analyzing Industry Carbon Emissions

-- "When factoring heat generation required for the manufacturing and transportation of products, Greenhouse gas emissions attributable to products, from food to sneakers to appliances, make up more than 75% of global emissions" - The Carbon Catalogue

-- In this project, I aim to find which industries are the worst offenders in contributing to this global crisis.

-- Publicly available data describes product carbon footprints (PCFs) for various companies. PCFs are the greenhouse gas emissions attributable to a given product, measured in CO2 (carbon dioxide equivalent). SOURCE: https://www.nature.com/articles/s41597-022-01178-9 


-- Find the number of companies contributing to this issue

SELECT COUNT(DISTINCT company) AS num_companies
FROM product_emissions;

num_companies = 145

--  Find combined carbon footprint PCF for each industry group

SELECT ROUND(SUM(carbon_footprint_pcf),1) AS total_industry_footprint
FROM product_emissions;

total_industry_footprint = 13696003.7

-- Find which industries have the largest number of companies contributing to carbon emissions

SELECT industry_group, COUNT(DISTINCT company) AS num_companies
FROM product_emissions
GROUP BY industry_group
ORDER BY num_companies DESC;

-- Find the year that carbon emission where the largest

SELECT MAX(year) AS max_year
FROM product_emissions;

max_year = 2017

-- Find the industry groups with the highest total industry footprint and how many companies each group has.

SELECT industry_group, 
	COUNT(DISTINCT company) AS num_companies, 
	ROUND(SUM(carbon_footprint_pcf),1) AS total_industry_footprint
FROM product_emissions
WHERE year = '2017'
GROUP BY industry_group
ORDER BY total_industry_footprint DESC;

