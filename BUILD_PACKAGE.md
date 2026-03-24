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
2. Change to the plannerPackage directory
3. Run package checks:
   ```r
   devtools::load_all("../plannerPackage")
   devtools::check("../plannerPackage")
   ```
4. Commit and push to GitHub:
   ```bash
   cd ../plannerPackage
   git add .
   git commit -m "Update from plannerApp"
   git push
   ```

## The plannerPackage Repository

The built package lives in: `../plannerPackage/`

It has its own git repository at: https://github.com/hedbergec/plannerPackage

## Workflow

```
plannerApp/
├── stable functions/    → Updated here
├── auto functions/      → Updated here
├── Planner/
│   └── app.R           → Updated here
└── build_package.R     ← Run this

        ↓ (build_package.R copies and transforms)
        
../plannerPackage/
├── R/                  → Contains all functions
├── inst/app/           → Contains Shiny app
└── .git/               → Git repo for distribution
```
