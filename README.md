# :space_invader: Covid-19 analysis: Worldwide and Vietnam
This repository was inspired by the tutorial of Alex Freberg - [Data Analyst Portfolio Projects](https://www.youtube.com/playlist?list=PLUaB-1hjhk8H48Pj32z4GZgGWyylqv85f). Following his instruction, I already performed some EDA and created a Tableau dashboard [here](https://public.tableau.com/views/WorldwideCovid-19Dashboard_16710219069800/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link). However, I would like to analyze other aspects of Covid-19 in the global scale and in Vietnam, then visualize them in Power BI since I've just learned it recently.

## 📓 Table of Contents
* [Data Preprocessing](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam#%EF%B8%8F-data-preprocessing)
* [Data Importing and Cleaning](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam#-data-importing-and-cleaning)
* [Data Exploratory Analysis](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam#-data-exploration-analysis)
    * [A. Cases and Deaths by Location](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam#a-cases-and-deaths-by-location)
    * [B. Vaccinations by Location](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam#b-vaccinations-by-location)
    * [C. Tests by Location](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam#c-tests-by-location)
    * [D. Hospitalizations by Location](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam#d-hospitalization-by-location)
* [Data Visualization](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam#-data-visualization)

---
## 🗃️ Data Preprocessing
The raw Covid-19 data collected from 1 Jan 2020 to 12 Dec 2022 is available on [Our World in Data](https://ourworldindata.org/covid-deaths). 
Detail definition for each column name can be found in this [GitHub doccument](https://github.com/owid/covid-19-data/blob/master/public/data/README.md).

My analysis has 4 parts: *Cases and Deaths*, *Vaccinations*, *Tests*, and *Hospitalizations*, so I split the original dataset into 4 corresponding tables & a `countries` table to perform `JOIN` later. Each one is stored in an Excel file. View all [here](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam/tree/main/datasets).

#### > Table `countries`

| Column |    Description                                                                                                                         |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| `iso_code`| Country codes. Note that OWID-defined regions contain prefix 'OWID_'.                                                                      |
| `continent`  | Continent of the geographical location. Note that Americas are divided into *North America* and *South America* in the file.            |
| `location`   | Geographical location (not exactly country name). There are also continents, income classes and other labels. You can check that when filtering *blank* on `continent` column.                                                                                                                           |
| `population` | Population (latest available values).                                                                                                   |


#### > Table `cases`

| Column | Description  |
|---|---|
| iso_code | Country codes. Note that OWID-defined regions contain prefix 'OWID_'.     |
| date | Date of observation.  |
| total_cases | Total confirmed cases of COVID-19. Counts can include probable cases, where reported.  |
| new_cases | New confirmed cases of COVID-19. Counts can include probable cases, where reported.   |
| total_deaths | Total deaths attributed to COVID-19. Counts can include probable deaths, where reported.  |
| new_deaths | New deaths attributed to COVID-19. Counts can include probable deaths, where reported.   |


#### > Table `vaccinations`

| **Column** | **Description** |
|---|---|
| iso_code | Country codes. Note that OWID-defined regions contain prefix 'OWID_'.   |
| date | Date of observation.  |
| total_vaccinations | Total number of COVID-19 vaccination doses administered.  |
| people_vaccinated | Total number of people who received at least one vaccine dose.  |
| people_fully_vaccinated | Total number of people who received all doses prescribed by the initial vaccination protocol.  |
| total_boosters | Total number of COVID-19 vaccination booster doses administered (doses administered beyond the number prescribed by the vaccination protocol).  |
| new_vaccinations | New COVID-19 vaccination doses administered (only calculated for consecutive days).  |


#### > Table `hospitals`

| **Column**             | **Description**                                                                                                                       |
|------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| iso_code               | Country codes. Note that OWID-defined regions contain prefix 'OWID_'.                                                                 |
| date                   | Date of observation.                                                                                                                  |
| icu_patients           | Number of COVID-19 patients in intensive care units (ICUs) on a given day                                                             |
| hosp_patients          | Number of COVID-19 patients in hospital on a given day                                                                                |
| weekly_icu_admissions  | Number of COVID-19 patients newly admitted to intensive care units (ICUs) in a given week (reporting date and the preceeding 6 days)  |
| weekly_hosp_admissions | Number of COVID-19 patients newly admitted to hospitals in a given week (reporting date and the preceeding 6 days)                    |


#### > Table `tests`

| **Column**     | **Description**                                                                                                              |
|----------------|------------------------------------------------------------------------------------------------------------------------------|
| iso_code       | Country codes. Note that OWID-defined regions contain prefix 'OWID_'.                                                        |
| date           | Date of observation.                                                                                                         |
| total_tests    | Total tests for COVID-19.                                                                                                    |
| new_tests      | New tests for COVID-19 (only calculated for consecutive days).                                                               |
| positive_rate  | The share of COVID-19 tests that are positive, given as a rolling 7-day average (this is the inverse of tests_per_case)      |
| tests_per_case | Tests conducted per new confirmed case of COVID-19, given as a rolling 7-day average (this is the inverse of positive_rate)  |
| tests_units    | Units used by the location to report its testing data.                                                                       |
  
---
## 🧼 Data Importing and Cleaning
Next, I import 5 tables above to SQL Server. There are some numeric data stored as `nvarchar`, so I convert them to `int`,  `bigint` or `float`.
View the detail SQL script for that [here](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam/blob/main/data_cleaning.sql).
  
#### > Table `countries`
![image](https://user-images.githubusercontent.com/84619797/208334125-06ddad3d-83d2-4d01-b918-bcc4a942cb3c.png)

#### > Table `cases`
![image](https://user-images.githubusercontent.com/84619797/208334294-dc2186a2-90b6-4bef-9fc3-694a7949f2ee.png)

#### > Table `vaccinations`
![image](https://user-images.githubusercontent.com/84619797/208334394-dc6142c7-d44c-4df1-8ca3-8d81f8f1b77b.png)

#### > Table `hospitals`
![image](https://user-images.githubusercontent.com/84619797/208334587-63e96dee-3879-4ffb-afe2-066d286694fc.png)

#### > Table `tests`
![image](https://user-images.githubusercontent.com/84619797/208334655-a3fe48bc-c058-4629-9a75-d59075367033.png)

#### > Entity Relationship Diagram
<img src="https://user-images.githubusercontent.com/84619797/208293847-6aed2530-473b-435b-b4c8-b52590c812e5.PNG" width="800" height="420" >

---
## 📂 Data Exploration Analysis
### A. Cases and Deaths by Location
#### 1. Worldwide - Total Cases, Total Deaths and Death Rate (if infected) by Country and Date. Death Rate (if infected) shows the likelihood of dying if you infect with Covid-19
```TSQL
SELECT 
  ct.location, cs.date, cs.total_cases, cs.total_deaths,
  100.0 * cs.total_deaths / cs.total_cases AS death_infected_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.continent IS NOT NULL
ORDER BY ct.location, cs.date;
```
![image](https://user-images.githubusercontent.com/84619797/208301882-699c9508-884e-4b21-aee8-f1f91aa4a625.png)

* Afghanistan had the 1st death on 23 Mar 2020 after 40 cases. The likelihood of dying on that date was 2.5%.

#### 2. Vietnam - Total Cases, Total Deaths and Death Rate (if infected) by Date. Death Rate (if infected) shows the likelihood of dying if you infect with Covid-19
```TSQL
SELECT 
  ct.location, cs.date, cs.total_cases, cs.total_deaths,
  100.0 * cs.total_deaths / cs.total_cases AS death_infected_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.location = 'Vietnam'
ORDER BY cs.date;
```
![image](https://user-images.githubusercontent.com/84619797/208302176-de6c358b-8ad1-4dc4-9b79-5b7df4826ebc.png)
  
* Vietnam had 3 first deaths on 31 Jul 2020. The likelihood of dying on that date was 0.54%.

#### 3. Worldwide - Infection Rate by Country and Date. This shows what percentage of population infected with Covid-19
```TSQL
SELECT 
  ct.location, cs.date, cs.total_cases, ct.population,
  100.0 * cs.total_cases / ct.population AS infection_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.continent IS NOT NULL
ORDER BY ct.location, cs.date;
```
  ![image](https://user-images.githubusercontent.com/84619797/208302845-cb8933d7-fefb-402d-aacd-08a43a866f55.png)

* This is the infection rate over the population of a country at a given date.

#### 4. Vietnam - Infection Rate per Population by Date. This metric shows what percentage of Vietnamese population infected with Covid-19
```TSQL
SELECT 
  ct.location, cs.date, cs.total_cases, ct.population,
  100.0 * cs.total_cases / ct.population AS infection_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.location = 'Vietnam'
ORDER BY cs.date;
```
![image](https://user-images.githubusercontent.com/84619797/208302960-3d17e142-3eed-406b-8ce3-e33dde0ba5b1.png)

* On 11 Sep 2021, the infection rate was 1 out of 100 people in Vietnam.

#### 5. Worldwide - Countries with Highest Infection Rate compared to Population
```TSQL
SELECT 
  ct.location, ct.population,
  MAX(total_cases) AS total_cases,
  100.0 * MAX( cs.total_cases) / ct.population AS infection_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.continent IS NOT NULL
GROUP BY ct.location, ct.population
ORDER BY infection_rate DESC;
```
![image](https://user-images.githubusercontent.com/84619797/208303255-b1bde655-b137-49fc-8b76-50825ac13593.png)

* Above is the top 10 countries with highest infection rate.

#### 6. Vietnam - Highest Infection Rate
```TSQL
SELECT 
  ct.location, ct.population,
  MAX(cs.total_cases) AS total_cases,
  100.0 * MAX( cs.total_cases) / ct.population AS infection_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.location = 'Vietnam'
GROUP BY ct.location, ct.population;
```
![image](https://user-images.githubusercontent.com/84619797/208303444-75d63dab-aed6-4868-94e0-56e08aca63ea.png)

* With the population of more than 98 million, until 12 Dec 2022, the infection rate in Vietnam is 11.74%. 

#### 7. Worldwide - Highest Death Count and Death Rate per Population
```TSQL
SELECT 
  ct.location, ct.population,
  MAX(cs.total_deaths) AS total_deaths,
  100.0 * MAX(cs.total_deaths) / ct.population AS death_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.continent IS NOT NULL
GROUP BY ct.location, ct.population
ORDER BY death_rate DESC;
```
![image](https://user-images.githubusercontent.com/84619797/208333940-e6b7d840-b6b3-44d7-a93c-407a17b03a83.png)

* Peru has highest death rate, while US has highest death count.

![image](https://user-images.githubusercontent.com/84619797/208335694-a1f7a9f0-e0c6-4384-8b26-da0aca30a0d8.png)

#### 8. Vietnam - Highest Death Count and Death Rate per Population
```TSQL
SELECT 
  ct.location, ct.population,
  MAX(cs.total_deaths) AS total_deaths,
  100.0 * MAX(cs.total_deaths) / ct.population AS death_rate
FROM cases cs
JOIN countries ct ON cs.iso_code = ct.iso_code
WHERE ct.location = 'Vietnam'
GROUP BY ct.location, ct.population;
```
![image](https://user-images.githubusercontent.com/84619797/208335823-fdbd537a-be57-496c-8f06-c173912b63e3.png)

* Up to 12 Dec 2022, Vietnam has the average death of 0.04%.

#### 9. Worldwide - Total Cases, Total Death, Infection Rate, Death Rate (if infected), and Vaccination Rate by Continent
```TSQL
SELECT 
  ct.location, ct.population,
  MAX(cs.total_cases) AS total_cases, 
  MAX(cs.total_deaths) AS total_deaths,
  MAX(cs.total_cases) / ct.population * 100.0 AS infection_rate,
  MAX(cs.total_deaths) * 100.0 / MAX(cs.total_cases) AS death_infected_rate,
  MAX(vc.total_vaccinations) * 100.0 / ct.population AS vaccination_rate
FROM countries ct 
JOIN cases cs ON cs.iso_code = ct.iso_code
JOIN vaccinations vc ON vc.iso_code = ct.iso_code
  AND cs.date = vc.date
WHERE ct.continent IS NULL
  AND ct.location NOT IN ('World', 'International', 'European Union')
  AND ct.location NOT LIKE '%income'
GROUP BY ct.location, ct.population
ORDER BY death_infected_rate DESC;
```
![image](https://user-images.githubusercontent.com/84619797/208336191-5eccb5c1-15a2-4534-8e3e-1ed910af53bb.png)

* Africa has the highest death rate (if infected), followed by Americas.
* Americas has highest vaccination rate, followed by Asia.

#### 10. Worldwide - Total Cases, Total Death, Infection Rate, Death Rate (if infected), and Vaccination Rate by Income Level
```TSQL
SELECT 
  ct.location, ct.population,
  MAX(cs.total_cases) AS total_cases, 
  MAX(cs.total_deaths) AS total_deaths,
  100.0 * MAX(cs.total_cases) / ct.population AS infection_rate,
  100.0 * MAX(cs.total_deaths) / MAX(cs.total_cases) AS death_infected_rate,
  100.0 * MAX(vc.total_vaccinations) / ct.population AS total_vaccination_rate
FROM countries ct 
JOIN cases cs ON cs.iso_code = ct.iso_code
JOIN vaccinations vc ON vc.iso_code = ct.iso_code
  AND cs.date = vc.date
WHERE ct.location LIKE '%income'
GROUP BY ct.location, ct.population
ORDER BY death_infected_rate DESC;
```
![image](https://user-images.githubusercontent.com/84619797/208336644-8f989c6b-bc1d-4693-8474-b00b5cd56ae6.png)

* Low income countries have highest death rate (if infected) and lowest vaccination rate. 
* High income countries have the lowest death rate (if infected) and highest vaccination rate.

### B. Vaccinations by Location
#### 1. Worldwide - Total Vaccinations, People Vaccinated, People Fully Vaccinated, and Total Boosters by Country
```TSQL
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
```
![image](https://user-images.githubusercontent.com/84619797/208337775-786a772b-f938-4979-ba0e-311df08ad541.png)

* Above is the 10 leading countries in terms of total number of vaccinations. 
* China is currently on top, Vietnam is at 9th place.

#### 2. Vietnam - Total Vaccinations, People Vaccinated, People Fully Vaccinated, and Total Boosters
```TSQL
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
```
![image](https://user-images.githubusercontent.com/84619797/208338004-0bc0f6a9-bd2d-44ea-a773-3d0534e10001.png)

#### 3. Worldwide - Total Vaccinations Rate, People Vaccinated Rate, People Fully Vaccinated Rate, and Total Boosters Rate by Country. These metrics show the overall percentage of population vaccinated against Covid-19
```TSQL
SELECT 
  ct.continent, ct.location, ct.population,
  100.0 * MAX(vc.total_vaccinations) / ct.population AS total_vaccination_rate,
  100.0 * MAX(vc.people_vaccinated) / ct.population AS people_vaccinated_rate, 
  100.0 * MAX(vc.people_fully_vaccinated) / ct.population AS people_fully_vaccinated_rate,
  100.0 * MAX(vc.total_boosters) / ct.population AS total_boosters_rate
FROM vaccinations vc
JOIN countries ct ON vc.iso_code = ct.iso_code
WHERE ct.continent IS NOT NULL
GROUP BY ct.continent, ct.location, ct.population
ORDER BY total_vaccination_rate DESC;

```
![image](https://user-images.githubusercontent.com/84619797/208339202-f3180dd8-a00c-4823-a768-79d6354bb599.png)

* Cuba has the highest total vaccination rate. Most Asia countries are on top 12.

#### 4. Vietnam - Total Vaccinations Rate, People Vaccinated Rate, People Fully Vaccinated Rate, and Total Boosters Rate. These metrics show the overall percentage of Vietnamese population vaccinated against Covid-19
```TSQL
SELECT 
  ct.location, ct.population,
  100.0 * MAX(vc.total_vaccinations) / ct.population AS total_vaccination_rate, 
  100.0 * MAX(vc.people_vaccinated) / ct.population AS people_vaccinated_rate, 
  100.0 * MAX(vc.people_fully_vaccinated) / ct.population AS people_fully_vaccinated_rate,
  100.0 * MAX(vc.total_boosters) / ct.population AS total_boosters_rate
FROM vaccinations vc
JOIN countries ct ON vc.iso_code = ct.iso_code
WHERE ct.location = 'Vietnam'
GROUP BY ct.location, ct.population;
```
![image](https://user-images.githubusercontent.com/84619797/208339340-a5759b12-ae52-40be-96ec-7d790a93f52c.png)

* The vaccination rate over the population of Vietnam is about 269%, which is true. Up to now, most Vietnamese have already vaccinated at least twice.
* Over 92% of Vietnamese population has vaccinated at least 1 dose.
* Over 86% of Vietnamese population has fully vacciated.

#### 5. Worldwide - Rolling Vaccination Rate, New Cases, and New Deaths by Country and Date. These metrics show the movement of New Cases and New Deaths as the population vaccinated rate increases
```TSQL
SELECT 
  ct.continent, ct.location, vc.date, ct.population, 
  SUM(vc.new_vaccinations) OVER (PARTITION BY ct.location ORDER BY ct.location, vc.date) AS rolling_vaccination,
  SUM(vc.new_vaccinations) OVER (PARTITION BY ct.location ORDER BY ct.location, vc.date)
    / ct.population * 100.0 AS vaccination_per_pop,
  cs.new_cases, cs.new_deaths
FROM countries ct
JOIN vaccinations vc ON ct.iso_code = vc.iso_code
JOIN cases cs ON ct.iso_code = cs.iso_code
AND vc.date = cs.date
WHERE ct.continent IS NOT NULL
ORDER BY ct.location, vc.date;
```
![image](https://user-images.githubusercontent.com/84619797/208341640-8a81d1a0-4b22-4920-b851-c68c81e9469a.png)

* Vaccinations in Malaysia began on 25 Feb 2021.

#### 6. Vietnam - Rolling Vaccination Rate, New Cases, and New Deaths by Date. These metrics show the movement of New Cases and New Deaths as the population vaccinated rate increases
```TSQL
SELECT 
  ct.continent, ct.location, vc.date, ct.population, 
  SUM(vc.new_vaccinations) OVER (PARTITION BY ct.location ORDER BY ct.location, vc.date) AS rolling_vaccination,
  SUM(vc.new_vaccinations) OVER (PARTITION BY ct.location ORDER BY ct.location, vc.date)
    / ct.population * 100.0 AS vaccination_per_pop,
  cs.new_cases, cs.new_deaths
FROM countries ct
JOIN vaccinations vc ON ct.iso_code = vc.iso_code
JOIN cases cs ON ct.iso_code = cs.iso_code
AND vc.date = cs.date
WHERE ct.location = 'Vietnam'
ORDER BY vc.date;
```
![image](https://user-images.githubusercontent.com/84619797/208341168-fd1ae941-ef12-4557-ad67-aa87fc192625.png)

* Vaccinations in Vietnam began on 08 Mar 2021.

### C. Tests by Location
#### 1. Worldwide - Positive Rate (7-rolling average), Total Tests, and Tests per Confirmed Case (7-rolling average) by Country and Date
```TSQL
SELECT 
  c.location, c.population, 
  t.date, t.total_tests, t.tests_units, t.positive_rate, t.tests_per_case
FROM countries c
JOIN tests t ON c.iso_code = t.iso_code
WHERE c.continent IS NOT NULL
ORDER BY c.location, t.date;
```
![image](https://user-images.githubusercontent.com/84619797/208343930-d9f3ae54-1ff9-48d0-87f3-d21287c6df42.png)

* Japan conducted first tests on 05 Feb 2020.

#### 2. Vietnam - Positive Rate (7-rolling average), Total Tests, and Tests per Confirmed Case (7-rolling average) by Date
```TSQL
SELECT 
  c.location, c.population, 
  t.date, t.total_tests, t.tests_units, t.positive_rate, t.tests_per_case
FROM countries c
JOIN tests t ON c.iso_code = t.iso_code
WHERE c.location = 'Vietnam'
ORDER BY t.date;
```
![image](https://user-images.githubusercontent.com/84619797/208343678-61563936-20cd-40f8-b69d-1587d44b965b.png)

* On 14 Sep 2021, there was 45,095,067 people tested.

#### 3. Worldwide - New tests performed each day
```TSQL
SELECT 
  c.location, c.population, 
  t.date, t.new_tests, t.tests_units
FROM countries c
JOIN tests t ON c.iso_code = t.iso_code
WHERE c.continent IS NOT NULL
ORDER BY c.location, t.date;
```
![image](https://user-images.githubusercontent.com/84619797/208344284-1af2ba21-d746-4c23-8783-a6bfc0f6b88e.png)

#### 4. Vietnam - New tests performed each day
```TSQL
SELECT 
  c.location, c.population, 
  t.date, t.new_tests, t.tests_units
FROM countries c
JOIN tests t ON c.iso_code = t.iso_code
WHERE c.location = 'Vietnam'
ORDER BY t.date;
```
![image](https://user-images.githubusercontent.com/84619797/208344494-93b484c3-c687-4223-be53-264788a22468.png)

* Vietnam conducted a massive number of tests on a daily basis in Sep 2021. This was actually our 4th wave of the pandemic that had most deaths recorded [Link](https://www.frontiersin.org/articles/10.3389/fpubh.2021.709067/full).

### D. Hospitalization by Location
#### 1. Worldwide - Number of patients, Number of ICU patients, Weekly hospital admissions, and Weekly ICU admission due to Covid by Country and Date
```TSQL
SELECT 
  ct.location, ct.population, 
  hp.date, hp.hosp_patients, icu_patients,
  hp.weekly_hosp_admissions, hp.weekly_icu_admissions
FROM countries ct
JOIN hospitals hp ON ct.iso_code = hp.iso_code
WHERE ct.continent IS NOT NULL
ORDER BY ct.location, hp.date;
```
![image](https://user-images.githubusercontent.com/84619797/208345134-0f0dda38-0e51-4840-954a-5ac1226d96b6.png)

* In Mar 2022, there was over 10 thousand hospital admissions in Germany on a daily basis. 

#### 2. Vietnam - Number of patients, Number of ICU patients, Weekly hospital admissions, and Weekly ICU admission due to Covid by Date
```TSQL
SELECT 
  ct.location, ct.population, 
  hp.date, hp.hosp_patients, icu_patients,
  hp.weekly_hosp_admissions, hp.weekly_icu_admissions
FROM countries ct
JOIN hospitals hp ON ct.iso_code = hp.iso_code
WHERE ct.location = 'Vietnam'
ORDER BY ct.location, hp.date;
```
![image](https://user-images.githubusercontent.com/84619797/208349043-9a867d51-97bc-49c4-8939-b4cc9e52a468.png)

* Unfortunately, there is no information about hospitalizations in Vietnam.

---
## 📊 Data Visualization
View the Power BI file [here](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam/blob/main/covid19_visualization.pbix).

![covid19_visualization-1](https://user-images.githubusercontent.com/84619797/208621080-4d618e04-c9d8-4be0-b570-b3a8a1967e53.png)

---
## 👏 Support
Please give me a ⭐️ if you like this project!

---
© 2022 Anh Nguyen
