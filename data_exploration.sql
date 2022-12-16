---------------------------
--A. Analysis by Location--
---------------------------

-- 1. Worldwide - Total Cases, Total Deaths and Death Rate by Country and Date
-- Shows the likelihood of dying if you contract Covid in each country

SELECT 
  ct.location, cs.date, cs.total_cases, cs.total_deaths,
  100.0 * cs.total_deaths / cs.total_cases AS death_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.continent IS NOT NULL
ORDER BY ct.location, cs.date;


-- 2. Vietnam - Total Cases, Total Deaths and Death Rate by Date
-- Shows the likelihood of dying if you contract Covid in Vietnam

SELECT 
  ct.location, cs.date, cs.total_cases, cs.total_deaths,
  100.0 * cs.total_deaths / cs.total_cases AS death_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.location = 'Vietnam'
ORDER BY cs.date;


-- 3. Worldwide - Infection Rate by Country and Date
-- Shows what percentage of population infected with Covid

SELECT 
  ct.location, cs.date, cs.total_cases, ct.population,
  100.0 * cs.total_cases / ct.population AS infection_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.continent IS NOT NULL
ORDER BY ct.location, cs.date;
