# screenmedR <img src='man/figures/hex-screenmedR.png' align="right" width="120" />

## Overview

screenmedR is a package for automatizing the screening of publications obtain from a search in Pubmed database, in order to minimize the manual work needed to extract the proper publications for your systematic review. It uses unsupervised machine learning algorithms to divide in groups all abstracts in terms of their cosine similarity with a small relevant set of 4 or 5 abstracts which you think they belong to your analysis. The group with the highest cosine similarity can be chosen (in case the difference with the others is big enough) to narrow your search and end up with a much smaller number of abstracts needed for checking. It comes also with extra functions that use mesh terms (Descriptors & Qualifiers) so as to narrow down your search even more. It uses Tidyverse (Wickham et. al)  RISmed (Kovalchik,n.d.) and rentrez (Winter 2017) packages to extract the information that needed and tm (Feinerer, Hornik, and Meyer 2008) package for the NLP.

## Installation

``` r
# You can download the development version of the package from github:
devtools::install_github('thdiakon/screenmedR')
```

## Analytical instructions and a case study

More info about the program and its functions can be found in the [vignette](https://github.com/thdiakon/screenmedR/blob/main/vignettes/vignette_27_5_2022.pdf).


## References

Wickham H, Averick M, Bryan J, Chang W, McGowan LD, François R, Grolemund G, Hayes A, Henry L, Hester J, Kuhn M, Pedersen TL, Miller E, Bache SM, Müller K, Ooms J, Robinson D, Seidel DP, Spinu V, Takahashi K, Vaughan D, Wilke C, Woo K, Yutani H (2019). “Welcome to the tidyverse.” Journal of Open Source Software, 4(43), 1686. doi:10.21105/joss.01686.

Feinerer, Ingo, Kurt Hornik, and David Meyer. 2008. “Text Mining Infrastructure in r.” Journal of Statistical
Software 25 (5): 1–54. ([tm](https://www.jstatsoft.org/v25/i05/))

Kovalchik, Stephanie. n.d. “RISmed: A Set of Tools to Extract Bibliographic Content from the National
Center for Biotechnology Information (NCBI) Databases, Including PubMed.” ([RISMED](https://CRAN.R-project.org/package=RISmed))

Winter, David J. 2017. “rentrez: An r Package for the NCBI eUtils API.” The R Journal 9: 520–26.
