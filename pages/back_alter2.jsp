<%@page import = "java.sql.*"%>
<%@page language="java" contentType="text/html"  pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品修改</title>
    <link rel="icon" href="../image/icon.ico">
    <link rel="stylesheet" href="../css/back_alter.css"> <!--連結CSS-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
    <header>
        <div class="logo"> <!--LOGO-->
            <a href="back.jsp"><img src="../image/logo.png" style="width: 100px; height: 100px;"></a>
        </div>
        <p>後台管理系統</p>
        <nav>
            <a href="back_new.jsp">新增商品</a>
            <a href="back_delete.jsp">刪除商品</a>
            <a href="back_alter.jsp">修改商品</a>
            <a href="order_view.jsp">瀏覽訂單</a>
            
            <a href="login.jsp" class="logout">
                <img src="../image/logout.png" alt="" style="width:100px; height:100px;">
            </a>
        </nav>
    </header>
</body>
</html>
	
	<section class="all">
		<br><br><div class="title" style="text-align:center">商品修改</div><br><br>
        <form action="back_alter3.jsp">
<%
	try { // 例外處理
			Class.forName("com.mysql.jdbc.Driver"); // 啟動 JDBC 驅動程式
			try {	// 例外處理
				String url="jdbc:mysql://localhost/?serverTimezone=UTC"; // url 是連接 MySQL 的位址（IP 或網域）
				String sql=""; // 建立字串變數 sql
				Connection con=DriverManager.getConnection(url,"root","1234"); // 連接 MySQL 資料庫（帳號：root；密碼：1234）
				if(con.isClosed()) // con.isClosed() 回傳 ture 代表連線關閉
				   out.println("警告：連線建立失敗！"); // 連線關閉代表連線沒有被建立
				else { // 連線成功建立就可以開始取得與更新資料庫的資料
					sql="USE `coffee`"; // SQL 語法：使用 cych 資料庫
					con.createStatement().execute(sql); // 執行上一行的 SQL
					String name=request.getParameter("goods");
					sql="SELECT `intro`,`img`,`place`,`price`,`iventory` FROM `products` WHERE `name`='"+name+"'"; // SQL 語法：取得 counter 資料表中的所有資料
					ResultSet rs=con.createStatement().executeQuery(sql); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果
					if(rs.next())
					{
%>	

          商品名稱&nbsp;:&nbsp;<input type="text" id="alter" name="name" value="<%=name%>" style="height:20px;width:300px;">
          <br>
          <br>
		  <br>
		  商品介紹&nbsp;:&nbsp;<input type="text" id="alter" name="intro" value="<%=rs.getString(1)%>" style="height:20px;width:300px;">
          <br>
		  <br>
          <br>
		  圖片路徑&nbsp;:&nbsp;<input type="text" id="alter" name="img" value="<%=rs.getString(2)%>" style="height:20px;width:300px;">
          <br>
		  <br>
          <br>
          商品產地&nbsp;:&nbsp;<input type="text" id="alter" name="place" value="<%=rs.getString(3)%>" style="height:20px;width:300px;">
          <br>
          <br>
		  <br>
          商品價格&nbsp;:&nbsp;<input type="text" id="alter" name="price" value="<%=rs.getString(4)%>" style="height:20px;width:300px;">
          <br>
          <br>
		  <br>
          商品庫存&nbsp;:&nbsp;<input type="text" id="alter" name="iventory" value="<%=rs.getString(5)%>" style="height:20px;width:300px;">
          <br>
          <br>
<%				
				con.close();
					}
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
          <div class="btn_class">
			<a href="#" onclick="javascript:window.location.reload()">
            <input type="reset"  class="btn" value="重設">
			</a>
            <input type="submit" class="btn" value="修改">
          </div>
          
        </form>
      
    </section>

	<footer style="background-color: #7f5539; width: 97.9%; height:1%; position: absolute; bottom: 0;"></footer>
  </body>
</html>