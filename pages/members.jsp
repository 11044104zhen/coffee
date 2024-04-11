<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html>

<head>
<title>會員資料</title>
<meta charset="UTF-8">
<link rel="icon" href="../image/icon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 響應式網站 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Boostrap 導入程式 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<link rel="stylesheet" href="../css/profile.css">
</head>

<body>


<header>
    <div class="logo"> <!--LOGO-->
        <a href="index2.jsp"><img src="../image/logo.png" style="width: 100px; height: 100px;"></a>
    </div>
    <nav>
        <a href="index2.jsp">首頁</a>
            <a href="coffee2.jsp">商品頁面</a>
            <a href="board2.jsp">留言板</a>
            <a href="aboutus2.jsp">關於我們</a>
            <a href="logout.jsp">登出會員</a>
            <a href="members.jsp">修改會員資料</a>
            <a href="cart2.jsp">🛒購物車</a>
    </nav>
</header>
    <div class="block">
        <div class="square1">
            <div class="title">My <br> Profile</div>
        </div>
		<%
		if(session.getAttribute("id")!=null&&!session.getAttribute("id").equals(""))
		{
			sql="SELECT * FROM `members` WHERE `customer_id`='"+session.getAttribute("id")+"';";
			PreparedStatement pstmt = null;
			pstmt=con.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			String id="",sex="",birthday="",tel="",password="",checkpassword="",email="";
			while(rs.next())
			{
				id=rs.getString("customer_id");
				sex=rs.getString("sex");
				birthday=rs.getString("birthday");
				tel=rs.getString("tel");
				password=rs.getString("pwd");
				checkpassword=rs.getString("checkpwd");
				email=rs.getString("email");	
			}
		%>		
        <div class="square2">
            <div class="txt">
                帳號&nbsp;:&nbsp;<%=id%><br>
                性別&nbsp;:&nbsp;<%=sex%><br>
                生日&nbsp;:&nbsp;<%=birthday%><br>
                手機&nbsp;:&nbsp;<%=tel%><br>
                Email&nbsp;:&nbsp;<%=email%><br>
            
            <input type="button" data-bs-toggle="modal" data-bs-target="#loginModal" value="編輯"class="edit"></input>
            </div>
        </div>
		
    </div> 


    <h2>購物紀錄</h2>
    <div class="block">
        <div class="block2">
            <div class="card1">
                <div class="txt-p">
				<%                
                    sql="SELECT * FROM `orders` WHERE `name`='"+id+"'";
                    ResultSet rs1=con.createStatement().executeQuery(sql);//依照訂單編號查詢訂單                           
					if (rs1.next()) {
						out.print("<h5 style='font-weight:bold;'>訂單流水號:" + rs1.getString(11) + "</h5><br>");
						String sql4 = "SELECT * FROM `orders` WHERE `name`='"+id+"'";;
						ResultSet rs4 = con.createStatement().executeQuery(sql4);
						while (rs4.next()) {
							
							out.print("商品ID:" + rs4.getString(3) + "&nbsp &nbsp");
							out.print("購買數量:" + rs4.getString(8) + "&nbsp &nbsp");
							out.print("總計:" + rs4.getInt(10) + "<br>");
						}
					}
				%>
                </div>
            </div>
            
        </div>
    </div>
    <h2>評論紀錄</h2>
    <div class="block">
        <div class="block2">
            <div class="card1">
			<%
				String sql1="SELECT * FROM `board` WHERE `name`='"+id+"'"; // SQL 語法：取得資料表中的所有資料
				ResultSet rs2=con.createStatement().executeQuery(sql1); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果
					
			   
				while(rs2.next())
				{
					out.print("<div class='myname'>");					
					out.print(rs2.getString(3));				
					out.print("</div>");
					out.print("<div class='date'>");					
					out.print(rs2.getString(7));				
					out.print("</div>");
					out.print("<div class='conment'>");					
					out.print(rs2.getString(6));				
					out.print("</div>");
			
										   
				}
				
			%>
            </div>
        </div>
    </div>

    <footer>
        <p class="pagetop"><a href="#top">▲回TOP</a></p> <!--TOP傳送門-->
        <p class="copyright">瀏覽人數：
		<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			if (con.isClosed()) {
				out.println("警告：連線建立失敗！");
			} else {
				sql = "USE coffee";
				con.createStatement().execute(sql);
				String sql2 = "SELECT * FROM counter";
				ResultSet rs3 = con.createStatement().executeQuery(sql2);
				while (rs3.next()) {
					String c_S = rs3.getString(1);
					int c = Integer.parseInt(c_S);
					if (session.isNew()) {
						c++;
						out.print(c);
					} else {
						out.print(c);
					}
					sql = "UPDATE counter SET count='" + c + "'";
				}
				con.createStatement().execute(sql2);
				con.close();
			}
		} catch (ClassNotFoundException err) {
			out.println("警告：class 錯誤！" + err.toString());
		} catch (SQLException sExec) {
			out.println("警告：MySQL 錯誤！" + sExec.toString());
		}
		%>
		
		
		<br> Copyright © 2023。本網站僅為作業之用，如有侵權敬請告知。</p>
    </footer>

    <!-- boostrap跳出視窗內容 -->

<div class="modal fade" id="loginModal">
    <div class="modal-dialog">
        <div class="modal-content">
        <!-- Header -->
        <div class="modal-header">
            <h3>編輯個人資料</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <!-- Body -->
        <div class="modal-body">
            <!-- 個資表單 -->
            <form method="post" action="update.jsp">
                <!-- 內容欄位 -->
                <div class="form-group">
                    <input type="text" class="account form-control" name="account" placeholder="帳號名稱">
                    <input type="text" class="account form-control" name="sex" placeholder="性別">
                    <input type="text" class="account form-control" name="birthday" placeholder="生日">
                    <input type="text" class="account form-control" name="tel" placeholder="手機">
                    <input type="text" class="account form-control" name="password" placeholder="修改密碼(最多十碼)">
                    <input type="text" class="account form-control" name="checkpassword" placeholder="再次確認密碼(最多十碼)">
                    <input type="email" class="account form-control" name="email" placeholder="Email">
                    
                </div>
                
                <!-- 送出按鈕 送出後重回個人資料頁面-->
				<input type="submit" class="btn btn-info" value="確認送出" />
            </form>
        </div>
        <!-- Footer -->
        <div class="modal-footer">
            <div class="signup">
                <span>Violet Cafe</span>
            </div>
        </div>
    </div>
</div>
<%}
else
{
	con.close();
	out.println("<script language='javascript'>alert('您尚未登入，請登入!');window.location.href='login.jsp';</script>");
}
%>  
</body>
</html>