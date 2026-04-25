#NAs function

NAs <- function(data, method = c("drop", "mean", "median", "max", "min", "zero"), x = NULL){
  
  if (is.null(dim(data))) {
    stop(paste("unexpected symbol: A", class(data), "- must have dimensions."))
  }
  
  method <- match.arg(method)
  
  if (method == "drop"){
    
    if (is.null(x)){
      return(data[complete.cases(data), ])
    }
    
    missingRatePerGene = apply(is.na(data), 1, sum) / ncol(data) * 100
    
    good.index.data = missingRatePerGene <= x
    
    return(data[good.index.data, ])
  }
  
  
  for (i in 1:ncol(data)) {
    
    if (method == "mean") {
      
      data[[i]] <- ifelse(is.na(data[[i]]),
                          mean(data[[i]], na.rm = TRUE),
                          data[[i]])
      
    } else if (method == "median") {
      
      data[[i]] <- ifelse(is.na(data[[i]]),
                          median(data[[i]], na.rm = TRUE),
                          data[[i]])
      
    } else if (method == "max") {
      
      data[[i]] <- ifelse(is.na(data[[i]]),
                          max(data[[i]], na.rm = TRUE),
                          data[[i]])
      
    } else if (method == "min") {
      
      data[[i]] <- ifelse(is.na(data[[i]]),
                          min(data[[i]], na.rm = TRUE),
                          data[[i]])
      
    } else if (method == "zero") {
      
      data[[i]] <- ifelse(is.na(data[[i]]), 0, data[[i]])
    }
  }
  
  return(data)
}