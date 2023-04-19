

################################################################################
# define the server function

server <- function(input,output,session) {
  
  # Define reactive values
  competition <- reactiveValues(dt = data.frame(),plot = plotly_empty())
  
  # Observers
  
  observeEvent(input$generate_competitive_positioning,{
    # Filter the cpc codes
    dt <- cpc %>% filter(grepl(pattern = paste(input$market_cpcs_input,sep = '',collapse = '|'),x = cpc$cpc_group,ignore.case = T))
    # merge with patents
    dt <- merge(dt,patent,by = 'patent_id')
    # merge with assignee
    dt <- merge(dt,assignee,by = 'patent_id')
    # merge location 
    dt <- merge(dt,location,by = 'location_id')

    # Get top 10 companies
    totals <- dt %>%
      filter(disambig_assignee_organization!='') %>%
      group_by(disambig_assignee_organization) %>%
      summarize(total=uniqueN(patent_id))

    totals <- totals[order(totals$total,decreasing = T),] %>% slice(1:10)

    # Calculate 5 year CAGR for top 10 companies
    cagr <- data.frame(expand.grid(year=2017:2021,disambig_assignee_organization=totals$disambig_assignee_organization))

    temp <- dt %>%
      filter(disambig_assignee_organization %in% totals$disambig_assignee_organization) %>%
      group_by(year=year(patent_date),disambig_assignee_organization) %>%
      summarise(n=uniqueN(patent_id))
    cagr <- merge(cagr,temp,by = c('year','disambig_assignee_organization'),all.x = T)
    rm(temp)
    cagr[is.na(cagr)] <- 0
    cagr <- cagr %>%
      group_by(disambig_assignee_organization) %>%
      mutate(cum_cnt = cumsum(n)) %>%  # make sure your date are sorted correctly before calculating the cumulative :)
      filter(year %in% c(2017,2021)) %>%
      pivot_wider(id_cols = disambig_assignee_organization,names_from = year,values_from = cum_cnt)
    cagr$cagr_2017_2021 <- round(((cagr$`2021`/cagr$`2017`)^(1/5))-1,3)


    # Calculate avg claim count for top 10 companies
    claims <- dt %>%
      filter(disambig_assignee_organization %in% totals$disambig_assignee_organization) %>%
      select(disambig_assignee_organization,patent_id,num_claims) %>%
      unique() %>%
      group_by(disambig_assignee_organization) %>%
      summarise(avg_claims=round(mean(num_claims)))

    # Combine and save file
    totals <- merge(totals,cagr,by = 'disambig_assignee_organization')
    totals <- merge(totals,claims,by = 'disambig_assignee_organization')
    totals <- totals %>% select(-`2017`,-`2021`)
    
    competition$dt <- totals
    
    output$competition_dt <- renderDT({
      datatable(
        competition$dt
      )
    })
    
    # Identify patents in each segment (benefit of doing it this way? scale)
    # segments_names <- c('Photovoltaic','Wind','Other Renewable Energy Sources', 'Combustion Mitigation', 'Nuclear', 'Electrical Efficiency', 'Non-Fossil Fuel', 'Energy Storage', 'Hydrogen', 'Other GHG Reduction Technology')
    # segments_codes <- c('Y02E10/5','Y02E10/7','Y02E10/1|Y02E10/2|Y02E10/3|Y02E10/4|Y02E10/6', 'Y02E2', 'Y02E3', 'Y02E4', 'Y02E5', 'Y02E60/1', 'Y02E60/3|Y02E60/5', 'Y02E60/6|Y02E7')
    segments_names <- unlist(strsplit(input$submarket_labels_input, ","))
    segments_codes <- unlist(strsplit(input$submarket_cpcs_input, ","))
    
    segments_dtlist <- list()
    for (segment in segments_codes) {
      segments_dtlist[[length(segments_dtlist)+1]] <- dt[grepl(pattern = segment,x = dt$cpc_group,ignore.case = T),c('patent_id','disambig_assignee_organization')] %>% unique()
    }
    names(segments_dtlist) <- segments_names
    
    # Assemble data and pivot
    for (segment in segments_names) {
      temp <- segments_dtlist[[segment]] %>% group_by(disambig_assignee_organization) %>% summarise(n=uniqueN(patent_id))
      colnames(temp)[colnames(temp)=='n'] <- segment
      totals <- merge(totals,temp,by = 'disambig_assignee_organization',all.x = T)
    }  
    totals[is.na(totals)] <- 0
    
    totals <- totals %>% arrange(desc(total))
    
    competition$sub_seg <- totals
    
    output$competition_sub_seg <- renderDT({
      datatable(
        competition$sub_seg
      )
    })
    
    # tidy up the location data
    dt$state_fips <- str_pad(string = dt$state_fips,width = 2,side = 'left',pad = '0')
    dt$county_fips <- str_pad(string = dt$county_fips,width = 3,side = 'left',pad = '0')
    dt$fips <- paste(dt$state_fips,dt$county_fips,sep = '')

    # County level
    # Summarize data by county
    dt_county <- dt %>%
      filter(!is.na(county_fips)) %>%
      group_by(disambig_state,county,fips) %>%
      summarise(n=uniqueN(patent_id))

    # get geojson files for mapping
    url <- 'https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json'
    counties <- rjson::fromJSON(file = url)

    g <- list(
      scope = 'usa',
      projection = list(type = 'albers usa'),
      showlakes = TRUE,
      lakecolor = toRGB('white')
    )

    fig <- plot_ly()
    fig <- fig %>% add_trace(
      type="choropleth",
      geojson=counties,
      locations= dt_county$fips,
      z=dt_county$n,
      colorscale="Viridis",
      zmin=0,
      zmax=3000,
      marker=list(line=list(
        width=0)
      )
    )
    fig <- fig %>% colorbar(title = "Number of patents")
    fig <- fig %>% layout(
      title = "Patents granted by county",
      geo = g
    )

    competition$plot <- fig

    output$competition_plot <- renderPlotly({
      competition$plot
    })

  observeEvent(input$generate_tech_trend,{  
    output$chart_tech_trends <- renderPlotly({
        plot_ly(competition$dt, x = ~patent_date, y = ~num_claims)
    })
  })
  })

}
