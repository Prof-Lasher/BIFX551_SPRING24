library(devtools)
library(roxygen2)

wd <- getwd()
wd

create("DnD")
document("DnD")

longsword <- DnD(1, 10)
longsword

fireball <- DnD(8, 6)
fireball

usethis::use_data(longsword, overwrite = TRUE)
usethis::use_data(fireball, overwrite = TRUE)

usethis::use_test(3)