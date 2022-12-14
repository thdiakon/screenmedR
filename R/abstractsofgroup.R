#' @title Abstract PMID collector of a specific group, after clustering.
#'
#' @description Gathering the PMIDs of abstracts belonging to a specific cluster.
#'
#' @param clustering,group_number,initial_search
#'
#' @return NULL
#'
#' @examples
#'
#' @export abstractsofgroup
#'
#'
abstractsofgroup<- function(clustering,group_number,initial_search){

    filtered<-c()

    for (i in 1:length(clustering)){
        if(clustering[i]%in% c(group_number)) filtered<-c(filtered, attributes(clustering[i]))
    }

    return(unname(unlist(filtered)))
}
