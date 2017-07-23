# Chapter 02 - Import Data

####  Load External data: Client #########################################

###   Dispatches
dispatches <- read.xlsx2(
  file       = "Data/ClientDB.xlsx", 
  sheetName  = "Dispatches", 
  colClasses = c("Date", rep("numeric", 3))
)
head(dispatches)

###   Sectors
sectors <- read.xlsx2(
  file       = "Data/ClientDB.xlsx", 
  sheetName  = "Sectors", 
  colClasses = c("numeric", "character", rep("numeric", 5))
)
head(sectors)

###   Trips
trips <- read.xlsx2(
  file       = "Data/ClientDB.xlsx", 
  sheetName  = "Trips", 
  colClasses = c("numeric", "character")
)
head(trips)

###   Jobs
jobs <- read.xlsx2(
  file       = "Data/ClientDB.xlsx", 
  sheetName  = "Jobs", 
  colClasses = c("numeric", "character")
)
head(jobs)



####  Load Internal data: Supplier #########################################

###   Services
services <- read.xlsx2(
  file       = "Data/SupplierDB.xlsx", 
  sheetName  = "Services", 
  colClasses = c("numeric", "character")
)
head(services)

###   SetVehicles
setVehicles <- read.xlsx2(
  file       = "Data/SupplierDB.xlsx", 
  sheetName  = "SetVehicles",
  colClasses = c(rep("numeric",3), "character")
)
head(setVehicles)

###   Prices
prices <- read.xlsx2(
  file       = "Data/SupplierDB.xlsx", 
  sheetName  = "Prices",
  colClasses = c(rep("numeric",3), "character")
)
head(prices)
