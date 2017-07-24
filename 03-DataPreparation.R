# Chapter 03 - Data Preparation

####  Data cleansing ####
# Missing values
dispatches  <- subset(dispatches, !is.nan(kilograms))


#### Data integration ####
# Merging/joining data sets
head(sectors)
head(trips)
base <- left_join(dispatches, sectors, by="idSector")
base <- left_join(base, trips, by="idTrip")
head(base)
head(services)
base <- left_join(base, services, by="idService")

#### Data transformation #### 



