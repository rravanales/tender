# Chapter 02 - Import Data


# 2.1 Load External data: Client ----------------------------------------------

# 2.1.1 - Dispatches ----------------------------------------------------------
c.dispatches <- read.xlsx(
  xlsxFile    = "Data/ClientDB.xlsx", 
  sheet       = "Dispatches", 
  detectDates = TRUE
)
str(c.dispatches)

# 2.1.2 - Sectors -------------------------------------------------------------
c.sectors <- read.xlsx(
  xlsxFile    =  "Data/ClientDB.xlsx", 
  sheet       = "Sectors"
)
str(c.sectors)

# 2.1.3 - Trips ---------------------------------------------------------------
c.trips <- read.xlsx(
  xlsxFile    = "Data/ClientDB.xlsx", 
  sheet       = "Trips"
)
str(c.trips)

# 2.1.4 - Jobs ----------------------------------------------------------------
c.jobs <- read.xlsx(
  xlsxFile    = "Data/ClientDB.xlsx", 
  sheet       = "Jobs"
)
str(c.jobs)



# 2.2 Load Internal data: Supplier --------------------------------------------

# 2.2.1 - Services ------------------------------------------------------------
s.services <- read.xlsx(
  xlsxFile    = "Data/SupplierDB.xlsx", 
  sheet       = "Services"
)
str(s.services)

# 2.2.2 - SetVehicles ---------------------------------------------------------
s.setVehicles <- read.xlsx(
  xlsxFile    = "Data/SupplierDB.xlsx", 
  sheet       = "SetVehicles"
)
str(s.setVehicles)

# 2.2.3 - Prices --------------------------------------------------------------
s.prices <- read.xlsx(
  xlsxFile    = "Data/SupplierDB.xlsx", 
  sheet       = "Prices",
  detectDates = TRUE
)
str(s.prices)
