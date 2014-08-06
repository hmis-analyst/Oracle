# APP: DATA ELEMENTS
#------------------------------------
#------------------------------------

#.libPaths("~/R/win-library/3.1")
# install.packages("devtools",repos="http://cran.rstudio.com/")
# devtools::install_github("shiny-incubator", "rstudio")
# install.packages("RJDBC",repos="http://cran.rstudio.com/")
# install.packages("ggplot2",repos="http://cran.rstudio.com/")
# install.packages("reshape2",repos="http://cran.rstudio.com/")
# install.packages("stringr",repos="http://cran.rstudio.com/")

# Load packages
library(shinyIncubator)
library(RJDBC)
library(ggplot2)
library(reshape2)
library(stringr)

# Set library paths
libPath1 <- "~/HMIS Data Analyst/lib/"
libPath2 <- "../../lib/"

# Establish JDBC connection using RJDBC
source(paste(libPath1,"conn-Ora-Georgia_Base.r",sep=""),local=TRUE)

# Define server logic required to query/graph HMIS gender data
shinyServer(function(input, output, session) {

  source(paste(libPath2,"DataOptions-Ora.server.r",sep=""), local=TRUE)
  source("mainQueries.r",local=TRUE)
  source("tables.r",local=TRUE)
  source("plots.r",local=TRUE)
  source("mainPanel.r",local=TRUE)
  source("downloads.r",local=TRUE)

})
