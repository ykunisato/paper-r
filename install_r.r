# install rstan
install.packages("rstan", type = "source")

dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
M <- file.path(dotR, ifelse(.Platform$OS.type == "windows", "Makevars.win", "Makevars"))
if (!file.exists(M)) file.create(M)
cat("\nCXX14FLAGS=-O3 -march=native -mtune=native",
    if( grepl("^darwin", R.version$os)) "CXX14FLAGS += -arch x86_64 -ftemplate-depth-256" else 
    if (.Platform$OS.type == "windows") "CXX11FLAGS=-O3 -march=corei7 -mtune=corei7" else
    "CXX14FLAGS += -fPIC",
    file = M, sep = "\n", append = TRUE)

# install CMDSTAN_HOME
install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
install.packages("posterior", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
library(cmdstanr)
install_cmdstan()

# install R packages from CRAN
install.packages(c("devtools",
"remotes",
"memisc",
"bayesplot",
"brms",
"citr",
"coda",
"caret",
"car",
"e1071",
"Hmisc",
"GGally",
"ggmcmc",
"ggsci",
"gridExtra",
"ggridges",
"glmnet",
"kableExtra",
"lme4",
"ltm",
"loo",
"MASS",
"pixiedust",
"pROC",
"projpred",
"rstanarm",
"rstantools",
"shinystan",
"sigr",
"stargazer",
"stringr",
"tidybayes",
"viridis",
"psycho",
"psych",
"apaTables",
"googleComputeEngineR",
"googleCloudStorageR",
"future",
"checkpoint",
"packrat",
"VIM",
"mice",
"irr",
"DiagrammeR",
"magick",
"roxygen2md",
"googledrive",
"rdrop2",
"furrr",
"leaflet",
"osfr",
"xaringanthemer",
"patchwork",
"pso",
"latex2exp",
"parameters",
"effectsize",
"insight",
"bayestestR",
"performance",
"see",
"report",
"correlation"
), error = TRUE, dependencies = TRUE)

# install R packages from GitHub
remotes::install_github(c("crsh/papaja",
"rstudio/rticles",
"benmarwick/wordcountaddin",
"ropenscilabs/gramr",
"sachaepskamp/parSim",
"rstudio/renv",
"karthik/holepunch",
"yihui/xaringan",
"CrumpLab/jsPsychR",
"djnavarro/xprmntr",
"Kohze/fireData",
"CrumpLab/vertical",
"ykunisato/senshuRmd",
"ykunisato/jsPsychRmd",
"ykunisato/openPsychData"
), dependencies = TRUE)

# install ipaex for Japanese
tinytex::tlmgr_install("ipaex")