# plannerPackage

Interactive power analysis and study design planner built with Shiny.

## Installation

```r
# Install from GitHub
devtools::install_github("hedbergec/plannerPackage")

# Or from local directory
devtools::install_local("path/to/plannerPackage")
```

## Usage

Simply call:

```r
library(plannerPackage)
startPlanner()
```

The Shiny app will launch in your default web browser. Use it to:

- Calculate power and minimum detectable effect size (MDES) for various study designs
- Perform randomization of units to treatment and control groups
- Explore different design parameters interactively

## Features

- **Power Analysis**: Calculate power for specified effect sizes and sample sizes
- **MDES Calculation**: Determine the minimum detectable effect size given desired power
- **Randomization Tool**: Perform stratified or simple randomization with reproducible seeds
- **Interactive Design**: Built with Shiny for real-time calculations and visualizations
- **Multiple Designs**: Support for RCTs, quasi-experimental designs, and more

## Requirements

- R >= 4.0
- Shiny
- Plotly
- ggplot2
- tidyverse
- shinythemes

## License

MIT

## Building the Package

This package is automatically built from the plannerApp Shiny application.
To rebuild after making changes to plannerApp, run the build_package.R script.

