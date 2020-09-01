# Dockerfile of writing paper by R Markdown

This Dockerfile was developed for the Japanesese R users (So, it contains settings of Japanese environment). English version of this dockerfile is [here]((https://hub.docker.com/r/ykunisato/paper-r).

これは，RstudioでR Markdownを用いて論文執筆を行う際に便利なパッケージやアドインを含めたDockerファイルのリポジトリです。このDockerファイルでは，[アカデミアのためのRSTUDIO](https://ytake2.github.io/create.manuscript/RStudio_for_Academia.html)にて紹介されているパッケージは大体用意できます。各種パッケージやアドインの詳細は，[アカデミアのためのRSTUDIO](https://ytake2.github.io/create.manuscript/RStudio_for_Academia.html)を参照ください。

本Dockerファイルは，rocker/verseをベースにし，antoine-sachet/rocker-MLに記載されている方法を使ってrstanをインストールし，いくつかR Markdown関連のパッケージを追加しています。また，日本語環境の設定は，[rocker-jp/verse](https://github.com/rocker-jp/verse)を参考にしています。

作成者は専修大学人間科学部心理学科の国里愛彦です (ykunisato@psy.senshu-u.ac.jp)。エラーや追加してほしいパッケージなどがありましたら，気軽にご連絡ください。

Keywords: 心理学, 認知科学, 分析・執筆，rstudio, rstan, rmarkdown

## 使用法

Docker Desktopがインストールされていて，ある程度の通信速度があれば，数分で使用可能です。

1.Docker Desktop ( https://www.docker.com/products/docker-desktop )をインストールする。

2.ターミナル（Macの場合。Winはコマンドプロンプト？)を開く

3.ターミナルに以下を打ち込んで、コンテナーをrunする(runの前にPullが自動的なされます)。パスワードとコンテナ名はご自身の好きなように設定ください。

```
docker run -e PASSWORD=パスワード -p 8787:8787 -v $PWD:/home/rstudio -d --name コンテナ名 ykunisato/paper-r-jp
```

4.ブラウザを開いて，urlバー（アドレスバー）に，http://localhost:8787/ とタイプする

5.ブラウザ上にRstudioが出てくるので，IDにrstudio，パスに上記で設定したパスワードをいれる。

## Docker間の依存関係について

国里(ykunisato)が管理しているRStudio用Dockerコンテナとその依存関係は以下になります。

- [ykunisato/paper-r](https://hub.docker.com/r/ykunisato/paper-r) : 心理学系使いそうなRパッケージを入れたコンテナ（rocker/verseをベースに作成）
- [ykunisato/paper-r-jp](https://hub.docker.com/r/ykunisato/paper-r-jp) : ykunisato/paper-rをベースに日本語環境化したコンテナ（本コンテナ）
- [ykunisato/ccp-lab-r](https://hub.docker.com/r/ykunisato/ccp-lab-r) : ykunisato/paper-rをベースに認知モデリング,心理学的ネットワーク分析，ネットワークメタ分析で使用するパッケージを追加したコンテナ
- [ykunisato/ccp-lab-r-jp](https://hub.docker.com/r/ykunisato/ccp-lab-rjp) : ykunisato/ccp-lab-rをベースに日本語環境化したコンテナ



## 事前にインストールされている追加のRパッケージ
### 論文のテンプレート系パッケージ

- rticles              :                Article Formats for R Markdown
- papaja               :                Prepare reproducible APA journal articles with R Markdown

### 図表作成用パッケージ

- papaja               :                Prepare reproducible APA journal articles with R Markdown
- stargazer            :                Well-Formatted Regression and Summary Statistics Tables
- pixiedust            :                Tables so Beautifully Fine-Tuned You Will Believe It's Magic
- ggsci                :                Scientific Journal and Sci-Fi Themed Color Palettes for 'ggplot2'

### 解析結果の報告用パッケージ

- sigr                 :                Succinct and Correct Statistical Summaries for Reports
- psycho               :                Efficient and Publishing-Oriented Workflow for Psychological Science

### 心理学などで使用しそうな解析パッケージ

- BayesFactor       :                   Computation of Bayes Factors for Common Designs
- blavaan        :                      Bayesian Latent Variable Analysis
- brms                :                 Bayesian Regression Models using 'Stan'
- lme4                 :                Linear Mixed-Effects Models using 'Eigen' and S4
- psych                :                Procedures for Psychological, Psychometric, and Personality Research
- rstan                :                R Interface to Stan
- tidyverse            :                Easily Install and Load the 'Tidyverse'

### RStudioの便利なアドイン

- citr                  :               'RStudio' Add-in to Insert Markdown Citations (BibTeX)
- gramr                :                The Grammar of Grammar
- wordcountaddin       :                Word counts and readability statistics in R markdown documents

### Google Compute Engine関係

- googleComputeEngineR : R Interface with Google Compute Engine
- googleCloudStorageR :  Interface with Google Cloud Storage API
- future : Unified Parallel and Distributed Processing in R for Everyone

### その他

- abind :                                Combine Multidimensional Arrays
- acepack :                              ACE and AVAS for Selecting Multiple Regression Transformations
- arrayhelpers :                         Convenience Functions for Arrays
- askpass       :                       Safe Password Entry for R, Git, and SSH
- assertthat     :                      Easy Pre and Post Assertions
- backports       :                     Reimplementations of Functions Introduced Since R-3.0.0
- base64enc        :                    Tools for base64 encoding
- bayesplot          :                  Plotting for Bayesian Models
- BDgraph             :                 Bayesian Structure Learning in Graphical Models using Birth-Death MCMC
- BH                   :                Boost C++ Header Files
- bibtex                :               Bibtex Parser
- BiocManager            :              Access the Bioconductor Project Package Repository
- bit                     :             A Class for Vectors of 1-Bit Booleans
- bit64                    :            A S3 Class for Vectors of 64bit Integers :
- bitops        :                       Bitwise Operations
- blob            :                     A Simple S3 Class for Representing Vectors of Binary Data ('BLOBS')
- bookdown         :                    Authoring Books and Technical Documents with R Markdown
- brew              :                   Templating Framework for Report Generation
- bridgesampling     :                  Bridge Sampling for Marginal Likelihoods and Bayes Factors
- Brobdingnag          :                Very Large Numbers in R
- broom                 :               Convert Statistical Analysis Objects into Tidy Tibbles
- callr                  :              Call R from R
- car                    :              Companion to Applied Regression
- carData                :              Companion to Applied Regression Data Sets
- caret                 :               Classification and Regression Training
- caTools               :               Tools: moving window statistics, GIF, Base64, ROC AUC, etc.
- cellranger            :               Translate Spreadsheet Cell Ranges to Rows and Columns
- checkmate             :               Fast and Versatile Argument Checks
- cli                   :               Helpers for Developing Command Line Interfaces
- clipr                 :               Read and Write from the System Clipboard
- clisymbols            :               Unicode Symbols at the R Prompt
- coda                  :               Output Analysis and Diagnostics for MCMC
- colorspace            :               A Toolbox for Manipulating and Assessing Colors and Palettes
- colourpicker          :               A Colour Picker Tool for Shiny and for Selecting Colours in Plots
- commonmark            :               High Performance CommonMark and Github Markdown Rendering in R
- CompQuadForm          :               Distribution Function of Quadratic Forms in Normal Variables
- contfrac              :               Continued Fractions
- corpcor               :               Efficient Estimation of Covariance and (Partial) Correlation
- covr                  :               Test Coverage for Packages
- crayon                :               Colored Terminal Output
- crosstalk             :               Inter-Widget Interactivity for HTML Widgets
- curl                  :               A Modern and Flexible Web Client for R
- d3Network             :               Tools for creating D3 JavaScript network, tree, dendrogram, and Sankey graphs from R
- data.table            :              Extension of 'data.frame'
- DBI                   :               R Database Interface
- dbplyr                :               A 'dplyr' Back End for Databases
- desc                  :               Manipulate DESCRIPTION Files
- DescTools             :               Tools for Descriptive Statistics
- deSolve               :               Solvers for Initial Value Problems of Differential Equations ('ODE','DAE', 'DDE')
- devtools              :               Tools to Make Developing R Packages Easier
- digest                :               Create Compact Hash Digests of R Objects
- docopt                :               Command-Line Interface Specification Language
- dplyr                 :               A Grammar of Data Manipulation
- DT                    :               A Wrapper of the JavaScript Library 'DataTables'
- dtplyr                :               Data Table Back-End for 'dplyr'
- dygraphs              :               Interface to 'Dygraphs' Interactive Time Series Charting Library
- e1071                 :               Misc Functions of the Department of Statistics, Probability Theory Group(Formerly: E1071), TU Wien
- ellipsis              :               Tools for Working with ...
- elliptic              :               Weierstrass and Jacobi Elliptic Functions
- emmeans               :               Estimated Marginal Means, aka Least-Squares Means
- estimability          :               Tools for Assessing Estimability of Linear Predictions
- evaluate              :               Parsing and Evaluation Tools that Provide More Details than the Default
- expm                  :               Matrix Exponential, Log, 'etc'
- fansi                 :               ANSI Control Sequence Aware String Functions
- fdrtool               :               Estimation of (Local) False Discovery Rates and Higher Criticism
- feather               :               R Bindings to the Feather 'API'
- foghorn               :               Summarize CRAN Check Results in the Terminal
- forcats               :               Tools for Working with Categorical Variables (Factors)
- foreach               :               Provides Foreach Looping Construct for R
- formatR               :               Format R Code Automatically
- Formula               :               Extended Model Formulas
- fs                    :               Cross-Platform File System Operations Based on 'libuv'
- future                :               Unified Parallel and Distributed Processing in R for Everyone
- generics              :               Common S3 Generics not Provided by Base R Methods Related to Model Fitting
- GGally               :                Extension to 'ggplot2'
- ggcorrplot           :                Visualization of a Correlation Matrix using 'ggplot2'
- ggm                  :                Functions for graphical Markov models
- ggmcmc               :                Tools for Analyzing MCMC Simulations from Bayesian Inference
- ggplot2              :                Create Elegant Data Visualisations Using the Grammar of Graphics
- ggridges             :                Ridgeline Plots in 'ggplot2'
- ggstance             :                Horizontal 'ggplot2' Components
- gh                   :                'GitHub' 'API'
- git2r                :                Provides Access to Git Repositories
- glasso               :                Graphical Lasso: Estimation of Gaussian Graphical Models
- glmnet               :                Lasso and Elastic-Net Regularized Generalized Linear Models
- globals              :                Identify Global Objects in R Expressions
- glue                 :                Interpreted String Literals
- gmailr               :                Access the Gmail RESTful API
- gower                :                Gower's Distance
- gridExtra            :                Miscellaneous Functions for "Grid" Graphics
- gtable               :                Arrange 'Grobs' in Tables
- gtools               :                Various R Programming Tools
- haven                :                Import and Export 'SPSS', 'Stata' and 'SAS' Files
- HDInterval           :                Highest (Posterior) Density Intervals
- highlight            :                Syntax Highlighter
- highr                :                Syntax Highlighting for R Source Code
- Hmisc                :                Harrell Miscellaneous
- hms                  :                Pretty Time of Day
- htmlTable            :                Advanced Tables for Markdown/HTML
- htmltools            :                Tools for HTML
- htmlwidgets          :                HTML Widgets for R
- httpuv               :                HTTP and WebSocket Server Library
- httr                 :                Tools for Working with URLs and HTTP
- huge                 :                High-Dimensional Undirected Graph Estimation
- hunspell             :                High-Performance Stemmer, Tokenizer, and Spell Checker
- hypergeo             :                The Gauss Hypergeometric Function
- igraph               :                Network Analysis and Visualization
- ini                  :                Read and Write '.ini' Files
- inline               :                Functions to Inline C, C++, Fortran Function Calls from R
- ipred                :                Improved Predictors
- iterators            :                Provides Iterator Construct for R
- jpeg                 :                Read and write JPEG images
- jsonlite             :                A Robust, High Performance JSON Parser and Generator for R
- knitr                :                A General-Purpose Package for Dynamic Report Generation in R
- koRpus               :                An R Package for Text Analysis
- koRpus.lang.en       :                Language Support for 'koRpus' Package: English
- labeling             :                Axis Labeling
- labelVector          :                Label Attributes for Atomic Vectors
- Lahman               :                Sean 'Lahman' Baseball Database
- LaplacesDemon        :                Complete Environment for Bayesian Inference
- later                :                Utilities for Delaying Function Execution
- latticeExtra         :                Extra Graphical Utilities Based on Lattice
- lava                 :                Latent Variable Models
- lavaan               :                Latent Variable Analysis
- lazyeval             :                Lazy (Non-Standard) Evaluation
- lintr                :                A 'Linter' for R Code
- listenv              :                Environments Behaving (Almost) as Lists
- littler              :                R at the Command-Line via 'r'
- lmerTest             :                Tests in Linear Mixed Effects Models
- loo                  :                Efficient Leave-One-Out Cross-Validation and WAIC for Bayesian Models
- ltm                  :                Latent Trait Models under IRT
- lubridate            :                Make Dealing with Dates a Little Easier
- magrittr             :                A Forward-Pipe Operator for R
- manipulate           :                Interactive Plots for RStudio
- maptools             :                Tools for Handling Spatial Objects
- markdown             :                'Markdown' Rendering for R
- MatrixModels         :                Modelling with Sparse And Dense Matrices
- matrixStats          :                Functions that Apply to Rows and Columns of Matrices (and to Vectors)
- mcmc                 :                Markov Chain Monte Carlo
- MCMCpack             :                Markov Chain Monte Carlo (MCMC) Package
- memoise              :                Memoisation of Functions
- microbenchmark       :                Accurate Timing Functions
- mime                 :                Map Filenames to MIME Types
- miniUI               :                Shiny UI Widgets for Small Screens
- minqa                :                Derivative-free optimization algorithms by quadratic approximation
- mnormt               :                The Multivariate Normal and t Distributions
- mockery              :                Mocking Library for R
- ModelMetrics         :                Rapid Calculation of Model Metrics
- modelr               :                Modelling Functions that Work with the Pipe
- msm                  :                Multi-State Markov and Hidden Markov Models in Continuous Time
- MuMIn                :                Multi-Model Inference
- munsell              :                Utilities for Using Munsell Colours
- mvtnorm              :                Multivariate Normal and t Distributions
- nFactors             :                Parallel Analysis and Non Graphical Solutions to the Cattell Scree Test
- nleqslv              :                Solve Systems of Nonlinear Equations
- nloptr               :                R Interface to NLopt
- nonnest2             :                Tests of Non-Nested Models
- numDeriv             :                Accurate Numerical Derivatives
- nycflights13         :                Flights that Departed NYC in 2013
- openssl              :                Toolkit for Encryption, Signatures and Certificates Based on OpenSSL
- openxlsx             :                Read, Write and Edit XLSX Files
- packrat              :                A Dependency Management System for Projects and their R Package Dependencies
- parsedate            :                Recognize and Parse Dates in Various Formats, Including All ISO 8601 Formats
- pbapply              :                Adding Progress Bar to 'apply' Functions
- pbivnorm             :                Vectorized Bivariate Normal CDF
- pbkrtest                             Parametric Bootstrap and Kenward Roger Based Methods for Mixed Model Comparison
- pillar               :                Coloured Formatting for Columns
- pingr                :                Check if a Remote Computer is Up
- pkgbuild             :                Find Tools Needed to Build R Packages
- pkgconfig            :                Private Configuration for 'R' Packages
- pkgdown              :                Make Static HTML Documentation for a Package
- pkgload              :                Simulate Package Installation and Attach
- pkgmaker             :                Development Utilities for R Packages
- PKI                  :                Public Key Infrastucture for R Based on the X.509 Standard
- plogr                :                The 'plog' C++ Logging Library
- plyr                 :                Tools for Splitting, Applying and Combining Data
- png                  :                Read and write PNG images
- polycor              :                Polychoric and Polyserial Correlations
- ppcor                :                Partial and Semi-Partial (Part) Correlation
- praise               :                Praise Users
- prettyunits          :                Pretty, Human Readable Formatting of Quantities
- pROC                 :                Display and Analyze ROC Curves
- processx             :                Execute and Control System Processes
- prodlim              :                Product-Limit Estimation for Censored Event History Analysis
- progress             :                Terminal Progress Bars
- projpred             :                Projection Predictive Feature Selection
- promises             :                Abstractions for Promise-Based Asynchronous Programming
- ps                   :                List, Query, Manipulate System Processes
- purrr                :                Functional Programming Tools
- qgraph               :                Graph Plotting Methods, Psychometric Data Visualization and Graphical Model Estimation
- quantreg             :                Quantile Regression
- R6                   :                Encapsulated Classes with Reference Semantics
- rappdirs             :                Application Directories: Determine Where to Save Data, Caches, and Logs
- rcmdcheck            :                Run 'R CMD check' from 'R' and Capture Results
- RColorBrewer         :                ColorBrewer Palettes
- Rcpp                 :                Seamless R and C++ Integration
- RcppArmadillo        :                'Rcpp' Integration for the 'Armadillo' Templated Linear Algebra Library
- RcppEigen            :                'Rcpp' Integration for the 'Eigen' Templated Linear Algebra Library
- RcppRoll             :                Efficient Rolling / Windowed Operations
- RCurl                :                General Network (HTTP/FTP/...) Client Interface for R
- readr                :                Read Rectangular Text Data
- readxl               :                Read Excel Files
- recipes              :                Preprocessing Tools to Create Design Matrices
- RefManageR           :                Straightforward 'BibTeX' and 'BibLaTeX' Bibliography Management
- registry             :                Infrastructure for R Package Registries
- rematch              :                Match Regular Expressions with a Nicer 'API'
- rematch2             :                Tidy Output from Regular Expression Matching
- remotes              :                R Package Installation from Remote Repositories, Including 'GitHub'
- reprex               :                Prepare Reproducible Example Code via the Clipboard
- reshape              :                Flexibly Reshape Data
- reshape2             :                Flexibly Reshape Data: A Reboot of the Reshape Package
- rex                  :                Friendly Regular Expressions
- rhub                 :                Connect to 'R-hub'
- rio                  :                A Swiss-Army Knife for Data I/O
- rJava                :                Low-Level R to Java Interface
- rjson                :                JSON for R
- rlang                :                Functions for Base Types and Core R and 'Tidyverse' Features
- rmarkdown            :                Dynamic Documents for R
- rmdshower            :                'R' 'Markdown' Format for 'shower' Presentations
- RMySQL               :                Database Interface and 'MySQL' Driver for R
- rngtools             :                Utility Functions for Working with Random Number Generators
- roxygen2             :                In-Line Documentation for R
- RPostgreSQL          :                R Interface to the 'PostgreSQL' Database System
- rprojroot            :                Finding Files in Project Subdirectories
- rsconnect            :                Deployment Interface for R Markdown Documents and Shiny Applications
- RSQLite              :                'SQLite' Interface for R
- rstanarm             :                Bayesian Applied Regression Modeling via Stan
- rstantools           :                Tools for Developing R Packages Interfacing with 'Stan'
- rstudioapi           :                Safely Access the RStudio API
- rversions            :                Query 'R' Versions, Including 'r-release' and 'r-oldrel'
- rvest                :                Easily Harvest (Scrape) Web Pages
- sandwich             :                Robust Covariance Matrix Estimators
- scales               :                Scale Functions for Visualization
- selectr              :                Translate CSS Selectors to XPath Expressions
- servr                :                A Simple HTTP Server to Serve Static Files or Dynamic Documents
- sessioninfo          :                R Session Information
- shiny                :                Web Application Framework for R
- shinyjs              :                Easily Improve the User Experience of Your Shiny Apps in Seconds
- shinystan            :                Interactive Visual and Numerical Diagnostics and Posterior Analysis for Bayesian Models
- shinythemes          :                Themes for Shiny
- sourcetools          :                Tools for Reading, Tokenizing and Parsing R Code
- sp                   :                Classes and Methods for Spatial Data
- SparseM              :                Sparse Linear Algebra
- spelling             :                Tools for Spell Checking in R
- SQUAREM              :                Squared Extrapolation Methods for Accelerating EM-Like Monotone Algorithms
- StanHeaders          :                C++ Header Files for Stan
- stringdist           :                Approximate String Matching and String Distance Functions
- stringi              :                Character String Processing Facilities
- stringr              :                Simple, Consistent Wrappers for Common String Operations
- svUnit               :                SciViews GUI API - Unit testing
- sylly                :                Hyphenation and Syllable Counting for Text Analysis
- sylly.en             :                Language Support for 'sylly' Package: English
- sys                  :                Powerful and Reliable Tools for Running System Commands in R
- testit               :                A Simple Package for Testing R Packages
- testthat             :                Unit Testing for R
- threejs              :                Interactive 3D Scatter Plots, Networks and Globes
- tibble               :                Simple Data Frames
- tidybayes            :                Tidy Data and 'Geoms' for Bayesian Models
- tidyr                :                Easily Tidy Data with 'spread()' and 'gather()' Functions
- tidyselect           :                Select from a Set of Strings
- timeDate             :                Rmetrics - Chronological and Calendar Objects
- tinytex              :                Helper Functions to Install and Maintain 'TeX Live', and Compile 'LaTeX'Documents
- tufte                                Tufte's Styles for R Markdown Documents
- usethis              :                Automate Package and Project Setup
- utf8                 :                Unicode Text Processing
- uuid                 :                Tools for generating and handling of UUIDs
- V8                   :                Embedded JavaScript Engine for R
- viridis              :                Default Color Maps from 'matplotlib'
- viridisLite          :                Default Color Maps from 'matplotlib' (Lite Version)
- webshot              :                Take Screenshots of Web Pages
- whisker              :                {{mustache}} for R, logicless templating
- whoami              :                 Username, Full Name, Email Address, 'GitHub' Username of the Current User
- withr                :                Run Code 'With' Temporarily Modified Global State
- wrapr                :                Wrap R Tools for Debugging and Parametric Programming
- xfun                 :                Miscellaneous Functions by 'Yihui Xie'
- XML                  :                Tools for Parsing and Generating XML Within R and S-Plus
- xml2                 :                Parse XML
- xopen                :                Open System Files, 'URLs', Anything
- xtable               :                Export Tables to LaTeX or HTML
- xts                  :                eXtensible Time Series
- yaml                 :                Methods to Convert R Data to YAML and Back
- zip                  :                Cross-Platform 'zip' Compression
- zoo                  :                S3 Infrastructure for Regular and Irregular Time Series (Z's Ordered Observations)
