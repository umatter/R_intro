########################################################################################
# Prettify the code in ioslides further
# - replace span tag classes 'lit' with 'bool' if span contains TRUE or FALSE
#    (ioslides does not distinct lit and bool)
# Notes: 'bool' added to ioslides.css prettify section by UM
# overall aim: get as close as possible to the RStudio merbivore theme in slides
#
# UM, Zurich, August 2018
########################################################################################

# PREAMBLE------------

# fix variables
PATH_SLIDES <- "materials/slides/html"
SPAN_TRUE <- "<pre class = 'prettyprint lang-r'>condition &lt;- TRUE"
SPAN_FALSE <- "<pre class = 'prettyprint lang-r'>condition &lt;- FALSE"
SPAN_TRUE_N <- "<pre class = 'bool'>condition &lt;- TRUE"
SPAN_FALSE_N <- "<pre class = 'bool'>condition &lt;- FALSE"
# DOES NOT WORK YET, IOSLIDES IS COMPILED DYNAMICALLY

# BODY ------------------

# read all html slides
all_paths <- list.files(PATH_SLIDES, full.names = TRUE)
all_docs <- lapply(all_paths, readLines)

# iterate through each slide set
# replace span classes
for (i in 1:length(all_docs)){
     
     doc_i <- all_docs[[i]]
     doc_i <- gsub(pattern = SPAN_TRUE, replacement = SPAN_TRUE_N, doc_i, fixed = TRUE)
     doc_i <- gsub(pattern = SPAN_FALSE, replacement = SPAN_FALSE_N, doc_i, fixed = TRUE)
     
     writeLines(doc_i, all_paths[i])
}