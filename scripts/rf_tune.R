library(tidymodels)
corn_yield <- readRDS("./data/data-out/true-train.RDS")
source("scripts/formula_prep.R")

# Add coordinates to county data. 
counties <- sf::st_read("data/data-raw/tl_2019_us_county/tl_2019_us_county.shp")
county_centroid <- sf::st_centroid(counties)
county_join <- county_centroid %>% 
  dplyr::mutate(lon = sf::st_coordinates(.)[,1],
                lat = sf::st_coordinates(.)[,2]) %>%
  as.data.frame(.) %>%
  dplyr::select(GEOID, lon, lat)
corn_yield <- dplyr::left_join(corn_yield, county_join, by = "GEOID") 

# https://juliasilge.com/blog/sf-trees-random-tuning/

set.seed(90211)
corn_split <- initial_split(corn_yield)
corn_train <- training(corn_split)
corn_test <- testing(corn_split)

corn_rec <- recipe(formula_list[[1]], data = corn_train)

tune_spec <- rand_forest(
  mtry = tune(),
  trees = 1000,
  min_n = tune()
) %>%
  set_mode("regression") %>%
  set_engine("ranger")

tune_wf <- workflow() %>%
  add_recipe(corn_rec) %>%
  add_model(tune_spec)

corn_folds <- vfold_cv(corn_train)

# Train in parallel
doParallel::registerDoParallel()

tune_res <- tune_grid(
  tune_wf,
  resamples = corn_folds,
  grid = 3
)

best_rmse <- select_best(tune_res, "rmse")

final_rf <- finalize_model(
  tune_spec,
  best_rmse
)

profvis::profvis(
final_rf |>
  fit(formula_list[[1]], corn_train)
)


test <- ranger(formula_list[[1]], corn_train)
