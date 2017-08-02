# Chapter 05 - Data Modeling



# 5.1 Model and variable selection ----------------------------------------

# 5.1.1 - Predictors and target ---------------------------------------------

# a) Costs 
costs         <- matrix(serv_cost_kg$price, ncol = 5, byrow = TRUE)

costs
s.services
c.trips

# 5.2 Model execution -----------------------------------------------------

# 5.2.1 - Fits model on data ------------------------------------------------

# a) Parameters -----------------------------------------------------------

# i.- Demand 

demand  <- v.ave_kg_dem_by_trip %>% 
  left_join(c.trips, by="trip") %>% 
  arrange(idTrip) %>% 
  select(third_qu)

# ii.- Supply 

# 1) Number of vehicles per services

Num_veh_Carro   <- 32
Num_veh_Rampla  <- 2
Num_veh_Simple  <- 30

# 2) Number of trips

num_daily_trips <- 3.3

# 3) Capacity of vehicles

s.setVehicles
cap_veh <- s.setVehicles %>% 
  filter(kindSet == "Current" & idJob == "1") %>%
  arrange(idService) %>%
  select(capacityKG)


# iii.- Constraint 

num_veh <- c(Num_veh_Carro,Num_veh_Rampla,Num_veh_Simple)
supply  <- cap_veh * num_veh * num_daily_trips 
sum(supply)
sum(demand)

row.signs <- rep ("<", 3)
row.rhs <- supply$capacityKG
#row.rhs <- c(50,5,55)
col.signs <- rep (">", 5)
#col.rhs <- c(5,50,25,15,0)
col.rhs <- demand$third_qu
sum(row.rhs)
sum(col.rhs)

# b) Run -----------------------------------------------------------------

model = lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)

# 5.2.2 - Shows model fit statistics -------------------------------------------

# a) Model fit: R-squared (mejor comparado con el promedio o sin planificacion)
model$solution
model$objval*27.5

c.trips
s.services
sum(model$solution[1,])

# 5.3 Model diagnostic and model comparison ------------------------------

# 5.3.1 - Model diagnostics ---------------------------------------------------

# 5.3.2 - Building multiple models --------------------------------------------
# a) probar con diferentes restricciones de oferta  (analisis de sensibilidad)

# 5.3.3 - Error measures ------------------------------------------------------



