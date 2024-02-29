# T Tests

A t-test is used to decide if the means of two groups are the same or different. The farther the t-value is from 0, the more likely it is that the difference in the means is not due to chance.
R allows for several modesl of t-tests.
```{r}
data(mtcars)
t.test(mtcars$mpg~mtcars$am) #test the mean of numeric variables grouped into two subgroups
t.test(mtcars[mtcars$am==0,mpg], mtcars[mtcars$am==1,$mpg]) #test mean of two sets of numeric variables
t.test(mtcars$mpg,mu=20) #single sample test if mean is the same as given
```
The t.test function in R outputs a list, from which you can gain the t-value, p-value, and the 95% confidence interval.

# Datetimes

Datetimes are more difficult to work with than you may think. A useful library is lubridate.

```{r}
library(lubridate)
dt_str = '02/25/2020 21:56:17'
dt <- parse_date_time(dt_str,"mdy HMS",tz = 'EST')
month <- month(dt) #gets month from date-time
date <- date(dt) #gets just date from date-time
round_date(dt, unit = "minute") #rounds date-time to nearest minute
ds(dt) #Returns TRUE if it is daylight savings time
```

Plotting with date-times isn't always straightforward, sometimes the best thing to do is to convert the date-time into days or seconds from a starting point.

# Saving plots
It's important sometimes to save your plots as files, especially when making slides. Here's how you do it.

```{r}
ggplot(iris,aes(x=Species,y=Sepal.Length))+geom_violin()
ggsave('my_plot.png', plot = last_plot(), device = 'png')
```


#Check Blackboard for Project 1 Assignment
*IMPORTANT!!! - This will be turned in via blackboard*