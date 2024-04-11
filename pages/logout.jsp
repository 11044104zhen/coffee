<%@page import = "java.sql.*"%>
<%@page language="java" contentType="text/html"  pageEncoding="UTF-8"%>

<%
	session.removeAttribute("id");
	out.print("<script>alert('登出成功！');location.href='index.jsp'</script>");
%>