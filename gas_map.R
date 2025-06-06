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
library(ggplot2)


gasdata<- read.csv('gas.csv')

states<- read_sf("STATES.shp")

#Perform left join to join the gas price data with the states shapefile

gas_states<- left_join(states,gasdata,by=c("STATE_NAME"="State"))


# Save the plot as a PNG
png("gas_price_map.png", width = 800, height = 500)  

#Plot the map
ggplot(gas_states)+geom_sf(aes(fill=Regular))+theme_bw()+labs(fill="Price of 1 gallon of gas in dollars",title="Price of regular gas in each state",x="Longitude")+scale_fill_continuous(low="yellow", high="red", labels=comma)

#Finish saving as
dev.off()
