library(tidyverse)
library(data.table)
library(shiny)
library(shinythemes)
library(shinydashboard)
library(plotly)
library(bslib)
library(feather)
library(DT)

# setwd("C:/GitHubProjects/Strat/R_Shiny_Dashboard")
# load('data/unique_cpc_groups/unique_cpc_group.Rdata')
# assignee <- read_feather('data/g_assignee_disambiguated_2012_2021.feather')
# location <- read_feather('data/g_location_disambiguated_2012_2021.feather')
# patent <- read_feather('data/g_patent_2012_2021.feather')
# cpc <- read_feather('data/g_cpc_current_2012_2021.feather')
# cpc$patent_id <- as.character(cpc$patent_id)
# # unique_cpc_group <- head(unique_cpc_group)
# cpc <- head(cpc)

#>>>>>>> f4e1fc6518bc44e1ad0f0020778c23af4e9d5972

# Resources
# https://shiny.rstudio.com/
# https://shiny.rstudio.com/gallery/
# Icons https://fontawesome.com/search?o=r&m=free
# HTML tags https://shiny.rstudio.com/articles/tag-glossary.html
# Inputs https://shiny.rstudio.com/tutorial/written-tutorial/lesson3/

# Agenda:
# Server
# Reactivity
# Reactive values
# Inputs
# Server logic
# Rendering outputs
# Displaying in UI
# Observers
# Debugging - browser()
# Work together in class:
# Add code from competetive positioning assignemnt to make your app interactive




