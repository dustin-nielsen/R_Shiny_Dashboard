mytheme <- bs_theme(version = 5,
                    bootswatch = 'yeti',
                    bg = '#FFF',
                    fg = '#512888')

ui <- navbarPage(title = 'Patent Analytics',
                   theme = mytheme,
                   tabPanel(title = 'Home',

                            wellPanel(
                              h4('Patent Analytics')
                            )
                          )
                 ),
                 tabPanel(title = 'Competitive Analysis',
                          fluidPage(
                            fluidRow(
                              HTML('<p style = "padding-left: 30px; font-size: 20px;"> Competitive Positioning </p>
                                      <br>
                                      <p style = "padding-left: 30px;"> This page analyzes the market cpc to find trends </p>')
                              ),
                              hr(),br(),
                              fluidRow(
                                column(width = 3,
                                       h4('Inputs'),
                                       wellPanel(
                                         selectInput(inputId = 'market_cpcs_input',label = 'Market CPCs',choices = unique_cpc_group, multiple = TRUE,width = '100%'),
                                         #selectInput(inputId = 'submarket_cpcs_input',label = 'Submarket CPCs',choices = unique_cpc_group, multiple = TRUE,width = '100%'),
                                         textAreaInput(inputId = 'submarket_cpcs_input',label = 'Submarket CPCs (comma separated, in quotes)'),
                                         textAreaInput(inputId = 'submarket_labels_input',label = 'Submarket labels (comma separated)'),
                                         actionButton(inputId = 'generate_competitive_positioning',label = 'Generate',width = '100%')
                                       )
                                ),
                                column(width = 8, offset = 1,
                                       h4('Outputs'),
                                       DTOutput(outputId = 'competition_dt')
                                ),
                              ),
                              column(width = 6,
                                     h4('USA County Graph'),
                                     plotlyOutput(outputId = 'competition_plot')
                              )
                            )
                   ),
                   tabPanel(title = 'Technology Trends',
                            h4('Another test...'),
                            DTOutput(outputId = 'competition_sub_seg')
                            )
                        )
                 )
    
)

