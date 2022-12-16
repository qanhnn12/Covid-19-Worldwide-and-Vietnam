ALTER TABLE cases
ALTER COLUMN total_cases INT null;

ALTER TABLE cases
ALTER COLUMN new_cases INT null;

ALTER TABLE cases
ALTER COLUMN total_deaths INT null;

ALTER TABLE cases
ALTER COLUMN new_deaths INT null;

ALTER TABLE tests
ALTER COLUMN total_tests BIGINT null;

ALTER TABLE tests
ALTER COLUMN new_tests BIGINT null;

ALTER TABLE tests
ALTER COLUMN positive_rate FLOAT null;

ALTER TABLE tests
ALTER COLUMN tests_per_case FLOAT null;

ALTER TABLE vaccinations
ALTER COLUMN total_vaccinations BIGINT null;

ALTER TABLE vaccinations
ALTER COLUMN people_vaccinated BIGINT null;

ALTER TABLE vaccinations
ALTER COLUMN people_fully_vaccinated BIGINT null;

ALTER TABLE vaccinations
ALTER COLUMN total_boosters BIGINT null;

ALTER TABLE vaccinations
ALTER COLUMN new_vaccinations BIGINT null;
