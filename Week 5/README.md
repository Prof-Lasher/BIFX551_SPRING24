# Parts of a Data Science Report
## Data Wrangling/Cleaning
Make it clear where the data comes from and how to read it in. This shouldn't be a huge part of the assignment, but it's important.

## Exploratory Analysis
Explore your data. It is useful to come up with several questions you would like to answer beforehand. Calculate statistics and create figures that answer your questions. If new questions occur to you later, decide on which questions gave you the most concise insights into your data.

## Model Building
This step becomes more sophisticated as your toolset grows. For this project, you will try to answer a central question using the data that requires more than simple manipulation to answer.

## Communication
Make sure the audience understands your questions and your answers, and that the road between the two is as short as possible. This step may also include creating a slide deck, for those who don't want to see code, to further summarize your key findings.

# ggplot2
The 'gg' in ggplot refers to a 'grammar of graphics,' and much like real grammar there are really more exceptions than rules. The basic structure of a ggplot plot is:
- Specify data and aesthetic elements
- Specify a geom_
- Specify axes and annotations
All of these are added to the graph as different 'layers' each layer is added through addition so most plot will look like
```{r}
g <- ggplot(data,aes(x,y)) + geom_something() #and maybe 
      + scale_something() + coord_something()
```
# Assignment
Perform a fuller exploratory analysis on your dataset for your project. You should aggregate the data in some way with dplyr (if your dataset doesn't have any categorical variables, then make some) and make **four distinct figures** using ggplot2. Make sure you include:
- A plot with continuous variables
- A plot with discrete variables
- A plot where you use color or size to represent a quantity
- A faceted plot

Include text between your plots to tell a story about the data. What insights do these plots give us into your data?

Because you always need to rotate your text labels, and they don't make it easy: [Stack Overflow](https://stackoverflow.com/questions/1330989/rotating-and-spacing-axis-labels-in-ggplot2)