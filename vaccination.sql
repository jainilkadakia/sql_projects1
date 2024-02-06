use portfolio_projectss;

create table covid_vaccination (
iso_code varchar(255),
continent varchar(255),
location varchar(255),
date_date varchar(255),
total_tests_per_thousand bigint ,
new_tests_per_thousand bigint ,
new_tests_smoothed bigint ,
new_tests_smoothed_per_thousand bigint,
positive_rate bigint,
tests_per_case bigint,
tests_units varchar(255),
total_vaccinations bigint,
people_vaccinated bigint,
people_fully_vaccinated bigint,
total_boosters bigint,
new_vaccinations bigint,
new_vaccinations_smoothed bigint,
total_vaccinations_per_hundred bigint ,
people_vaccinated_per_hundred bigint,
people_fully_vaccinated_per_hundred bigint,
total_boosters_per_hundred bigint,
new_vaccinations_smoothed_per_million bigint,
new_people_vaccinated_smoothed bigint,
new_people_vaccinated_smoothed_per_hundred bigint,
stringency_index bigint,
population_density bigint,
median_age bigint,
aged_65_older bigint,
aged_70_older bigint,
gdp_per_capita bigint,
extreme_poverty bigint,
cardiovasc_death_rate bigint,
diabetes_prevalence bigint,
female_smokers bigint ,
male_smokers bigint,
handwashing_facilities bigint ,
hospital_beds_per_thousand bigint,
life_expectancy bigint,
human_development_index bigint,
excess_mortality_cumulative_absolute bigint,
excess_mortality_cumulative bigint,
excess_mortality bigint ,
excess_mortality_cumulative_per_million bigint );

alter table covid_vaccination modify column tests_units varchar(255);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/covid vaccination.csv'  INTO TABLE covid_vaccination
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;









 






















