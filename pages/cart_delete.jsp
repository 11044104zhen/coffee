<!--刪除購物車裡的商品-->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
	try {
			Class.forName("com.mysql.jdbc.Driver");
			try {	
				String url="jdbc:mysql://localhost/?serverTimezone=UTC";
				Connection con=DriverManager.getConnection(url,"root","1234");
				if(con.isClosed()) // con.isClosed() 回傳 ture 代表連線關閉
				   out.println("警告：連線建立失敗！");
				else{
					String sql="USE `coffee`";
					con.createStatement().execute(sql);
					String productid=request.getParameter("product_id");
					String userid=(String)session.getAttribute("id");
					String sql1="DELETE FROM `cart` WHERE `customer_id`='"+userid+"' && `product_id`='"+productid+"'";
					con.createStatement().execute(sql1);
				}
				con.close();
				
				response.sendRedirect("cart2.jsp");
				}
				
			catch (SQLException sExec) {
				out.println("警告：MySQL 錯誤！"+sExec.toString()); // MySQL 錯誤警告
			}
		}
		catch (ClassNotFoundException err) {
		  out.println("警告：class 錯誤！"+err.toString()); // JDBC 錯誤警告
		}
	
%>