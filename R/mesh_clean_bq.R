#' @title Screening-cleaning relevant publications in terms of number of mesh terms.
#'
#' @description It provides the PMID numbers of a set of publications x which have at least d descriptors and q qualifiers in common with a small default set y.
#'
#'
#' @param x A character vector containing the PMID numbers of the articles of our search
#'
#' @param y A character vector containing the pmid numbers of publications that the user would like to compare with x.
#'
#' @param d An integer that describes the number of Descriptors that the user wants the two vectors to have at least in common.
#'
#' @param q An integer that describes the number of Qualifiers that the user wants the two vectors to have at least in common.
#'
#'
#' @return NULL
#'
#' @examples
#'
#'initial_search <- read.csv(system.file("extdata", "csv-randomized-set.csv", package = "screenmedR"))
#'initialPMID<-initial_search$PMID
#'knownPMID<-c("18822428","8276025","16452355","17329276","8346957")
#'mesh_clean_bq(initialPMID,knownPMID,11,2)
#'
#' @export
mesh_clean_bq<-function(x,y,d,q){

    bigqueryindex <-
        split(seq(1,length(x)), ceiling(seq_along(seq(1,length(x)))/100))


    extractedData <- c()

    for (i in bigqueryindex) {

        extractedData = c(extractedData,mesh_clean(x[unlist(i)],y,d,q))
    }
    uextracteddata<-unique(extractedData)

    return(uextracteddata)
}
