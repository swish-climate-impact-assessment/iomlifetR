% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/life_table.R
\name{life_table}
\alias{life_table}
\title{Calculate life expectancy}
\usage{
life_table(hazard, start_age, neonatal_deaths = TRUE)
}
\arguments{
\item{hazard}{A numeric vector. The age specific hazard.}

\item{start_age}{A numeric vector. The first age (in years) in each age group.}

\item{neonatal_deaths}{Logical. Are neonatal deaths included?}
}
\value{
A data frame of: \itemize{
\item{Age groups}
\item{Age-specific hazards}
\item{Population surviving from a cohort of 100,000}
\item{Survival probability}
\item{Number of deaths per 100,000}
\item{Number of life-years lived per 100,0000}
\item{life expectancy}}
}
\description{
Calculate life expectancy using the Chiang method
}
\examples{

# Using an abridged set of population and mortality data:
head(abridged_data)
population <- subset(abridged_data,
                     time == 2011 & sex == "Persons" & measure == "Population",
                     select = c(age, value))
population = population$value
deaths <- subset(abridged_data,
                 time == 2011 & sex == "Persons" & measure == "Deaths",
                 select = c(age, value))
start_age <- as.numeric(gsub(" .+", "", deaths$age))
deaths  <- deaths$value
hazard <- deaths / population
life_table(hazard, start_age)

# Using single-year population and mortality data
head(single_year_data)
population <- subset(single_year_data,
                     time == 2011 & sex == "Persons" & measure == "Population",
                     select = c(age, value))
population = population$value
deaths <- subset(single_year_data,
                 time == 2011 & sex == "Persons" & measure == "Deaths",
                 select = c(age, value))
start_age <- as.numeric(gsub(" .+", "", deaths$age))
deaths  <- deaths$value
hazard <- deaths / population
life_table(hazard, start_age)
}
