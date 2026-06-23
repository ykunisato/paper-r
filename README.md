# Dockerfile of writing paper by R Markdown

This is a repository of Dockerfile including packages and add-ins that are useful for writing articles with R Markdown in Rstudio. This Dockerfile is based on rocker/verse. Installing rstan conducted by the method described in antoine-sachet / rocker-ML.

[日本語解説(Japanese)](https://github.com/ykunisato/paper-r/blob/master/README_jp.md)

Maintainer is Yoshihiko Kunisato (ykunisato@psy.senshu-u.ac.jp)

Keywords: psychology, cognitive science, rstudio, rstan, rmarkdown

## Usage

1. Install ["Docker Desktop"](https://www.docker.com/products/docker-desktop)

2. Open "terminal"(Mac) or "Command Prompt"(Windows)

3. Type the following code to pull a Docker container. Change the "password" and "name_of_container" as you like.


**Mac**


```
docker run -e PASSWORD=password -p 8787:8787 -v $(pwd):/home/rstudio -d --name paperr ghcr.io/ykunisato/paper-r:latest-linux-arm64
```
or

```
docker run -e PASSWORD=password -e DISABLE_AUTH=true -p 8787:8787 -v $(pwd):/home/rstudio -d --name paperr ghcr.io/ykunisato/paper-r:latest-linux-arm64
```

**Windows**


```
docker run -e PASSWORD=password -p 8787:8787 -v "%cd%":/home/rstudio -d --name paperr ghcr.io/ykunisato/paper-r:latest-linux-arm64
```


4. Open the web browser and type "http://localhost:8787/" in the URL bar.

5. You will see the Rstudio on the web browser. Type rstudio in ID column and password that you set in password column.

## [List of R packages](https://github.com/ykunisato/paper-r/blob/master/list_packages.md)

## AI assistant tools

In addition to the R packages, this image bundles tools that let you use AI assistants for coding and writing:

- **[opencode](https://github.com/anomalyco/opencode)**: An AI coding agent available from the terminal. Run `opencode` in the RStudio "Terminal" tab to start it.
- **R packages for LLMs**: [`ellmer`](https://ellmer.tidyverse.org/) (calling LLM APIs from R), [`gander`](https://github.com/simonpcouch/gander) and [`chores`](https://github.com/simonpcouch/chores) (RStudio add-ins for AI-assisted coding), [`btw`](https://github.com/posit-dev/btw), and `usethis`.

To use these, set your own API key in `~/.Renviron` (e.g. open it with `usethis::edit_r_environ()` and add a line such as `GROQ_API_KEY="gsk_xxxxxxxx"`, then restart R). When `GROQ_API_KEY` is set, `gander` is preconfigured to use Groq's `llama-3.3-70b-versatile` model.
