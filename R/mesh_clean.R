#' @title Screening-cleaning relevant publications in terms of number of mesh terms.
#'
#' @description It provides the PMID numbers of the publications of a group x, which have at least d descriptors and q qualifiers in common with the distinct total number of descriptors and qualifiers of a group y.
#'
#'
#' @param x A numeric vector containing the PMID numbers of the articles of our search
#'
#' @param y A character vector containing the pmid numbers of publications that the user would like to compare with x.
#'
#' @param d An integer that describes the number of the least Descriptors could share a publication of the first group x with all the publications of the second group y.
#'
#' @param q An integer that describes the number of the least Qualifiers could share a publication of the first group x with all the publications of the second group y.
#'
#'
#' @return result_final
#'
#'
#' @export
mesh_clean<-function(x,y,d,q){

    merge<-unique(c(x,y))

    rec <- rentrez::entrez_fetch(db="pubmed", id=merge, rettype = "xml", parsed=TRUE)

    mesh <- XML::getNodeSet(rec, "//PubmedArticle")

    xpath2 <-function(x, ...){
        y <- XML::xpathSApply(x, ...)
        ifelse(length(y) == 0, NA,  list(y, collapse=" "))
    }

    m1 <- sapply(mesh, xpath2, ".//DescriptorName", XML::xmlValue, "UI")
    m2 <- sapply(mesh, xpath2, ".//QualifierName", XML::xmlValue, "UI")
    m2 <- sapply(m2,unique)
    m3 <- sapply(mesh, xpath2, ".//MedlineCitation/PMID", XML::xmlValue)

    t<-dplyr::tibble(DescriptorNameUI = m1,
                     QualifierNAmeUI = m2, PMID = m3)

    # for purrr
    `%>%` <- purrr::`%>%`

    #they have no DescriptorNameUI or QualifierNAmeUI
    mesh0<-unlist(dplyr::filter(t, DescriptorNameUI=="NA")
                  %>% dplyr::pull("PMID"))


    Descriptor_small<-unique(unlist(dplyr::filter(t,PMID %in% y)
                                    %>% dplyr::pull("DescriptorNameUI")))


    Qualifier_small<-unique(unlist(dplyr::filter(t,PMID %in% y)
                                   %>% dplyr::pull("QualifierNAmeUI")))


    inter_descriptor<-lapply(m1,intersect,Descriptor_small)

    inter_qualifier<-lapply(m2,intersect,Qualifier_small)


    common_n_discriptor<-lapply(inter_descriptor,length)

    common_n_qualifier<-lapply(inter_qualifier,length)

    result<-dplyr::tibble(common_n_discriptor,common_n_qualifier,m3)

    filter_final <- result %>% dplyr::filter(common_n_discriptor >=d & common_n_qualifier >=q)

    res<-unlist(filter_final$m3)

    result_final<-intersect(res,x)

    return(result_final)
}
