# Chapter 04 - Data Exploration


# 4.1 Simple graphs -------------------------------------------------------

# 4.1.1 - Daily kilograms demand ------------------------------------------

# a)
qplot(x    = date, 
      y    = daily_kg, 
      data = v.daily_kg_dem, 
      geom = "point"
     ) + labs(title    = "Daily kilograms demand", 
              subtitle = "year 2015", 
              caption  = "3e+06 = 3.000.000 | Figure 1.1")

# b) Outliers
qplot(x    = " ",
      y    = daily_kg,
      data = v.daily_kg_dem ,
      geom = "boxplot"
) + labs(title    = "Daily kilograms demand",
         subtitle = "year 2015  - boxplot", 
         caption  = "Common values, tipical values and outliers | Figure 1.2")
summary(s.daily_kg_dem)

# 4.1.2 - Daily kilograms demand group by trip ----------------------------



# a)
qplot(x     = trip,
      data  = v.daily_kg_dem_by_trip,
      geom  = "bar",
      fill = trip
) + labs(title    = "Number of days worked by trip",
         subtitle = "year 2015",
         caption  = "Figure 2.1")
# b.1)
qplot(x     = date,
      y     = daily_kg, 
      data  = v.daily_kg_dem_by_trip,
      geom  = "point", 
      color = trip
     ) + labs(title    = "Daily kilograms demand group by trip",
              subtitle = "year 2015",
              caption  = "Figure 2.2.a")

# b.2)
qplot(x    = date,
      y    = daily_kg,
      data = v.daily_kg_dem_by_trip,
      geom = c("smooth","point"),
      color = trip
     ) + labs(title    = "Daily kilograms demand group by trip",
              subtitle = "year 2015  - Smooth, Point", 
              caption  = "Figure 2.2.b")

# b.3)
qplot(x    = date,
      y    = daily_kg,
      data = v.daily_kg_dem_by_trip,
      geom = c("smooth"),
      color = trip
     ) + labs(title    = "Daily kilograms demand group by trip",
              subtitle = "year 2015  - Smooth", 
              caption  = "Figure 2.2.c")

# c) Outliers
qplot(x    = reorder(trip,daily_kg),
      y    = daily_kg,
      data = v.daily_kg_dem_by_trip,
      geom = "boxplot"
     ) + labs(title    = "Daily kilograms group by trip",
         subtitle = "year 2015  - boxplot", 
         caption  = "Figure 2.3")





# c) Outliers
qplot(x    = service,
      y    = num_workers,
      data = v.daily_kg_dem_by_service,
      geom = "boxplot"
) + labs(title    = "Daily kilograms group by trip",
         subtitle = "year 2015  - boxplot", 
         caption  = "Figure 2.3")

# c) Outliers
qplot(x    = service,
      y    = num_trips,
      data = v.daily_kg_dem_by_service,
      geom = "boxplot"
) + labs(title    = "Daily kilograms group by trip",
         subtitle = "year 2015  - boxplot", 
         caption  = "Figure 2.3")


# 4.2 Combined graphs --------------------------------------------------------
