<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
<title>新增評論</title>
</head>
<body>
<%
	if(session.getAttribute("id")==null)
	{
		out.print("<script>alert('請先登入');window.location='login.jsp'</script>");
	}
	else
	{
   try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
            sql = "USE `coffee`";
            con.createStatement().execute(sql);
            request.setCharacterEncoding("UTF-8");  
            String new_content = request.getParameter("content");
            java.sql.Date new_date = new java.sql.Date(System.currentTimeMillis());	
            int c = 0;
            String new_name = request.getParameter("com");
			String new_product = request.getParameter("product");
			String new_star = request.getParameter("star");
			String acc = request.getParameter("author");
			
//Step 4: 執行 SQL 指令
            sql="INSERT `board` (`customer_id`,`name`, `product_name`, `star_number` ,`content`,`date`) ";
            sql+="VALUES ('" + new_name + "', ";
			sql+="'" + acc +"',";
			sql+="'" + new_product +"',";
			sql+="'" + new_star +"',";
            sql+="'" + new_content +"',";
            sql+="'"+ new_date +"')";
            con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
          out.print("<script>alert('新增留言成功');location.href='index2.jsp'</script>");
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
	}
%>
</body>
</html>