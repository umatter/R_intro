---
title: "README.md"
author: Ulrich Matter
---

# About

Lecture Materials for an intensive introduction to programming with R (one-day block-course).

# Prerequisites

Compilation depends on `bookdown` and `knitr`
```{r}
install.packages("bookdown")
install.packages("knitr")
```

In order to get the intended RStudio/Merbivore-style syntax highlighting in the ioslides output, copy `style/prettify.js` and `style/r-lang.j` to the respective ioslides folder in the `rmarkdown` library of your R installation, overwriting the default files with the same names (in OSX with R 3.4, this is: /Library/Frameworks/R.framework/Versions/3.4/Resources/library/rmarkdown/rmd/ioslides/ioslides-13.5.1/js/prettify/). 

Install the packages used in the code examples:

```{r}
install.packages("qdapRegex")
install.packages("pacman")
# get a list of all rmd files (slides and notes)
notes_files <- list.files("materials/notes", pattern = "\\.Rmd", full.names =TRUE)
slides_files <- list.files("materials/slides", pattern = "\\.Rmd", full.names = TRUE)
all_files <- c(notes_files, slides_files)

# parse the rmds, extract a list of package dependencies
rmds <- lapply(all_files, readLines)
to_install <- lapply(rmds, qdapRegex::rm_between, 
                     left = c("library(", "require("),
                     right = c(")", ")"),
                     extract = TRUE)
to_install <-  unique(na.omit(unlist(to_install)))
to_install <- to_install[! to_install %in% c("PACKAGE-NAME",  "<PACKAGE NAME>")]

# install all missing packages
pacman::p_load(char = to_install)
```


# Compile all material
Run the this in the terminal to compile all materials (also tests all the R code in the examples):
```{bash}
sh makeall_rintro.sh
```

# Content and Course Structure
The course is designed for first year graduate students in economics (MEcon Program at SEPS-HSG). No former knowledge of R or programming is expected. However, the exercises presuppose basic knowledge of statistics and econometrics. The course is structured in three parts. For each part there are lecture notes (in `materials/notes`; rmd-files and compiled versions in html and pdf), lecture slides (in `materials/slides`; rmd-files and compiled version in html), and the source code of all R-examples (in `materials/notes`). 

## Part I: Background/Tools

 - Why R? Why programming?
 - The tools: R, RStudio.

## Part II: First steps in R, core concepts.

 - First steps in R: R as a calculator, variables.
 - Basic programming concepts in R.
 - R objects and data structures.
 - R functions for basic statistics.

### Part III: Working with Data in R.

 - Loading/importing data.
 - Visualizing data with R/ggplot.
 - Basic data analysis with R.


# Contribute
Report issues, suggest enhancements, add exercises.

# Considerations for future lectures
- spend more time with data types/structures (less function exercises, but more with data type and structures).
- Add visualization and analysis exercise: import data, visualize, run a regression. (take home exercise)
