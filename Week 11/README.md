
# R Shiny
R Shiny is a package to create interactive dashboards and data exploration tools. Every Shiny application requires two parts a **user interface** (ui) and a **server** (server). The User interface outlines what the application should look like, what types of widgets should be used for inputs and outputs. The server outlines exactly how the input gets transformed into an output.

Once you install shiny, a great way to learn about how it works is to look at the built-in examples

```{r}
install.packages("shiny")
library(shiny)

runExample("01_hello")      # a histogram
runExample("02_text")       # tables and data frames
runExample("03_reactivity") # a reactive expression
runExample("04_mpg")        # global variables
runExample("05_sliders")    # slider bars
runExample("06_tabsets")    # tabbed panels
runExample("07_widgets")    # help text and submit buttons
runExample("08_html")       # Shiny app built from HTML
runExample("09_upload")     # file upload wizard
runExample("10_download")   # file download wizard
runExample("11_timer")      # an automated timer
```

You can create your own Shiny app easily from within RStudio by selecting "Shiny Web Application" from the "New File" option in the "File" menu of RStudio.

## Publishing your App
When you launch your shiny app within RStudio there is a "publish" button that will allow you to publish to https://www.shinyapps.io/ . In order to do this, you need to create an account, which is free. It is also possible to publish to your own site, but takes a bit more doing and is beyond the scope of this course (and me).

## Resources
- [Shiny Tutorial](https://shiny.rstudio.com/tutorial/)
- [Book Reference](https://mastering-shiny.org/)
- [Video Series](https://www.youtube.com/playlist?list=PL9HYL-VRX0oRbLoj3FyL5zeASU5FMDgVe)

# HW Assignment
Make literally any graph interactive. Feel free to adjust one of the built-in examples (in fact, that is probably preferable) and a data-set loaded from base R such as "iris" or "mtcars". Submit a .R file that I can open in R studio, or publish to shinyapps.io and send me the link.

# R Shiny Project ( Final Group Project )

## What to turn in
Your final project will be an R Shiny application, you will hand in
- An .r file of your groups code
- A powerpoint discussing your thought processes and results.
- A short writeup that documents worked on what sections of your project
- A link to the actual application (likely hosted on [shinyapps.io](shinyapps.io))

## Demo and Presentation
 As a part of this project your group will give a demo and discussion of your application
 During this presentation please go over 
	- The dataset
	- Thought processes
	- Findings and models
	- Any issues you had along the way. 
You may also want to include what else can be done. Or how you might change or improve your application. 

## Requirements
Your shiny app should allow a user to interact with data in some way, the type of data is up to you. Keep in mind that you can simplify the data set in some way if you do not want to create 12 input sliders to control every aspect of the data. I want to give you enough flexibility to allow for creativity, but I also want you to demonstrate that you can design a variety of apps. Almost every app will require at least one or two of four things, so for a complete project, your app should allow the user to:
- Visualize data
  - There should be inputs that allow the user to change a visualization of the data
  - This could be a filter to control how much data is displayed
  - This could be a way to control some aestheic aspect (color palette, graph type)
  - This could be a selection of variables
  - Other ideas welcome!
- Transform data
  - The data must have some operation performed on it
  - This could be a logarithmic transformation
  - This could be a reordering of factor variables
  - This could be a linear model fit to the data
  - Anything else you can think of
- Input data
  - Provide some way for the user to input data or other free-form input
  - Upload a .csv file
  - Manually enter a dataframe
  - Enter the title or axis labels on a graph
  - Should have more flexibility than something like a slider or button
- Output data
  - Provide some way to get a read-out of your data visualization/transormation
  - Download a .pdf or other file of the graph
  - Download a .csv of the transformed data
  - Some other useful output that can be downloaded.
- Coding practices
  - Comment your code, this means a comment for each function you write, and a short description of variables.
  - Make your code modular, use variables that you can change once and write functions for actions you do over and over again.
  - Use require(package) to make sure all packages are loaded when someone tries to run your app
  
## Due Date
- 4/25, 5/2 Each Thursday, please provide a link to demonstrate your progress.
- 5/9 Will be your group presentation, students must submit their final project by midnight on 5/9 

