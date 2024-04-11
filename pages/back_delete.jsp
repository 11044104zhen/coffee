<%@page import = "java.sql.*"%>
<%@page language="java" contentType="text/html"  pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>刪除商品</title>
    <link rel="icon" href="../image/icon.ico">
    <link rel="stylesheet" href="../css/backmanage2.css"> <!--連結CSS-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>

  <body>
    <div>
        <div class="backg"></div>
      </div>
      
    <header>
        <div class="logo"> <!--LOGO-->
            <a href="#"><img src="../image/logo.png" style="width: 100px; height: 100px;"></a>
        </div>
        <h1>後台管理系統</h1>
        <nav>
            <a href="back_new.jsp">新增商品</a>
            <a href="back_delete.jsp">刪除商品</a>
            <a href="back_alter.jsp">修改商品</a>
            <a href="order_view.jsp">瀏覽訂單</a>
        </nav>
        <div>
            <a href="login.jsp" class="logout"><p>
                <img src="../image/logout.png" alt="" style="width:100px; height:100px;" >
            </p></a>
        </div>
    </header>
	
   <form action="back_delete2.jsp">
	<section class="all">
		<br><br><div class="title" style="text-align:center">商品刪除</div><br>
		<div style="width:100%">

			<div class="list" style="width:100%;text-align:center">
				選擇要刪除的商品：
				<select name="goods">
				<%
				Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://localhost/?serverTimezone=UTC";
                Connection con=DriverManager.getConnection(url,"root","1234");
                String sql="USE `coffee`";
                con.createStatement().execute(sql);
                String sql1 = "SELECT`name`FROM `products`";
                ResultSet rs1 =con.createStatement().executeQuery(sql1);
				int i=1;
				while(rs1.next()){
				
                    out.print("<option value='"+rs1.getString(i)+"'>"+rs1.getString(i)+"</option>");
					
			    }  
				con.close();
				%>
				</select><br>
			</div>
		</div>
		<div class="btn-group">
			<input type="submit" value="刪除" class="btn" />
		</div>
	</section>
    </form>
	
	<footer style="background-color: #7f5539; width: 100%; height:4%; position: absolute; bottom: 0;"></footer>
</body>
</html>