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

# Get cross validation results for one run. 
set.seed(10255)
preds <- rf_cv(formula_list[[14]], corn_yield, 5)
preds_sum <- get_cv_rmse(formula_list[[14]], corn_yield, 5)

corn_yield$preds <- preds

tsum <- corn_yield |>
  group_by(GEOID) |>
  summarize(n = n(), 
            rmse = mean((preds-YIELD)^2),
            smape = mean(abs(preds - YIELD) / (abs(preds) + abs(YIELD))),
            lon = first(lon),
            lat = first(lat))

jpeg(filename = "results/cv_one_run.jpg", width = 7, height = 5, 
     units = "in", res = 600)
ggplot(tsum, aes(x = factor(11 - n), y = smape)) + 
  geom_boxplot() + 
  xlab("Number of Years Missing") + 
  ylab("SMAPE") + 
  scale_y_continuous(limits = c(0, 0.6), breaks = seq(0, 0.6, .1)) +
  theme_bw() + 
  theme(text = element_text(size = 16))
dev.off()