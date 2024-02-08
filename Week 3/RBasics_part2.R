#----------------------------- Review -------------------------------
#Assignments, vectors
a <- 5
b <- "This is a string"
c <- c(1,2,3)
d <- 1:26
e <- letters
f <- rainbow(26)

#look for help
?df 

#Create a dataframe
df = data.frame( "numbers"=d, "letters"=e, "colors"=f )

#Structure of a dataframe
str(df)

#Access an Element
df$letters

#
df$letters[ df$letters > "f" & df$letters <= "s" ]


#----------------------------- -------------------------------

#----------------------------- Packages -------------------------------

#Package installation using the Packages menu in RStudio:
#Packages --> Install packages --> enter package name

#Alternatively in the console
#install.packages("packagename")
#library(packagename) #quotation marks not needed
#instead of 'library', the 'require'-function may be used. Main difference: 'library' throws an error if the package is not installed, 'require' only a warning.
#This makes it possible to use require inside functions. Useful, e.g., to automatically install a package if it cannot be loaded:
#if (!require(packagename)) install.packages("packagename"); require(packagename) Note: ';' is used to execute two commands in one line sequentially 

.libPaths()  #Display where libraries are installed
library()   #Show what packages are already installed
search()    #Show what packages are currently loaded

install.packages("tidyr")   #install tidyr package from CRAN

#install.packages(file_name_with_path, repos = NULL, type = "source") #install custom packages

#----------------------------- end Packages -------------------------------


#-------------------------- import/export data ---------------------------------
# 
# download.file("http://statmath.wu.ac.at/~wurzer/ADAR/Data/dataceo.txt",
#               "dataceo.txt",
#               method = "libcurl")

p <- file.choose()                       # choose a file to import interactively
p                                        # path to chosen file
file.show(p)                             # check file structure (header, seperators, row numbers etc.)
dataceo <- read.table(p, header = TRUE)  # read txt-file

?read.table

dataceo <- read.table("http://statmath.wu.ac.at/~wurzer/ADAR/Data/dataceo.txt", header = TRUE) #use url to import a table

head(dataceo)                                  #list
head(dataceo, 10)                              #Column names and first 10 rows of the dataset
tail(dataceo)                                  #Column names and last 6 rows of the dataset

#excel files should be saved as .csv and read using read.csv(), correspondingly 
#(recommended because of figures, frames, formattings etc. in excel may cause troubles if the excel file is 
#read directly via functions provided by the packages xlsReadWrite, XLConnect, gdata and others)

#Using readr
if (!require(readr)) install.packages("readr"); require(readr);

library("readr");
(chickens <- read_csv(readr_example("chickens.csv")))
spec(chickens)

#set the data type information for each column
chickens <- read_csv(
  readr_example("chickens.csv"),
    col_types = cols(
    chicken   = col_character(),
    sex       = col_factor(levels = c("rooster", "hen")),
    eggs_laid = col_integer(),
    motto     = col_character()
  )
)


# See https://readr.tidyverse.org/articles/readr.html for more information
#----------------------------- end import/export -------------------------------

#--------------------------------- missing values ------------------------------
x <- 1:10
x[c(1, 7, 8)] <- NA                  #Insert missing values on positions 1, 3 and 8
x                                    #x with NAs
na.omit(x)                           #x is returned without NAs; additionally: Position of the missings
na.pass(x)                           #x is returned without changes
na.fail(x)                           #error if x includes NAs (x is not returned)

sum(x)                               #Statistical functions in R require that all values are nonmissing!
mean(x)                           
sum(x, na.rm = TRUE)                 #Remove missing values before the computation

is.na(x)                             #logical condition for missing values in x
any(is.na(x) == TRUE)                #Any missing values in x?
which(is.na(x) == TRUE)              #Position of the missing values in x

#----------------------------end missing values ------------------------------

#-----------------------------loading CSV and cleaning---------------------------------
download.file("https://ndownloader.figshare.com/files/9282364",
              "boulder-precip-temp.csv",
              method = "libcurl")

