#########################
## Occupancy model
#########################

# set working directory
setwd("/Users/joe/Desktop/R_projects/CH2_Occupancy/shorebird_occupancy/data")
list.files()

# open libraries
library(ggplot2)
library(plyr)
library(dplyr)
library(tidyverse)
library(tibble)


#########################
## Group data
#########################
# read in data

dat <- read.csv("Observations_edits.csv")

# merge columns "treatment, date, and species into ID column"

dat <- mutate(dat, ID = paste(treatment, date,species))

## Group data by date

dat_by_date_species<- group_by(dat, treatment, date, species)
summarise(dat_by_date_species, 
          suma_p=sum(count_present_in, na.rm=TRUE),
          suma_f=sum(count_foraging_in, na.rm=TRUE))


