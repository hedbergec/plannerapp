# plannerapp
This is for an R-Shiny app to be used for teaching experimental designs. 

## Installation

Users need to install `devtools` before running the app:
```r
install.packages("devtools")
```

## Contents

`Data` is a directory with simulated data that is used in the QED game in the app. These files are created by `support materials/makeQEDData.R` based on statistics in `support materials/school_list.xlsx`. In `support materials/setUp.R` there is a command to source `makeQEDData.R` that is commented-out. This is to ensure the data do not change unless we really want to run again.  

The shiny code and data for posting the app is in `Planner`

All functions in `auto functions` are destroyed and regenerated each time `setUp.R` is run.  

Functions in `stable functions` are to be written and edited as typical code and will not change unless _explicitly_ edited.  

## Primary artifact 

Many of the functions, options, and titles are governed by the `support materials/menuManager.xlsx` Excel file. 

## Organization of operations

The general approach for all `power` and `mdes` computations is that the expected test statistic can be organized into the form of 

$$ \lambda = \delta \times \sqrt{V} $$

where $\delta$ is the effect size relative to the population variance and $V$ is a function of the design matrix and other corrections necessary to express $\delta$ as a population effect size. 

Thus, choices in the app determine which functions for `V` and `df` are used, and the results are passed to a general `ncp` function for computing `MDES` or power. 

The `compute_mdes_function` starts with Bloom's approximation and then iterates a bit to refine the MDES. This is to make better predictions for small `df`. 


