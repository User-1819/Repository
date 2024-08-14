# Import required libraries
library(stringr)

# Define global variables
Number <- 0
Number2 <- 0
Number3 <- .Machine$integer.max  # R doesn't have UInt64, using max integer

# Main function
main <- function() {
  file <- "File.txt"
  if (!file.exists(file)) {
    writeLines("Goodbye Cruel World!", file)
  }
  
  cat("WARNING! THIS A FILE CLONER! EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!\n")
  readline(prompt = "Press Enter to continue...")
  
  end()
}

# End function
end <- function() {
  system("cls")  # Clear console (Windows-specific, use 'clear' for Unix-like systems)
  
  File <- "File.txt"
  contents <- readLines(File)
  
  for (Number in 0:(Number3 - 1)) {
    Number2 <- Number2 + 1
    
    write(contents, File, append = TRUE)
    cat("\r", Number2)
    
    # Set console title (not directly possible in R, skipping this part)
    
    flush.console()
    
    File2 <- paste0("File (", Number2, ").txt")
    file.copy(File, File2)
    File <- File2
  }
  
  cat("\n")
}

# Run the main function
main()


