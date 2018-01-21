FROM rocker/binder:3.4.2

# Copy repo into ${HOME}, make user own $HOME
USER root
RUN install2.r --error \
    foreign \
    ggplot2 \
    ggfortify \
    stringr \
    forecast \
    datamart \
    lawstat \
    nortest \
    genetics \
    ggthemes \
    car \
    gridExtra \
    dplyr
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}

## run any install.R script we find
RUN if [ -f install.R ]; then R --quiet -f install.R; fi

