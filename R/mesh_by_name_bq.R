#' @title A function that provides the PMID numbers of publications in terms of the names of their Descriptors & Qualifiers
#'
#' @description It can provide all the PMIDS of publications with specific Descriptors
#' and Qualifiers.
#'
#' @param x A character vector containing the PMID numbers of the articles of our search
#'
#' @param Descriptor A character vector containing the mesh Descriptors.
#'
#' @param Qualifier A character vector containing the mesh Qualifiers.
#'
#' @return NULL
#'
#' @examples
#'
#'initial_search <- read.csv(system.file("extdata", "csv-randomized-set.csv", package = "screenmedR"))
#'initialPMID<-initial_search$PMID
#'Descriptor<-c("Blood Pressure","Dobutamine","Humans","Infant, Newborn")
#'Qualifier<-c("administration & dosage")
#'mesh_by_name_bq(initialPMID,Descriptor,Qualifier)
#'
#' @export
mesh_by_name_bq<-function(x,d,q){

    bigqueryindex <-
        split(seq(1,length(x)), ceiling(seq_along(seq(1,length(x)))/100))


    extractedData <- c()

    for (i in bigqueryindex) {

        extractedData = c(extractedData,mesh_by_name(x[unlist(i)],d,q))
    }


    return(extractedData)
}
