

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
    
    competition$dt <- dt #temp head(dt)
    
    output$competition_dt <- renderDT({
      datatable(
        competition$dt,
        #colnames = colnames(competition$dt)[1:6,8,10,13]
        #select = c("patent_id","cpc_group","patent_date","patent_title","num_claims","disambig_assignee_organization", "disambig_assignee_individual_name_first", "disambig_assignee_individual_name_last")
        #options = list(
        #  columnDefs = list(list(targets = c(2, 3, 4, 5, 6, 7), searchable = FALSE))
        #)
      )
    })
    
    # renderDT({
    #   datatable(data, 
    #             options = list(
    #               columnDefs = list(list(targets = c(2, 3), searchable = FALSE))
    #             )
    #   )
    # })
  })
  
  # Reactivity:
  # As a general rule, use reactive() when you just want to update something based on a new value (e.g. a user input)
  # and use reactiveVal or reactiveValues when you have an object that you want to maintain a state
  
  # # Reactive objects:
  # text_labels_input <- reactive({
  #   req(input$submarket_labels_input)
  #   paste('You entered: ',input$submarket_labels_input,sep = '',collapse = '')
  #   })
  # output$text_labels_output <- renderText({text_labels_input()})
  # 
  # # # Reactive objects:
  # market_cpc_input_text <- reactive({
  #   req(input$market_cpcs_input)
  #   paste(input$market_cpcs_input,sep = '',collapse = ', ')
  #   })
  # output$market_cpc_output <- renderText({market_cpc_input_text()})
  # 
  # 
  # # Reactive values and observers
  # r_list <- reactiveValues(txt = 'You entered: ',txt2 = 'You typed: ')
  # observe({
  #   output$text_labels_output <- renderText({
  #     paste(r_list$txt, input$submarket_labels_input,sep = '',collapse = '')
  #   })
  #   })
  # 
  # 
  # # ObserveEvent
  # r_list <- reactiveValues(txt = 'You entered: ',txt2 = 'You typed: ')
  # observeEvent(input$generate_competitive_positioning,{
  #   r_list$txt <- paste(r_list$txt, input$submarket_labels_input,sep = '',collapse = '')
  # })
  # output$text_labels_output <- renderText({
  #   r_list$txt
  # })
  # 
  # 
  # # Debugging - browser()
  #   r_list <- reactiveValues(txt = 'You entered: ',txt2 = 'You typed: ')
  #   observeEvent(input$generate_competitive_positioning,{
  #     browser()
  #     temp <- 1
  #     print(temp*5)
  #     r_list$txt <- paste(r_list$txt, input$submarket_labels_input,sep = '',collapse = '')
  # 
  #   })
  #   output$text_labels_output <- renderText({
  #     r_list$txt
  #   })
}
