<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>更新會員資料</title>

<%
	String username=request.getParameter("account");
	String sex=request.getParameter("sex");
	String birth=request.getParameter("birthday");
	String tel=request.getParameter("tel");
	String pwd=request.getParameter("password");
	String checkpwd=request.getParameter("checkpassword");		
	String email=request.getParameter("email");
	
	

if(session.getAttribute("id") != null ){
    if(request.getParameter("account")!=null){
    
	
	sql = "UPDATE `members` SET `customer_id`='"+username+"' WHERE `customer_id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
    sql = "UPDATE `members` SET `sex`='"+sex+"' WHERE `customer_id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
	sql = "UPDATE `members` SET `birthday`='"+birth+"' WHERE `customer_id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
    sql = "UPDATE `members` SET `tel`='"+tel+"' WHERE `customer_id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
	sql = "UPDATE `members` SET `pwd`='"+pwd+"' WHERE `customer_id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
	sql = "UPDATE `members` SET `checkpwd`='"+checkpwd+"' WHERE `customer_id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
	sql = "UPDATE `members` SET `email`='"+email+"' WHERE `customer_id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
 
	
	int no=con.createStatement().executeUpdate(sql);
	if(no>0){
		out.println("<script language='javascript'>alert('更新成功!!');window.location.href='members.jsp';</script>");	

	//out.close();
	}
	else{
		//con.close();
		out.println("<script language='javascript'>alert('更新失敗!!請填寫完整資訊');window.location.href='members.jsp';</script>");
	}

}
}
else{
%>
<h1><font color="red">您尚未登入，請登入！</font></h1>
<form action="check.jsp" method="POST">
帳號：<input type="text" name="id" /><br />
密碼：<input type="password" name="pwd" /><br />
<input type="submit" name="b1" value="登入" />
</form>

<%
}
%>