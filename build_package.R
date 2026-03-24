#' Build script for plannerPackage
#' 
#' This script takes the Shiny app code from plannerApp and builds/updates
#' the plannerPackage R package. Run this whenever you update the code in
#' plannerApp to rebuild the package.
#'
#' Usage:
#'   source("build_package.R")

# Check if required packages are available
required_packages <- c("fs", "glue")
for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    install.packages(pkg)
    library(pkg, character.only = TRUE)
  }
}

# Define paths
# Try to get the directory from RStudio first, fall back to current working directory
app_dir <- NULL
tryCatch({
  app_dir <- dirname(rstudioapi::getSourceEditorContext()$path)
}, error = function(e) {
  # Will use getwd() below if this fails
})

if (is.null(app_dir)) {
  app_dir <- getwd()
}

source_dir <- app_dir
package_dir <- file.path(dirname(app_dir), "plannerPackage")

message("====================================")
message("Building plannerPackage")
message("====================================")
message(glue("Source directory: {source_dir}"))
message(glue("Package directory: {package_dir}"))

# Create package structure if it doesn't exist
package_dirs <- c(
  "R",
  "inst/app",
  "data",
  "man"
)

for (dir in package_dirs) {
  dir_path <- file.path(package_dir, dir)
  if (!dir_exists(dir_path)) {
    dir_create(dir_path, recurse = TRUE)
    message(glue("Created directory: {dir}"))
  }
}

# 1. Copy stable functions to R/
stable_src <- file.path(source_dir, "stable functions")
if (dir_exists(stable_src)) {
  stable_files <- list.files(stable_src, pattern = "\\.R$", full.names = TRUE)
  for (file in stable_files) {
    dest <- file.path(package_dir, "R", basename(file))
    file_copy(file, dest, overwrite = TRUE)
  }
  message(glue("Copied {length(stable_files)} stable functions"))
} else {
  warning(glue("Stable functions directory not found: {stable_src}"))
}

# 2. Copy auto functions to R/
auto_src <- file.path(source_dir, "auto functions")
if (dir_exists(auto_src)) {
  auto_files <- list.files(auto_src, pattern = "\\.R$", full.names = TRUE)
  for (file in auto_files) {
    dest <- file.path(package_dir, "R", basename(file))
    file_copy(file, dest, overwrite = TRUE)
  }
  message(glue("Copied {length(auto_files)} auto functions"))
} else {
  warning(glue("Auto functions directory not found: {auto_src}"))
}

