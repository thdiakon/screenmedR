#' @title A Function that collects the PMID's of a specific clustering group, after clustering with screenmed function.
#'
#' @description Gathering the PMIDs of abstracts which belong to a specific cluster.
#'
#' @param clustering The $clustering output of the screemed function.
#'
#' @param group_number The number of the group the screenmed divided the initial_search.
#'
#' @return NULL
#'
#'
#' @export
abstractsofgroup<- function(clustering,group_number){

    filtered<-c()

    for (i in 1:length(clustering)){
        if(clustering[i]%in% c(group_number)) filtered<-c(filtered, attributes(clustering[i]))
    }

    return(unname(unlist(filtered)))
}