boulder_precip <- read_csv(file = "boulder-precip-temp.csv")  #read in the file

str(boulder_precip)   #show structure of boulder_precip

boulder_precip$PRECIP   #entries for the PRECIP column
boulder_precip$TEMP     #entries for the TEMP column  ( notice the -999 or NA )

#lets fix the -999 as NA
boulder_precip <- read_csv(file = "boulder-precip-temp.csv", na=c("","NA",-999))  #read in the file
boulder_precip$TEMP    


boulder_precip[!complete.cases(boulder_precip),]  #look at the entries that are NA

boulder_precip[complete.cases(boulder_precip),]  #look at the entries with no NA

#------------------------ end loading CSV and cleaning---------------------------------

dev.off() # to reset plot settings

#------------------------ Scatter plots ---------------------------------
#plot a scatter of X^2
#
d<-0:10
plot(x =d, y = d^2,
     main="Exponents",
     sub="Subtitle",
     xlab="X",
     ylab="X^2", pch=19, col="blue")

points(x =d, y = d, pch=19, col="green")
points(x =d, y = d^3, pch=19, col="red")

legend( "topleft", lwd = 1, legend=c("x", "x^2","x^3"), col=c("blue","green", "red") )


#create a 2x2 graph grid
par(mfrow = c(2, 2))

plot(d, d^2, type = "l")
plot(d, d^2, type = "b")
plot(d, d^2, type = "s")
plot(d, d^2, type = "h")

#
#------------------------ Bar plots ---------------------------------
#
mean_df = aggregate(Sepal.Length ~ Species, data=iris, mean);

barplot(Sepal.Length ~ Species     ,
        data=mean_df,
        col=c("red","orange","purple"),
        xlab="categories", 
        ylab="values", 
        main="Mean Sepal Length", 
        ylim=c(0,10)
)


#------------------------ histogram ---------------------------------
# create dice roll
roll <- function( nDice=2, diceSides=6){
  dice <- sample( diceSides, size = nDice, replace=TRUE)
  return sum(dice)
}

nRolls <- replicate(100000, roll(nDice=2))

#Plot the output
hist(nRolls)

par(mfrow = c(2, 2))
hist(nRolls, breaks = 13 )
hist(nRolls, breaks = 7 )
hist(nRolls, breaks = 13, freq = FALSE )
hist(nRolls, breaks = seq(2,12, length.out=5 ) )

#------------------------ box plot ---------------------------------
#generate some random data
# rnorm(n, mean = 0, sd = 1)
d1 <- rnorm( 100, 50, 20 );
d2 <- rnorm( 100, 25, 5 );
d3 <- rnorm( 100, 75, 10 );

b <- boxplot( d1,d2,d3, horizontal = TRUE, col=c("cyan","violet", "limegreen") )

str(b)

b$stats #list box boundaries (upper/lower extremes of box / whiskers and the median )
b$out   #list outliners


#iris example
boxplot(iris$Sepal.Length ~ iris$Species, 
        xlab="Species",
        ylab="Sepal Length",
        main="Iris Sepal Length by Species", 
        col=c("bisque1","bisque3","bisque4"))


#------------------------ pie chart ---------------------------------
mytable <- table(iris$Species)
lbls <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels = lbls,col = rainbow(length(lbls)),
    main="Pie Chart of Species\n (with sample sizes)")



#------------------------ coplot ---------------------------------
coplot(long ~ lat | depth, data = quakes)
coplot(breaks ~ 1:54 | wool * tension, data = warpbreaks, col = 'red')


coplot(Life.Exp ~ Income | Illiteracy * state.region, number = 3,
       panel=function(x,y,...) panel.smooth(x,y, span= .8, ...))


#
#Class example
#
#boulder_precip$TEMP = na_if(boulder_precip$TEMP, -999 )
#boulder_precip2 <- boulder_precip[complete.cases(boulder_precip),]
3plot( boulder_precip2$TEMP ~ as.Date(boulder_precip2$DATE,  tryFormats = c("%m/%d/%y")), pch=19, type="b" )

      
