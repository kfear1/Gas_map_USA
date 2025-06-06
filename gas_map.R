#Script to join gas.csv table with states.shp feature class
#Create regular gas price map by state

#Set working directory 
setwd("~/Documents/R/Github/Gas_map_USA")

# Question 1- join gas.csv to states.shp and create a regular gas price map by state for the USA

#install.packages(c('sf','dplyr','ggplot2','leaflet','scales','ggmap'))
library(sf)
library(dplyr)
library(ggplot2)
library(scales)
library(leaflet)
library(ggmap)


gasdata<- read.csv('gas.csv')

states<- read_sf("STATES.shp")

#left join

gas_states<- left_join(states,gasdata,by=c("STATE_NAME"="State"))

plot(gas_states["Regular"],main="Regular gas price in each state", breaks="jenks")
