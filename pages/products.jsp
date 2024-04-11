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
    <link rel="stylesheet" href="../css/coffeebean.css"> <!--連結CSS-->
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
<%
			String productid=request.getParameter("product_id");
	try { // 例外處理
			Class.forName("com.mysql.jdbc.Driver"); // 啟動 JDBC 驅動程式
			try {	// 例外處理
				String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC"; // url 是連接 MySQL 的位址（IP 或網域）
				String sql=""; // 建立字串變數 sql
				Connection con=DriverManager.getConnection(url,"root","1234"); // 連接 MySQL 資料庫（帳號：root；密碼：1234）
				if(con.isClosed()) // con.isClosed() 回傳 ture 代表連線關閉
				   out.println("警告：連線建立失敗！"); // 連線關閉代表連線沒有被建立
				else { // 連線成功建立就可以開始取得與更新資料庫的資料
					sql="use `coffee`"; // SQL 語法：使用 coffee 資料庫
					con.createStatement().execute(sql); // 執行上一行的 SQL
					sql="select * from `products2` "; // SQL 語法：取得 products2 資料表中的所有資料
					sql+="where `id`='"+productid+"'AND `id` BETWEEN 'P001' AND 'P020'";
					ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果
			   while(rs.next())
			   {
		
					out.print("<p style='text-align:center; font-size:50px; font-weight:900;'>"+"<br>"+rs.getString(2)+"</p>");
					out.print("<div class='us'>");
					out.print("<img class='image' src='"+rs.getString(3)+ "'>");//產品圖片
					out.print("</div>");
					out.print("<div class='text'>");
					out.print("<h2 style=' font-weight:900;'>"+"【"+rs.getString(4)+"】"+"</h2>"+"<br>"+"<br>");
					out.print("<p>·規格:"+rs.getString(5)+"<br>"+"<br>");
					out.print("·烘焙度："+rs.getString(6)+"<br>"+"<br>");
					out.print("·豆種："+rs.getString(7)+"<br>"+"<br>");
					out.print("·產地："+rs.getString(8)+"<br>"+"<br>");
					out.print("·種植海拔："+rs.getString(9)+"<br>"+"<br>");
					out.print("·精緻法："+rs.getString(10)+"<br>"+"<br>");
					out.print("·口感："+rs.getString(11)+"<br>"+"<br>");
					out.print("·酸度："+rs.getString(12));
					out.print("</p>");
					out.print("</div>");
					out.print("<br>");
					out.print("<br>");
					
				}
					String sql1="select * from `products3` "; // SQL 語法：取得 products2 資料表中的所有資料
					sql1+="where `id`='"+productid+"'AND `id` BETWEEN 'P021' AND 'P025'";
					ResultSet rs2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql1); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果
					 
					  
					while(rs2.next())
					{
					out.print("<p style='text-align:center; font-size:50px; font-weight:900;'>"+"<br>"+rs2.getString(2)+"</p>");
					out.print("<div class='us'>");
					out.print("<img class='image' src='"+rs2.getString(3)+ "'>");//產品圖片
					out.print("</div>");
					out.print("<div class='text'>");
					out.print("<h2 style=' font-weight:900;'>"+"【產品規格】"+"</h2>"+"<br>");
					out.print("<p>·容量:"+rs2.getString(4)+"<br>"+"<br>");
					out.print("·材質："+rs2.getString(5)+"<br>"+"<br>");
					out.print("·尺寸："+rs2.getString(6)+"<br>"+"<br>");
					out.print("·重量："+rs2.getString(7)+"<br>"+"<br>");
					out.print("·原產國："+rs2.getString(8)+"<br>"+"<br>");
					out.print("</p>");
					out.print("</div>");
					out.print("<br>");
					out.print("<br>");
					}
 
				}
				con.close();
			}
			catch (SQLException sExec) {
				out.println("警告：MySQL 錯誤！"+sExec.toString()); // MySQL 錯誤警告
			}
		}
		catch (ClassNotFoundException err) {
		  out.println("警告：class 錯誤！"+err.toString()); // JDBC 錯誤警告
		}
		
		out.print("<form action='producs_view.jsp' method='post'class='basic-grey'>");
		out.print("<input type='hidden' name='product_id' value='"+productid+"'>");      
		out.print("</form>");
                

%>

    </main>

    <footer>
        <p class="copyright">本文瀏覽次數：123456<br> Copyright © 2023。本網站僅為作業之用，如有侵權敬請告知。</p>
    </footer>
	
</body>
</html>