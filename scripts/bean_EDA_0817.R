library(tidyverse)
library(ranger)

corn_yield <- readRDS("./data/data-out/true-train.RDS")

# Add coordinates to county data. 
counties <- sf::st_read("data/data-raw/tl_2019_us_county/tl_2019_us_county.shp")

county_centroid <- sf::st_centroid(counties)

county_join <- county_centroid %>% 
  dplyr::mutate(lon = sf::st_coordinates(.)[,1],
                lat = sf::st_coordinates(.)[,2]) %>%
  as.data.frame(.) %>%
  dplyr::select(GEOID, lon, lat)

corn_yield2 <- dplyr::left_join(corn_yield, county_join, by = "GEOID")
  

yield_RF <- corn_yield2 %>% dplyr::select(-c(GEOID))
yield_RF$FRR <- as.factor(yield_RF$FRR)

# Create training (75%) and test (25%) sets for our corn yield data.
# Use set.seed for reproducibility
set.seed(1235) 
random_rn <- sample(nrow(yield_RF), ceiling(nrow(yield_RF)*.25)) 
train_fullset <- yield_RF[-random_rn,] 
test_fullset <- yield_RF[random_rn,] 

train <- train_fullset %>% select(YEAR,YIELD,PERC_IRR,GDD,BV2,BV18,
                                  SDI_CDL_AG,BV9,BV4,TP,ELEVATION,S_PH_H2O,
                                  SLOPE,BV8,BV19,T_CEC_SOIL,BV15,
                                  T_REF_BULK_DENSITY,T_OC, lon, lat)

test <- test_fullset %>% select(YEAR,YIELD,PERC_IRR,GDD,BV2,BV18,
                                SDI_CDL_AG,BV9,BV4,TP,ELEVATION,S_PH_H2O,SLOPE,
                                BV8,BV19,T_CEC_SOIL,BV15,T_REF_BULK_DENSITY,
                                T_OC, lon, lat)

# subset for biophysical AND farm(er) variables
farmer_train <- train_fullset %>% select(YEAR,YIELD,PERC_IRR,FRR,GDD,BV2,BV18,
                                         SDI_CDL_AG,BV9,BV4,TP,ELEVATION,
                                         S_PH_H2O,SLOPE,BV8,BV19,T_CEC_SOIL,BV15,
                                         T_REF_BULK_DENSITY,T_OC,perc_corn,chem,
                                         fert,labor_expense,machinery,
                                         insur_acres,gvt_prog,exp,occup,tenant,
                                         acres_per_op, lon, lat)

farmer_test <- test_fullset %>% select(YEAR,YIELD,PERC_IRR,FRR,GDD,BV2,BV18,
                                       SDI_CDL_AG,BV9,BV4,TP,ELEVATION,S_PH_H2O,
                                       SLOPE,BV8,BV19,T_CEC_SOIL,BV15,
                                       T_REF_BULK_DENSITY,T_OC,perc_corn,chem,
                                       fert,labor_expense,machinery,insur_acres,
                                       gvt_prog,exp,occup,tenant,acres_per_op, lon, lat)


# Virtually the same level of accuracy using the default parameters. The 
# improvements due to tuning are inconsequential.
check_rf <- ranger(YIELD ~ . , train)
train_2 <- train
train_2$resid <- train_2$YIELD - predict(check_rf, train_2)$predictions
# check_rf <- ranger(YIELD ~ . , train, num.trees = 2000, 
#                    mtry = 7, min.node.size = 4,
#                    sample.fraction = 0.800)

t_resid <- mgcv::gam(resid ~ s(lon,lat, bs="sos", k = 100), data = train_2)

temp <- mgcv::gam(YIELD ~ s(YEAR) + s(PERC_IRR) + s(GDD) + s(BV2) + s(BV18) + 
                    s(SDI_CDL_AG) + s(BV9) + s(BV4) + s(TP) + s(ELEVATION) + s(S_PH_H2O) + s(SLOPE) + 
                    s(BV8) + s(BV19) + s(T_CEC_SOIL) + s(BV15) + s(T_REF_BULK_DENSITY) + s(T_OC) + 
                    s(lon,lat, bs="sos", k = 100),
                  data = train)

temp2 <- mgcv::gam(YIELD ~ s(YEAR) + s(PERC_IRR) + s(GDD) + s(BV2) + s(BV18) + 
                    s(SDI_CDL_AG) + s(BV9) + s(BV4) + s(TP) + s(ELEVATION) + s(S_PH_H2O) + s(SLOPE) + 
                    s(BV8) + s(BV19) + s(T_CEC_SOIL) + s(BV15) + s(T_REF_BULK_DENSITY) + s(T_OC),
                  data = train)

check_gam <- predict(temp, test)
check_gam2 <- predict(temp2, test)
pred_rf <- predict(check_rf, test)
pred_rf_resid <- predict(t_resid, test)

mean((check_gam - test$YIELD)^2)
mean((check_gam2 - test$YIELD)^2)
mean((pred_rf$predictions - test$YIELD)^2)
mean(((pred_rf$predictions + pred_rf_resid) - test$YIELD)^2)
