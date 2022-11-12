rf_cv <- function(formula, data, k, ...){
  groups <- sample(rep(1:k, length.out = nrow(data)))
  preds <- vector("numeric", nrow(data)) - 1
  
  for(i in 1:k){
    train <- data[groups != i, ]
    test <- data[groups == i, ]
    
    tfit <- ranger::ranger(formula, train, ...)
    preds[groups == i] <- predict(tfit, test)$predictions
  }
  
  preds
}

get_cv_rmse <- function(formula, data, k, ...){
  preds <- rf_cv(formula, data, k, ...)
  
  actual <- model.response(model.frame(formula, data))
  
  # rmse, median absolute error, and MAPE
  c(mean((actual - preds)^2),
    median(abs(actual - preds)),
    mean(abs(actual - preds) / abs(actual)))
}