# Covid-19 analysis: Worldwide and Vietnam
This repository was inspired by the tutorial of Alex Freberg's [Data Analyst Portfolio Projects](https://www.youtube.com/playlist?list=PLUaB-1hjhk8H48Pj32z4GZgGWyylqv85f). Following his instruction, I already performed some EDA and created a Tableau dashboard [here](https://public.tableau.com/views/WorldwideCovid-19Dashboard_16710219069800/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link). However, I would like to analyze other aspects of Covid-19 in the global scale and in Vietnam, then visualize them in Power BI since I've just learned it recently.

## Table of Contents
1. [Data Preprocessing](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam#1-data-preprocessing)
2. [Data Importing and Cleaning](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam#2-data-importing-and-cleaning)
3. [Data Exploratory Analysis]
4. [Data Visualization]
5. [Summary and Conclusion]

## 1. Data Preprocessing
The raw Covid-19 dataset from 1 Jan 2020 to 12 Dec 2022 was downloaded from [Our World in Data](https://ourworldindata.org/covid-deaths).
Detail definition for each column name can be found in this [GitHub](https://github.com/owid/covid-19-data/blob/master/public/data/README.md).

After scrolling the CSV file and GitHub doccument above, I categorized my analysis into 4 main parts: *Cases and Deaths*, *Vaccinations*, *Hospitalizations*, and *Tests*. 

To reduce the size of the dataset, I divided it into 5 tables. Each one was in a corresponding Excel file.


#### Table `countries`

| Column |    Description                                                                                                                         |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| `iso_code`| Country codes. Note that OWID-defined regions contain prefix 'OWID_'.                                                                      |
| `continent`  | Continent of the geographical location. Note that Americas were divided into *North America* and *South America*.                       |
| `location`   | Geographical location (not exactly country name). There are also continents, income classes and other labels. You can check that when filtering *blank* on `continent` column.                                                                                                                           |
| `population` | Population (latest available values).                                                                                                   |


#### Table `cases`

| Column | Description  |
|---|---|
| iso_code | Country codes. Note that OWID-defined regions contain prefix 'OWID_'.     |
| date | Date of observation.  |
| total_cases | Total confirmed cases of COVID-19. Counts can include probable cases, where reported.  |
| new_cases | New confirmed cases of COVID-19. Counts can include probable cases, where reported.   |
| total_deaths | Total deaths attributed to COVID-19. Counts can include probable deaths, where reported.  |
| new_deaths | New deaths attributed to COVID-19. Counts can include probable deaths, where reported.   |


#### Table `vaccinations`

| **Column** | **Description** |
|---|---|
| iso_code | Country codes. Note that OWID-defined regions contain prefix 'OWID_'.   |
| date | Date of observation.  |
| total_vaccinations | Total number of COVID-19 vaccination doses administered.  |
| people_vaccinated | Total number of people who received at least one vaccine dose.  |
| people_fully_vaccinated | Total number of people who received all doses prescribed by the initial vaccination protocol.  |
| total_boosters | Total number of COVID-19 vaccination booster doses administered (doses administered beyond the number prescribed by the vaccination protocol).  |
| new_vaccinations | New COVID-19 vaccination doses administered (only calculated for consecutive days).  |


#### Table `hospitals`

| **Column**             | **Description**                                                                                                                      |
|------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| iso_code               | Country codes. Note that OWID-defined regions contain prefix 'OWID_'.                                                                 |
| date                   | Date of observation.                                                                                                                  |
| icu_patients           | Number of COVID-19 patients in intensive care units (ICUs) on a given day                                                             |
| hosp_patients          | Number of COVID-19 patients in hospital on a given day                                                                                |
| weekly_icu_admissions  | Number of COVID-19 patients newly admitted to intensive care units (ICUs) in a given week (reporting date and the preceeding 6 days)  |
| weekly_hosp_admissions | Number of COVID-19 patients newly admitted to hospitals in a given week (reporting date and the preceeding 6 days)                    |


#### Table `tests`

| **Column**     | **Description**                                                                                                              |
|----------------|------------------------------------------------------------------------------------------------------------------------------|
| iso_code       | Country codes. Note that OWID-defined regions contain prefix 'OWID_'.                                                        |
| date           | Date of observation.                                                                                                         |
| total_tests    | Total tests for COVID-19.                                                                                                    |
| new_tests      | New tests for COVID-19 (only calculated for consecutive days).                                                               |
| positive_rate  | The share of COVID-19 tests that are positive, given as a rolling 7-day average (this is the inverse of tests_per_case)      |
| tests_per_case | Tests conducted per new confirmed case of COVID-19, given as a rolling 7-day average (this is the inverse of positive_rate)  |
| tests_units    | Units used by the location to report its testing data.                                                                       |

</p>
</details>

## 2. Data Importing and Cleaning
After importing 5 tables above to SQL Server, there are some numeric data stored as `nvarchar`, so I converted them to `int`,  `bigint` or `float`.
View the detail SQL script to convert them [here](https://github.com/qanhnn12/Covid-19-analysis-Worldwide-and-Vietnam/blob/main/data_cleaning.sql).

So, this is my Entity Relationship Diagram:

<p align="center">
<img src="https://user-images.githubusercontent.com/84619797/208293847-6aed2530-473b-435b-b4c8-b52590c812e5.PNG" align="center" width="800" height="420" >

## 3. Data Exploration Analysis

## 4. Data Visualization
