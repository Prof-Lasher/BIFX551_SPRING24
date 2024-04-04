#' A Dungeons and Dragons Weapon/Spell Information
#'
#' This function allows you to look up the stat blocks for selected weapons and spells in Dungeons and Dragons 5th Edition
#' This returns the webpage from DnDBeyond for the chosen weapon or spell
#' @param name, The name of the weapon or spell 
#' @param type, Either weapon or spell
#' @keywords DnD_info
#' @export
#' @examples
#' DnD_info(longsword)
#' 

# Function to fetch DnD weapon or spell information from D&D Beyond
DnD_info <- function(name, type) {
  # Converts name to lowercase and replaces spaces with dashes
  formatted_name <- tolower(gsub(" ", "-", name))
  
  # Checks type and pastes name into URL 
  if (type == "weapon") {
    url <- paste0("https://www.dndbeyond.com/equipment/", formatted_name)
  } else if (type == "spell") {
    url <- paste0("https://www.dndbeyond.com/spells/", formatted_name)
  } else {
    stop("Invalid type. Please specify 'weapon' or 'spell'.")
  }
  # Opens the webpage for the weapon or spell of interest
  browseURL(url = url)
}
