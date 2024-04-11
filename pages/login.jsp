<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Violet Cafe</title>
    <link rel="icon" href="../image/icon.ico">
    <link rel="stylesheet" href="../css/back.css"> <!--連結CSS-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
    <header>
        <div class="logo"> <!--LOGO-->
            <a href="index.jsp"><img src="../image/logo.png" style="width: 100px; height: 100px;"></a>
        </div>
        <nav>
            <a href="index.jsp">首頁</a>
            <a href="coffee.jsp">商品頁面</a>
            <a href="board.jsp">留言板</a>
            <a href="aboutus.jsp">關於我們</a>
            <a href="login.jsp">登入會員</a>
            <a href="cart.jsp">🛒購物車</a>
        </nav>
    </header>
    <main>
    <form action="check.jsp" class="login">
        <h1>會員登入</h1>
        <i class="fa fa-user-circle-o"></i>
        <h2>帳號</h2>
        <input type="text" name="id" id="Account" placeholder="請輸入帳號">
        <h2>密碼</h2>
        <input type="password" name="pwd" id="Password" placeholder="請輸入密碼">
        <button type="submit">登入</button>
        <br>還沒有帳號已經註冊了嗎？  &nbsp&nbsp<a href="signup.jsp">前往註冊</a>
    </form>
   </main>

    <footer>
        <p class="pagetop"><a href="#top">▲回TOP</a></p> <!--TOP傳送門-->
        <p class="copyright">瀏覽人數：<%@include file="counter.jsp"%><br> Copyright © 2023。本網站僅為作業之用，如有侵權敬請告知。</p>
    </footer>

