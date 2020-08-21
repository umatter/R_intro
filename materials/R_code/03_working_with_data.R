## ----eval=TRUE------------------------------------------------------------------------------------
data(swiss)


## ----eval=TRUE------------------------------------------------------------------------------------
# inspect the structure
str(swiss)

# look at the first few rows
head(swiss)






## ----eval=FALSE-----------------------------------------------------------------------------------
## # install the package
## install.packages("readxl")




## ----eval=FALSE-----------------------------------------------------------------------------------
## # load the package
## library(readxl)
## 
## # import data from a spreadsheet
## swiss_imported <- read_excel("data/swiss.xlsx")




## ----eval=FALSE-----------------------------------------------------------------------------------
## # install the package (if not yet installed):
## # install.packages("haven")
## 
## # load the package
## library(haven)
## 
## # read the data
## swiss_imported <- read_spss("data/swiss.sav")
## 




## ----echo=TRUE, warning=FALSE, message=FALSE------------------------------------------------------
# load the *R* package
library(ggplot2)
# load the data
data(swiss)
# get details about the data set
# ?swiss
# inspect the data
head(swiss)


## -------------------------------------------------------------------------------------------------
# code province as 'Catholic' if more than 50% are catholic
swiss$Religion <- 'Protestant'
swiss$Religion[50 < swiss$Catholic] <- 'Catholic'
swiss$Religion <- as.factor(swiss$Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination))



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point()



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point() +
     facet_wrap(~Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point() +
     geom_smooth(method = 'loess') +
     facet_wrap(~Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point() +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion)



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     coord_flip()



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     theme(legend.position = "bottom", axis.text=element_text(size=12) ) 



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     theme_minimal()



## ----echo=TRUE, out.width="85%", fig.width=6,fig.height=2.8---------------------------------------
ggplot(data = swiss, aes(x = Education, y = Examination)) + 
     geom_point(aes(color = Agriculture)) +
     geom_smooth(method = 'lm') +
     facet_wrap(~Religion) +
     theme_dark()



## -------------------------------------------------------------------------------------------------
# initiate sample
a <- c(10,22,33, 22, 40)
names(a) <- c("Andy", "Betty", "Claire", "Daniel", "Eva")

# compute the mean
mean(a)
# compute the median
median(a)



## ---- echo=TRUE-----------------------------------------------------------------------------------
range(a)
var(a)
sd(a)



## -------------------------------------------------------------------------------------------------
# define size of sample
n <- 100
# draw the random sample from a normal distribution with mean 10 and sd 2
sample <- rnorm(n, mean = 10, sd = 2)

# Test H0: mean of population = 10 
t.test(sample, mu = 10)



## -------------------------------------------------------------------------------------------------
model1 <- Examination~Education


## -------------------------------------------------------------------------------------------------
fit1 <- lm(formula = model1, data = swiss)


## -------------------------------------------------------------------------------------------------
summary(fit1)


## -------------------------------------------------------------------------------------------------
# load data
data(swiss)

# linear regression with one variable
# estimate coefficients
model_fit <- lm(Examination~Education, data = swiss)
# t-tests of coefficients (and additional statistics)
summary(model_fit)



## -------------------------------------------------------------------------------------------------
# multiple linear regression
# estimate coefficients
model_fit2 <- lm(Examination~Education + Catholic + Agriculture, data = swiss)
# t-tests of coefficients (and additional statistics)
summary(model_fit2)



## ----eval=FALSE-----------------------------------------------------------------------------------
## # load packages
## library(stargazer)




## ---- warning=FALSE-------------------------------------------------------------------------------

# print regression results as text
stargazer(model_fit, model_fit2, type = "text")


## ---- results='asis', warning=FALSE---------------------------------------------------------------
# conditional on the output format of the whole document,
# generate and render a HTML or a LaTeX table.
if (knitr::is_latex_output()) {
     stargazer(model_fit, model_fit2, type = "latex",
               header = FALSE, table.placement = "H")
} else {
     stargazer(model_fit, model_fit2, type = "html")
}

