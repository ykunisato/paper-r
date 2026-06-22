FROM rocker/tidyverse:latest
LABEL maintainer="Yoshihiko Kunisato <kunisato@psy.senshu-u.ac.jp>"

# Install Quarto CLI
RUN /rocker_scripts/install_quarto.sh default

# Install TinyTeX
ENV PATH="${PATH}:/opt/TinyTeX/bin/x86_64-linux:/opt/TinyTeX/bin/aarch64-linux"
RUN install2.r --error tinytex \
    && Rscript -e 'tinytex::install_tinytex(dir = "/opt/TinyTeX", force = TRUE)' \
    && /opt/TinyTeX/bin/*/tlmgr path add

# Install ipaexfont
RUN apt-get update
RUN apt-get install -y fonts-ipaexfont

# Insatall notofont
RUN apt-get install -y fonts-noto-cjk fonts-noto-cjk-extra

# install libjpeg & V8 for "psycho"
RUN apt-get install -y libjpeg-dev libv8-dev

# install ffmpeg
RUN apt-get -y install ffmpeg

# install ImageMagick++ library for magick
RUN apt-get install -y libmagick++-dev

# install clang for Rstan
RUN apt-get install -y clang make

# Install JAGS and other linux packages
RUN apt-get update && apt-get install -y \
    jags \
    libgsl0-dev \
    tcl8.6-dev \
    tk8.6-dev\
    openmpi-bin\
    libglpk-dev \
    libcgal-dev \
    libglu1-mesa-dev \
    libsecret-1-dev \
    libsodium-dev \
    libssl-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# install sqlite3
RUN apt-get update
RUN apt-get install -y sqlite3

# install R packages
COPY install_r.r install_r.r
RUN ["r", "install_r.r"]

