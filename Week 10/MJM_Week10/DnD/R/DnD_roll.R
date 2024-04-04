#' A Dungeons and Dragons dice rolling function
#'
#' This function allows you to choose how many dice you roll and how many sides the dice have
#' This returns the result of each roll and the sum of the rolls
#' @param n_dice, Number of Dice returned
#' @param n_sides, Number of Sides on each Dice returned
#' @keywords DnD_roll
#' @export
#' @examples
#' DnD_roll(4, 6)
#' 

# Function to roll a specified number of dice with a given number of sides
DnD_roll <- function(n_dice, n_sides) {
  
  # Create vector for the results of each roll
  results <- numeric(n_dice)
  
  # Roll each dice
  for (i in 1:n_dice) {
    # Generate a random number between 1 and the number of sides on the die
    results[i] <- sample(1:n_sides, 1, replace = TRUE)
  }
  # Sum each dice roll
  total <- sum(results)
  
  # Return results and total
  return(list(Rolls = results, Total = total))
}

