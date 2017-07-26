# Chapter 03 - Data Preparation


# 3.1 Data cleansing ------------------------------------------------------

c.dispatches_with_na = c.dispatches

# 3.1.1 - Missin Values ---------------------------------------------------
c.dispatches  <- subset(c.dispatches, !is.na(kilograms))


# 3.2 Data integration ----------------------------------------------------

# 3.2.1 - Merging/joining data sets ---------------------------------------
base <- left_join(c.dispatches, c.sectors, by="idSector")
base <- left_join(base, c.trips, by="idTrip")
base <- left_join(base, s.services, by="idService")


# 3.3 Data transformation -------------------------------------------------




