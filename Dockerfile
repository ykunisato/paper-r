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

# Install Node.js 22 LTS for opencode.
RUN apt-get update && apt-get install -y ca-certificates curl gnupg \
    && mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key \
       | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" \
       > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install opencode.
RUN OPENCODE_INSTALL_DIR=/usr/local/bin \
    bash -c "$(curl -fsSL https://opencode.ai/install)"

# Install R packages for LLM-assisted workflows.
RUN Rscript -e "\
  install.packages( \
    c('ellmer', 'gander', 'chores', 'btw', 'usethis'), \
    repos = 'https://cloud.r-project.org', \
    dependencies = TRUE \
  ) \
"

# Configure gander when GROQ_API_KEY is available.
RUN printf '\n\
# AI assistant (ellmer / gander)\n\
# Set GROQ_API_KEY in your ~/.Renviron and restart R.\n\
if (nzchar(Sys.getenv("GROQ_API_KEY"))) {\n\
  options(\n\
    gander.chat = ellmer::chat_groq(\n\
      model = "llama-3.3-70b-versatile"\n\
    )\n\
  )\n\
}\n\
# End AI assistant setup\n\
' >> /usr/local/lib/R/etc/Rprofile.site

# Install project R packages last to preserve cache layers.

# install R packages
COPY install_r.r install_r.r
RUN ["r", "install_r.r"]
