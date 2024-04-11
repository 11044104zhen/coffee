<!--新增商品到購物車-->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%//登入控制
if(session.getAttribute("id")!=null&&!session.getAttribute("id").equals(""))
{
%>
<%
	try {
			Class.forName("com.mysql.jdbc.Driver");
			try {	
				String url="jdbc:mysql://localhost/?serverTimezone=UTC";
				Connection con=DriverManager.getConnection(url,"root","1234");
				if(con.isClosed())
				   out.println("警告：連線建立失敗！");
				else{
					String sql="USE `coffee`";
					con.createStatement().execute(sql);
					request.setCharacterEncoding("UTF-8"); 
					String userid=(String)session.getAttribute("id");
					String productid=request.getParameter("product_id");
					String number=request.getParameter("product_number");
					
					if(number==null)
						number="1";
					
					String sql1="INSERT into `cart`(`customer_id`,`product_id`,`number`)";
					sql1+="VALUES('"+userid+"','"+productid+"','"+number+"')";      
					
					con.createStatement().execute(sql1);
				
					con.close();
					response.sendRedirect("cart2.jsp");
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
<%}
		else
		{
			//con.close();
			out.println("<script language='javascript'>alert('您尚未登入，請登入!');window.location.href='login.jsp';</script>");
		}
		%>