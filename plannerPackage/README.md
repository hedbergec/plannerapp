# plannerPackage

Interactive power analysis and study design planner built with Shiny.

## Installation

### Prerequisites: Install devtools

First, you need to install the `devtools` package:

```r
install.packages("devtools")
```

#### Platform-specific requirements

**Windows:**
- No additional setup needed beyond R and RTools (typically included with R installation)

**macOS:**
```r
# Install Xcode Command Line Tools (required once)
# Run in Terminal:
xcode-select --install
```

**Linux (Ubuntu/Debian):**
```bash
# Run in Terminal:
sudo apt-get install build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev
```

**Linux (Fedora/RHEL):**
```bash
# Run in Terminal:
sudo yum install gcc gcc-c++ make libcurl-devel libxml2-devel openssl-devel
```

### Install plannerPackage

```r
# Install from GitHub
devtools::install_github("hedbergec/plannerApp", subdir = "plannerPackage")

# Or from local directory
devtools::install_local("path/to/plannerApp/plannerPackage")
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
- data.table
- ggpubr

## License

MIT

## Building the Package

This package is automatically built from the plannerApp Shiny application.
To rebuild after making changes to plannerApp, run the build_package.R script.

