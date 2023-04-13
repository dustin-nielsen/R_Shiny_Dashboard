

# Define UI ----
# FROM WEBSITE - LIST OF WIDGETS
#  ui <- fluidPage(
#   titlePanel("Basic widgets"),
#  
#    fluidRow(
#  
#     column(3,
#             h3("Buttons"),
#            actionButton("action", "Action"),
#            br(),
#            br(),
#            submitButton("Submit")),
# 
#     column(3,
#            h3("Single checkbox"),
#            checkboxInput("checkbox", "Choice A", value = TRUE)),
# 
#     column(3,
#            checkboxGroupInput("checkGroup",
#                               h3("Checkbox group"),
#                               choices = list("Choice 1" = 1,
#                                              "Choice 2" = 2,
#                                              "Choice 3" = 3),
#                               selected = 1)),
# 
#     column(3,
#            dateInput("date",
#                      h3("Date input"),
#                      value = "2014-01-01"))
#   ),
# 
#   fluidRow(
# 
#     column(3,
#            dateRangeInput("dates", h3("Date range"))),
# 
#     column(3,
#            fileInput("file", h3("File input"))),
# 
#     column(3,
#            h3("Help text"),
#            helpText("Note: help text isn't a true widget,",
#                     "but it provides an easy way to add text to",
#                     "accompany other widgets.")),
# 
#     column(3,
#            numericInput("num",
#                         h3("Numeric input"),
#                         value = 1))
#   ),
# 
#   fluidRow(
# 
#     column(3,
#            radioButtons("radio", h3("Radio buttons"),
#                         choices = list("Choice 1" = 1, "Choice 2" = 2,
#                                        "Choice 3" = 3),selected = 1)),
# 
#     column(3,
#            selectInput("select", h3("Select box"),
#                        choices = list("Choice 1" = 1, "Choice 2" = 2,
#                                       "Choice 3" = 3), selected = 1)),
# 
#     column(3,
#            sliderInput("slider1", h3("Sliders"),
#                        min = 0, max = 100, value = 50),
#            sliderInput("slider2", "",
#                        min = 0, max = 100, value = c(25, 75))
#     ),
# 
#     column(3,
#            textInput("text", h3("Text input"),
#                      value = "Enter text..."))
#   )
# )
# 

################################################################################
################################################################################
# Layout
# fluidpage
# navbarpage
# shinydashboard


################################################################################
# fluidpage

# ui <- fluidPage(
# 
#   fluidRow(
#     h1('Page title')
#   ),
#   fluidRow(
#     column(width = 6,
#            wellPanel(
#              p('Hello world')
#            )
#            ),
#     column(width = 6,
#            wellPanel(
#              p('Panel 2')
#            )
#            )
#   ),
#   tabsetPanel(
#     tabPanel(title = 'Inputs',
#              wellPanel(
#             textInput(inputId = 'my_input',label = 'Input',width = '200px',placeholder = 'Enter text here')
#              )),
#     tabPanel(title = 'Outputs',
#              wellPanel(
#                plotlyOutput(outputId = 'my_output')
#              ))
#   )
# 
# )



################################################################################
# navbarpage

# ui <- navbarPage(title = 'Patent Analytics',
# 
#   tabPanel(title = 'Home',
#            titlePanel('Home'),
#            sidebarLayout(
#              sidebarPanel = sidebarPanel(width = 3,
#                                          h4('Side bar')
#                                          ),
#              mainPanel = mainPanel(
#                tags$h4('Main bar')
#              )
#            )
#            ),
# 
#   tabPanel(title = 'Competitive positioning',
#            # fluidPage(
#            #   fluidRow()
#            # )
#            fluidPage(
# 
#              fluidRow(
#                h1('Page title')
#              ),
#              fluidRow(
#                column(width = 6,
#                       wellPanel(
#                         p('Hello world')
#                       )
#                       ),
#                column(width = 6,
#                       wellPanel(
#                         p('Panel 2')
#                       )
#                       )
#              ),
#              tabsetPanel(
#                tabPanel(title = 'Inputs',
#                         wellPanel(
#                        textInput(inputId = 'my_input',label = 'Input',width = '200px',placeholder = 'Enter text here')
#                         )),
#                tabPanel(title = 'Outputs',
#                         wellPanel(
#                           plotlyOutput(outputId = 'my_output')
#                         ))
#              )
# 
#            )
# 
# 
#            ),
# 
#   tabPanel(title = 'Technology trends',
# 
# 
# 
#            )
# 
# )

################################################################################
# dashboard

# ui <- shinydashboard::dashboardPage(
# 
#   # header
#       dashboardHeader(title = 'Patent analytics'),
# 
#   # sidebar
#       dashboardSidebar(
#         sidebarMenu(
#           menuItem(text = 'Page 1',tabName = 'page1'),
#           menuItem(text = 'Page 2',tabName = 'page2',
#                    menuSubItem('Page 2.1',tabName = 'page2-1'),
#                    menuSubItem('Page 2.2',tabName = 'page2-2')
#                    )
#         )
# 
#       ),
#   # body
#       dashboardBody(
#         tabItems(
#           tabItem(tabName = 'page1',
#                   tags$h4('Hello world')
#           ),
#           tabItem(tabName = 'page2-1',
#                   HTML('<p style="font-size:18pt; color:blue;">Hello world</p>'),
#                   mainPanel(
#                     fluidPage(
#                       fluidRow(
#                         h1('Page title')
#                       ),
#                       fluidRow(
#                         column(width = 6,
#                                wellPanel(
#                                  p('Hello world')
#                                )
#                         ),
#                         column(width = 6,
#                                wellPanel(
#                                  p('Panel 2')
#                                )
#                         )
#                       ),
#                       tabsetPanel(
#                         tabPanel(title = 'Inputs',
#                                  wellPanel(
#                                    textInput(inputId = 'my_input',label = 'Input',width = '200px',placeholder = 'Enter text here')
#                                  )),
#                         tabPanel(title = 'Outputs',
#                                  wellPanel(
#                                    plotlyOutput(outputId = 'my_output')
#                                  ))
#                     ))
# 
#           ),
#           tabItem(tabName = 'page2-2',
#                   HTML('<p style="font-size:24pt; color:red;">Hello world</p>'),
#                   sidebarPanel(
#                     h1('this is my sidebar')
#                   ),
#                   mainPanel(
# 
#                   )
#           )
#         )
# 
#       )
# 
# 
# )


