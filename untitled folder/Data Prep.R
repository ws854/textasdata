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


xmlToDataFrame(nodes=getNodeSet(doc,"//wtext"))[[3]][c("head")]

xmlToDataFrame(nodes=getNodeSet(doc,"//wtext"))[[1]]


try <- c(try,xmlToDataFrame(nodes=getNodeSet(doc,"//wtext/div"))[[4]][c("div")])

#write.table(hhh, "/Users/sunevan/Dropbox/Spring 2017/Text As Data/mydata.txt", sep="\t")


#xmlToDataFrame(nodes=getNodeSet(doc,"//wtext/div"))

library(xlsReadWrite)
write.xls()

#install.packages("corpora")
#library(corpora)
#data(BNCmeta)
#head(BNCmeta)


xmlfile=xmlParse(x)
class(xmlfile) #"XMLInternalDocument" "XMLAbstractDocument"
xmltop = xmlRoot(doc) #gives content of root
class(xmltop)#"XMLInternalElementNode" "XMLInternalNode" "XMLAbstractNode"
xmlName(xmltop) #give name of node, PubmedArticleSet
xmlSize(xmltop) #how many children in node, 19
xmlName(xmltop[[1]]) #name of root's children

# this is useful  # xml how many articles 
ncol(xmlSApply(xmlRoot(doc)[[2]], xmlAttrs))

### 
a<-xmltop[[2]][[5]][[1]][[1]]

ww <- xml_find_all(a,".//w")
xml_attr(w,"hw")


xmlToDataFrame(xmltop[[2]][[1]][[1]][[1]])
xmlToDataFrame(xmltop[[2]][[1]][[2]][[2]])

Madhu2012 <- ldply(xmlToList(x), data.frame)
View(Madhu2012)


install.packages("xml2")
library(xml2)

read_xml(x)



xmltop <- xmlRoot(xmlParse(x))
xmlSApply(xmltop[["wtext"]][["div"]][["head"]],xmlAttrs)
