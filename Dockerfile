FROM rocker/verse
MAINTAINER "Yoshihiko Kunisato" ykunisato@psy.senshu-u.ac.jp

# Using clang as compiler for stan
RUN apt-get update \
&& apt-get install -y --no-install-recommends \
clang

# Install ipaexfont
RUN apt-get install -y fonts-ipaexfont

# install libjpeg & V8 for "psycho"
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y libv8-dev

# install ImageMagick++ library for magick
RUN apt-get install -y libmagick++-dev

# Creates a makevars file and installs rstan from source(https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Linux)
COPY inst_stan.r inst_stan.r
RUN ["r", "inst_stan.r"]

# install devtools & R package from github
RUN install2.r -s --error \
devtools

RUN Rscript -e "devtools::install_github('crsh/papaja')"
RUN Rscript -e "devtools::install_github('rstudio/rticles')"
RUN Rscript -e "devtools::install_github('benmarwick/wordcountaddin', type = 'source', dependencies = TRUE)"
RUN Rscript -e "devtools::install_github('ropenscilabs/gramr')"
RUN Rscript -e "devtools::install_github('sachaepskamp/parSim')"
RUN Rscript -e  "devtools::install_github('rstudio/renv')"
RUN Rscript -e  "devtools::install_github('karthik/holepunch')"

# jsPsych
RUN Rscript -e  "devtools::install_github('CrumpLab/jsPsychR')"
RUN Rscript -e  "devtools::install_github('djnavarro/xprmntr')"
RUN Rscript -e  "devtools::install_github('Kohze/fireData')"

# install ipaex font
RUN Rscript -e "tinytex::tlmgr_install('ipaex')"

# install other R packages
RUN install2.r -s --error \
bayesplot \
brms \
citr \
coda \
caret \
car \
e1071 \
Hmisc \
GGally \
ggmcmc \
ggsci \
gridExtra \
ggridges \
glmnet \
lme4 \
ltm \
loo \
MASS \
pixiedust \
pROC \
projpred \
rstanarm \
rstantools \
shinystan \
sigr \
stargazer \
stringr \
tidybayes \
viridis \
psycho \
apaTables \
googleComputeEngineR \
googleCloudStorageR \
future \
checkpoint \
packrat \
VIM \
mice \
irr  \
DiagrammeR  \
magick  \
roxygen2md \
googledrive \
rdrop2 \
furrr \
tidylog
