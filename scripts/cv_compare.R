library(tidyverse)
corn_yield <- readRDS("./data/data-out/true-train.RDS")
source("scripts/formula_prep.R")
source("scripts/cv_functions.R")

# Add coordinates to county data. 
counties <- sf::st_read("data/data-raw/tl_2019_us_county/tl_2019_us_county.shp")
county_centroid <- sf::st_centroid(counties)
county_join <- county_centroid %>% 
  dplyr::mutate(lon = sf::st_coordinates(.)[,1],
                lat = sf::st_coordinates(.)[,2]) %>%
  as.data.frame(.) %>%
  dplyr::select(GEOID, lon, lat)
corn_yield <- dplyr::left_join(corn_yield, county_join, by = "GEOID") 

# Set up grid of accuracy metrics. 
reps <- 50
tdf <- data.frame(formula = rep(-1, reps*length(formula_list)),
                  rmse = 0,
                  mae = 0, 
                  smape = 0)

set.seed(90210)
ind <- 1
for(i in 1:length(formula_list)){
  print(i)
  print(Sys.time())
  for(j in 1:reps){
    tdf[ind, 2:4] <- get_cv_rmse(formula_list[[i]], corn_yield, 5)
    
    ind <- ind + 1
  }
}
tdf[, 1] <- rep(1:length(formula_list), each = reps)

save(tdf, file = "results/cv_results_11032022_2.Rdata")

