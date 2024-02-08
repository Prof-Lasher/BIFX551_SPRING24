# File importing with .csv and .txt

download.file(url,destfile) can be used to download a file from the internet
```{r}
download.file(url,"my_file.csv")
df <- read.csv('my_file.csv',sep = ",", header=TRUE)
#Beware stringsAsFactors = True
```

You can read text files two ways
```{r}
download.file(url,"my_file.txt")
df <- read.delim('my_file.txt',sep="",header=TRUE)

#OR if you want a few lines at a time
f <- file('my_file.txt')
open(f)
readLines(f,n=1)
close(f)
```

# Basic Plotting

```{r}
# Scatter plot
plot(mtcars$mpg,
      mtcars$hp,
      xlab="Miles per Gallon",
      ylab = "Horse Power",
      main="HP as a function of MPG")

# Bar plot
mean_df = aggregate(Sepal.Length ~ Species, data=iris, mean);
barplot(Sepal.Length ~ Species,
        data=mean_df,
        col=c("red","orange","purple"),
        xlab="Species",
        ylab="Sepal Length",
        main="Mean Spepal Length by Species")

# Histogram
hist(mtcars$mpg,
      main='mtcars MPG histogram',
      xlab = 'MPG',
      ylab = 'Frequency',
      breaks=5,
      col="lightgreen",
      border="darkgreen")

#Boxplot
boxplot(iris$Sepal.Length ~ iris$Species, 
         xlab="Species",
         ylab="Sepal Length",
         main="Iris Sepal Length by Species", 
         col=c("bisque1","bisque3","bisque4"))
```
# Assignment
- Go through the vignette for readr.
- Find a csv or txt file, download it, read it into a dataframe, use summary() to describe it, and create a labeled graph. Submit as an .R file. It should run and produce your graph.
- Reading 
	- [R Markdown - Chapter 2](https://bookdown.org/yihui/rmarkdown/basics.html)
		- Please watch the videos too
	- [R For Data Science - Chapter 9](https://r4ds.hadley.nz/layers)
		- This will introduce ggplot2

# Submission
Please submit in the same format as previous weeks (however in the week 3 folder)  <br>
\<INTIALS\>_week3.R <br>


# Helpful References 
## Readr
* [https://readr.tidyverse.org/index.html](https://readr.tidyverse.org/index.html)
## Plotting
* [https://intro2r.com/simple-base-r-plots.html](https://intro2r.com/simple-base-r-plots.html)
## Review for Basic R
* [https://r4ds.hadley.nz/base-r](https://r4ds.hadley.nz/base-r)
