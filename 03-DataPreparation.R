# Chapter 03 - Data Preparation


# 3.1 Data cleansing ------------------------------------------------------

c.dispatches_with_na <- c.dispatches


# 3.1.1 - Missin Values ---------------------------------------------------
c.dispatches  <- subset(c.dispatches, !is.na(kilograms))


# 3.2 Data integration ----------------------------------------------------

# 3.2.1 - Merging/joining data sets ---------------------------------------
base <- c.dispatches  %>% 
        left_join(c.sectors, by="idSector") %>% 
        left_join(c.trips, by="idTrip")  %>% 
        left_join(s.services, by="idService")


# 3.3 Data transformation -------------------------------------------------

# Creating views
serv_cost_kg  <- s.prices %>% 
                 filter(kindPrice == "KG") %>%
                 arrange(idService,idTrip) %>% 
                 left_join(s.services, "idService") %>% 
                 left_join(c.trips, "idTrip") %>% 
                 select(service, trip, price,kindPrice)

v.curr_veh <- s.setVehicles %>% 
              filter(kindSet == "Current" & idJob == 1) %>% 
              left_join(s.services, "idService") %>%
              select(idService, service, capacityKG)

v.daily_kg_dem      <- c.dispatches %>%
                       group_by(date) %>%
                       summarise(daily_kg = sum(kilograms))

v.daily_kg_dem_by_trip <- base %>%
                          group_by(date, trip) %>%
                          summarise(daily_kg = sum(kilograms))

v.daily_kg_dem_by_service <- base %>%
                             group_by(date, service) %>%
                             summarise(daily_kg = sum(kilograms), 
                                       daily_onway_km = sum(oneWayKM)) %>%
                             left_join(v.curr_veh,"service") %>%
                             mutate(num_trips = ceiling(daily_kg/capacityKG), 
                                    fleet = round(num_trips/3), 
                                    daily_km = round(daily_onway_km*2), 
                                    hours = round(daily_km/30), 
                                    num_workers = round(hours/4)
                                    )
sum(v.daily_kg_dem_by_service$num_trips)

v.daily_kg_dem_by_trip_service <- base %>%
                                  group_by(date, trip, service) %>%
                                  summarise(daily_kg = sum(kilograms)) %>% 
                                  left_join(serv_cost_kg, by = c("trip","service")) %>% 
                                  select(-kindPrice) %>% 
                                  mutate(value = price * daily_kg)


sum(v.daily_kg_dem_by_trip_service$value)/12

v.daily_kg_dem_by_service %>% group_by(service) %>% summarise(average_fleet = round(mean(fleet)), ave_num_workers = round(mean(num_workers)))
summary(v.daily_kg_dem_by_service)

v.ave_kg_dem_by_trip  <- v.daily_kg_dem_by_trip %>% 
                         group_by(trip) %>%
                         summarise(average_daily_kg = round(mean(daily_kg)), 
                                   median_daily_kg = median(daily_kg),
                                   dif_m = median_daily_kg - average_daily_kg,
                                   third_qu = quantile(daily_kg,0.80),
                                   dif_t = third_qu - average_daily_kg)

sum(v.ave_kg_dem_by_trip$average_daily_kg)
sum(v.ave_kg_dem_by_trip$median_daily_kg)
sum(v.ave_kg_dem_by_trip$third_qu)




# Derived measures

  

aux.inicio      <- as.Date("2015-01-02")
aux.fin         <- as.Date("2015-12-31")
aux.length_year <- as.numeric(aux.fin - aux.inicio) + 1
aux.date        <- seq(from = aux.inicio,
                       to = aux.fin, 
                       by = "days") %>%
                   rep(each = length(c.trips$trip))
aux.trip        <- rep(c.trips$trip, 
                       t = aux.length_year)
aux             <- data.frame(date = aux.date,
                              trip = aux.trip, 
                              stringsAsFactors = FALSE) %>%
                   left_join(y = v.daily_kg_dem_by_trip, 
                             by=c("date","trip"))

aux[is.na(aux$daily_kg),3] <- 0

m.dayly_kg_dem <- matrix(aux$daily_kg, ncol = length(c.trips$trip))

length(aux$date)
