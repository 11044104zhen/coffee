<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Violet Cafe</title>
    <link rel="icon" href="../image/icon.ico">
    <link rel="stylesheet" href="../css/aboutus.css"> <!--連結CSS-->
</head>
<body>
    <header>
        <div class="logo"> <!--LOGO-->
            <a href="index2.jsp"><img src="../image/logo.png" style="width: 100px; height: 100px;"></a>
        </div>
        <nav>
            <a href="index2.jsp">首頁</a>
            <a href="coffee2.jsp">商品頁面</a>
            <a href="board2.jsp">留言板</a>
            <a href="aboutus2.jsp">關於我們</a>
            <a href="logout.jsp">登出會員</a>
            <a href="members.jsp">修改會員資料</a>
            <a href="cart2.jsp">🛒購物車</a>
        </nav>
    </header>

    <main>
        <h1><br><br>關於我們</h1>
        <article>
            
			<%
//組員介紹
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
            sql="USE `coffee`";
            con.createStatement().execute(sql);
            String team = "SELECT * FROM `team`";
            ResultSet rs = con.createStatement().executeQuery(team);
 
            while(rs.next())    	
            {   
				out.print("<div class='set'></div>");
				out.print("<div class='us'>");
				out.print("<img src='"+rs.getString(3)+"'style='width: 350px; height: 250px;'  class='image'>");  
                out.print("<div class='text'>");
                out.print("<h2>"+rs.getString(1)+rs.getString(2)+"</h2>");
                out.print("<p>"+rs.getString(4)+"</p>");
                out.print("</div>");
				out.print("</div>");

            }
//Step 6: 關閉連線
            con.close();
        }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}
%>
           
        </article>
    </main>

    <footer>
        <p class="pagetop"><a href="#top">▲回TOP</a></p> <!--TOP傳送門-->
        <p class="copyright">瀏覽人數：<%@include file="counter.jsp"%><br> Copyright © 2023。本網站僅為作業之用，如有侵權敬請告知。</p>
    </footer>