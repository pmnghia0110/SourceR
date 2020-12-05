library(shiny)
library(shinyjs)
library(glue)
library(dashboardthemes)
library(shinyWidgets)
library(RMySQL)
library(shinydashboard)
library(gsubfn)
library(DT)
library(shinyalert)
source("D:/R Project/Shop-wed/function.R")
killDbConnections()
mydb = dbConnect(
  MySQL(),
  user = 'root',
  password = '',
  dbname = 'nhom1',
  host = 'localhost'
)
user<-"SELECT * FROM khachhang"
pro<-"SELECT * FROM sanpham"
bill<-"SELECT * FROM hoadon"
type<-"SELECT * FROM loaisanpham"
detail<-"SELECT * FROM detail_hds"
ui<-dashboardPage(
  dashboardHeader(title = "DATABASE"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("KHACH HANG", tabName = "user", icon = icon("user-o")),
      menuItem("SAN PHAM", tabName = "product", icon = icon("opencart")),
      menuItem("HOA DON",tabName= "bill",icon= icon("money")),
      menuItem("LOAI SAN PHAM",tabName= "product_type",icon= icon("list")),
      menuItem("CHI TIET HOA DON",tabName = "detail",icon = icon("info"))
      
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = 'user',
            dataTableOutput('output_user'),
            textInput('detail_id',"soHD"),
            actionButton('delete_user',"DELETE"),
            textOutput('rs')),
      tabItem(tabName = "product",
              dataTableOutput('output_pro')),
      tabItem(tabName = "bill",
              dataTableOutput('output_bill')),
      tabItem(tabName = "product_type",
              dataTableOutput('output_type'),
              textInput('maloai','MALOAI'),
              textInput('tenloai','TENLOAI'),
              actionButton('add_pro_type','INSERT'),
              textOutput('insert')),
                
      tabItem(tabName = "detail",
              dataTableOutput('output_detail'))
      
    )
  )
  
)
server<-function(input,output){
output$output_user<-renderDataTable(
rs<-view_user(mydb))
output$output_bill<-renderDataTable(
  rs<-view_bill(mydb))
output$output_detail<-renderDataTable(
  rs<-view_detail(mydb))
output$output_pro<-renderDataTable(
  rs<-view_pro(mydb))
output$output_type<-renderDataTable(
  rs<-view_type(mydb))
observeEvent(input$delete_user, {
  detail_id<-input$detail_id
  output$rs<-renderText(
    str<-delete_user(mydb,detail_id)
  )
  
})
observeEvent(input$add_pro_type, {
  useShinyalert()
  MALOAI<-input$maloai
  TENLOAI<-input$tenloai
  df<-data.frame(MALOAI,TENLOAI)
  dbWriteTable(mydb, "loaisanpham",df, append = TRUE,row.names=FALSE)
  output$insert<-renderText(
    str<-"SUCCESS"
    
  )
  })
  

  }

shinyApp(ui=ui,server = server)
