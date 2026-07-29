FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install(ask=FALSE); BiocManager::install('remotes')"

RUN Rscript -e "options(repos = BiocManager::repositories()); devtools::install('.', dependencies=TRUE, build_vignettes=TRUE)"

RUN Rscript -e "BiocManager::install('vjcitn/ontoProc2', ref='devel', force=TRUE)"

USER rstudio
ENV HOME=/home/rstudio

# preload a large ontology into cache
RUN Rscript -e "library(BiocFileCache); ca = BiocFileCache(ask=FALSE, cache=BiocFileCache::getBFCOption('CACHE')); library(ontoProc2); mondo = semsql_connect(ontology='mondo', cache=ca); cl = semsql_connect(ontology='cl', cache=ca)" 

USER root
