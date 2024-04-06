#' Count occurrences of "create table" in a file
#' 
#' This function counts how many times the string "create table" appears in a file.
#' 
#' @param file_path Path to the file.
#' @return Integer count of occurrences.
#' @export
count_create_table <- function(file_path) {
  # Read the contents of the file
  file_content <- readLines(file_path)
  
  # Initialize counter
  count <- 0
  
  # Loop through each line of the file
  for (line in file_content) {
    # Check if the line contains the string "create table" (case insensitive)
    if (grepl("create table", tolower(line), ignore.case = TRUE)) {
      count <- count + 1
    }
  }
  
  return(count)
}
