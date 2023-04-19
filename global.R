library(tidyverse)
library(data.table)
library(shiny)
library(shinythemes)
library(shinydashboard)
library(plotly)
library(bslib)
library(feather)
library(DT)
library(rjson)
library(stm)
library(udpipe)

#setwd("C:/GitHubProjects/Strat/R_Shiny_Dashboard")
load('data/unique_cpc_group.Rdata')
assignee <- read_feather('data/g_assignee_disambiguated_2012_2021.feather')
location <- read_feather('data/g_location_disambiguated_2012_2021.feather')
patent <- read_feather('data/g_patent_2012_2021.feather')
cpc <- read_feather('data/g_cpc_current_2012_2021.feather')
cpc$patent_id <- as.character(cpc$patent_id)
# # unique_cpc_group <- head(unique_cpc_group)
# cpc <- head(cpc)






