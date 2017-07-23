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

#### Data transformation #### 





dispatches_by_date <- group_by(base, date)
s <- summarise(dispatches_by_date,
               kilograms = sum(kilograms),
          total = sum(kilograms), 
          min = min(kilograms), 
          max = max(kilograms), 
          median = median(kilograms), 
          mean = mean(kilograms)
)
s
dispatches_by_date_trip_f3 <- filter(dispatches_by_date_trip,date >= '2015-12-01')
qplot(x=date, y=kilograms, data=s, geom="point")
head(dispatches_by_date_trip_f3)

dispatches_by_sector <- group_by(dispatches,idSector)

dispatches_by_service <- group_by(dispatches,idService)


summarise(dispatches_by_date, 
          total = sum(kilograms), 
          min = min(kilograms), 
          max = max(kilograms), 
          median = median(kilograms), 
          mean = mean(kilograms)
          )


dispatches_by_date_service <- group_by(dispatches,date,idService)
dis_f3 = filter(dispatches_by_date_service,idService %in% c(2) & date >= '2015-12-01')
s <- summarise(dispatches_by_date_service, 
          total = sum(kilograms), 
          min = min(kilograms), 
          max = max(kilograms), 
          median = median(kilograms), 
          mean = mean(kilograms)
)

ungroup(dispatches_by_date_service)

s
summarise(s, total = sum(total))


dispatches_f3 = filter(dispatches,idSector %in% c(30,60,90) & date >= '2015-12-01')
head(dispatches_f3)
qplot(x=date, y=kilograms, data=dispatches_f3, geom="point",color=idService)




dispatches_f2 = select(dispatches,idSector)
dispatches_f2 = arrange(dispatches_f2, desc(idSector))
dispatches_f2 = mutate(dispatches_f2,new_col=idSector*2)

head(dispatches_f2)

qplot(x=date, y=kilograms, data=dispatches_f2, geom="line",color=idService)

table(dispatches$idService)
qplot(x=date,y=kilograms,data=dispatches, geom="boxplot")

qplot(dispatches$idSector)
table(dispatches$idSector)