# 3. Create startPlanner.R if it doesn't exist
start_planner_path <- file.path(package_dir, "R", "startPlanner.R")
if (!file_exists(start_planner_path)) {
  start_planner_content <- "#' Start the Planner Shiny Application
#'
#' Launches the interactive Planner Shiny app for power analysis and study design.
#' 
#' @param launch.browser Logical. If TRUE (default), the app will open in your default web browser.
#'
#' @return Invisible NULL. The Shiny app runs until you close it.
#'
#' @details
#' The Planner app provides an interactive interface for:
#' \\itemize{
#'   \\item Computing power and minimum detectable effect size (MDES)
#'   \\item Randomization of units to treatment and control
#'   \\item Exploring different study designs and sample sizes
#' }
#'
#' @seealso [shiny::shinyApp()]
#'
#' @export
#' @examples
#' \\dontrun{
#'   startPlanner()
#' }
startPlanner <- function(launch.browser = TRUE) {
  appDir <- system.file(\"app\", package = \"plannerPackage\")
  if (appDir == \"\") {
    stop(\"Could not find app directory. Try re-installing the package.\",
         call. = FALSE)
  }

  shiny::runApp(appDir, launch.browser = launch.browser)
}
"
  write(start_planner_content, start_planner_path)
  message("Created startPlanner.R")
}

# 4. Copy Shiny app
planner_app_src <- file.path(source_dir, "Planner", "app.R")
if (file_exists(planner_app_src)) {
  # Read the original app file
  app_content <- readLines(planner_app_src)
  
  # Update the data loading line to use system.file from package
  app_content <- gsub(
    'load\\("appData\\.RData"\\)',
    'load(system.file("app/appData.RData", package = "plannerPackage"))',
    app_content
  )
  
  # Write to package inst/app
  dest_app <- file.path(package_dir, "inst", "app", "app.R")
  writeLines(app_content, dest_app)
  message("Updated Shiny app: inst/app/app.R")
} else {
  warning(glue("Shiny app not found: {planner_app_src}"))
}

# 5. Copy appData.RData
data_src <- file.path(source_dir, "Planner", "appData.RData")
if (file_exists(data_src)) {
  file_copy(data_src, file.path(package_dir, "inst", "app", "appData.RData"), overwrite = TRUE)
  file_copy(data_src, file.path(package_dir, "data", "appData.RData"), overwrite = TRUE)
  message("Copied appData.RData")
} else {
  warning(glue("appData.RData not found: {data_src}"))
}

# 6. Create/update DESCRIPTION
description_path <- file.path(package_dir, "DESCRIPTION")
description_content <- "Package: plannerPackage
Title: Interactive Study Design and Power Analysis Planner
Version: 0.1.0
Authors@R: 
    person(given = \"First\",
           family = \"Last\",
           role = c(\"aut\", \"cre\"),
           email = \"first.last@example.com\")
Description: A Shiny application for interactive power analysis, minimum detectable effect size (MDES) calculation, and study design planning for RCTs and quasi-experimental designs.
License: MIT + file LICENSE
Encoding: UTF-8
Roxygen: list(markdown = TRUE)
RoxygenNote: 7.2.3
Depends: 
    R (>= 4.0)
Imports:
    shiny,
    plotly,
    tidyverse,
    data.table,
    shinythemes,
    ggplot2,
    ggpubr
Suggests:
    testthat (>= 3.0.0)
"
write(description_content, description_path)
message("Created/updated DESCRIPTION")

# 7. Create/update NAMESPACE
namespace_path <- file.path(package_dir, "NAMESPACE")
namespace_content <- "# Generated by build script
export(startPlanner)
import(ggplot2)
import(ggpubr)
import(shiny)
import(shinythemes)
import(plotly)
import(tidyverse)
import(data.table)
"
write(namespace_content, namespace_path)
message("Created/updated NAMESPACE")

# 8. Create/update README.md
readme_path <- file.path(package_dir, "README.md")
readme_content <- "# plannerPackage

Interactive power analysis and study design planner built with Shiny.

## Installation

```r
# Install from GitHub
devtools::install_github(\"hedbergec/plannerPackage\")

# Or from local directory
devtools::install_local(\"path/to/plannerPackage\")
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
"
write(readme_content, readme_path)
message("Created/updated README.md")

# 9. Create supporting files
gitignore_path <- file.path(package_dir, ".gitignore")
if (!file_exists(gitignore_path)) {
  gitignore_content <- ".Rhistory
.RData
.Rproj.user/
.DS_Store
*.Rproj
inst/doc
"
  write(gitignore_content, gitignore_path)
  message("Created .gitignore")
}

rbuildignore_path <- file.path(package_dir, ".Rbuildignore")
if (!file_exists(rbuildignore_path)) {
  rbuildignore_content <- "^\\.git$
^\\.gitignore$
^\\.DS_Store$
^.*\\.Rproj$
^\\.Rproj\\.user$
"
  write(rbuildignore_content, rbuildignore_path)
  message("Created .Rbuildignore")
}

message("")
message("====================================")
message("Build complete!")
message("====================================")
message("")
message("Next steps:")
message("1. Check the plannerPackage directory for any changes")
message("2. From plannerPackage directory, run:")
message("   devtools::load_all()")
message("   devtools::check()")
message("3. If everything looks good, push to GitHub:")
message("   git add .")
message("   git commit -m 'Update package from plannerApp'")
message("   git push")
message("")
