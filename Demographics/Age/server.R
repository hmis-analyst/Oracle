# APP: AGE
#------------------------------------
#------------------------------------

# Load shiny, RODBC, and ggplot2 packages
library(shinyIncubator)
library(RJDBC)
library(ggplot2)
library(stringr)


libPath1 <- "~/HMIS Data Analyst/lib/"
libPath2 <- "../../lib/"

#######################################################################
# Run preparatory code
#----------------------------------------------------------------------
# Establish JDBC connection using RJDBC
source(paste(libPath1,"conn-Ora-Georgia_Base.r",sep=""),local=TRUE)
# Create custom functions
source(paste(libPath2,"customFunctions.r",sep=""),local=TRUE)
#######################################################################

# Define server logic required to query/graph HMIS Age data
shinyServer(function(input, output, session) {

  # Import Data Options server code
  source(paste(libPath2,"DataOptions-Ora.server.r",sep=""), local=TRUE)
  source("data.R",local=TRUE)
  source("plots.R",local=TRUE)
  source("mainPanel.R",local=TRUE)

})
