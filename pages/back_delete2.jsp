<%@page import = "java.sql.*"%>
<%@page language="java" contentType="text/html"  pageEncoding="UTF-8"%>	

<html>
<head>
<title>確認商品刪除</title>
</head>
<body>
<%
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost/?serverTimezone=UTC";
            Connection con=DriverManager.getConnection(url,"root","1234");
			String sql="USE `coffee`";
			con.createStatement().execute(sql);
			String name=request.getParameter("goods");
			String sql1="DELETE FROM `products` WHERE `name`='"+name+"'";
		    con.createStatement().execute(sql1);
			out.print("<script>alert('刪除成功');location.href='back_delete.jsp'</script>");
            con.close();
		   
%>
</body>
</html>