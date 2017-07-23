# Chapter 04 - Data Exploration

###   Graphic
format(t(s), big.mark = ".", decimal.mark = ",")

#### Simple graphs ####

# 1 - kilograms daily
head(dispatches)
summary(dispatches)
dis_by_date         <- group_by(dispatches, date)
dis_by_date_sum_kgs <- summarise(dis_by_date, kilograms = sum(kilograms))
qplot(x=date, y=kilograms, data=dis_by_date_sum_kgs, geom="point")

# 2 - kilograms daily group by trip
head(base)
summary(base)
dis_by_date_trip          <- group_by(base, date, trip)
dis_by_date_trip_sum_kgs  <- summarise(dis_by_date_trip, kilograms = sum(kilograms))
qplot(x=date, y=kilograms, data=dis_by_date_trip_sum_kgs, geom="point", color=trip)
# outliers
qplot(x=trip, y=kilograms, data=dis_by_date_trip_sum_kgs, geom="boxplot")

#### Combined graphs ####



dis_by_date_trip_sum_kgs