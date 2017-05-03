install.packages("XML")
install.packages("XML")
install.packages("plyr")
install.packages("ggplot2")
install.packages("gridExtra")
install.packages("xlsReadWrite")
require("XML")
require("plyr")
require("ggplot2")
require("gridExtra")
library(XML)

x  <- "/Volumes/SD Card/2554/2554/download/Texts/A/A0/A00.xml"

doc <- xmlParse(x)



xmlSApply(xmltop[[2]], xmlAttrs)
xmlToDataFrame(nodes=getNodeSet(doc,"//wtext"))[[4]][c("div")]


require("corpora")
data(BNCmeta)
colnames(BNCmeta)

BNCmeta["id"]

BNCmeta["domain"]
#https://rdrr.io/cran/corpora/man/BNCmeta.html 