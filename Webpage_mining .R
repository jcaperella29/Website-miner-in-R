
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

url <- "https://link.springer.com/article/10.1007/s12282-024-01555-9"
url_2<- "https://www.frontiersin.org/journals/oncology/articles/10.3389/fonc.2020.00120/full"
urls<-c(url,url_2)

text_test<-pdf_text(pdf_2)
pdfs<-c(pdf,pdf_2)
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




# 3. We are going to analyze the State of the Union Addresses from 1934 to 2020. First, set your working directory to the location of your files.

corp<-corpus(text_to_analyze)
# 4. Create a corpus. A corpus is a structure for text analysis that retains the position of the words.



article_corp <-corpus (text)
article_corp




#Take a look at a few statistics

ndoc(article_corp) # document count
docnames(article_corp) # unique document identifiers
ntoken(article_corp) # tokens in each document
ntype(article_corp) # types (unique tokens) in each document
nsentence(article_corp) # sentences in each document
summary(article_corp)# to get types, tokens, sentences
summary(article_corp,5)




# 5. Tokenize your corpus

article_toks <-tokens(article_corp)# It removes separators (whitespaces)but we can remove numbers,punctuation, symbols
print(article_toks)
article_toks <- tokens(article_corp,  remove_punct = TRUE)
print(article_toks)



article_toks <- tokens_tolower(article_toks)

article_toks [[1]][1:20]# first 20 tokens of document 1

#####Keywords in Context: What words immediately precede and follow terms of interest

kw_estogen <- kwic(article_toks, pattern="tumor*", window = 10)



 
kw_outcomes <- kwic(article_toks, pattern="ER*", window = 10)


#we can find multi-word expressions
kw_proliferation<- kwic(article_toks, pattern= "proliferation",window = 10)

