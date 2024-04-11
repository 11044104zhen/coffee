<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Violet Cafe</title>
    <link rel="icon" href="../image/icon.ico">
    <link rel="stylesheet" href="../css/index.css"> <!--連結CSS-->
</head>
<html>
<body>
    <header>
        <div class="logo"> <!--LOGO-->
            <a href="index.jsp"><img src="../image/logo.png" style="width: 100px; height: 100px;"></a>
        </div>
		<form action="search.jsp" method="get">
				<span class="icon"><img src="../image/search.png" style="width:3% ; height:5% ; position:absolute;top:4.2%;left:59%"></span>
				<input type="search"  id="search" placeholder="Search..." name="search" style="position:absolute;top:5.2%;left:62%;height:3%"/>
			</form>
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
	
   <main>
        <div class="ADcontainer"> <!--廣告版-->
            <div id="change">
                <img src="../image/5.jpg" width="400px" height="280px" alt="Image 1">
                <img src="../image/9.jpg" width="400px" height="280px" alt="Image 2">
                <img src="../image/11.jpg" width="400px" height="280px" alt="Image 3">
                <img src="../image/15.jpg" width="400px" height="280px" alt="Image 4">
                <img src="../image/24.jpg" width="400px" height="280px" alt="Image 5">
              </div>
        </div>
        <article class="profile"> <!--article1-->
            <div class="about">
                <h2>關於咖啡，我想說...</h2>
                <p>在這喧囂繁忙的生活環境，咖啡已經成為多數人的一部分，好比在早晨陽光的擁抱中，咖啡的清香驅散了我們那纏人的睡意；在午後夕照的怠緩中，咖啡的甜味讓我們有充足的精神可以繼續奮鬥；在夜晚月光的沐浴下，咖啡的回甘來結束一天，讓我們的付出都能有回報。</p><p>咖啡陪伴著你我一天的旅途，不管我們在世界的何處，只要有一杯咖啡，都能讓我們在繼續努力下去，因為，咖啡就是我們最好的依靠。</p>
            </div>
        </article>
        <hr>
        <article class="profile2"> <!--article2-->
            <div class="something">
                <h2>關於violet cafe，我想說...</h2>
                <p>創立此violet cafe品牌的原因是由ヴァイオレット・エヴァーガーデン中所衍生出來的，我們想帶給顧客們的感受，就是讓顧客可以把我們當成最信任的朋友，我們也秉持著，不管顧客在哪裡，我們都會以最真誠的服務，將最好的商品送到顧客的手上，這就是我們violet cafe堅持的地方。</p>
            </div>
        </article>
    </main>

    <footer>
        <p class="pagetop"><a href="#top">▲回TOP</a></p> <!--TOP傳送門-->
        <p class="copyright">瀏覽人數：<%@include file="counter.jsp"%><br> Copyright © 2023。本網站僅為作業之用，如有侵權敬請告知。</p>
    </footer>
    <script>
        //Script設定
        const change = document.getElementById('change');
        const images = change.getElementsByTagName('img');
        var photos = 0;

        function showImage(index) {
          for (var i = 0; i < images.length; i++) {
            if (i === index) {
              images[i].style.opacity = 1;
            } else {
              images[i].style.opacity = 0;
            }
          }
        }

        function nextImage() {
            photos = (photos + 1) % images.length;
          showImage(photos);
        }
    
        showImage(photos);
        setInterval(nextImage, 5000);//計時5秒然後換下一張圖片
      </script>
</body>
</html>