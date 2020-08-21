##################################################
# Shell script to make/update all documents
# of the course:
# Introduction to Programming with R
# first version:
# U.Matter, August 2018
# Prerequisites:
# needs latexmk (is shipped with new latex distr)
# brew install bib-tool
# brew install latex2rtf
##################################################



# MATERIALS
# manual changes should only be made in materials
# this compiles all materials in the requested formats 

# render notes (pdf and html)
Rscript code/render_notes.R
Rscript code/render_slides.R


# clean intermediate results (from interactive session)
rm materials/slides/*.html
rm -r materials/slides/html/*files
rm -r materials/notes/*files
rm -r materials/notes/html/*files
rm materials/notes/*.html
rm materials/notes/*.pdf

