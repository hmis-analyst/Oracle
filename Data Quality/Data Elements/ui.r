# .libPaths("~/R/win-library/3.1")
# install.packages("devtools",repos="http://cran.rstudio.com/")
# devtools::install_github("shiny-incubator", "rstudio")
# install.packages("RJDBC",repos="http://cran.rstudio.com/")

# Load shiny and RODBC packages
library(shinyIncubator)
#library(shiny)
library(RJDBC)

libPath1 <- "~/HMIS Data Analyst/lib/"

# Establish JDBC connection using RJDBC
source(paste(libPath1,"conn-Ora-Georgia_Base.r",sep=""),local=TRUE)

shinyUI(basicPage(
  progressInit(),
  # Call a separate HTML file to create bars, headers, layouts
  includeHTML("lib/page.html"),
  fluidRow(
    column(4,
      tags$form(class="well noprint",
        h3("Data Elements",align="center"),
        tabsetPanel(selected="Data Options",
          tabPanel("Instructions",
            p('1. FIRST select your data options.'),
            p('2. Click the "Analyze" button.'),
            p('3. When the analysis is complete, the Main Panel will update. Upon completion, you will
               also be able to download your data as a spreadsheet.'),
            p('4. If you are not satisfied with the appearance of the report, 
               you can modify the viewing options.')
          ),
          tabPanel("Data Options",
            # Require user to click "ANALYZE" button in order for graph to update
            div(actionButton("update",strong("ANALYZE"),icon=icon("arrow-circle-right")),align="right"),
            br(),
            conditionalPanel(
              condition = "input.reportLevel == 'Program'",
              textInput("passkey","Enter passkey to access client data")
            ),
            checkboxInput("APR", "APR records only", FALSE),
            br(),
            # Display date range input with default values
            dateRangeInput("daterange","Date range", format='mm/dd/yyyy',start="2013-07-01",max=Sys.Date()),
            br(),
            # Display radio buttons with 3 defined report levels
            radioButtons("reportLevel", "Report level",list("Group","Agency","Program"),selected="Program"),
            br(),
            # Display "Group Name" select list when user chooses "Group" report level
            conditionalPanel(
              # Define condition of this display
              condition = "input.reportLevel == 'Group'",
              # Query Pathways group names to populate select list
              selectInput("groupSelect", "Group name",as.list(as.character(
                dbGetQuery(connection,"
                  SELECT unique Group_Name 
                  FROM Community_Group_Information
                  ORDER BY Group_Name"
                )[[1]]
              )))
            ),
            # Display "Agency Name" select list when user chooses "Agency" or "Program" report levels
            conditionalPanel(
              # Define condition of this display
              condition = "input.reportLevel == 'Agency' | input.reportLevel == 'Program'",
              # Query agency names to populate select list
              selectInput("agencySelect", "Agency name",as.list(as.character(
                dbGetQuery(connection,"
                  SELECT unique Agency_Name 
                  FROM Program_Profile_Info
                  ORDER BY Agency_Name"
                )[[1]]
              )))
            ),
            # Display "Program Name" select list when user chooses "Program" report level
            conditionalPanel(
              # Define condition of this display
              condition = "input.reportLevel == 'Program'",
              # Call "programChoices" (reactive select list, defined in server.R)
              # Display on sidebar
              uiOutput("programChoices")
            ),
            br(),
            uiOutput("programTypes"),
            br(),br(),br(),br(),br(),br(), br()
          ),
          tabPanel("Viewing Options",
            checkboxInput("printable", "Printable", FALSE)
          ),
          tabPanel("About",
            p(strong("Title:"),"Georgia HMIS Data Quality: Data Elements"),
            p(strong("Version:"),"2.4.0"),
            p(strong("Date:"),"15 July 2014"),
            p(strong("Description:"),"Set of customizable reports and charts for the purpose of reporting
              and improving data quality among homeless service providers in the state of Georgia"),
            p(strong("Bug reports:"),"Send to ",a(href="mailto:jason.m.rodriguez@vanderbilt.edu","jason.m.rodriguez@vanderbilt.edu")),
            p(div(strong("Source code:"),"View on",a(href="https://github.com/hmis-analyst/shiny-apps-oracle/tree/master/Data%20Quality","GitHub"))),
            p(strong('Changes since last version:')),
            p(' - Added "long-term stayers" data element'),
            p(' - Updated Summary table to include unaccompanied children and long-term stayers')
            p(' - Minor bug fixes')
          )
        )
      )
    ),
    column(8,
      div(style="width: 100%; height: 400px;",
        uiOutput("mainPanel")
      )
    )
  )
))