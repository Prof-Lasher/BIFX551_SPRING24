
# R Shiny Project

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

