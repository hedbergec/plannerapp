# Rebuilding plannerPackage

The `plannerPackage` is automatically generated from the code in this `plannerApp` directory using the `build_package.R` script.

## When to rebuild

- When you update functions in `stable functions/` or `auto functions/`
- When you update the Shiny app code in `Planner/app.R`
- When you update `Planner/appData.RData`

## How to rebuild

From within R/RStudio in the plannerApp directory:

```r
# Make sure you have required packages
if (!require("fs")) install.packages("fs")

# Run the build script
source("build_package.R")
```

This will:
1. Copy all R functions from `stable functions/` and `auto functions/` to `plannerPackage/R/`
2. Update the Shiny app in `plannerPackage/inst/app/`
3. Copy the appData.RData file
4. Update package configuration files (DESCRIPTION, NAMESPACE, README.md)

## After rebuilding

The script will output next steps. Typically:

1. Check that everything looks good
2. Change to the plannerPackage directory:
   ```bash
   cd plannerPackage
   ```
3. Run package checks:
   ```r
   devtools::load_all()
   devtools::check()
   ```
4. If you have git set up for the package, commit and push changes:
   ```bash
   git add .
   git commit -m "Update from plannerApp"
   git push
   ```

## The plannerPackage Repository

The built package lives in: `./plannerPackage/` (subdirectory of plannerApp)

It has its own git repository at: `./plannerPackage/.git/`

## Workflow

```
plannerApp/
├── stable functions/    → Updated here
├── auto functions/      → Updated here
├── Planner/
│   └── app.R           → Updated here
├── build_package.R     ← Run this
│
└── plannerPackage/     ← Built here
    ├── R/              → Contains all functions
    ├── inst/app/       → Contains Shiny app
    └── .git/           → Git repo (optional, for distribution)
```
