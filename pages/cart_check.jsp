<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<title>更新購物車資料</title>
<%
	String productid=request.getParameter("product_id");
	String number=request.getParameter("product_number");
	
	sql = "UPDATE `cart` SET `product_id`='"+productid+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
	sql = "UPDATE `cart` SET `product_number`='"+number+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
	
	con.close();
	response.sendRedirect("ordercheckout.jsp");
%>