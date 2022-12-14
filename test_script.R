# Statistical Programming Coursework 2

# Members and contributions ---------------------------------------------------------------
## 1. Stefi Tirkova
## 2. Passara Chanchotisatien

# Code description



# Question 1 ------------------------------------------------------------------------------

# This question contains code for the function pone, which takes in n, k, strategy,
# and nreps as arguments and returns the probability of one prisoner succeeding in
# finding their number. k (integer) is the prisoner number and strategy (integer)
# indicates which strategy (an integer 1 to 3) to estimate the probability for. nreps
# is the amount of times to run the simulation. 


pone <- function(n, k, strategy, nreps) {
  twon <- as.integer(n+n) 
  success_count <- 0
  prisoner_num <- k
  
  # if strategy 3 is selected
  if (strategy == 3) {
    for (i in 1:nreps) {
      card_number <- sample(1:twon)
      box_opened_hist = sample(card_number, n)
      if (prisoner_num %in% sample(card_number,n)) {
        success_count <- success_count + 1
      }
    }
  } else {
    for(i in 1:nreps){
      card_number <- sample(1:twon)
      boxes_opened <- 0
      if (strategy == 1) {
        current_box_num <- prisoner_num 
      } else if (strategy == 2) {
        current_box_num <- sample(twon, 1)
      }
      while(boxes_opened < n) {
        if(card_number[current_box_num] == prisoner_num) {
          success_count <- success_count + 1
          break
        }
        boxes_opened = boxes_opened + 1
        current_box_num <- card_number[current_box_num]
      }
    } 
  }
  
  # return the probability of a single player succeeding in finding their number
  # which is the number of successes divided 
  return((success_count / nreps))
}


print(pone(50, 34, 1, 10000))
print(pone(50, 34, 2, 10000))
print(pone(50, 34, 3, 10000))


# Question 2 ------------------------------------------------------------------------------

# This question contains code for the function pall, which takes in n, strategy,
# nreps as arguments and returns the probability of all prisoners succeeding in
# finding their number.

pall <- function(n, strategy, nreps) {
  success_vec <- rep(0,nreps)
  twon <- as.integer(n+n)
  
  if (strategy == 3) {
    for(i in 1:nreps){
      card_number <- sample(1:twon)
      num_pris_success <- 0
      for(prisoner_num in 1:twon){
        box_opened_hist <- sample(card_number, n)
        if (prisoner_num %in% sample(card_number,n)) {
          num_pris_success <- num_pris_success + 1
        }
      }
      success_vec[i] <- sum(num_pris_success)
    }
  } else {
    for(i in 1:nreps){
      card_number <- sample(1:twon)
      num_pris_success <- 0
      for(prisoner_num in 1:twon){
        boxes_opened = 0
        
        if(strategy == 1) { current_box_num <- prisoner_num }
        else if (strategy == 2) { current_box_num <- sample(twon, 1) }
        
        while(boxes_opened<n){
          if(card_number[current_box_num] == prisoner_num) {
            num_pris_success <- num_pris_success + 1
            break
          }
          boxes_opened <- boxes_opened + 1
          current_box_num <- card_number[current_box_num]
        }
      }
      success_vec[i] <- num_pris_success
    }
  }
  
  probability_all_succeed <- (length(success_vec[success_vec == twon])/nreps)*100
  return(probability_all_succeed)
}



# Question 3 ------------------------------------------------------------------------------

# Here, we estimate the individual and joint success probabilities for each strategy
# for when n = 5 and n = 50.

num_trials = 1000

# one prisoner succeeding in finding their number
print("Estimating the probability of a single prisoner succeeding:")
#n = 5
#print("n = 5")
#cat("Strategy 1 resulted in a success rate of ", pone(n, 3, 1,num_trials), ".",sep="")
#cat("Strategy 2 resulted in a success rate of ", pone(n, 3, 2,num_trials), ".",sep="")
#cat("Strategy 3 resulted in a success rate of ", pone(n, 3, 3,num_trials), ".",sep="")

n = 50
cat("Strategy 1 resulted in a success rate of ", pone(n, 34, 1,num_trials), ".",sep="")
cat("Strategy 2 resulted in a success rate of ", pone(n, 34, 2,num_trials), ".",sep="")
cat("Strategy 3 resulted in a success rate of ", pone(n, 34, 3,num_trials), ".",sep="")


# all prisoners succeeding in finding their number
print("Estimating the probability of all prisoners succeeding:")
#n = 5
#cat("Strategy 1 resulted in a success rate of ", pall(n,1,num_trials), "%.",sep="")
#cat("Strategy 2 resulted in a success rate of ", pall(n,2,num_trials), "%.",sep="")
#cat("Strategy 3 resulted in a success rate of ", pall(n,3,num_trials), "%.",sep="")

n = 50
cat("Strategy 1 resulted in a success rate of ", pall(n,1,num_trials), "%.",sep="")
cat("Strategy 2 resulted in a success rate of ", pall(n,2,num_trials), "%.",sep="")
cat("Strategy 3 resulted in a success rate of ", pall(n,3,num_trials), "%.",sep="")


# Question 4 ------------------------------------------------------------------------------

# In this section, we elaborate why the results are surprising.

# Question 5 ------------------------------------------------------------------------------



# Question 6 ------------------------------------------------------------------------------



