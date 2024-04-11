<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Violet Cafe</title>
    <link rel="icon" href="../image/icon.ico">
    <link rel="stylesheet" href="../css/index.css"> <!--連結CSS-->
	<link rel="stylesheet" href="../css/coffeebean.css">
</head>
<body>
    <header>
        <div class="logo"> <!--LOGO-->
            <a href="index.html"><img src="../image/logo.png" style="width: 100px; height: 100px;"></a>
        </div>
        <nav>
            <a href="index.jsp">首頁</a>
            <a href="coffee.jsp">商品頁面</a>
            <a href="board.jsp">留言板</a>
            <a href="aboutus.html">關於我們</a>
            <a href="login.jsp">登入會員</a>
            <a href="cart.jsp">🛒購物車</a>
        </nav>
    </header>

<main>	
<form action=""  class="box">	
<%
			String productname=request.getParameter("search");
	try { // 例外處理
			Class.forName("com.mysql.jdbc.Driver"); // 啟動 JDBC 驅動程式
			try {	// 例外處理
				String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC"; // url 是連接 MySQL 的位址（IP 或網域）
				String sql=""; // 建立字串變數 sql
				Connection con=DriverManager.getConnection(url,"root","1234"); // 連接 MySQL 資料庫（帳號：root；密碼：1234）
				if(con.isClosed()) // con.isClosed() 回傳 ture 代表連線關閉
				   out.println("警告：連線建立失敗！"); // 連線關閉代表連線沒有被建立
				else { // 連線成功建立就可以開始取得與更新資料庫的資料
					sql="USE `coffee`"; // SQL 語法：使用 cych 資料庫
					con.createStatement().execute(sql); // 執行上一行的 SQL
					//sql="SELECT * FROM `products2`"; // SQL 語法：取得 counter 資料表中的所有資料
					//sql+="WHERE `id`='"+productid+"'";
					//ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果			   					
					
					//String search=request.getParameter("search");
					String sql2 = "SELECT * FROM `products2` WHERE `name` LIKE'%"+productname+"%'";
					ResultSet rs2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql2); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果			   

			   
			   while(rs2.next())
			   {
					out.print("<p style='text-align:center; font-size:50px; font-weight:900;'>"+"<br>"+rs2.getString(2)+"</p>");
					out.print("<div class='us'>");
					out.print("<img class='image' src='"+rs2.getString(3)+ "'>");//產品圖片
					out.print("</div>");
					out.print("<div class='text'>");
					out.print("<h2 style=' font-weight:900;'>"+"【"+rs2.getString(4)+"】"+"</h2>"+"<br>"+"<br>");
					out.print("<p>·規格:"+rs2.getString(5)+"<br>"+"<br>");
					out.print("·烘焙度："+rs2.getString(6)+"<br>"+"<br>");
					out.print("·豆種："+rs2.getString(7)+"<br>"+"<br>");
					out.print("·產地："+rs2.getString(8)+"<br>"+"<br>");
					out.print("·種植海拔："+rs2.getString(9)+"<br>"+"<br>");
					out.print("·精緻法："+rs2.getString(10)+"<br>"+"<br>");
					out.print("·口感："+rs2.getString(11)+"<br>"+"<br>");
					out.print("·酸度："+rs2.getString(12));
					out.print("</p>");
					out.print("</div>");
					out.print("<br>");
					out.print("<br>");
					
					out.print("</form>");
					out.print("<form action='products_view.jsp' method='post'>");
					out.print("<input type='hidden' name='product_id' value='"+rs2.getString(1)+"'>"); 
					out.print("</form>");						
				}
				con.close();
			}
			}
			catch (SQLException sExec) {
				out.println("警告：MySQL 錯誤！"+sExec.toString()); // MySQL 錯誤警告
			}
		}
		catch (ClassNotFoundException err) {
		  out.println("警告：class 錯誤！"+err.toString()); // JDBC 錯誤警告
		}
		
            
        
%>
</main>		

    <footer>
        <p class="copyright">本文瀏覽次數：123456<br> Copyright © 2023。本網站僅為作業之用，如有侵權敬請告知。</p>
    </footer>
	
</body>
</html>