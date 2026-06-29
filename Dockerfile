FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install(ask=FALSE)"

RUN Rscript -e "options(repos = BiocManager::repositories()); devtools::install('.', dependencies=TRUE, build_vignettes=TRUE)"

# Pre-populate the rstudio user's BiocFileCache with the MONDO ontology (~220MB)
# so workshop participants don't hit the S3 bucket during the session.
USER rstudio
RUN Rscript -e "library(ontoProc2); semsql_connect(ontology='mondo')"
USER root
