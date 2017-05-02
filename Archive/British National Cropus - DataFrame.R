library(plyr)
library(ggplot2)
library(gridExtra)
library(XML)
library(readtext)


setwd("/Volumes/SD Card/2554/2554/download/")

for (i in list.files(path = "Texts/")){
  for (j in list.files(path = paste("Texts",i,sep="/"))){
    for (k in list.files(path = paste("Texts",i,j,sep = "/"))) {
      doc <- try(xmlParse(paste("Texts,i,j,k,sep="/"")))
      if (class(doc)=="try-error") {
        next
      }
      else {
        for (h in 1:ncol(xmlSApply(xmlRoot(doc)[[2]], xmlAttrs))){
          sss <- xmlToDataFrame(nodes=getNodeSet(doc,"//wtext"))[[i]][c("div")]
        
        }
      }
      
    }
  }
}


treaties <- xmlParse("Texts/*/*/*.xml", docvarsfrom=c("filenames"))




treaties_corpus <- corpus(treaties)

cases <- read.csv("Native American Treaties/universecases.csv")
date <- as.Date(as.character(cases$Date[1:365]), "%m-%d-%Y")

docvars(treaties_corpus)$Date <- date

/A/A0/A00.xml