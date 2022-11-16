## code to prepare `mydataset` dataset goes here

mydataset<-unlist(read.csv("stopwords.txt", header = FALSE, sep = ",", encoding ="UTF-8"))

usethis::use_data(mydataset, overwrite = TRUE)
