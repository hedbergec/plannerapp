# plannerapp
This is for an R-Shiny app to be used for teaching experimental designs. 

Many of the functions, options, and titles are governed by the menu manager Excel file. 

All functions in `auto functions` are destroyed and regenerated each time `setUp.R` is run.  

Functions in `stable functions` are to be written and edited as typical code and will not change unless _explicitly_ edited.  

The general approach for all power and mdes computations is that the expected test statistic can be organized into the form for 

  E(t) = d * sqrt(V)

where d is the effect size relative to the population variance and V is a function of the design matrix and other corrections necessary to express d as a population effect size. 

The app has a tool for trying to match clusters by hand, and uses pre-made fake data in the `Data` folder. 

The shiny code and data for posting the app is in `Planner`.
