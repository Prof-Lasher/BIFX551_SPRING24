#' A sqlprep Function
#' 
#' Convert "." to "_" in the first line of a data file
#' @param file_path Path to the data file
#' @return A character vector with the converted first line
#' @export
dotsfirst <- function(file_path) {
  content <- readLines(file_path)
  content[1] <- gsub("\\.","_", content[1])
  file_conn <- file(file_path,"w")
  writeLines(content,file_conn)
  close(file_conn)
  cat("Replacement completed. Check the file:", file_path, "\n")
}

