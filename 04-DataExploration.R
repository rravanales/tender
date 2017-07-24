# Chapter 04 - Data Exploration

###   Graphic
format(t(s), big.mark = ".", decimal.mark = ",")

#### Simple graphs ####

# 1 - kilograms daily
head(dispatches)
summary(dispatches)
dis_by_date         <- group_by(dispatches, date)
dis_by_date_sum_kgs <- summarise(dis_by_date, kilograms = sum(kilograms))
plt <- qplot(x=date, y=kilograms, data=dis_by_date_sum_kgs, geom="point")
plt <- plt + labs(title = "kilograms daily", subtitle = "year 2015", caption = "3e+06 = 3.000.000")
plt
summary(dis_by_date_sum_kgs)

# 2 - kilograms daily group by trip
head(base)
summary(base)
dis_by_date_trip          <- group_by(base, date, trip)
dis_by_date_trip_sum_kgs  <- summarise(dis_by_date_trip, kilograms = sum(kilograms))
plt <- qplot(x=date, y=kilograms, data=dis_by_date_trip_sum_kgs, geom="point", color=trip)
plt <- plt + labs(title = "kilograms daily group by trip", subtitle = "year 2015", caption = "@rravanales")
plt
summary(dis_by_date_trip_sum_kgs)

# outliers
plt <- qplot(x=date, y=kilograms, data=dis_by_date_trip_sum_kgs, geom=c("smooth","point"), color=trip)
plt <- plt + labs(title = "kilograms daily group by trip - Smooth, Point ", subtitle = "year 2015", caption = "@rravanales")
plt


plt <- qplot(x=date, y=kilograms, data=dis_by_date_trip_sum_kgs, geom=c("smooth"), color=trip)
plt <- plt + labs(title = "kilograms daily group by trip - Smooth", subtitle = "year 2015", caption = "@rravanales")
plt

plt <- qplot(x=trip, y=kilograms, data=dis_by_date_trip_sum_kgs, geom="boxplot")
plt <- plt + labs(title = "kilograms daily group by trip - Boxplot", subtitle = "year 2015", caption = "@rravanales")
plt

# 3 - kilograms daily group by trip and service
summary(base)
base_f1                           <- filter(base, date >= '2015-12-01')
dis_daily_by_trip_service         <- group_by(base_f1, date, trip, service)
dis_daily_by_trip_service_sum_kgs <- summarise(dis_daily_by_trip_service, kilograms = sum(kilograms))
qplot(x=date, y=kilograms, data=dis_daily_by_trip_service_sum_kgs, geom="smooth", color=trip, shape=service)

#### Combined graphs ####



dis_by_date_trip_sum_kgs