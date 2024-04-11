<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>評論新增</title>
</head>
<body>
<%

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
            sql = "USE `album`";
            con.createStatement().execute(sql);
            request.setCharacterEncoding("UTF-8");  
            String new_content = request.getParameter("content");
            java.sql.Date new_date = new java.sql.Date(System.currentTimeMillis());	
            int c = 0;
            String new_name = request.getParameter("name");

//Step 4: 執行 SQL 指令
            String email = request.getParameter("email");
            sql="INSERT `response` ( `name`, `email`, `date`, `content`) ";
            sql+="VALUES ('" + new_name + "', ";
            sql+="'" + email +"',";
            sql+="'" + new_date +"',";
            sql+="'"+ new_content +"')";
            con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
          out.print("<script>alert('謝謝給予我們意見');location.href='index.jsp'</script>");
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>