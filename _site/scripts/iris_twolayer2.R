library(magrittr)
library(dplyr)

iris_features <- tibble(
  sepal_length = iris$Sepal.Length,
  sepal_width = iris$Sepal.Width,
  petal_length = iris$Petal.Length,
  petal_width = iris$Petal.Width,
  context = 1 # a.k.a., bias, intercept, etc
) %>% as.matrix()

iris_species <- tibble(
  setosa = as.numeric(iris$Species == "setosa"),
  versicolor = as.numeric(iris$Species == "versicolor"),
  virginica = as.numeric(iris$Species == "virginica")
) %>% as.matrix()


logit <- function(x){
  1/(1+exp(-x))
}

input <- function(case) {
  iris_features[case,]
}

target <- function(case) {
  iris_species[case,]
}

labels <- list(
  input = colnames(iris_features),
  output = colnames(iris_species)
)


n_in <- length(labels$input)
n_out <- length(labels$output)
n_case <- dim(iris_features)[1]

weights <- matrix(
  data = rnorm(n_in * n_out) *.01,
  nrow = n_in,
  ncol = n_out,
  dimnames = labels
)

lambda <- .1
n_epoch <- 100
sse <- matrix(NA, n_case, n_epoch)

for(e in 1:n_epoch){
  
  ord <- sample(1:n_case)
  
  for(k in 1:n_case) {
    
    case <- ord[k]
    
    # feed forward
    output <- input(case) %*% weights %>% logit()
    
    delta_w <- matrix(NA,n_in,n_out)
    
    # compute the error at the weight
    for(i in 1:n_in) {
      for(o in 1:n_out) {
        
        prediction_error <- target(case)[o] - output[o] # equation 4 (times -1)
        
        # eq 5 & 6
        a_i <- input(case)[i] # salience value at the input node ("CS")
        b_j <- output[o] * (1-output[o]) # salience value at the output node ("US")
        delta_w[i,o] <- prediction_error * a_i * b_j
        
        weights[i,o] <- weights[i,o] + lambda * delta_w[i,o]  # equation 8
        
      }
    }
    
    sse[case,e] <- sum((target(case) - output)^2)
    
  }
}

plot(colSums(sse),type="b")

# matrix algebra form
#err_gr <- output - target(case) 
#dw_mat <- input(case) %*% (err_gr * output * (1-output))


