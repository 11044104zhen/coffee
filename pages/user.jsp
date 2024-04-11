<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>






















<html>

<head>
<title>個人資料</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 響應式網站 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Boostrap 導入程式 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

<link rel="stylesheet" href="css/profile.css">
<style>
* {
    margin: 0;
    padding: 0;
}

/*設定所有圖片的邊框為0*/
img {
    border: 0;
}

header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px;
    background-color: #7f5539;
}

nav {
    display: flex;
    gap: 10px;
}

/*nav的連結*/
nav a {
    color: #FFFFFF;
    text-decoration: none;
    transition: color 0.3s;
}

/*nav的動畫*/
nav a:hover {
    color: #dea360;
    text-decoration: none;
}



/*回TOP*/
.pagetop {
    text-align: right;
}

/*版權*/
.copyright {
    border-top: solid 5px #A16F36;
    text-align: center;
    padding-top: 20px;
}

hr {
    border: 0;
    border-top: 1px solid #ccc;
    width: 50%;
    text-align: center;
}

footer {
    background-color: #ede0d4;
    font-size: 14px;
    font-weight: 200;
    line-height: 1em;
    padding: 20px;
}


body {
    background-color: #ede0d4;
}

section {
    margin: 20px;
}

/*商品區塊*/

.block {
    display: flex;
    justify-content: center;
}

h2 {
    margin: 3% 0% 2% 20%;
    font-size: 25px;
    font-weight: bold;
}

/*商品圖片*/
.itemimg {
    border-radius: 50%;
    float: left;
    width: 150px;
    height: 150px;
}

h1 {
    text-align: center;
    padding: 40px;
    font-size: 40px;
    color: #7f5539;
}

.square1 {
    margin: 5% 0% 0% 20%;
    width: 400px;
    height: 300px;
    background: #b08868d5;
    position: relative;
    z-index: 0;
    float: left;
}

.square2 {
    margin: 5% 20% 0% 0%;
    width: 40%;
    height: 300px;
    background: #e6ccb2;
    position: relative;
    z-index: 0;
    float: right;
}


.title {
    margin-top: 10%;
    color: white;
    text-align: center;
    font-size: 80px;
    line-height: 100px;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}

.txt {
    margin: 40px;
    font-size: 20px;
    line-height: 10mm;

}

/*購物記錄區塊*/
.block2 {
    width: 80%;
    display: flex;
    margin: 0.1% 0% 0% 20%
        /*對齊*/
}

.card1 {
    padding-left: 3%;
    background-color: #e6ccb284;
    width: 75%;
    /*寬度*/
    border: 0px;

}

.itemimg-p {
    border-radius: 50%;
    float: left;
    margin: 2% 1% 1% 1%;
    width: 150px;
    height: 150px;
}

.txt-p {
    margin: 4% 0% 4% 22%;
    line-height: 10mm;

}

.edit {
    margin: 2% 0% 0% 30%;
    padding: 3px 12px;
    border: none;
    background: #7f5539;
    color: white;
    font-size: 14px;
    font-weight: 600;
    position: relative;
    left: 50px;
    cursor: pointer;
}

.edit:hover {
    background-color: black;
}

/*boostrap跳出視窗*/
.modal-header {
    height: 100px;
    background-color: #b08968;
}

.modal-footer {
    height: 50px;
    background-color: #b08968;
}

.modal-header h3 {
    font-size: 30px;
    color: white;
    /* 置中 */
    position: absolute;
    top: 7%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.modal-body {
    background-color: #ede0d4;
}

.modal-body form .account,
.modal-body form .password {
    margin: 30px;
    width: 90%;
    border-radius: 20px;
}

.remember {
    margin-bottom: 20px;
}

.modal-body form .btn {
    width: 100%;
    font-size: 25px;
    color: white;
    background-color: #b08968;
    border: #432d1d;
}

.modal-footer .signup span {
    text-align: center;
    color: #FFFFFF;
}

/*評論紀錄*/
.myname {
    margin: 2% 0% 0% 1%;
    font-size: 18px;
    font-weight: bold;
    color: #432d1d;
}

.date {
    font-size: 14px;
    margin: 0% 0% 0% 6%;
    color: rgb(150, 140, 140);
}

.conment {
    margin: 0% 1% 3% 6%;
}

</style>
</head>
<body>
<%
if(session.getAttribute("id") != null){
	sql="SELECT * FROM `members` WHERE `id`='" + session.getAttribute("id") + "';";
	ResultSet rs = con.createStatement().executeQuery(sql);
	String id="",pwd="";
	while(rs.next()){
		id=rs.getString("id");
		pwd=rs.getString("pwd");
	}
	con.close();
}
%>
<header>
    <div class="logo"> <!--LOGO-->
        <a href="index.html"><img src="image/logo.png" style="width: 100px; height: 100px;"></a>
    </div>
    <nav>
        <a href="index.html">首頁</a>
        <a href="store.html">商品頁面</a>
        <a href="aboutus.html">關於我們</a>
        <a href="login.html">哈囉!<%=id%></a>
        <a href="shopping.html">🛒購物車</a>
    </nav>
</header>
    <div class="block">
        <div class="square1">
            <div class="title">My <br> Profile</div>
        </div>
        <div class="square2">
            <div class="txt">
                名字: 嗨嗨          <br>
                性別:   不明        <br>
                生日:  2023.5.24         <br>
                手機:   1234567891        <br>
                Email:  123456@gmail.com        <br>
            
            <input type="button" data-bs-toggle="modal" data-bs-target="#loginModal" value="編輯"class="edit"></input>
            </div>
        </div>
    </div> 


    <h2>購物紀錄</h2>
    <div class="block">
        <div class="block2">
            <div class="card1">
                <img src="https://picsum.photos/150/150?random=1" alt="Image 1" class="itemimg-p"  >
                <div class="txt-p">
                    品名:                  <br>
                    價格:                  <br>
                    購買數量:              <br>

                </div>
            </div>
            
        </div>
    </div>
    <div class="block">
        <div class="block2">
            <div class="card1">
                <img src="https://picsum.photos/150/150?random=1" alt="Image 1" class="itemimg-p"  >
                <div class="txt-p">
                    品名:                  <br>
                    價格:                  <br>
                    購買數量:              <br>

                </div>
            </div>
            
        </div>
    </div>
    <h2>評論紀錄</h2>
    <div class="block">
        <div class="block2">
            <div class="card1">
                <div class="myname">嗨嗨</div>
                <div class="date">2023-05-24</div>
                <div class="conment">
                   Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi ad temporibus reprehenderit unde sequi quo quos similique! Sapiente similique, nihil at quibusdam ad aspernatur corrupti nesciunt quas perferendis, soluta accusantium?
                </div>
            </div>
            
        </div>
    </div>
    <div class="block">
        <div class="block2">
            <div class="card1">
                <div class="myname">嗨嗨</div>
                <div class="date">2023-05-24</div>
                <div class="conment">
                   Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi ad temporibus reprehenderit unde sequi quo quos similique! Sapiente similique, nihil at quibusdam ad aspernatur corrupti nesciunt quas perferendis, soluta accusantium?
                </div>
            </div>
            
        </div>
    </div>

    <footer>
        <p class="pagetop"><a href="#top">▲回TOP</a></p> <!--TOP傳送門-->
        <p class="copyright">本文瀏覽次數：123456<br> Copyright © 2023。本網站僅為作業之用，如有侵權敬請告知。</p>
    </footer>

    
    




</body>


</html>