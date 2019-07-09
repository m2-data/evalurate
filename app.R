#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(knitr)

#vars
property <- c("House", "Flat", "Detached House", "Room")
# buyClicked <- reactiveVal(flag = FALSE)
# buyClicked <- FALSE
# Define UI for application that draws a histogram

ui <- fluidPage(
  
  # selectInput("num", "Choose a number", 1:10),
  # conditionalPanel(
  #   condition = "output.square",
  #   "That's a perfect square!"
  # ),
  
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    HTML(
        '<head>
          <meta charset="utf-8">
          <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1" />
          <title>evalurate</title>
          <meta name="description" content="Evalurate risk evaluation pf property market dynamics for investors">
          <link href="https://fonts.googleapis.com/css?family=Comfortaa:400,700" rel="stylesheet">
          <link rel="stylesheet" href="style.css">
        
        </head>
        <body>
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
    <main>'),
    
    
    
    dashboardSidebar(
      hr(),
      sidebarMenu(id = "menu",
                  menuItem("Property", tabName = "property_nav", selected = TRUE),
                  menuItem("Report", tabName = "report_nav"),
                  menuItem("About", tabName = "readme", icon = icon("info"))
                  
      ),
      
      helpText("Developed by ", 
               a("evalurate", href = "http://..."), ".")
      
    ),
    
        
        HTML('
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
        #verbatimTextOutput('out1'),
        textInput("in2", label = h3("Postcode"), value = "Enter text..."),
        selectInput("in1", "Proprty Type", choices = property),
        numericInput("num", label = h3("Estimated Property Value"), value = 100000),
        numericInput("num2", label = h3("Loan Value"), value = 100000),
    HTML('</div>'),
        downloadButton("report", "BUY NOW"),
    
    
    
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
    </footer>
        </body>'
    ),
  tags$script(src = "main.js")
)

#Define server logic required to draw a histogram
server <- function(input, output) {

  #conditional output
  output$square <- reactive({
    sqrt(as.numeric(input$num)) %% 1 == 0

  })
  outputOptions(output, 'square', suspendWhenHidden = FALSE)
  
  # observeEvent(buyClicked$flag, {
  #   # buyClicked$flag.reactiveVal(TRUE)
  #   buyClicked$flag = TRUE
  #   print(paste0("You have chosen: ", buyClicked$flag))
  # })
    #pdf output
     output$report <- downloadHandler(
         # For PDF output, change this to "report.pdf"
         filename = "Evalurate report.pdf",
         content = function(file) {
             # Copy the report file to a temporary directory before processing it, in
             # case we don't have write permissions to the current working dir (which
             # can happen when deployed).

           # buyClicked$flag.reactiveVal(TRUE)
           # print(buyClicked$flag)
           
             tempReport <- file.path(tempdir(), "report.Rmd")
             file.copy("report.Rmd", tempReport, overwrite = TRUE)
    
             # Set up parameters to pass to Rmd document
             params <- list(n = input$in1, n2 = input$in2, num = input$num, num2 = input$num2)
    
             # Knit the document, passing in the `params` list, and eval it in a
             # child of the global environment (this isolates the code in the document
             # from the code in this app).

             rmarkdown::render(tempReport, output_file = file,
                               params = params,
                               envir = new.env(parent = globalenv())
             )
             
             
            
             
             # if(buyClicked$flag == FALSE){
             #   buyClicked$flag.reactiveVal(TRUE)
             #   print(buyClicked$flag)
             # 
             # }
         }
     )
    
}

# Run the application
shinyApp(ui = ui, server = server)

