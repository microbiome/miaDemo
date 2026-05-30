FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio/omatutorials

COPY --chown=rstudio:rstudio . /home/rstudio/omatutorials

RUN apt-get update && apt-get install -y libglpk-dev && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV R_REMOTES_NO_ERRORS_FROM_WARNINGS=true

RUN Rscript -e "install.packages('remotes'); remotes::install_local('.', dependencies = TRUE, repos = BiocManager::repositories())"