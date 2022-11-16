#' @title A function that cleans and manipulates the abstracts
#'
#' @description By Using tm functions works for cleaning, stemming, removing
#' special words etc.
#'
#' @param x
#'
#' @return NULL
#'
#'
#' @export diagnosis_clean
#'
#'
#'
#'
diagnosis_clean<-function(x){
    x<-tm::removeWords(x,mydataset)
    x<-tolower(x)
    x<-tm::removeNumbers(x)
    x<-gsub("[[:punct:]]|[^[:alnum:]]", " ", x)
    x<-tm::removeWords(x,tm::stopwords("SMART"))
    x<-stringr::str_squish(x)
    x<-tm::stemDocument(x)
    return(x)
}

