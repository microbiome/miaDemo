FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN Rscript -e "options(repos = BiocManager::repositories()); BiocManager::install(ask = FALSE)"

RUN Rscript -e "install.packages('remotes', repos = 'https://cloud.r-project.org')"

RUN Rscript -e "remotes::install_version('biclust', version = '2.0.3.1', repos = 'https://cran.r-project.org', upgrade = 'never')"

RUN Rscript -e "options(repos = BiocManager::repositories()); devtools::install('.', dependencies = TRUE, build_vignettes = TRUE)"
