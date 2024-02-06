use portfolio_projectss;
select * from covid_death ;

/* Q1 :Total Cases vs Total deaths */
/* Shows likehood of dying if you contract covid in */
Select continent,location ,new_date ,total_cases,total_deaths ,(total_deaths/total_cases)* 100 as Death_Percentage from covid_death 
group by continent ,location,new_date,total_cases,total_deaths
order by  Death_percentage desc;

/* Q2: Total Case VS Population 
 Percent of population who got covid */
 Select continent, location ,total_cases,population ,(total_cases/population) * 100 as CASES_PER_POPULATION 
 FROM covid_death 
 group by location,total_cases,population,continent
 order by CASES_PER_POPULATION desc ;
 
 /* Q3 Highets infected rate as per location */
 SELECT location , population ,MAX(total_cases)as highest_infected,MAX((total_cases/population))* 100 as percent_population_infected
 from covid_death
 group by 1,2
order by 1,2;

/* Q:4 GLOBAL NUMBERS as DeathPercentage */
Select new_date ,SUM(new_cases), SUM(new_deaths) as Death_percentage 
from covid_death
where continent is not null
group by new_date 
order by 3 desc ;


/* Q5 Looking at Total Population Vs Vaccination */
Select covid_death.location ,covid_death.continent, covid_death.new_date ,covid_death.population,covid_vaccination.new_vaccinations
from covid_death 
JOIN covid_vaccination on covid_death.location = covid_vaccination.location and covid_death.new_date = covid_vaccination.date_date
order by 2,3;


/* Q6 :Total Population vs Vaccinations
 Population that has recieved at least one Covid Vaccine */
Select covid_death.continent, covid_death.location, covid_death.new_date, covid_death.population, covid_vaccination.new_vaccinations
, SUM(covid_vaccination.new_vaccinations) OVER (Partition by covid_vaccination.location Order by covid_vaccination.location, covid_vaccination.date_date) as RollingPeopleVaccinated
From covid_death
Join covid_vaccination
	On covid_death.location = covid_vaccination.location
	and covid_death.new_date = covid_vaccination.date_date
 order by 6 desc;
 
 /*Q7 :Using CTE to perform Calculation on Partition By in previous query*/
With PopvsVac (continent, location, new_date, population, new_Vaccinations, RollingPeopleVaccinated)
as
(Select covid_death.continent, covid_death.location, covid_death.new_date, covid_death.population, covid_vaccination.new_vaccinations
, SUM(covid_vaccination.new_vaccinations) OVER (Partition by covid_vaccination.location Order by covid_vaccination.location, covid_vaccination.date_date) as RollingPeopleVaccinated
From covid_death
Join covid_vaccination
	On covid_death.location = covid_vaccination.location
	and covid_death.new_date = covid_vaccination.date_date
 order by 6 desc)
 select * from PopvsVac;
 
 
 /* Q8:Using Temp Table to perform Calculation on Partition By in previous query INSERT */
Create Table PercentPopulationVaccinated
(
Continent varchar(255),
Location varchar(255),
Date datetime,
Population bigint,
New_vaccinations bigint,
RollingPeopleVaccinated bigint);


INSERT  into PercentPopulationVaccinated
Select covid_death.continent, covid_death.location, covid_death.new_date, covid_death.population, covid_vaccination.new_vaccinations
, SUM(covid_vaccination.new_vaccinations) OVER (Partition by covid_vaccination.location Order by covid_vaccination.location, covid_vaccination.date_date) as RollingPeopleVaccinated
From covid_death
Join covid_vaccination
	On covid_death.location = covid_vaccination.location
	and covid_death.new_date = covid_vaccination.date_date
 order by 6 desc;

 select * from PercentPopulationVaccinated;
 
 
 /*Q9 :Creating View to store data for later visualizations */
 Create View viewvaccination as
 Select covid_death.continent, covid_death.location, covid_death.new_date, covid_death.population, covid_vaccination.new_vaccinations
, SUM(covid_vaccination.new_vaccinations) OVER (Partition by covid_vaccination.location Order by covid_vaccination.location, covid_vaccination.date_date) as RollingPeopleVaccinated
From covid_death
Join covid_vaccination
	On covid_death.location = covid_vaccination.location
	and covid_death.new_date = covid_vaccination.date_date
 order by 6 desc;
 
 