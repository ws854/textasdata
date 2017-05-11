library(knitr)
library(readtext)
library(corpora)
library(quanteda)
library(dplyr)
library(tm)

#loading file 

BNC <- readtext("/Users/xinyan/Downloads/BNC/*.txt", docvarsfrom=c("filenames"), docvarnames = "id")

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

BNC_dfm <- dfm(BNC_sub_corpus,stem = F,remove_punct = TRUE , tolower = T)

BNC_dfm_bi <- dfm(BNC_sub_corpus,stem = F,ngrams = 2,remove_punct = TRUE, tolower = T)

BNC_top_5000 <- topfeatures(BNC_dfm_bi, n=5000)
write.csv(BNC_top_5000,"BNC_top_5000.csv")

sum <- sum(BNC_dfm_bi)
BNC_top_5000_frq <- BNC_top_5000/sum
write.csv(BNC_top_5000_frq,"BNC_top_5000_frq.csv")

rm(BNC_dfm_bi) # remove the dfm to save the space


OANC <- readtext("/Users/xinyan/Downloads/OANC/*.txt", docvarsfrom=c("filenames"))

OANC_corpus <- corpus(OANC)

OANC_dfm <- dfm(OANC_corpus,stem = F, remove_punct = TRUE , tolower = T)

OANC_dfm_bi <- dfm(OANC_corpus,stem = F,ngrams = 2,remove_punct = TRUE, tolower = T)

OANC_top_5000 <- topfeatures(OANC_dfm_bi, n=5000)
write.csv(OANC_top_5000,"OANC_top_5000.csv")

sum <- sum(OANC_dfm_bi)
OANC_top_5000_frq <- OANC_top_5000/sum



BNC_bi_feature <- names(BNC_top_5000_frq)
OANC_bi_feature <- names(OANC_top_5000_frq)
#words appear in both cropus 
joint_feature <- intersect(BNC_bi_feature,OANC_bi_feature)

#joint dfm 
BNC_joint_frq <- BNC_top_5000_frq[joint_feature]
OANC_joint_frq <- OANC_top_5000_frq[joint_feature]
diff_bi_frq <- BNC_joint_frq - OANC_joint_frq
diff_bi_frq <- sort(diff_bi_frq, decreasing = TRUE)
write.csv(diff_bi_frq,"diff bi frq.csv")



BNC_feature <- featnames(BNC_dfm)
OANC_feature <- featnames(OANC_dfm)

top_british_bi <- BNC_joint_frq
top_american_bi <- OANC_joint_frq
british_df_bi<- data.frame(features = names(top_british_bi),rank = seq(3149,1,-1))
american_df_bi<- data.frame(features = names(top_american_bi),rank = seq(3149,1,-1))
full_df_bi <- merge(x = american_df_bi,y = british_df_bi, by = "features", all = TRUE)
colnames(full_df_bi) = c("features","rank_in_american","rank_in_british")
full_df_bi["difference"] = abs(full_df_bi["rank_in_american"] - full_df_bi["rank_in_british"])
full_df_bi[with(full_df_bi, order(-difference)), ]
write.csv(full_df_bi, "full_df_bi.csv")
