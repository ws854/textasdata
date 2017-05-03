setwd("/Volumes/SD Card/OANC/")

library(knitr)
library(readtext)
library(corpora)
library(quanteda)
library(dplyr)

list.files()

#loading file 

OANC <- readtext("*.txt", docvarsfrom=c("filenames"))

OANC_corpus <- corpus(OANC)

OANC_dfm <- dfm(OANC_corpus)

