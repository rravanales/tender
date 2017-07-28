# Chapter 04 - Data Exploration


# 4.1 Simple graphs -------------------------------------------------------

# 4.1.1 - Daily kilograms demand ------------------------------------------

head(c.dispatches)
v.daily_dem    <- group_by(c.dispatches, date)
s.daily_kg_dem <- summarise(v.daily_dem, daily_kg = sum(kilograms))
s.daily_kg_dem

# a)
qplot(x    = date, 
      y    = daily_kg, 
      data = s.daily_kg_dem, 
      geom = "point"
     ) + labs(title    = "Daily kilograms demand", 
              subtitle = "year 2015", 
              caption  = "3e+06 = 3.000.000 | Figure 1.1")

# b) Outliers
qplot(x    = " ",
      y    = daily_kg,
      data = s.daily_kg_dem,
      geom = "boxplot"
) + labs(title    = "Daily kilograms demand",
         subtitle = "year 2015  - boxplot", 
         caption  = "Common values, tipical values and outliers | Figure 1.2")
summary(s.daily_kg_dem)

# 4.1.2 - Daily kilograms demand group by trip ----------------------------

head(base)
v.daily_dem_by_trip     <- group_by(base, date, trip)
s.daily_kg_dem_by_trip  <- summarise(v.daily_dem_by_trip, daily_kg = sum(kilograms))
s.daily_kg_dem_by_trip

# a)
qplot(x     = trip,
      data  = s.daily_kg_dem_by_trip,
      geom  = "bar",
      fill = trip
) + labs(title    = "Number of days worked by trip",
         subtitle = "year 2015",
         caption  = "Figure 2.1")
# b.1)
qplot(x     = date,
      y     = daily_kg, 
      data  = s.daily_kg_dem_by_trip,
      geom  = "point", 
      color = trip
     ) + labs(title    = "Daily kilograms demand group by trip",
              subtitle = "year 2015",
              caption  = "Figure 2.2.a")

# b.2)
qplot(x    = date,
      y    = daily_kg,
      data = s.daily_kg_dem_by_trip,
      geom = c("smooth","point"),
      color = trip
     ) + labs(title    = "Daily kilograms demand group by trip",
              subtitle = "year 2015  - Smooth, Point", 
              caption  = "Figure 2.2.b")

# b.3)
qplot(x    = date,
      y    = daily_kg,
      data = s.daily_kg_dem_by_trip,
      geom = c("smooth"),
      color = trip
     ) + labs(title    = "Daily kilograms demand group by trip",
              subtitle = "year 2015  - Smooth", 
              caption  = "Figure 2.2.c")

# c) Outliers
qplot(x    = reorder(trip,daily_kg),
      y    = daily_kg,
      data = s.daily_kg_dem_by_trip,
      geom = "boxplot"
     ) + labs(title    = "Daily kilograms group by trip",
         subtitle = "year 2015  - boxplot", 
         caption  = "Figure 2.3")

head(s.daily_kg_dem_by_trip)
v.dem_by_trip         <- group_by(s.daily_kg_dem_by_trip, trip)
s.ave_kg_dem_by_trip  <- summarise(v.dem_by_trip, average_daily_kg = mean(daily_kg), median_daily_kg = median(daily_kg), dif = average_daily_kg - median_daily_kg)
s.ave_kg_dem_by_trip
sum(s.ave_kg_dem_by_trip$average_daily_kg)
sum(s.ave_kg_dem_by_trip$median_daily_kg)






# 4.2 Combined graphs --------------------------------------------------------
