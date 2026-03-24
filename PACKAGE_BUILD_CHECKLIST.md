# Package Build Verification Checklist

Use this checklist after running `build_package.R` to verify the package build is correct.

## Pre-Build Steps
- [ ] Verify source files are up-to-date
  - [ ] Check `/Planner/app.R` has latest code
  - [ ] Check `/Planner/appData.RData` is recent
  - [ ] Check `/stable functions/` directory is complete
  - [ ] Check `/auto functions/` directory is complete

## Build Execution
- [ ] Run `Rscript build_package.R` successfully
  - [ ] Check for error messages in output
  - [ ] Verify all sections completed (8 sections total):
    - [ ] Package directories created
    - [ ] Stable functions copied
    - [ ] Auto functions copied
    - [ ] startPlanner.R created/updated
    - [ ] App files and data copied
    - [ ] DESCRIPTION file created/updated
    - [ ] NAMESPACE file created/updated
    - [ ] README.md created/updated

## Post-Build Verification

### 1. App Data File Copying
- [ ] File exists: `plannerPackage/inst/app/appData.RData`
  - Size should be ~2.0M
  - Timestamp: should be current build date
- [ ] File exists: `plannerPackage/data/appData.RData`
  - Size should be ~2.0M
  - Timestamp: should match inst/app version
- [ ] Verify with: `ls -lh plannerPackage/inst/app/appData.RData plannerPackage/data/appData.RData`

### 2. Path Updates in app.R
- [ ] Check `plannerPackage/inst/app/app.R` contains correct data loading:
  ```r
  appDataPath <- system.file("app", "appData.RData", package = "plannerPackage")
  load(appDataPath)
  ```
  - NOT: `load("appData.RData")` (relative path - breaks in package)
  - NOT: hardcoded absolute paths
- [ ] Verify with: `grep -n "appDataPath" plannerPackage/inst/app/app.R`

### 3. Package Structure
- [ ] Directory exists: `plannerPackage/R/`
  - [ ] Contains stable function files (8 files)
  - [ ] Contains auto function files (33 files)
  - [ ] Contains `startPlanner.R`
- [ ] Directory exists: `plannerPackage/inst/app/`
  - [ ] Contains `app.R`
  - [ ] Contains `appData.RData`
- [ ] Directory exists: `plannerPackage/data/`
  - [ ] Contains `appData.RData`
- [ ] Files exist: `plannerPackage/DESCRIPTION`, `NAMESPACE`, `README.md`

### 4. Function Files
- [ ] Verify stable functions count: `ls -1 plannerPackage/R/ | grep -E "^(compute|make|plot|exact)" | wc -l` (should be 8)
- [ ] Verify auto functions count: `ls -1 plannerPackage/R/ | grep -v "^(compute|make|plot|exact|startPlanner)" | wc -l` (should be 33+1)

### 5. DESCRIPTION File
- [ ] Check `plannerPackage/DESCRIPTION` contains:
  - [ ] Package name: `plannerPackage`
  - [ ] Proper version number
  - [ ] All required dependencies listed under `Imports:`
  - [ ] License information

### 6. NAMESPACE File
- [ ] Check `plannerPackage/NAMESPACE` contains:
  - [ ] `export(startPlanner)`
  - [ ] `import(shiny)`
  - [ ] All necessary imports from dependencies

## Package Installation Test
- [ ] Run `devtools::load_all()` from `plannerPackage/` directory
  - [ ] No errors or warnings
  - [ ] startPlanner function is available
- [ ] Run `devtools::check()` from `plannerPackage/` directory
  - [ ] No critical errors
  - [ ] Review any warnings/notes
- [ ] Test launching app: `startPlanner()` in R console
  - [ ] Shiny app launches successfully
  - [ ] App loads data correctly (menus populate)
  - [ ] No errors in console

## Cleanup & Commit
- [ ] Review changed files: `git status` from root directory
- [ ] Stage appropriate files: `git add plannerPackage/`
- [ ] Commit with message: `git commit -m "Update plannerPackage: rebuild with latest app and data"`
- [ ] Push to remote if applicable: `git push`

## Quick Verification Commands

```bash
# Run full build
Rscript build_package.R

# Verify data files
ls -lh plannerPackage/inst/app/appData.RData plannerPackage/data/appData.RData

# Check app.R data path
grep -n "appDataPath\|system.file" plannerPackage/inst/app/app.R | head -3

# Count functions
echo "Stable functions:"; ls -1 plannerPackage/R/ | grep -E "^(compute|make|plot|exact)" | wc -l
echo "Auto functions:"; ls -1 plannerPackage/R/ | grep -Ev "^(compute|make|plot|exact|startPlanner)" | wc -l

# Check package structure
find plannerPackage -type f -name "*.R" -o -name "*.RData" -o -name "DESCRIPTION" -o -name "NAMESPACE" | sort
```

## Notes
- Always run this checklist after ANY changes to source files or app.R
- The build script uses `system.file()` to make paths portable across installations
- appData.RData must be in both `inst/app/` (for package running) and `data/` (for package data distribution)
