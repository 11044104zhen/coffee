<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="config.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>瀏覽訂單</title>
    <link rel="icon" href="../image/icon.ico">
    <link rel="stylesheet" href="../css/backmanage2.css"> <!--連結CSS-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <style>

        .pagination {
            margin-top: 20px;
            text-align: center;
        }

        .pagination a {
            color: #7f5539;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .pagination a.active {
            background-color: #7f5539;
            color: #fff;
        }

    </style>
</head>

<body>
    <div>
        <div class="backg"></div>
    </div>

    <header>
        <div class="logo"> <!--LOGO-->
            <a href="#"><img src="../image/logo.png" style="width: 100px; height: 100px;"></a>
        </div>
        <h1>後台管理系統</h1>
        <nav>
            <a href="back_new.jsp">新增商品</a>
            <a href="back_delete.jsp">刪除商品</a>
            <a href="back_alter.jsp">修改商品</a>
            <a href="order_view.jsp">瀏覽訂單</a>
        </nav>
        <div>
            <a href="login.jsp" class="logout">
                <p>
                    <img src="../image/logout.png" alt="" style="width:100px; height:100px;">
                </p>
            </a>
        </div>
    </header>

    <section class="all">
        <br><br><div class="title" style="text-align:center">訂單紀錄</div><br><br>
         <%
            String orders_number = (String) application.getAttribute("order_number");
            int ordernumber = 0;
            try {
                ordernumber = Integer.parseInt(orders_number);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            int pageSize = 5; // 每頁顯示的訂單數量
            int currentPage = 1; // 當前頁數，從第1頁開始
            int totalPage = (int) Math.ceil((double) ordernumber / pageSize); // 總頁數

            // 獲取 URL 中的當前頁數，若無則默認為第1頁
            String currentPageParam = request.getParameter("currentPage");
            if (currentPageParam != null && !currentPageParam.equals("")) {
                currentPage = Integer.parseInt(currentPageParam);
            }

            int startIndex = (currentPage - 1) * pageSize; // 每頁的起始索引
            int endIndex = Math.min(currentPage * pageSize, ordernumber) - 1; // 每頁的結束索引

            // 根據訂單流水號降序排列訂單
            String orderQuery = "SELECT * FROM `orders` ORDER BY orders_number DESC LIMIT " + startIndex + ", " + pageSize;
            ResultSet rs = con.createStatement().executeQuery(orderQuery);
            while (rs.next()) {
                int orderIndex = rs.getInt("orders_number");
                out.print("<h3><br>訂單流水號: " + orderIndex + "<br><br></h3>");
                out.print("顧客ID:" + rs.getString(2) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" );
                out.print("姓名: " + rs.getString(4) + "<br>");
                out.print("電話: " + rs.getString(5)+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                out.print("地址: " + rs.getString(7) + "<br>");
                out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email: " + rs.getString(6)+"&nbsp;&nbsp;&nbsp;&nbsp;");
                out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 付款方式: " + rs.getString(9) + "<br>");

                // 查詢該訂單的商品信息
                String orderItemSql = "SELECT * FROM `orders` WHERE `orders_number`=" + orderIndex;
                ResultSet rs1 = con.createStatement().executeQuery(orderItemSql);
                while (rs1.next()) {
                    out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 商品ID：" + rs1.getString("product_id"));
                    out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;購買數量：" + rs1.getInt("product_number") + "<br><br>");
                    out.print("<p style='color:red; font-weight:bold;'>總計：NT" + rs1.getInt("total") + "<br><br></p>");
				}
				out.print("<hr>");
			}
%>
    </section>

    <div class="pagination">
        <%
            out.print("<div style='text-align: center; margin-top: 30px;margin-bottom: 70px;'>");
            if (currentPage > 1) {
                out.print("<a href='order_view.jsp?currentPage=" + (currentPage - 1) + "'>上一頁</a>&nbsp;&nbsp;");
            }
            for (int i = 1; i <= totalPage; i++) {
                if (i == currentPage) {
                    out.print("<span style='font-weight:bold;'>" + i + "</span>&nbsp;&nbsp;");
                } else {
                    out.print("<a href='order_view.jsp?currentPage=" + i + "'>" + i + "</a>&nbsp;&nbsp;");
                }
            }

            if (currentPage < totalPage) {
                out.print("<a href='order_view.jsp?currentPage=" + (currentPage + 1) + "'>下一頁</a>");
            }
            out.print("</div>");
        %>
    </div>
    <footer style="background-color: #7f5539; width: 100%; height:4%; position: fixed; bottom: 0; left: 0;"></footer>

</body>
</html>