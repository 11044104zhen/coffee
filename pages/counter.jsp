<%@ page import = "java.sql.*, java.util.*"%>
<!-- 引入資源 -->
<%@page contentType="text/html" pageEncoding="utf-8"%>
<html>

<head>
	<title>網站總瀏覽數統計</title>
	<meta charset="utf-8">
</head>

<body>

<%
try { // 例外處理
    Class.forName("com.mysql.jdbc.Driver"); // 啟動 JDBC 驅動程式
    try {	// 例外處理
        String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC"; // url 是連接 MySQL 的位址（IP 或網域）
        String sql=""; // 建立字串變數 sql
        Connection con=DriverManager.getConnection(url,"root","1234"); // 連接 MySQL 資料庫（帳號：root；密碼：1234）
        if(con.isClosed()) // con.isClosed() 回傳 ture 代表連線關閉
           out.println("警告：連線建立失敗！"); // 連線關閉代表連線沒有被建立
        else { // 連線成功建立就可以開始取得與更新資料庫的資料
				sql="USE coffee"; // SQL 語法：使用 cych 資料庫
				con.createStatement().execute(sql); // 執行上一行的 SQL
				sql="SELECT * FROM counter"; // SQL 語法：取得 counter 資料表中的所有資料
				ResultSet rs=con.createStatement().executeQuery(sql); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果
			while(rs.next()) // 一筆一筆讀取資料，回傳 false 表示讀取結束
            {
				String c_S= rs.getString(1); // 取得資料表第一個欄位的資料到 c_S 這個字串中
				int c=Integer.parseInt(c_S); // 將 c_S 這個字串轉成 int 整數並存至 c 變數
				if (session.isNew()) { // 如果使用者是使用新的 Session 連入
					c++; // c 變數 +1
				out.print(c); // 印出 c 變數
			}
			else  // 如果使用者不是使用新的 Session 連入
			{
				out.print(c); // 直接印出 c 變數
			} 
			sql="UPDATE counter SET count=\'" + c + "\'"; // SQL 語法：將 c 的數字更新到 counter 資料表中的 count 欄位
			}
			con.createStatement().execute(sql); // 執行剛剛的 SQL 語法
			con.close(); // 關閉 MySQL 連線
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