<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>

<html>
	<head>
		<title>確認產品修改</title>
	</head>
	
	<body>
<%          
            String name=request.getParameter("name");
            String intro=request.getParameter("intro");
            String img=request.getParameter("img");
            String place=request.getParameter("place");
            String price=request.getParameter("price");
            String iventory=request.getParameter("iventory");

		   if(name=="")
		   {
			   out.print("<script>alert(decodeURIComponent('修改失敗！商品名稱不能為空！請重新輸入'));location.href='back_alter.jsp'</script>");
			   return;
		   }
		   if(intro=="")
		   {
			   out.print("<script>alert(decodeURIComponent('修改失敗！商品介紹不能為空！請重新輸入'));location.href='back_alter.jsp'</script>");
			   return;
		   }
		   if(img=="")
		   {
			   out.print("<script>alert(decodeURIComponent('修改失敗！圖片路徑不能為空！請重新輸入'));location.href='back_alter.jsp'</script>");
			   return;
		   }
		   if(place=="")
		   {
			   out.print("<script>alert(decodeURIComponent('修改失敗！商品產地不能為空！請重新輸入'));location.href='back_alter.jsp'</script>");
			   return;
		   }
		   if(price=="")
		   {
			   out.print("<script>alert(decodeURIComponent('修改失敗！商品價格不能為空！請重新輸入'));location.href='back_alter.jsp'</script>");
			   return;
		   }
		   if(iventory=="")
		   {
			   out.print("<script>alert(decodeURIComponent('修改失敗！商品庫存不能為空！請重新輸入'));location.href='back_alter.jsp'</script>");
			   return;
		   }
	
	
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
						con.createStatement().executeUpdate(sql); // 執行上一行的 SQL
						int rs=con.createStatement().executeUpdate(sql); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果	
						
						String sql1 = "UPDATE `products` SET `name`='"+name+"' WHERE `name`='"+name+"'"; 
						con.createStatement().executeUpdate(sql1);
						   
						String sql2 = "UPDATE `products` SET `intro`='"+intro+"' WHERE `name`='"+name+"'";
						con.createStatement().executeUpdate(sql2);
						   
						String sql3 = "UPDATE `products` SET `img`='"+img+"' WHERE `name`='"+name+"'";
						con.createStatement().executeUpdate(sql3);
						   
						String sql4 = "UPDATE `products` SET `place`='"+place+"' WHERE `name`='"+name+"'";
						con.createStatement().executeUpdate(sql4);
							
						String sql5 = "UPDATE `products` SET `price`='"+price+"' WHERE `name`='"+name+"'"; 
						con.createStatement().executeUpdate(sql5);
						   
						String sql6 = "UPDATE `products` SET `iventory`='"+iventory+"' WHERE `name`='"+name+"'";
						con.createStatement().executeUpdate(sql6);
													
						out.print("<script>alert('修改成功!');location.href='back_alter.jsp'</script>");
							
						
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

	</body>
</html>