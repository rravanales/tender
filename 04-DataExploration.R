# Chapter 04 - Data Exploration


# 4.1 Simple graphs -------------------------------------------------------

# 4.1.1 - Daily kilograms -------------------------------------------------

head(dispatches)
summary(dispatches)
daily_dis         <- group_by(dispatches, date)
daily_dis_sum_kgs <- summarise(daily_dis, kilograms = sum(kilograms))
summary(daily_dis_sum_kgs)

# a)
qplot(x    = date, 
      y    = kilograms, 
      data = daily_dis_sum_kgs, 
      geom = "point"
     ) + labs(title    = "Daily kilograms", 
              subtitle = "year 2015", 
              caption  = "3e+06 = 3.000.000")

# outliers
# b)
qplot(x    = "1",
      y    = kilograms,
      data = daily_dis_sum_kgs,
      geom = "boxplot"
) + labs(title    = "Daily kilograms",
         subtitle = "year 2015  - boxplot", 
         caption  = "Common values, tipical values and outliers")


# 4.1.2 - Daily kilograms group by trip -----------------------------------

head(base)
summary(base)
daily_dis_by_trip          <- group_by(base, date, trip)
daily_dis_by_trip_sum_kgs  <- summarise(daily_dis_by_trip, kilograms = sum(kilograms))
summary(daily_dis_by_trip_sum_kgs)

# a)
qplot(x     = trip,
      data  = daily_dis_by_trip_sum_kgs,
      geom  = "bar",
      fill = trip
) + labs(title    = "Number of days worked by trip",
         subtitle = "year 2015",
         caption  = "")
# b)
qplot(x     = date,
      y     = kilograms, 
      data  = daily_dis_by_trip_sum_kgs,
      geom  = "point", 
      color = trip
     ) + labs(title    = "Daily kilograms group by trip",
              subtitle = "year 2015",
              caption  = "")

# c)
qplot(x    = date,
      y    = kilograms,
      data = daily_dis_by_trip_sum_kgs,
      geom = c("smooth","point"),
      color = trip
     ) + labs(title    = "Daily kilograms group by trip",
              subtitle = "year 2015  - Smooth, Point", 
              caption  = "")

# d)
qplot(x    = date,
      y    = kilograms,
      data = daily_dis_by_trip_sum_kgs,
      geom = c("smooth"),
      color = trip
     ) + labs(title    = "Daily kilograms group by trip",
              subtitle = "year 2015  - Smooth", 
              caption  = "")

# outliers
# e)
qplot(x    = reorder(trip,kilograms),
      y    = kilograms,
      data = daily_dis_by_trip_sum_kgs,
      geom = "boxplot"
     ) + labs(title    = "Daily kilograms group by trip",
         subtitle = "year 2015  - boxplot", 
         caption  = "")






# 4.1.3 - Daily Kilograms group by trip and service (map) -----------------

summary(base)
base_f1                     <- filter(base, date >= '2015-12-01')
dis_by_trip_service         <- group_by(base, trip, service)
dis_by_trip_service_sum_kgs <- summarise(dis_by_trip_service, total = sum(kilograms), n = n(), promedio = mean(kilograms))
summary(dis_by_trip_service_sum_kgs)
sum(dis_by_trip_service_sum_kgs$promedio)

sum(dis_by_trip_service_sum_kgs[dis_by_trip_service_sum_kgs$trip == "MEDIANOS"]$promedio)
dis_by_trip_service_sum_kgs$trip == "MEDIANOS"
sum(dis_by_trip_service_sum_kgs[dis_by_trip_service_sum_kgs$trip == "MEDIANOS",]$promedio)

mean(base[base$trip == "MEDIANOS",]$kilograms)

# a)
qplot(x    = service, 
      data = base, 
      geom = "bar",
      fill = trip,
      position = "dodge"
) + labs(title    = "Number of services worked by trip ", 
         subtitle = "year 2015", 
         caption  = "")


# 4.2 Combined graphs --------------------------------------------------------
