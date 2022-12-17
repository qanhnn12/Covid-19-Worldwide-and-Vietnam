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


-- 10. Worldwide - Total Cases, Total Death, Infection Rate, and Death Rate by Income Level

SELECT 
  ct.location, ct.population,
  MAX(cs.total_cases) AS total_cases, 
  MAX(cs.total_deaths) AS total_deaths,
  MAX(cs.total_cases) / ct.population * 100.0 AS infection_rate,
  MAX(cs.total_deaths) * 100.0 / MAX(cs.total_cases) AS death_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.location LIKE '%income'
GROUP BY ct.location, ct.population
ORDER BY death_rate DESC;



------------------------------------------
--B. Analysis of Vaccinations by Location--
------------------------------------------

-- 1. Worldwide - Total Vaccinations, People Vaccinated, People Fully Vaccinated, and Total Boosters by Country

SELECT 
  ct.location, ct.population,
  MAX(vc.total_vaccinations) AS total_vaccination, 
  MAX(vc.people_vaccinated) AS people_vaccinated, 
  MAX(vc.people_fully_vaccinated) AS people_fully_vaccinated,
  MAX(vc.total_boosters) AS total_boosters
FROM vaccinations vc
JOIN countries ct ON vc.iso_code = ct.iso_code
WHERE ct.continent IS NOT NULL
GROUP BY ct.location, ct.population
ORDER BY total_vaccination DESC;


-- 2. Vietnam - Total Vaccinations, People Vaccinated, People Fully Vaccinated, and Total Boosters

SELECT 
  ct.location, ct.population,
  MAX(vc.total_vaccinations) AS total_vaccination, 
  MAX(vc.people_vaccinated) AS people_vaccinated, 
  MAX(vc.people_fully_vaccinated) AS people_fully_vaccinated,
  MAX(vc.total_boosters) AS total_boosters
FROM vaccinations vc
JOIN countries ct ON vc.iso_code = ct.iso_code
WHERE ct.location = 'Vietnam'
GROUP BY ct.location, ct.population
ORDER BY total_vaccination DESC;


-- 3. Worldwide - Total Vaccinations Percentage, People Vaccinated Percentage, People Fully Vaccinated Percentage, and Total Boosters Percentage by Country
-- Show the percentage of population vaccinated against Covid

SELECT 
  ct.location, ct.population,
  100.0 * MAX(vc.total_vaccinations) / ct.population AS total_vaccination_pct, 
  100.0 * MAX(vc.people_vaccinated) / ct.population AS people_vaccinated_pct, 
  100.0 * MAX(vc.people_fully_vaccinated) / ct.population AS people_fully_vaccinated_pct,
  100.0 * MAX(vc.total_boosters) / ct.population AS total_boosters_pct
FROM vaccinations vc
JOIN countries ct ON vc.iso_code = ct.iso_code
WHERE ct.continent IS NOT NULL
GROUP BY ct.location, ct.population
ORDER BY total_vaccination_pct DESC;


-- 4. Vietnam - Total Vaccinations Percentage, People Vaccinated Percentage, People Fully Vaccinated Percentage, and Total Boosters Percentage
-- Show the percentage of Vietnamese population vaccinated against Covid

SELECT 
  ct.location, ct.population,
  100.0 * MAX(vc.total_vaccinations) / ct.population AS total_vaccination_pct, 
  100.0 * MAX(vc.people_vaccinated) / ct.population AS people_vaccinated_pct, 
  100.0 * MAX(vc.people_fully_vaccinated) / ct.population AS people_fully_vaccinated_pct,
  100.0 * MAX(vc.total_boosters) / ct.population AS total_boosters_pct
FROM vaccinations vc
JOIN countries ct ON vc.iso_code = ct.iso_code
WHERE ct.location = 'Vietnam'
GROUP BY ct.location, ct.population;


-- 5. Worldwide - Rolling new vaccinations by Country and Date

SELECT 
  ct.location, vc.date, ct.population, 
  COALESCE(vc.total_vaccinations, 0)
  - LAG(vc.total_vaccinations) 
      OVER (PARTITION BY ct.location
      ORDER BY ct.location, vc.date) AS new_vaccinations,
  vc.total_vaccinations
FROM countries ct
JOIN vaccinations vc ON ct.iso_code = vc.iso_code
WHERE ct.continent IS NOT NULL
ORDER BY ct.location, vc.date;


-- 6. Vietnam - Rolling new vaccinations by Date

SELECT 
  ct.location, vc.date, ct.population, 
  COALESCE(vc.total_vaccinations, 0)
  - LAG(vc.total_vaccinations) 
      OVER (PARTITION BY ct.location
      ORDER BY ct.location, vc.date) AS new_vaccinations
  vc.total_vaccinations
FROM countries ct
JOIN vaccinations vc ON ct.iso_code = vc.iso_code
WHERE ct.location = 'Vietnam'
ORDER BY ct.location, vc.date;



------------------------------------
--C. Analysis of Tests by Location--
------------------------------------

-- 1. Worldwide - Positive Rate (7-rolling average), Total Tests, and Tests per Confirmed Case (7-rolling average) by Country and Date

SELECT 
  c.location, c.population, 
  t.date, t.positive_rate, t.total_tests, t.tests_per_case
FROM countries c
JOIN tests t ON c.iso_code = t.iso_code
WHERE c.continent IS NOT NULL
ORDER BY c.location, t.date;


-- 2. Vietnam - Positive Rate (7-rolling average), Total Tests, and Tests per Confirmed Case (7-rolling average) by Date

SELECT 
  c.location, c.population, 
  t.date, t.positive_rate, t.total_tests, t.tests_per_case
FROM countries c
JOIN tests t ON c.iso_code = t.iso_code
WHERE c.location = 'Vietnam'
ORDER BY t.date;


--3. Worldwide - New tests performed each day

SELECT 
  c.location, c.population, 
  t.date, t.new_tests
FROM countries c
JOIN tests t ON c.iso_code = t.iso_code
WHERE c.continent IS NOT NULL
ORDER BY c.location, t.date;


-- 4. Vietnam - New tests performed each day

SELECT 
  c.location, c.population, 
  t.date, t.new_tests
FROM countries c
JOIN tests t ON c.iso_code = t.iso_code
WHERE c.location = 'Vietnam'
ORDER BY t.date;



-----------------------------------------------
--D. Analysis of Hospitalizations by Location--
-----------------------------------------------

-- 1. Worldwide - Number of patients, Number of ICU patients, Weekly hospital admissions, and Weekly ICU admission due to Covid by Country and Date

SELECT 
  ct.location, ct.population, 
  hp.date, hp.hosp_patients, icu_patients,
  hp.weekly_hosp_admissions, hp.weekly_icu_admissions
FROM countries ct
JOIN hospitals hp ON ct.iso_code = hp.iso_code
WHERE ct.continent IS NOT NULL
ORDER BY ct.location, hp.date;


-- 2. Vietnam- Number of patients, Number of ICU patients, Weekly hospital admissions, and Weekly ICU admission due to Covid by Date

SELECT 
  ct.location, ct.population, 
  hp.date, hp.hosp_patients, icu_patients,
  hp.weekly_hosp_admissions, hp.weekly_icu_admissions
FROM countries ct
JOIN hospitals hp ON ct.iso_code = hp.iso_code
WHERE ct.location = 'Vietnam'
ORDER BY ct.location, hp.date;

