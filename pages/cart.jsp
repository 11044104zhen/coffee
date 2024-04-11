<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 響應式網站 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Boostrap 導入程式 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

    
    <title>購物車</title>
    <link rel="icon" href="../image/icon.ico">
    <link rel="stylesheet" href="../css/shopping.css"> <!--連結CSS-->
</head>
<%//登入控制
int a=0;
int total=0;
if(session.getAttribute("id")!=null&&!session.getAttribute("id").equals(""))
{
%>

<%
	try {
			Class.forName("com.mysql.jdbc.Driver");
			try {	
				String url="jdbc:mysql://localhost/?serverTimezone=UTC";
				Connection con=DriverManager.getConnection(url,"root","1234");
				if(con.isClosed()) // con.isClosed() 回傳 ture 代表連線關閉
					out.println("警告：連線建立失敗！");		
				   
				else { // 連線成功建立就可以開始取得與更新資料庫的資料
					String sql="USE `coffee`";
					con.createStatement().execute(sql);
					String userid=(String)session.getAttribute("id");
					String sql1 = "SELECT * FROM `cart` WHERE `customer_id`='" +userid+"'"; //查詢對應使用者 
					ResultSet rs=con.createStatement().executeQuery(sql1); // ResultSet 用來儲存查詢結果，將上一行 SQL 執行後並儲存結果
%>
<body>
    <header>
        <div class="logo"> <!--LOGO-->
            <a href="index.jsp"><img src="../image/logo.png" style="width: 100px; height: 100px;"></a>
        </div>
        <nav>
            <a href="index.jsp">首頁</a>
            <a href="coffee.jsp">商品頁面</a>
            <a href="aboutus.jsp">關於我們</a>
            <a href="login.jsp">登入會員</a>
            <a href="cart.jsp">🛒購物車</a>
        </nav>
    </header>
    <section>
        <h1>購物車  🛒</h1>
		<form action="cart_update.jsp" method="post">
		<%
					while(rs.next())
					{
						
						String productid=rs.getString(2);
						String sql_products="select * from `products` where `id` ='"+productid+"'";
						ResultSet rs_products=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql_products);
						
						while(rs_products.next())
						{	
							out.print("<div class='block'>");
							out.print("<img src='"+rs_products.getString(4)+"' class='itemimg'>");//產品圖片
							out.print("<div class='card1'>");
							out.print("<p class='text' style='font-weight: 900;'>品名:"+rs_products.getString(2)+"<br>"+"</p>");//產品名稱
							out.print("價格:NT"+rs_products.getString(6)+"<br>");//產品價格
							out.print("<div>");			
							out.print("<input type='hidden' name='product_id"+a+"' value='"+rs_products.getString(1)+"'>");//隱藏傳遞，跟表單一起傳
							out.print("<input type='button' value='-' class='btn1' onclick='minus("+a+")'>&nbsp");
							out.print("<input type='text' size='3' class='input_num' name='product_number"+a+"' value='"+rs.getString(3)+"'>&nbsp");
							out.print("<input type='button' value='+' class='btn1' onclick='add("+a+")'>");
							out.print("<button class='delete'> <a href='deleteproduct.jsp?product_id="+rs_products.getString(1)+"' style='text-decoration:none;color:white;'>"+"刪除</a></button>");
							out.print("</div>");
							out.print("</p>");
							out.print("</div>");
							out.print("</div> ");
						}
						a++;
					}
					String sqll = "SELECT * FROM `cart` WHERE `customer_id`='" +userid+"'";
					ResultSet rs1=con.createStatement().executeQuery(sqll);
					
					int sum=0;
					while(rs1.next()){												
						String sql2="SELECT * FROM `cart` WHERE `product_id`='"+rs1.getString(2)+"'";
						ResultSet rs2 =con.createStatement().executeQuery(sql2);
						while(rs2.next()){
							String sql3="SELECT `name`,`price` FROM `products` WHERE `id`='"+rs2.getString(2)+"'";
							ResultSet rs3=con.createStatement().executeQuery(sql3);
							while(rs3.next()){
								int price=rs3.getInt(2);
								int stock2=rs1.getInt(3);
								int subtotal=price*stock2;
								
								sum+=subtotal;

							}
						}
					}	
					out.print("<div class='total'>");
					out.print("<div class='price'>");
					out.print("總計:NT"+sum);
					out.print("</div>");
					out.print("</div>");
					
					con.close();
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
			<!--結帳按鈕--> 
			<div class="block">
				<!--<button type="button" class="buy" onclick="checkclick()">結帳去</button>-->
				<input type="button" data-bs-toggle="modal" data-bs-target="#loginModal" value="結帳去"class="buy"></input>
			</div>        
		</form>
					<%}
		else
		{
			//con.close();
			out.println("<script language='javascript'>alert('您尚未登入，請登入!');window.location.href='login.jsp';</script>");
		}
		%>
    </section>
    
    
   

    <footer>
        <p class="pagetop"><a href="#top">▲回TOP</a></p> <!--TOP傳送門-->
        <p class="copyright">瀏覽人數：<%@include file="counter.jsp"%><br> Copyright © 2023。本網站僅為作業之用，如有侵權敬請告知。</p>
    </footer>

    <!-- boostrap跳出視窗內容 -->
	
    <div class="modal fade" id="loginModal">
        <div class="modal-dialog">
            <div class="modal-content">
            <!-- Header -->
            <div class="modal-header">
                <h3>填寫購買資訊</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Body -->
            <div class="modal-body">
                <!-- 個資表單 -->
                <form>
				
                    <!-- 內容欄位 -->
                    <div class="form-group">
                        <input type="text" class="account form-control"  name="receivername" placeholder="收件人姓名">
                        <input type="text" class="account form-control" name="addr" placeholder="收件地址">
                        <input type="text" class="account form-control" name="tel" placeholder="手機">
                        <input type="email" class="account form-control" name="email" placeholder="Email">
                        <div class="paytxt">選擇付款方式:</div>
                        <select name="pay_way" id="" class="account form-control">
                            <option value="creditcard">信用卡</option>
                            <option value="cash">貨到付款</option>
                            <option value="atm">ATM付款</option>
                        </select>
                    
                        
                    </div>
                    
                    <!-- 送出按鈕 -->
                    <a href="shopping.html"><!--送出後清空購物車-->
                    <button type="button" class="btn btn-info" onclick="checkclick()"> 確認送出 </button>
                    </a>
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




    <script>
        function minus(ctn_num){
            var num = Number(document.getElementsByClassName("input_num")[ctn_num].value);
            if(num > 1){
                document.getElementsByClassName("input_num")[ctn_num].value = num-1;
            }
        }
        function add(ctn_num){
            var num = Number(document.getElementsByClassName("input_num")[ctn_num].value);
            if(num < 100){
                document.getElementsByClassName("input_num")[ctn_num].value = num+1;
            }
        }

        function checkclick(){
             window.alert("您的訂單已完成");
        }

    </script>
    
</body>
</html>