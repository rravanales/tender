# Chapter 06 - Data Presentation

###   Graphic
base_f1 = filter(base,date >= '2015-12-26')

summary(base_f1)
qplot(x    = lat, 
      y    = long, 
      data = base_f1, 
      geom = "point",
      color = trip,
      alpha = kilograms,
      size = kilograms,
      shape = service
) + labs(title    = "kilograms", 
         subtitle = "year 2015", 
         caption  = "3e+06 = 3.000.000") + geom_jitter(width = 0.01, height = 0.01)

# 4.1.3 - Daily Kilograms group by trip and service (map) -----------------

