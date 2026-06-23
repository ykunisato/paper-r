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


# opencode
RUN set -eux; \
    ARCH=$(uname -m); \
    case "$ARCH" in \
      aarch64) TRIPLE="linux-arm64" ;; \
      x86_64)  TRIPLE="linux-x64"   ;; \
      *) echo "Unsupported arch: $ARCH" && exit 1 ;; \
    esac; \
    LATEST=$(curl -fsSL https://api.github.com/repos/anomalyco/opencode/releases/latest \
             | grep '"tag_name"' | sed 's/.*"v\([^"]*\)".*/\1/'); \
    curl -fsSL "https://github.com/anomalyco/opencode/releases/download/v${LATEST}/opencode-${TRIPLE}.tar.gz" \
         -o /tmp/opencode.tar.gz; \
    tar -xzf /tmp/opencode.tar.gz -C /usr/local/bin; \
    chmod 755 /usr/local/bin/opencode; \
    rm /tmp/opencode.tar.gz; \
    opencode --version
 

# ellmer
RUN Rscript -e "\
  install.packages( \
    c('ellmer', 'gander', 'chores', 'btw', 'usethis'), \
    repos = 'https://cloud.r-project.org', \
    dependencies = TRUE \
  ) \
"
 
# Rprofile
RUN printf '\n\
# ── AI assistant (ellmer / gander) ──────────────────────────────\n\
# GROQ_API_KEY を各自の ~/.Renviron に設定してください。\n\
# 例: usethis::edit_r_environ() で開いて\n\
#     GROQ_API_KEY="gsk_xxxxxxxxxxxx" の行を追加し、R を再起動。\n\
if (nzchar(Sys.getenv("GROQ_API_KEY"))) {\n\
  options(\n\
    gander.chat = ellmer::chat_groq(\n\
      model = "llama-3.3-70b-versatile"\n\
    )\n\
  )\n\
}\n\
# ────────────────────────────────────────────────────────────────\n\
' >> /usr/local/lib/R/etc/Rprofile.site
 

# install R packages
COPY install_r.r install_r.r
RUN ["r", "install_r.r"]