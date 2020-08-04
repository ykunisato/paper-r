FROM rocker/verse:4.0.2
LABEL maintainer="Yoshihiko Kunisato <kunisato@psy.senshu-u.ac.jp>"

# Install ipaexfont
RUN apt-get update
RUN apt-get install -y fonts-ipaexfont

# install libjpeg & V8 for "psycho"
RUN apt-get install -y libjpeg-dev libv8-dev

# install ImageMagick++ library for magick
RUN apt-get install -y libmagick++-dev

# install clang for Rstan
RUN apt-get install -y clang make

# set github_PAT
# ARG GITHUB_PAT
# RUN set -x && \
#  echo "GITHUB_PAT=$GITHUB_PAT" >> /usr/local/lib/R/etc/Renviron

# install R packages
COPY install_r.r install_r.r
RUN ["r", "install_r.r"]