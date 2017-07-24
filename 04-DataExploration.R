# Chapter 04 - Data Exploration

###   Graphic
format(t(s), big.mark = ".", decimal.mark = ",")

#### Simple graphs ####

# 1 - daily kilograms

head(dispatches)
summary(dispatches)
daily_dis         <- group_by(dispatches, date)
daily_dis_sum_kgs <- summarise(daily_dis, kilograms = sum(kilograms))
summary(daily_dis_sum_kgs)

# 1.1
qplot(x    = date, 
      y    = kilograms, 
      data = daily_dis_sum_kgs, 
      geom = "point"
     ) + labs(title    = "Daily kilograms", 
              subtitle = "year 2015", 
              caption  = "3e+06 = 3.000.000")

# outliers
# 1.2
qplot(x    = "1",
      y    = kilograms,
      data = daily_dis_sum_kgs,
      geom = "boxplot"
) + labs(title    = "Daily kilograms",
         subtitle = "year 2015  - boxplot", 
         caption  = "Common values, tipical values and outliers")


# 2 - daily kilograms group by trip

head(base)
summary(base)
daily_dis_by_trip          <- group_by(base, date, trip)
daily_dis_by_trip_sum_kgs  <- summarise(daily_dis_by_trip, kilograms = sum(kilograms))
summary(daily_dis_by_trip_sum_kgs)

# 2.1
qplot(x     = trip,
      data  = daily_dis_by_trip_sum_kgs,
      geom  = "bar",
      fill = trip
) + labs(title    = "Number of days worked by trip",
         subtitle = "year 2015",
         caption  = "")
# 2.2
qplot(x     = date,
      y     = kilograms, 
      data  = daily_dis_by_trip_sum_kgs,
      geom  = "point", 
      color = trip
     ) + labs(title    = "Daily kilograms group by trip",
              subtitle = "year 2015",
              caption  = "")

# 2.3
qplot(x    = date,
      y    = kilograms,
      data = daily_dis_by_trip_sum_kgs,
      geom = c("smooth","point"),
      color = trip
     ) + labs(title    = "Daily kilograms group by trip",
              subtitle = "year 2015  - Smooth, Point", 
              caption  = "")

# 2.4
qplot(x    = date,
      y    = kilograms,
      data = daily_dis_by_trip_sum_kgs,
      geom = c("smooth"),
      color = trip
     ) + labs(title    = "Daily kilograms group by trip",
              subtitle = "year 2015  - Smooth", 
              caption  = "")

# outliers
# 2.5
qplot(x    = reorder(trip,kilograms),
      y    = kilograms,
      data = daily_dis_by_trip_sum_kgs,
      geom = "boxplot"
     ) + labs(title    = "Daily kilograms group by trip",
         subtitle = "year 2015  - boxplot", 
         caption  = "")




#### Combined graphs ####

# 3 - kilograms daily group by trip and service (map)

summary(base)
base_f1                     <- filter(base, date >= '2015-12-01')
dis_by_trip_service         <- group_by(base, trip, service)
dis_by_trip_service_sum_kgs <- summarise(dis_by_trip_service, kilograms = sum(kilograms))
summary(base)

# 3.1
qplot(x    = service, 
      data = base, 
      geom = "bar",
      fill = trip,
      position = "dodge"
) + labs(title    = "Number of services worked by trip ", 
         subtitle = "year 2015", 
         caption  = "")

