# BNC
setwd("/Volumes/SD Card")

library(knitr)
library(readtext)
library(corpora)
library(quanteda)
library(dplyr)

#loading file 

BNC <- readtext("BNC/*.txt", docvarsfrom=c("filenames"), docvarnames = "id")

BNC_corpus <- corpus(BNC)

bnc_docvars <- data.frame(id = docvars(BNC_corpus)$id,stringsAsFactors = F)


# left join to find meta info from BNCmeta 
data(BNCmeta)
df_bnc_docvars <- data.frame(
  id = BNCmeta["id"],
  mode = BNCmeta["mode"],
  domain = BNCmeta["domain"],
  stringAsFactors = F) 

docvar_info <- left_join(bnc_docvars,df_bnc_docvars,by = c("id" = "id"))

# add docvars
docvars(BNC_corpus)$mode <- df_bnc_docvars$mode
docvars(BNC_corpus)$domain <- df_bnc_docvars$domain

#unique(df_bnc_docvars$domain)


BNC_sub_corpus <- corpus_subset(BNC_corpus,mode == "written")

BNC_select_domain <- c("social_science","world_affairs","arts","leisure","commerce_finance")

BNC_sub_corpus <- corpus_subset(BNC_sub_corpus,domain %in% BNC_select_domain)

#smalllist<-docvars(BNC_sub_corpus)$id[1:1000]

#BNC_try <- corpus_subset(BNC_sub_corpus,id %in% smalllist)

BNC_dfm <- dfm(BNC_sub_corpus)

# OANC


#loading file 

OANC <- readtext("OANC/*.txt", docvarsfrom=c("filenames"))

OANC_corpus <- corpus(OANC)

OANC_dfm <- dfm(OANC_corpus)



## 3. First Try: FRE (No Pre-process)


OANC_FRE <- textstat_readability(texts(OANC_corpus, groups = "docvar2"), "Flesch")

hist(OANC_FRE, breaks=1000, col="red")


BNC_FRE <- textstat_readability(texts(BNC_sub_corpus, groups = "id"), "Flesch")

hist(BNC_FRE, breaks=400)