################################################################################
################################################################################
# Look/feel
# html
# css
# bslib
# shiny themes


################################################################################
# html

# customize look using html attributes 
# ui <- navbarPage(title = 'Patent analytics',
#                  tabPanel(title = 'Home',
#                           wellPanel(
#                             HTML('<p style="font-size:20px;font-weight:bold;background-color: #000;">Some text here</p>')
#                           )
#                  ),
#                  tabPanel(title = 'Charts',
#                  )
# 
# )




################################################################################
# css

# adding css to html elements directly 
# ui <- navbarPage(title = 'Patent analytics',
#                  tabPanel(title = 'Home',
# 
#                           wellPanel(style = 'margin-top: 20px; margin-left: 25px; background-color: coral;',
#                             p(style = 'background-color: #000; font-size: 20px;','Some text here')
#                             # same as 
#                             # HTML('<p style="font-size:20px;font-weight:bold;background-color: #000;">Some text here</p>')
#                           )
#                  ),
#                  tabPanel(title = 'Charts',
#                  )
# 
# )


# adding a custom css file
# ui <- navbarPage(title = 'Patent analytics', 
#                  #theme = 'custom.css',
#                  tabPanel(title = 'Home',
#                           
#                           wellPanel(
#                             p('Some text here')
#                           )
#                  ),
#                  tabPanel(title = 'Charts',
#                  )
#                  
# )


################################################################################
# bslib (shinythemes library also offers bootswatch themes)

# bootswatch_themes()
# https://bootswatch.com/

mytheme <- bs_theme(version = 5,
                    bootswatch = 'yeti',
                    bg = '#FFF',
                    fg = '#512888')

  ui <- navbarPage(title = 'Patent Analytics',
                   theme = mytheme,
                   tabPanel(title = 'Home',

                            wellPanel(
                              p('Rett Was Here'),
                              column(3,
                                     selectInput("select", h3("Select box"),
                                     choices = cpc$patent_id)
                                     )
                            )
                   ),
                   tabPanel(title = 'Competitive Analysis',
                            p('Testing')
                   ),
                   tabPanel(title = 'Technology Trends',
                            P('Another test...')
                            )
                    bootswatch = 'cosmo',
                    bg = '#000',
                    fg = '#FFF')

  ui <- navbarPage(title = 'Patent analytics',
                   theme = mytheme,
                   tabPanel(title = 'Home',
                             titlePanel('Home'),
                             sidebarLayout(
                               sidebarPanel = sidebarPanel(width = 3,
                                                           h4('Side bar')
                                                           ),
                               mainPanel = mainPanel(
                                 tags$h4('Main bar')
                               )
                             )
                             ),

                    tabPanel(title = 'Competitive positioning',
                             fluidPage(
                               fluidRow(
                                 HTML('<p style = "padding-left: 30px; font-size: 20px;"> Competitive Positioning </p>
                                      <br>
                                      <p style = "padding-left: 30px;"> This page analyzes the cop pasldf </p>')
                               ),
                               hr(),br(),
                               column(width = 3,
                                      h4('Inputs'),
                                      wellPanel(
                                        selectInput(inputId = 'market_cpcs_input',label = 'Market CPCs',choices = unique_cpc_group, multiple = TRUE),
                                        #selectInput(inputId = 'submarket_cpcs_input',label = 'Submarket CPCs',choices = unique_cpc_group),
                                        textAreaInput(inputId = 'submarket_labels_input',label = 'Submarket labels (comma separated'),
                                        actionButton(inputId = 'generate_competitive_positioning',label = 'Generate',width = '35%')
                                      )
                                      ),
                               column(width = 8, offset = 1,
                                      h4('Outputs'),
                                      textOutput(outputId = 'text_labels_output'),
                                      DTOutput(outputId = 'competition_dt')
                                      )
                               )

                             ),

                    tabPanel(title = 'Technology trends',
                             fluidPage(
                               fluidRow(
                                 
                               )
                             )


                             )

  )




################################################################################
################################################################################
# Inputs and outputs

# https://shiny.rstudio.com/tutorial/written-tutorial/lesson3/
# https://fontawesome.com/search?o=r&m=free

# ui <- navbarPage(title = 'Patent analytics',
#                  theme = 'custom.css',
#                  tabPanel(title = 'Home',
#                           column(width = 6,
#                                  wellPanel(
#                                    p('Inputs'),
#                                    selectInput(inputId = 'input1',
#                                                label = 'Select input',
#                                                choices = c('Option 1','Option 2','Option 3'),
#                                                multiple = T,
#                                                width = '200px'),
#                                    actionButton(inputId = 'button1',label = 'Github',icon = icon('github')
#                                                 )
#                                  )
#                                  ),
#                           column(width = 6,
#                                  wellPanel(
#                                    p('Outputs'),
#                                    plotlyOutput(outputId = 'chart1')
#                                  )
#                                  )
# 
#                  ),
#                  tabPanel(title = 'Charts',
#                  )
# 
# )