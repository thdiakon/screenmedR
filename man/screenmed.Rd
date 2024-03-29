% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/screenmed.R
\name{screenmed}
\alias{screenmed}
\title{A Function which is grouping abstracts in terms of similarity with a small group of relevant publications.}
\usage{
screenmed(initial_search, filtered, sparsity, group_number)
}
\arguments{
\item{initial_search}{A character vector containing the PMID numbers of the articles of our search.}

\item{filtered}{A character vector containing the pmid numbers of abstracts (4 or 5 typically) that belong to the study.}

\item{sparsity}{A number typically in (0,99,1) that defines the sparsity of the abstracts for clustering.}

\item{group_number}{The number of groups the user would like to divide the initial number of publications from pubmed search.}
}
\value{
group_number,cosine_similarity,clustering,missing_abstracts
}
\description{
It provides the following:
1) The number of groups the user choose to split the initial search
2) The cosine similarities between the small group of publications and each of the clustered groups of abstracts
3) A list of the clustered abstracts and the cluster they belong to.
4) The PMIDS of the publications that no abstract was found in Pubmed.
}
