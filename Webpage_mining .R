
library(htm2txt)
library(readtext)
library(quanteda)
library(quanteda.textmodels)
library(quanteda.textstats)
library(quanteda.textplots)
library(tidyverse)
library("RCurl")
library("XML")
library("httr")
library("rvest")
library("stringr")

#Read in your urls


urls_to_mine<-"C:/Users/ccape/Downloads/URLS for mining"


urls <- list.files(urls_to_mine, pattern="*.html", full.names=TRUE)


text_collector<-function(urls){
texts<-list()

for (i in urls)
  {
  
text <- gettxt(i)
texts<-append(texts,text)
}
texts<-as.character(texts)
return(texts)
}
text_to_analyze<-text_collector(urls)
#******* TEXT MINING
#***********************************************************





corp<-corpus(text_to_analyze)








#Take a look at a few statistics

ndoc(corp) # document count
docnames(corp) # unique document identifiers
ntoken(corp) # tokens in each document
ntype(corp) # types (unique tokens) in each document
nsentence(corp) # sentences in each document
summary(corp)# to get types, tokens, sentences
summary(corp,5)




# 5. Tokenize your corpus

article_toks <-tokens(corp)# It removes separators (whitespaces)but we can remove numbers,punctuation, symbols
print(article_toks)
article_toks <- tokens(corp,  remove_punct = TRUE)
print(article_toks)



article_toks <- tokens_tolower(article_toks)

article_toks [[1]][1:20]# first 20 tokens of document 1

#####Keywords in Context: What words immediately precede and follow terms of interest
#output from each search  is to be saved as a CSV file

kw_estogen <- kwic(article_toks, pattern="tumor*", window = 10)

write.csv(kw_estogen, "path choosen by user")

 
kw_outcomes <- kwic(article_toks, pattern="ER*", window = 10)
write.csv(kw_outcomes,"path choosen by user")

kw_proliferation<- kwic(article_toks, pattern= "proliferation",window = 10)
write.csv(kw_proliferations,"path choosen by user")
