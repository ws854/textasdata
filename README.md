# textasdata final project 
## Author: 
Xinyan Yang (xy975)  
Wenjie Sun (ws854)   

## Pre-processing Data
### Pre-process.ipynb
This python code provides:   
1) A code to extract information from the British National Corpus (BNC) 
2) A code to translate the .xml file to .txt for the BNC   
3) A code to move all the .txt file into one single folder for the BNC    
4) A code to move all the .txt file into one single folder for the Open American National Corpus (OANC)

### Analysis 1.Rmd
This R code provides:    
1) A code to intergrate the BNCmeta data with the BNC
2) A code to filter desired the corpus for BNC
3) A code to import the corpus for OANC 
4) A code to covert both corpus into dfm 
5) A code to calculate the FRE score and plot it
6) A code to use bag-of-words frame work to compute the weights of each features in both corpus 
7) A code to analyze the tokens that were not included in the Dale-Chall's Easy Word List

### Analysis 2.R  
This R code provides: 
1) A code to analyze the bi-grams features and its findings 
2) A code to generate the csv file of bigrams that has different frequency in both languages (full_df_bi.csv)
