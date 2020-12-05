library(RMySQL)
library(gsubfn)
  mydb = dbConnect(
    MySQL(),
    user = 'root',
    password = '',
    dbname = 'nhom1',
    host = 'localhost'
  )
  view_user <- function(mydb){
sqlStatement <-"SELECT * from khachhang"
rs <- fetch(dbSendQuery(mydb, sqlStatement))
return(rs)

  }
  view_bill <- function(mydb){
    sqlStatement <-"SELECT * from hoadon"
    rs <- fetch(dbSendQuery(mydb, sqlStatement))
    return(rs)
    
  }
  view_detail <- function(mydb){
    sqlStatement <-"SELECT * from detail_hd"
    rs <- fetch(dbSendQuery(mydb, sqlStatement))
    return(rs)
    
  }
  view_pro <- function(mydb){
    sqlStatement <-"SELECT * from sanpham"
    rs <- fetch(dbSendQuery(mydb, sqlStatement))
    return(rs)
    
  }
  view_type <- function(mydb){
    sqlStatement <-"SELECT * from loaisanpham"
    rs <- fetch(dbSendQuery(mydb, sqlStatement))
    return(rs)
    
  }
  delete_user<-function(mydb,detail_id){
    query <- sprintf("DELETE FROM khachhang WHERE MAKH IN (SELECT * from hoadon where
                     hoadon.SoHD = %s )", detail_id)
    # 
    # sqlStatement<-paste("DELETE  from khachhang WHERE MAKH = '",
    #       user_id,"'," ,sep = "")
    rs <- fetch(dbSendQuery(mydb, query))
    str<-"XÓA THÀNH CÔNG"
    return(str)
  }
  insertloai<-function(mydb,MALOAI,TENLOAI){
    # query <- sprintf("insert into loaisanpham(MALOAI,TENLOAI) 
   
    query<-paste("INSERT INTO loaisanpham(MALOAI,TENLOAI) VALUES(",MALOAI, ",",TENLOAI, ")")

    rs <- fetch(dbSendQuery(mydb, query))
    str<-"THÊM THÀNH CÔNG"
    return(str)
    }
  killDbConnections <- function () {
    all_cons <- dbListConnections(MySQL())
    
    print(all_cons)
    
    for (con in all_cons)
      +  dbDisconnect(con)
    
    print(paste(length(all_cons), " connections killed."))
    
  }
  
