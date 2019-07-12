library(shiny)
library(shinydashboard)
library(shinyjs)
library(htmltools)
library(dplyr)
library(ggplot2)
library(leaflet)


#var
bool<- FALSE


#custom function

jscode <- '
Shiny.addCustomMessageHandler("mymessage", function(message) {
  alert(message);
});
'



##### Section 1 #####

ui <- dashboardPage( 
 # title = span(tagList(icon("fab fa-connectdevelop"), "   evalurate")
    dashboardHeader( disable = TRUE ),

  dashboardSidebar( disable = TRUE,
    hr(),
    useShinyjs(),
    sidebarMenu(id = "menu",
                tags$head(tags$style(".inactiveLink {
                            pointer-events: none;
                           cursor: default;
                           }")),
                menuItem("Property", tabName = "property_nav", selected = TRUE),
                menuItem("Report", tabName = "report_nav"),
                menuItem("About", tabName = "readme", icon = icon("info"))
                
    ),
    
    helpText("Developed by ", 
             a("evalurate", href = "http://..."), ".",
             style = "padding-left:1em; padding-right:1em;position:absolute; bottom:1em; ")
    
  ),
  
  dashboardBody(
    
    tags$head(
      tags$script(HTML(jscode)),
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
      tags$link(href="https://fonts.googleapis.com/css?family=Comfortaa:400,700", rel="stylesheet"),
      tags$title('evalurate'),
      tags$meta(charset="UTF-8"),
      tags$meta(name="viewport", content="width=device-width, initial-scale=1.0"),
      tags$meta(name="description", content="Evalurate risk evaluation pf property market dynamics for investors")
    ),
    
    
    tags$script(HTML("$('body').addClass('fixed');")),
    
    htmltools::tags$head(
      
      htmltools::tags$style(
        
        htmltools::HTML(
          
            '
            
            /* body */
            .content-wrapper {
            background: #f7f7f7;
            
            }
            /* font */
           /* body, label, input, button, select, box,
            .h1, .h2, .h3, .h4, .h5, h1, h2, h3, h4, h5 {
            color: #161c21;
            }*/
            /* font: fix for h6 */
            /* messes up sidebar user section if included above */
            .h6, h6 {

            }
            /* sidebar: logo */
            .skin-blue .main-header .logo {
            background: #f2f2f2;
            color: #161c21;
            font-size:22px;
            }
            /* sidebar: logo hover */
            .skin-blue .main-header .logo:hover {
            background: #f2f2f2;
            }
            /* sidebar: collapse button  */
            .skin-blue .main-header .navbar .sidebar-toggle {
            background: #f7f7f7;
            color: #161c21;
            }
            /* sidebar: collapse button hover */
            .skin-blue .main-header .navbar .sidebar-toggle:hover {
            background: #161c21;
            color: #f7f7f7;
            }
            /* header */
            .skin-blue .main-header .navbar {
            background: #f7f7f7;
            }
            /* sidebar*/
            .skin-blue .main-sidebar {
            background: #f2f2f2;
            }
            /* sidebar menu */
            .main-sidebar .user-panel, .sidebar-menu, .sidebar-menu>li.header {
            background: #f2f2f2;
            font-size: 13px;
            }
            /* sidebar: tabs */
            .skin-blue .main-sidebar .sidebar .sidebar-menu a {
            color: #22282b;
            border-width: 5px;
            border-color: #f0f4f7;
            }
            /* sidebar: tab selected */
            .skin-blue .main-sidebar .sidebar .sidebar-menu .active a {
            color: #22282b;
            background-color: #f2f2f2;
            border-width: 5px;
            border-color: #01b1b8;
            }
            /* sidebar: tab hovered */
            .skin-blue .main-sidebar .sidebar .sidebar-menu a:hover {
            background: #f2f2f2;
            color: #22282b;
            border-color: #01b1b8;
            }
            /* box */
            .box {
            background: #f7f7f7;
            border: 0px;
            -webkit-box-shadow: none; -moz-box-shadow: none;box-shadow: none;
            }
            /* box: title */
            .box-header .box-title {
            font-size: 15px;

            }
            /* textbox */
            .form-control, .selectize-input, .selectize-control.single .selectize-input {
            background: #ffffff;
            color: #002045;
            border-color: #059ca2;
            height: 40px;
            min-height: 40px;
            font-size: 14px;
            border-radius:0px
            }
            /* textbox: selected */
            .form-control:focus, .selectize-input.focus {
            color: #22282b;
            background: #ffffff;
            border: 2px solid #00aee3;
            /* -webkit-box-shadow: inset 0px 0px 0px, 0px 0px 0px;*/
            /* box-shadow: inset 0px 0px 0px, 0px 0px 0px;*/
            }
            /* drop-down menu */
            .selectize-dropdown, .selectize-dropdown.form-control {
            background: #fff7f9;
            color: #22282b;
            border-color: #00aee3;
            border-radius: 0px;
            min-height: 40px;
            font-size: 13px;
            }
            /* verbatim text output */
            .qt pre, .qt code {
            font-family: "Arial";
            }
            /* infobox */
            .info-box {
            background: #f7f7f7;
            border-radius: 0px;
            -webkit-box-shadow: none; -moz-box-shadow: none;box-shadow: none;
            }

            /* tabbox: title */
            .nav-tabs-custom>.nav-tabs>li.header {
            color: #22282b;
            font-size: 13px;
            font-weight: bold;
            }
            /* tabbox: tab color */
            .nav-tabs-custom, .nav-tabs-custom .nav-tabs li.active:hover a, .nav-tabs-custom .nav-tabs li.active a {
            background: #f0f4f7;
            color: #22282b;
            border-radius: 0px;
            }
            .nav-tabs-custom {
            box-shadow: 0px #f0f4f7;
            -webkit-box-shadow: none; -moz-box-shadow: none;box-shadow: none;
            }
            /* tabbox: active tab bg */
            .nav-tabs-custom>.nav-tabs>li.active {
            border-radius: 0px;
            border-top-color: #f0f4f7;
            box-shadow: 0px #f0f4f7;
            }
            /* tabbox: font color */
            .nav-tabs-custom>.nav-tabs>li.active:hover>a, .nav-tabs-custom>.nav-tabs>li.active>a {
            border-bottom-color: #00aee3; 
            border-top-color: #f6efff;
            border-right-color: #f6efff;
            border-left-color: #f6efff;
            color: #22282b;
            font-size: 13px;
            border-radius: 0px;
            }
            /* tabbox: inactive tabs background */
            .nav-tabs-custom>.nav-tabs>li>a {
            color: #22282b;
            font-size: 13px;
            font-weight: bold;
            }
            /* tabbox: top area back color */
            .nav-tabs-custom, .nav-tabs-custom>.tab-content, .nav-tabs-custom>.nav-tabs {
            border-bottom-color: #f6efff;
            background: #ffffff;
            }


            '

        )

      )

    ),
 
    
    
##### Section 2 #####    
    
    tabItems(
      tabItem(tabName = "property_nav",
              fluidRow( 
                box(width = 12, 
                  solidHeader = TRUE, 
                  collapsible = FALSE,
                 # actionButton("bton", "JavaScript popup"),
                  HTML(
                    '
        <div class="header_content">
            <nav tabindex="0" class="header_menu" role="navigation" aria-label="Mobile Navigation Dropdown">
                <div class="header_logo">
                    <img class="whiteLogo" alt="evalurate white logo" src="evaluratewhite.png">
                </div>                                                           
                <ul>
                    <li><a tabindex="0" class="selected header-link" href="index.html#home_section">HOME</a><p class="nav_line">|</p></li>
                    <li><a tabindex="0" href="about.html" class="header-link">ABOUT US</a><p class="nav_line">|</p></li>
                    <li><a tabindex="0" href="title.html" class="header-link">TITLE</a><p class="nav_line">|</p></li>
                    <li><a tabindex="0" href="about.html" class="header-link">HEADING</a><p class="nav_line">|</p></li>
                    <li><a tabindex="0" href="contact-us.html" class="header-link">CONTACT</a></li>						
                </ul>
                <img class="navIcon" alt="cross icon to open navigation menu" src="whitecross.png">
            </nav> 
        </div>
    </header>
    <main>
    
        <section>
            <div class="mainTitle">
                <img class="mainLogo" alt="evalurate main logo" src="evalurate.png">
                <h1>Professional level of insight for your property investment</h1>
                <div class="mainDetails">
                    <div class="details"> 
                        <p>Evalurate is an independent provider of risk evaluation related to property market dynamics and loans allowing potential P2P investors to assess main risks in a objective way based on big data analytics and AI.<span> READ MORE</span></p>
                        <h2>Get your independent Evalurate score NOW!<br>Only £19.95</h2>
                    </div>
                    <img class="ratingImg" alt="evalurate image of house, laptop and A rating" src="houselaptoprate.png">
                </div>
            </div>
        </section>
        <section>
            <div class="getReport">
                <div class="getReportHead">
                  <div class="reportHead">
                    <h2>Get your risk score</h2>
                    <h3>Enter the four simple pieces of information below to get started</h3>
                  </div>
            </div>
            <div class="inputs">

        '),
                  
                  
                  #div(style="display:inline-block", textInput("addressIn", label = "Property address", "eg 10 York Mansions, Prince of Wales Drive", width = "550")),
                  div(style="display:inline-block", textInput("postcodeIn", label = "Postcode", "SW11 4EZ", width = "125")),
                  div(style="display:inline-block", selectInput("propertytypeIn", label = "Property Type", 
                                                                c("Flats/Maisonettes" = "FLAT",
                                                                  "Terraced" = "TERRACED",
                                                                  "Semi-Detached" = "SEMI-DETACHED",
                                                                  "Detached" = "DETACHED"),
                                                                  width = "220")),
                  div(style="display:inline-block", numericInput("propertyvalueIn", label = "Property Value", 450000, step = 500, width = "125")),
                  div(style="display:inline-block", numericInput("loanamountIn", label = "Loan Amount", 350000, step = 500, width = "125")),
                  div(style="display:inline-block", numericInput("interestrateIn", label = "Interest Rate", 7, width = "125")),
                  div(style="display:inline-block", numericInput("loantermIn", label = "Loan Term", 18, width = "125")),
                div( class="buttonRep", actionButton("buyReport", "BUY REPORT")),
                  
              

              # actionButton("buyReport", "BUY REPORT"),
              
              HTML(
                ' 
          </div>
        </section>
        <section>
            <div class="descriptionSection">
                <div class="descriptionText">
                    <h2>Evalurate&#8217s Loan Risk Report</h2>
            <h3>It gives an overview of relevant location data:</h3>
            </div>
            <div class="descriptionIcons">
            <div class="iconsContainer">
                <figure>
                    <img src="location.png" >
                    <figcaption>Location description</figcaption>
                </figure>
                <figure>
                    <img src="pricetrend.png" >
                    <figcaption>Price Trend over the last 10 years</figcaption>
                </figure>
            </div>
            <div class="iconsContainer">
                <figure>
                    <img src="pricegrowth.png" >
                    <figcaption>Price Growth of the area compared to wider London market</figcaption>
                </figure>
                <figure>
                    <img src="locationscore.png" >
                    <figcaption>Evalurate location score</figcaption>
                </figure>
            </div>
            </div>
            <div class="descriptionText">
            <h3>As well as the evaluation of the proposed loan:</h3>
            </div>
            <div class="descriptionIcons">
            <div class="iconsContainer">
                <figure>
                    <img src="propertvalue.png" >
                    <figcaption>Property Value / Loan Amount / Loan to Value / Term</figcaption>
                </figure>
                <figure>
                    <img src="repayontime.png" >
                    <figcaption>Probability to repay on time</figcaption>
                </figure>
            </div>
            <div class="iconsContainer">
                <figure>
                    <img src="loanrisk.png" >
                    <figcaption>Expected amount recovered if loan defaults Loan Risk</figcaption>
                </figure>
                <figure>
                    <img src="loanscore.png" >
                    <figcaption>Evalurate Loan Score</figcaption>
                </figure>
            </div>
            </div>
            </div>
            <footer>
        <div class="footerCont">
            <div class="footerLogo">
                <img class="whiteLogo" alt="evalurate white logo" src="evaluratewhite.png">
            </div>
            <div class="social">
                <img src="facebook.png" alt="facebook logo">
                <img src="twitter.png" alt="twitter logo">
                <img src="instagram.png" alt="instagram logo">
            </div>   
        </div>
    </footer>'
              )
              )
              )
          ),
      
      tabItem(tabName = "report_nav",
              # conditionalPanel(
              #   condition = "bool",
              #   tabPanel(
              #     "Summary",
              #     h3("Outputs calculated based on user inputs", bool)
              #   ),
              
              
              fluidRow(
                box(width = 12,
                  HTML(
                    '<h2>Below is your bespoke report</h2>
                    <p>Download and/or print your report. Your report will not be saved.</p>
                    '
                  ),
                  downloadButton("export", label = "Download")
                )
              ),
              fluidRow(
                box(
                  width = 2,
                  tags$img(src = "evalurate.png", width = "150px")
                )
              ),
              fluidRow(
                box( 
                  width = 8,
                     span(style = "font-size: 25px; font-weight:bold;", textOutput("r.addressOut"))
                )
              #   box( width = 4
              #   )
              #  
              # ),
              ),
              fluidRow(
                box( width = 12,
                     span(style = "font-size: 20px; font-weight:bold;", textOutput("r.heading_score"))
                )
                
              ),
              fluidRow(
                box( width = 11,
                     #title = "Evalurate Score", 
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     span(style = "font-size: 75px; font-weight: bold;", textOutput("evaluratescore"))
                )
              ),
              
              # fluidRow(
              #   box( width = 12,
              #        span(style = "font-size: 20px; font-weight:bold;", textOutput("r.heading_transaction"))
              #   )
              # ),
              
              fluidRow(
                box( width = 2,
                     title = "Property Value", 
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     span(style = "font-size: 30px; font-weight: bold;", textOutput("r.propertyvalueOut"))
                ),
                box( width = 2,
                     title = "Loan Amount", 
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     span(style = "font-size: 30px; font-weight: bold;", textOutput("r.loanamountOut"))
                ),
                box( width = 2,
                     title = "Loan to Value", 
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     span(style = "font-size: 30px; font-weight: bold;", textOutput("r.ltvOut"))
                ),
                box( width = 2,
                     title = "Interest Rate", 
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     span(style = "font-size: 30px; font-weight: bold;", textOutput("r.interestrateOut"))
                ),
                box( width = 2,
                     title = "Loan Term", 
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     span(style = "font-size: 30px; font-weight: bold;", textOutput("r.loantermOut"))
                ),
                box( width = 2

                )
              ),
              fluidRow(
                box( width = 12,
                     span(style = "font-size: 20px; font-weight:bold;", textOutput("r.heading_loanScore"))
                  
                )
              ),
              fluidRow(
                box( width = 11,
                     #title = "Evalurate Loan core", 
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     span(style = "font-size: 75px; font-weight: bold;", textOutput("loanscore"))
                )
              ),
              
              # fluidRow(
              #   box( width = 12,
              #        span(style = "font-size: 20px; font-weight:bold;", textOutput("r.heading_evalurate"))
              #   )
              # ),
              
              fluidRow(
                box( width = 3,
                     title = "Probability to repay on time",
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     span(class="riskTitle", style = "font-size: 30px; font-weight: bold;", textOutput("r.loanPD"))
                ),
                box( width = 3,
                     title = "Expected amount recovered if loan defaults", 
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     span(class="riskTitle", style = "font-size: 30px; font-weight: bold;", textOutput("r.loanLGD"))
                ),
                box( width = 3,
                     title = "Loan Risk", 
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     span(class="riskTitle", style = "font-size: 30px; font-weight: bold;", textOutput("loanrisk"))
                )
                # box( width = 3,
                #      title = "Evalurate loan score", 
                #      solidHeader = TRUE, 
                #      collapsible = FALSE,
                #      span(style = "font-size: 50px; font-weight: bold;", textOutput("loanscore"))
                # )
                
              ),
              fluidRow(
                box( width = 12,
                     span(style = "font-size: 20px; font-weight:bold;", textOutput("r.heading_location"))
                )
                
              ),
              fluidRow(
                box( width = 11,
                     #title = "Evalurate Score", 
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     span(style = "font-size: 75px; font-weight: bold;", textOutput("r.evAreaScore"))
                )
              ),
              
              fluidRow(
                box( width = 8,
                     title = "Location Description", 
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     span(style = "font-family: Arial; font-size: 15px;", textOutput("description"))
                ),
                box( width = 1
                     
                )
              ),
              
              fluidRow(
                box( width = 8,
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     leafletOutput("map", height = "400px")
                )
                # box( width = 1
                #      
                # ),
                # box( width = 3,
                #      title = "Evalurate location Score", 
                #      solidHeader = TRUE, 
                #      collapsible = FALSE,
                #      span(style = "font-size: 50px; font-weight: bold;", textOutput("r.evAreaScore"))
                # )
              ),
              
              fluidRow( 
                box( width = 8,
                     title = "Information and Disclaimer", 
                     solidHeader = TRUE, 
                     collapsible = FALSE,
                     span(style = "font-size: 10px;", textOutput("disclaimer")),
                     
                     HTML('
                          <h1>TEST SWIFTCOMPLETE API</h1>
        <div class="testCont">
            <h2>Tests</h2>
            <h3>Test GET Geocoding - Geocode</h3>
            <form>
                <label><b>Enter a valid PostCode starting with SW1: </b></label>
                <input type="text" name="message" value="SW1 A0A" id="user_input">
            </form>
            <!-- <input type="submit" onclick="showInput();"><br/> -->
            <label>Your input: </label>
            <p><span id="display"></span></p>

            <pre></pre>

        
        </div>
                          ')
                )
                
              )
              
              )
      # )
           
      
      
    ),
tags$script(src = "app.js"),
tags$script(src = "mainAPI.js"),
tags$script(src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js")
    )
    )


server <- function(input, output, session) { 
  
  observeEvent(input$bton, {
    session$sendCustomMessage("mymessage", "test")
  })
  
  
  output$distPlot <- renderPlot({
    # Take a dependency on input$goButton. This will run once initially,
    # because the value changes from NULL to 0.
    input$buyReport
  })
  
  # 
  # addCssClass(selector = "a[data-value='report_nav']", class = "inactiveLink")
  # 
  # observeEvent(input$buyReport, {
  #   addCssClass(selector = "a[data-value='report_nav']", class = "inactiveLink")
  #   
  # })
  # observeEvent(input$Enable, {
  #   removeCssClass(selector = "a[data-value='report_nav']", class = "inactiveLink")
  # })
  
  value <- reactiveVal(FALSE)
  
  
  observeEvent(input$buyReport, {
    newtab <- switch(input$menu,
                     "property_nav" = "report_nav",
                     "report_nav" = "property_nav"
    )
    updateTabItems(session, "menu", newtab)
    
    removeClass(selector = "body", class = "sidebar-collapse")
    bool <- value
    value(TRUE)
    output$value <- renderText({
      value()                     # rv$value
    })
  })
  
  

  # Load tables
  ev_area_score <- read.csv("ev_area_score.csv")  
  ev_pd_table <- read.csv("ev_pd_table.csv")  
  mappostcodes <- read.csv("mappostcodesLdn.csv") 

  # Report outputs 
  output$r.addressOut = renderText({
    paste(input$propertytypeIn, "located in", input$postcodeIn)
  })
  
  
  #property value
  output$r.heading_transaction = renderText({paste("TRANSACTION SUMMARY")})
  #property score
  output$r.heading_score = renderText({paste("EVALURATE SCORE")})
  #loan score
  output$r.heading_loanScore = renderText({paste("EVALURATE LOAN SCORE")})
  #property value
  output$r.heading_evalurate = renderText({paste("RISK ASSESSMENT FOR LOAN")})
  #location score
  output$r.heading_location = renderText({paste("LOCATION SCORE")})
  #property value
  output$r.propertyvalueOut = renderText({paste(input$propertyvalueIn)})
  #loan amount
  output$r.loanamountOut = renderText({paste(input$loanamountIn)})
  #loan to value
  output$r.ltvOut = renderText({paste(round((input$loanamountIn / input$propertyvalueIn)*100, digits = 1),"%", sep = "")})
  #interest rate
  output$r.interestrateOut = renderText({paste(input$interestrateIn,"%", sep = "")})
  #loan term
  output$r.loantermOut = renderText({paste(input$loantermIn)})
  
  #Postcode selection and output
  PostcodeSelection <- reactive({
    inputString <- paste(substr(input$postcodeIn, 1, nchar(input$postcodeIn)-0))
    return(inputString)
  })
  
  #evPostcode selection and output, reactive, for PD, LGD, AreaScore
  evPostcodeSelection <- reactive({
    inputStringP <- paste(substr(input$postcodeIn, 1, nchar(input$postcodeIn)-4))
    return(inputStringP)
  })
  
  #evDistrict selection
  evDistrict <- reactive({
    inputStringD <- paste(ev_area_score[which(ev_area_score$evPostcode == evPostcodeSelection()),]$District)
    return(inputStringD)
  })
  
  #evDistrict selection and output for PD, LGD
  evDistrictandType <- reactive({
    inputStringDT <- paste(ev_area_score[which(ev_area_score$evPostcode == evPostcodeSelection()),]$District, input$propertytypeIn, sep = ".")
    return(inputStringDT)
  })
  
  #evDistrict selection and output for PD, LGD
  evALTV <- reactive({
    numCol <- round((input$loanamountIn / input$propertyvalueIn)*(1+(input$interestrateIn/100)*(input$loantermIn/12)), digits = 2)
    return(numCol)
  })
  
  #probability to repay on time
  output$r.loanPD <- renderText({paste(round(as.numeric(1 - ev_pd_table[which(ev_pd_table$Segment == evDistrictandType()),][evALTV()*100-50+2])*100, digits = 1), "%", sep = "")})
  
  #expected recovery at defualt
  output$r.loanLGD <- renderText({paste(round(as.numeric(1+(min(0,0.9*0.925-evALTV())))*100, digits = 1), "%", sep = "")})
  #output$r.loanLGD <- renderText({paste(round(as.numeric(1 + ev_lgd_table[which(ev_lgd_table$Segment == evDistrictandType()),][evALTV()*100-50+2])*100, digits = 1), "%", sep = "")})
  
  #area score
  output$r.evAreaScore <- renderText({paste(ev_area_score[which(ev_area_score$evPostcode == evPostcodeSelection()),]$evAreaScore)})
  

  # still to connect
  output$evaluratescore <- renderText(paste("A-"))
  output$loanscore <- renderText(paste("A"))
  output$loanrisk <- renderText(paste("Low"))
  
  
  # Dummy description, needs to be by API from swiftcomplete
  output$description <- renderText(paste("Situated in the South-west London Borough of Wandsworth, this 4 bedroom property is conveniently located less than half a mile from Battersea Park Railway Station.
                                         
                                         Leisure
                                         The property is superbly positioned for popular destinations including the King's Road with restaurants, cafes and boutiques. The closest supermarkets are Clapham Junction Asda and Waitrose, which are less than a mile away from the property. Tesco (Clapham, around 1.6 miles away) is also within easy reach.
                                         
                                         For cinema lovers, there are two Cineworld cinemas and a Vue cinema nearby - Cineworld London - Fulham Road is about 1.3 miles away, Cineworld London - Wandsworth is slightly over 2 miles away and Vue London (Fulham Broadway) is around 1.6 miles away.
                                         
                                         For keen cyclists, there are three TFL cycle docking stations nearby - Prince of Wales Drive and Austin Road are both a short walk away and Albert Bridge Road is less than half a mile away.
                                         
                                         Transport
                                         Sloane Square Underground Station (zone 1) is 1.2 miles away, which is served by the Circle and District lines, offering direct access to the City. Clapham Common Underground Station (zone 2) is also nearby, which is served by the Northern line offering frequent services to the West End.
                                         Trains: There are 3 stations within walking distance, Battersea Park Railway Station is around 0.4 miles away (9 min walk), Queenstown Road (Battersea) Railway Station is around 0.5 miles away (9 min walk) and Wandsworth Road Railway Station is about 0.9 miles away (18 min walk).
                                         Motorway Junctions: M4 J1 is the closest junction (5.4 miles).
                                         Flights: London City Airport is the nearest airport (9.4 miles).
                                         Healthcare
                                         Hospitals: Royal Brompton Hospital (1.2 miles), Chelsea and Westminster Hospital (1.2 miles) and The Royal Marsden Hospital (London) (1.3 miles) are all near to the property.
                                         Doctors: There are 3 surgeries within walking distance, Battersea Fields Practice is 0.2 miles away (4 min walk), Bridge Lane Group Practice is about 0.4 miles away (9 min walk) and Dr KROLL & partners is approximately 0.6 miles away (13 min walk)."))
  
    # Dummy disclaimer
  output$disclaimer <- renderText(paste("Evalurate applies institutional investment and risk methodologies in combination with machine learning methods to produce an objective and independent assessment of expected loan performance.
                                        Evalurate Score and Location Score are assessments of the quality of the loan and the location in which the relevant property is located to give you a fair and objective assessment of risk related to this proposition.
                                        
                                        Evaluerate, nor any other party makes any representation or warranty, expressly or implicitly, as to the validity, accuracy, reliability, suitability or completeness of any of the information (including any assumptions, data or projections underlying any estimates or projections) 
                                        contained in this Document, and said information may not be relied upon in connection with any investment decision or any other particular purpose. Evalurate accepts no liability or responsibility to any person with respect to, or arising directly or indirectly out of the contents 
                                        of or any omissions from this Document. This Document is being provided to the recipient and may not be reproduced, distributed, passed on or published, in whole or in part, to any person without the prior written consent of Evalurate. This Document may contain third-party trademarks, 
                                        service marks, graphics, and logos. You are not granted any right or license with respect to any intellectual property rights, in particular, with respect to our trademarks or the trademarks of any third party. 
                
                                        The content of this Document is not to be construed as legal, business, investment or tax advice. Each recipient should consult with its own professional advisers for any such matters and advice. This Document may contain forward looking statements. 
                                        While due care has been used in the preparation of forecast information, actual results may vary in a materially positive or negative manner. Forecasts and hypothetical examples are subject to uncertainty and contingencies outside Evalurate's control. Evalurate undertakes no obligation 
                                        to update publicly or revise any forward-looking statement, whether as a result of new information, future events or otherwise, except as may be required by applicable law. This Document is provided for general informational purposes only, and Evalurate is not soliciting any action based upon it. 
                                        This Document is not intended as, shall not be construed as and does not constitute an offer, recommendation or solicitation for the purchase or sale of any security or other financial instrument or financial service of Evalurate or of any other entity. 
                                        Any offer of securities, other financial instruments or financial services would be made pursuant to offering materials to which prospective investors would be referred. Nothing in this Document is intended to constitute a financial promotion for the purpose of section 21 of the Financial Services and Markets Act 2000. 
                                        By viewing this Document, the recipient acknowledges, and agrees to abide by, the aforementioned.

                                         "))
  
  
  # Create the map

  iconfa <- makeAwesomeIcon(icon = "direction", markerColor = "black", iconColor = "black") 
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("Hydda.Full") %>%
      addAwesomeMarkers(data = mappostcodes, lng = mappostcodes[which(mappostcodes$Postcode == PostcodeSelection()),]$Longitude, lat = mappostcodes[which(mappostcodes$Postcode == PostcodeSelection()),]$Latitude, icon = iconfa) %>% 
      addLegend("bottomright", colors= NULL, labels = NULL, title= paste("Property is located in", input$postcodeIn))
  })
  
  # mapshot(map, file = "~/map.png")
  # 
  
  # Clicking on the export button will generate a pdf file 
  output$export <- downloadHandler(
    filename = function() {paste("report.pdf")},
   
   # filename = "report.pdf",
    content = function(file) {
      
      # Copy the report file to a temporary directory before processing it, in
      # case we don't have write permissions to the current working dir (which
      # can happen when deployed).
      tempReport <- file.path(tempdir(), "report.Rmd")
      tempImg <- file.path(tempdir(), "evalurate.png")
      file.copy("report.Rmd", tempReport, overwrite = TRUE)
      file.copy("evalurate.png", tempImg, overwrite = TRUE)
      
      # Set up parameters to pass to Rmd document
      params <- list(propType = input$propertytypeIn, postC = input$postcodeIn, intRate = input$interestrateIn, loanT = input$loantermIn, pValue =input$propertyvalueIn, loanValue = input$loanamountIn, loanAmInt = input$loanamountIn)

      # Knit the document, passing in the `params` list, and eval it in a
      # child of the global environment (this isolates the code in the document
      # from the code in this app).
      rmarkdown::render(tempReport, output_file = file,
                        params = params,
                        envir = new.env(parent = globalenv())
      )
    }
  )
    
    
    
    # content = function(file) {
    #   pdf(file, onefile = TRUE)
    #   
    #   dev.off()
    # }
  #)
  
  }

shinyApp(ui, server)