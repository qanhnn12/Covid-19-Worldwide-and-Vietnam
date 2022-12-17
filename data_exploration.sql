-----------------------------------------------
--A. Analysis of Cases and Deaths by Location--
-----------------------------------------------

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


-- 4. Vietnam - Infection Rate per Population by Date
-- Shows what percentage of Vietnamese population infected with Covid

SELECT 
  ct.location, cs.date, cs.total_cases, ct.population,
  100.0 * cs.total_cases / ct.population AS infection_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.location = 'Vietnam'
ORDER BY cs.date;


-- 5. Worldwide - Countries with Highest Infection Rate compared to Population

SELECT 
  ct.location, ct.population,
  MAX(total_cases) AS total_cases,
  MAX(100.0 * cs.total_cases / ct.population) AS infection_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.continent IS NOT NULL
GROUP BY ct.location, ct.population
ORDER BY infection_rate DESC;


-- 6. Vietnam - Highest Infection Rate in Vietnam

SELECT 
  ct.location, ct.population,
  MAX(cs.total_cases) AS total_cases,
  MAX(100.0 * cs.total_cases / ct.population) AS infection_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.location = 'Vietnam'
GROUP BY ct.location, ct.population;


-- 7. Worldwide - Highest Death Count per Population and Death Rate

SELECT 
  ct.location, ct.population,
  MAX(cs.total_deaths) AS total_deaths,
  MAX(100.0 * cs.total_deaths / ct.population) AS death_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.continent IS NOT NULL
GROUP BY ct.location, ct.population
ORDER BY death_rate DESC;


-- 8. Vietnam - Highest Death Count and Death Rate

SELECT 
  ct.location, ct.population,
  MAX(cs.total_deaths) AS total_deaths,
  MAX(100.0 * cs.total_deaths / ct.population) AS death_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.location = 'Vietnam'
GROUP BY ct.location, ct.population;


-- 9. Worldwide - Total Cases, Total Death, Infection Rate, and Death Rate by Continent

SELECT 
  ct.location, ct.population,
  MAX(cs.total_cases) AS total_cases, 
  MAX(cs.total_deaths) AS total_deaths,
  MAX(cs.total_cases) / ct.population * 100.0 AS infection_rate,
  MAX(cs.total_deaths) * 100.0 / MAX(cs.total_cases) AS death_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.continent IS NULL
  AND ct.location NOT IN ('World', 'International', 'European Union')
  AND ct.location NOT LIKE '%income'
GROUP BY ct.location, ct.population
ORDER BY death_rate DESC;



------------------------------------------
--A. Analysis of Vaccination by Location--
------------------------------------------

-- 1. Worldwide - Total Vaccinations Percentage, People Vaccinated Percentage, People Fully Vaccinated Percentage, and Total Boosters Percentage by Country
-- Show the percentage of population vaccinated against Covid

SELECT 
	ct.location, ct.population,
	100.0*MAX(vc.total_vaccinations)/ct.population AS total_vaccination_pct, 
	100.0*MAX(vc.people_vaccinated)/ct.population AS people_vaccinated_pct, 
	100.0*MAX(vc.people_fully_vaccinated)/ct.population AS people_fully_vaccinated_pct,
	100.0*MAX(vc.total_boosters)/ct.population AS total_boosters_pct
FROM vaccinations vc
JOIN countries ct ON vc.iso_code = ct.iso_code
WHERE ct.continent IS NOT NULL
GROUP BY ct.location, ct.population
ORDER BY total_vaccination_pct DESC;


-- 2. Vietnam - Total Vaccinations Percentage, People Vaccinated Percentage, People Fully Vaccinated Percentage, and Total Boosters Percentage

SELECT 
	ct.location, ct.population,
	100.0*MAX(vc.total_vaccinations)/ct.population AS total_vaccination_pct, 
	100.0*MAX(vc.people_vaccinated)/ct.population AS people_vaccinated_pct, 
	100.0*MAX(vc.people_fully_vaccinated)/ct.population AS people_fully_vaccinated_pct,
	100.0*MAX(vc.total_boosters)/ct.population AS total_boosters_pct
FROM vaccinations vc
JOIN countries ct ON vc.iso_code = ct.iso_code
WHERE ct.location = 'Vietnam'
GROUP BY ct.location, ct.population;

