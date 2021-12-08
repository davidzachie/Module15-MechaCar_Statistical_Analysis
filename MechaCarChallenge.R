library(dplyr)

# DELIVERABLE 1
# Import the data
mecha_car_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F, stringsAsFactors = F)

# Perform linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_car_mpg)

# Perform summary
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_car_mpg))

# DELIVERABLE 2
# Import the data
suspension_coil <- read.csv(file='Suspension_Coil.csv',check.names=F, stringsAsFactors = F)

# Create total_summary data frame
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# Create lot_summary data frame
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

# DELIVERABLE 3
# Using the t.test() function to determine if the PSI across ALL manufacturing lots is statistically different 
# from the population mean of 1,500 pounds per square inch
t.test(suspension_coil$PSI, mu = 1500)

# Three more RScripts using the t.test() function and its subset() argument to determine if the PSI for EACH manufacturing lot 
# is statistically different from the population mean of 1,500 pounds per square inch
# Peform t-test on Lot 1
t.test(subset(suspension_coil,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)
# Peform t-test on Lot 2
t.test(subset(suspension_coil,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)
# Peform t-test on Lot 3
t.test(subset(suspension_coil,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)
                                                                        