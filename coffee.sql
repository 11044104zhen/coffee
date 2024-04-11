DROP DATABASE IF EXISTS coffee;

CREATE DATABASE coffee CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE coffee;

CREATE TABLE `board` (
   `board_id` int NOT NULL AUTO_INCREMENT,
   `customer_id` varchar(20) NOT NULL,
   `name` varchar(20) NOT NULL,
   `product_name` varchar(50) NOT NULL,
   `star_number` varchar(45) NOT NULL,
   `content` varchar(300) NOT NULL,
   `date` date NOT NULL,
   PRIMARY KEY (`board_id`)
 ) ;
 
 
 CREATE TABLE `cart` (
   `customer_id` varchar(30) NOT NULL,
   `product_id` varchar(10) NOT NULL,
   `number` int NOT NULL,
   `cart_id` int NOT NULL AUTO_INCREMENT,
   PRIMARY KEY (`cart_id`)
 ) ;
 
 CREATE TABLE counter (
   count int NOT NULL,
   PRIMARY KEY (count)
 ) ;
 
  INSERT INTO counter  VALUES(1000);
 
 
 
 CREATE TABLE members (
   customer_id varchar(30) NOT NULL,
   sex varchar(5) DEFAULT NULL,
   birthday varchar(45) DEFAULT NULL,
   tel varchar(20) DEFAULT NULL,
   pwd varchar(10) DEFAULT NULL,
   checkpwd varchar(10) DEFAULT NULL,
   email varchar(45) DEFAULT NULL,
   PRIMARY KEY (customer_id)
 ) ;
 
  INSERT INTO  members  VALUES("test","","","","1234","","");
  
  
  CREATE TABLE `orders` (
   `oid` int NOT NULL AUTO_INCREMENT,
   `customer_id` varchar(30) DEFAULT NULL,
   `product_id` varchar(10) DEFAULT NULL,
   `name` varchar(10) DEFAULT NULL,
   `tel` varchar(20) DEFAULT NULL,
   `email` varchar(45) DEFAULT NULL,
   `addr` varchar(100) DEFAULT NULL,
   `product_number` int DEFAULT NULL,
   `pay_way` varchar(20) DEFAULT NULL,
   `total` int DEFAULT NULL,
   `orders_number` int DEFAULT NULL,
   PRIMARY KEY (`oid`)
 ) ;
 
 
 CREATE TABLE products (
   id varchar(10) NOT NULL,
   `name` varchar(50) DEFAULT NULL,
   intro varchar(150) DEFAULT NULL,
   img varchar(50) DEFAULT NULL,
   place varchar(15) DEFAULT NULL,
   price int DEFAULT NULL,
   iventory int NOT NULL,
   PRIMARY KEY (id)
 ) ;
 
 
INSERT INTO  products  VALUES("P001","紅翡咖啡豆","多明尼加海拔最高之中央山脈Jarabacoa Cibao Altura莊園口感清爽、豐富餘韻、感受再次回甘的滋味","../image/1.jpg","多明尼加",450,160);
INSERT INTO  products  VALUES("P002","蜜處理 PRIME級莊園咖啡豆（226G）","多明尼加最新蜜處理咖啡；蜜處理法是介於日曬法及水洗法間的一種咖啡精製方式，蜜處理的咖啡具有很棒的甜味及果酸味的平衡，風味雖沒有日曬的咖啡濃烈，但卻更清新、香醇，並有濃郁巧克力及焦糖風味","../image/2.jpg","多明尼加",480,117);
INSERT INTO  products  VALUES("P003","多明尼加墨翠之咖啡生豆","採用有機方式栽植而成。口感濃郁豐富，有濃郁的巧克力香氣，渾厚但卻不澀，入口時會感到有中牧草的果酸味，隨著溫度及時間進而回甘，咖啡的口感不斷在口中變化。適合偏好有機栽植產品的您。","../image/3.jpg","多明尼加",440,99);
INSERT INTO  products  VALUES("P004","冰種 PRIME級莊園咖啡豆","位於多明尼加海拔最高之中央山脈Jarabacoa Cibao Altura莊園所種植的咖啡豆口感清爽、豐富餘韻、感受再次回甘的滋味味","../image/4.jpg","多明尼加",399,99);
INSERT INTO  products  VALUES("P005","超級加勒比配方咖啡豆","選用多明尼加生產的「加勒比冰種」&「加勒比墨翠」兩種阿拉比卡精品咖啡豆，採中深烘焙，口感甘甜滑順，最適合怕酸的族群享用。","../image/5.jpg","多明尼加",700,95);
INSERT INTO  products  VALUES("P006","西達摩 Legese Rowa Dasso","繽紛的熱帶水果風味，但有花香的清爽口感及檸檬柑橘的酸甜滋味。","../image/6.jpg","伊索比亞",1100,146);
INSERT INTO  products  VALUES("P007","紅櫻桃計畫 古吉 茉莉 水洗","清爽的綠茶口感，淡雅的花香伴隨著香草及柑橘的甜香味。","../image/7.jpg","伊索比亞",500,200);
INSERT INTO  products  VALUES("P008","西阿希 果拉康水洗廠 水洗","花草茶的香氣及口感，有藍莓的酸甜滋味及奶油的甜香味。。","../image/8.jpg","伊索比亞",800,207);
INSERT INTO  products  VALUES("P009","耶加雪菲 T.O.H冠軍處理廠系列 阿朵斯","豐富及強烈的熱帶水果口感、酸甜平衡、濃郁的果汁感，尾韻有著可可香氣。","../image/9.jpg","伊索比亞",1900,97);
INSERT INTO  products  VALUES("P010","利姆 巫克羅合作社","濃郁的茶感，有香草的甜香支撐風味，有著楓糖的甜感餘韻綿長。","../image/10.jpg","伊索比亞",500,100);
INSERT INTO  products  VALUES("P011","阿里山 特富野 豆御香藝妓咖啡莊園","檸檬清香、柑橘、茉莉花、綠茶、蜜蘋果、薑黃，茉香綠茶的清香圍繞口腔，餘韻綿長。","../image/11.jpg","台灣",3500,110);
INSERT INTO  products  VALUES("P012","阿里山 樂野 基布烏咖啡莊園","百香果、波羅蜜、鳳梨、新鮮水果茶、濃郁飽滿的水果香氣。","../image/12.jpg","台灣",1500,130);
INSERT INTO  products  VALUES("P013","阿里山 樂野 鄒讚咖啡莊園","香瓜、莓果、百香果、波羅蜜、可可、酒釀發酵，Body質感佳、層次豐富。","../image/13.jpg","台灣",1100,200);
INSERT INTO  products  VALUES("P014","阿里山 特富野 豆御香藝妓咖啡莊園","桃子、酸橙、果乾、藍莓、奶油、柔順水果的香氣、圓潤的口感。","../image/14.jpg","台灣",1900,249);
INSERT INTO  products  VALUES("P015","阿里山 番路 仙井咖啡莊園","花香、柑橘、百香果、Body圓潤飽滿、酸質乾淨明亮、甜感極佳。","../image/15.jpg","台灣",7000,230);
INSERT INTO  products  VALUES("P016","哥斯大黎加 音樂家協奏曲系列","[茶包式] 10入綜合茶包式咖啡","../image/16.jpg","哥斯大黎加",500,230);
INSERT INTO  products  VALUES("P017","哥斯大黎加 音樂家協奏曲系列","[濾掛式] 10入綜合濾掛式咖啡","../image/17.jpg","哥斯大黎加",500,200);
INSERT INTO  products  VALUES("P018","伊索比亞 古吉 烏拉嘎","[濾掛式] 單品濾掛式咖啡 日曬","../image/18.jpg","伊索比亞",175,100);
INSERT INTO  products  VALUES("P019","巴布亞新幾內亞 黑十字莊園","[茶包式] 單品茶包式咖啡 水洗","../image/19.jpg","巴布亞新幾內亞",175,100);
INSERT INTO  products  VALUES("P020","瓜地馬拉 安提瓜 瑪格麗特","[濾掛式] 單品濾掛式咖啡 水洗","../image/20.jpg","瓜地馬拉",175,90); 
INSERT INTO  products  VALUES("P021","MILA 高質感咖啡粉渣桶","不銹鋼咖啡敲渣桶/咖啡渣桶/義式敲渣桶","../image/21.jpg","中國",600,95); 
INSERT INTO  products  VALUES("P022","HeyCafé Buddy定量磨豆機","專業義式磨豆機 110V可家用 黑/白兩色","../image/22.jpg","中國",30000,130); 
INSERT INTO  products  VALUES("P023","KALITA 日本昭和復古陶瓷高台杯","陶瓷馬克杯 咖啡杯 200ml","../image/23.jpg","日本",430,150); 
INSERT INTO  products  VALUES("P024","HARIO V60 無限濾杯手沖套組","VDMU-02T-SPS 旅行套組","../image/24.jpg","日本",560,99); 
INSERT INTO  products  VALUES("P025","英國 Knock ｜Aergrind 迷你手搖磨豆機","義大利鍍鈦鋼刀盤","../image/25.jpg","英國",5040,100); 


CREATE TABLE products2 (
   id varchar(10) NOT NULL,
   `name` varchar(50) DEFAULT NULL,
   img varchar(50) DEFAULT NULL,
   intro varchar(150) DEFAULT NULL,
   specification varchar(20) DEFAULT NULL,
   bake varchar(30) DEFAULT NULL,
   beans varchar(20) DEFAULT NULL,
   place varchar(15) DEFAULT NULL,
   elevation varchar(20) DEFAULT NULL,
   `process` varchar(45) DEFAULT NULL,
   taste varchar(30) DEFAULT NULL,
   sour varchar(45) DEFAULT NULL,
   PRIMARY KEY (id)
 );

INSERT INTO  products2  VALUES("P001","紅翡咖啡豆","../image/1.jpg","多明尼加海拔最高之中央山脈Jarabacoa Cibao Altura莊園","半磅，226克裝","中度烘焙City Roast","阿拉比卡豆","多明尼加．Jarabacoa",	"1600公尺",	"水洗法","滑順回甘/香氣飽滿","適中"); 
INSERT INTO  products2  VALUES("P002","蜜處理 PRIME級莊園咖啡豆（226G）","../image/2.jpg","多明尼加最新蜜處理咖啡；蜜處理法是介於日曬法及水洗法間的一種咖啡精製方式，蜜處理的咖啡具有很棒的甜味及果酸味的平衡，風味雖沒有日曬的咖啡濃烈，但卻更清新、香醇，並有濃郁巧克力及焦糖風味","半磅，226克裝","淺度烘焙City Roast","阿拉比卡豆","多明尼加．Jarabacoa","1600公尺",	"蜜處理","清新、香醇，有濃郁巧克力及焦糖風味","帶有明顯滑順果酸味"); 
INSERT INTO  products2  VALUES("P003","墨翠 PRIME級莊園咖啡豆","../image/3.jpg","多明尼加墨翠之咖啡生豆採用有機方式栽植而成。口感濃郁豐富，有濃郁的巧克力香氣，渾厚但卻不澀，入口時會感到有中牧草的果酸味，隨著溫度及時間進而回甘，咖啡的口感不斷在口中變化。適合偏好有機栽植產品的您。","半磅，226克裝","中度烘焙City Roast","阿拉比卡豆","多明尼加．Jarabacoa","1100～1500公尺","水洗法","醇厚回甘","適中"); 
INSERT INTO  products2  VALUES("P004","冰種 PRIME級莊園咖啡豆","../image/4.jpg","位於多明尼加海拔最高之中央山脈Jarabacoa Cibao Altura莊園所種植的咖啡豆口感清爽、豐富餘韻、感受再次回甘的滋味味","半磅，226克裝","中度烘焙 City Roast","阿拉比卡豆","多明尼加．Jarabacoa","1100～1500公尺","水洗法","清爽滑順","適中"); 
INSERT INTO  products2  VALUES("P005","超級加勒比配方咖啡豆","../image/5.jpg","選用多明尼加生產的「加勒比冰種」&「加勒比墨翠」兩種阿拉比卡精品咖啡豆，採中深烘焙，口感甘甜滑順，最適合怕酸的族群享用。","半磅，226克裝","中深烘焙  Agtron#55 City Roast","阿拉比卡豆","多明尼加．Jarabacoa","1100～1500公尺","水洗法","清爽明亮","低"); 
INSERT INTO  products2  VALUES("P006","西達摩 Legese Rowa Dasso","../image/6.jpg","繽紛的熱帶水果風味，但有花香的清爽口感及檸檬柑橘的酸甜滋味。","半磅，226克裝","中度烘焙City Roast","阿拉比卡豆","多明尼加．Jarabacoa","2000公尺","水洗法","滑順回甘/香氣飽滿","適中");
INSERT INTO  products2  VALUES("P007","紅櫻桃計畫 古吉 茉莉 水洗","../image/7.jpg","紅櫻桃計畫為班莎鎮出產的咖啡，更是紅櫻桃計畫優質產品代表。","半磅，226克裝","中度烘焙City Roast","衣索比亞豆","Ethiopia","1800公尺","水洗法","綠茶口感、伴隨清香","無"); 
INSERT INTO  products2  VALUES("P008","西阿希 果拉康水洗廠 水洗","../image/8.jpg","花草茶的香氣及口感，有藍莓的酸甜滋味及奶油的甜香味。","半磅，226克裝","中深度烘焙City Roast","衣索比亞豆","西阿希","1900公尺","水洗法","酸甜香味","微"); 
INSERT INTO  products2  VALUES("P009","耶加雪菲 T.O.H冠軍處理廠系列 阿朵斯","../image/9.jpg","豐富及強烈的熱帶水果口感、酸甜平衡、濃郁的果汁感，尾韻有著可可香氣。","半磅，226克裝","中深度烘焙City Roast","衣索比亞豆","耶加雪菲","1950-2100公尺","水洗法","酸甜香味","適中"); 
INSERT INTO  products2  VALUES("P010","利姆 巫克羅合作社","../image/10.jpg","濃郁的茶感，有香草的甜香支撐風味，有著楓糖的甜感餘韻綿長。","半磅，226克裝","中深度烘焙City Roast","衣索比亞豆","耶加雪菲","1950-2100公尺","水洗法","濃郁茶香，偏甜","無"); 
INSERT INTO  products2  VALUES("P011","阿里山 特富野 豆御香藝妓咖啡莊園","../image/11.jpg","檸檬清香、柑橘、茉莉花、綠茶、蜜蘋果、薑黃，茉香綠茶的清香圍繞口腔，餘韻綿長。","半磅，226克裝","深度烘焙City Roast","台灣咖啡豆","特富野","1200公尺","水洗法","檸檬清香的清香圍繞口腔","無"); 
INSERT INTO  products2  VALUES("P012","阿里山 樂野 基布烏咖啡莊園","../image/12.jpg","百香果、波羅蜜、鳳梨、新鮮水果茶、濃郁飽滿的水果香氣。","半磅，226克裝","深度烘焙City Roast","台灣咖啡豆","樂野","800-900公尺","厭氧緩慢日曬","檸檬清香的清香圍繞口腔","微酸"); 
INSERT INTO  products2  VALUES("P013","阿里山 樂野 鄒讚咖啡莊園","../image/13.jpg","香瓜、莓果、百香果、波羅蜜、可可、酒釀發酵，Body質感佳、層次豐富。","半磅，226克裝","深度烘焙City Roast","台灣咖啡豆","樂野","850-1200公尺","日曬","如莓果般的酸味，讓人愛上","微酸"); 
INSERT INTO  products2  VALUES("P014","阿里山 特富野 豆御香藝妓咖啡莊園","../image/14.jpg","桃子、酸橙、果乾、藍莓、奶油、柔順水果的香氣、圓潤的口感。","半磅，226克裝","中度烘焙City Roast","台灣咖啡豆","特富野","1000公尺","厭氧日曬處理","柔順水果的香氣、圓潤的口感","微酸"); 
INSERT INTO  products2  VALUES("P015","阿里山 番路 仙井咖啡莊園","../image/15.jpg","花香、柑橘、百香果、Body圓潤飽滿、酸質乾淨明亮、甜感極佳","半磅，226克裝","中度烘焙City Roast","台灣咖啡豆","番路","1200公尺","厭氧日曬處理","酸質乾淨明亮、甜感極佳","適中"); 
INSERT INTO  products2  VALUES("P016","哥斯大黎加 音樂家協奏曲系列 [茶包式] 10入綜合茶包式咖啡","../image/16.jpg","茶包式","1包，10克裝","中度烘焙City Roast","阿拉比卡豆","哥斯大黎加","1200公尺","水洗法(咖啡豆的話)","滑順回甘，一點茶香的回味","無"); 
INSERT INTO  products2  VALUES("P017","哥斯大黎加 音樂家協奏曲系列 [濾掛式] 10入綜合濾掛式咖啡","../image/17.jpg","濾掛式","1包，10克裝","中度烘焙City Roast","阿拉比卡豆","哥斯大黎加","1200公尺","水洗法(咖啡豆的話)","滑順回甘，一點茶香的回味","無"); 
INSERT INTO  products2  VALUES("P018","伊索比亞 古吉 烏拉嘎[濾掛式] 單品濾掛式咖啡 日曬","../image/18.jpg","濾掛式","1包，10克裝","中度烘焙City Roast","古吉 烏拉嘎豆","衣索比亞","2000-2200公尺","水洗法(咖啡豆的話)","有著柑橘，柳橙等水果的果香","小酸"); 
INSERT INTO  products2  VALUES("P019","巴布亞新幾內亞 黑十字莊園[茶包式] 單品茶包式咖啡 水洗","../image/19.jpg","茶包式","1包，10克裝","中度烘焙City Roast","巴布亞新幾內亞","新幾內亞","1400-1500公尺","水洗法(咖啡豆的話)","花香、茶香、果香、楓糖，焦糖韻味回甘度佳！","小酸"); 
INSERT INTO  products2  VALUES("P020","瓜地馬拉 安提瓜 瑪格麗特[濾掛式] 單品濾掛式咖啡 水洗","../image/20.jpg","濾掛式","1包，10克裝","中度烘焙City Roast","瑪格麗特咖啡豆","瓜地馬拉","1500公尺","水洗法(咖啡豆的話)","烤堅果,柑橘,巧克力,焦糖,奶油","無"); 


CREATE TABLE products3 (
  id VARCHAR(10) NOT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  img VARCHAR(50) NULL DEFAULT NULL,
  capacity VARCHAR(30) NULL DEFAULT NULL,
  material VARCHAR(30) NULL DEFAULT NULL,
  size VARCHAR(30) NULL DEFAULT NULL,
  weight VARCHAR(30) NULL DEFAULT NULL,
  country VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (id)
  );


INSERT INTO  products3  VALUES("P021","MILA 高質感咖啡粉渣桶","../image/21.jpg","13.5*16(實際已消費者為主)","不銹鋼+矽膠","半徑圓13.5公分、高16公分","空桶重量約850克","台灣製造");
INSERT INTO  products3  VALUES("P022","HeyCafé Buddy定量磨豆機","../image/22.jpg","1.2kg(豆槽)","硬化鋼","(長 x 寬 x 高): 350 x 210 x 550","445g","德國");
INSERT INTO  products3  VALUES("P023","KALITA 日本昭和復古陶瓷高台杯","../image/23.jpg","200ml","陶瓷","10.5 x H8.8 x 杯底7.5cm","200g","日本設計，中國製造");
INSERT INTO  products3  VALUES("P024","HARIO V60 無限濾杯手沖套組","../image/24.jpg","350ml","PCT樹脂(耐熱溫度:100℃)","長116×寬142×高94口徑116mm","200g","日本");
INSERT INTO  products3  VALUES("P025","英國 Knock ｜Aergrind 迷你手搖磨豆機","../image/25.jpg","250ml","不鏽鋼、氮化鈦、鋁、胡桃木","W 47mm H 167mm","445g","英國");

CREATE TABLE team (
   team_id varchar(10) NOT NULL,
   team_name varchar(10) DEFAULT NULL,
   pic varchar(50) DEFAULT NULL,
   note varchar(500) DEFAULT NULL,
   PRIMARY KEY (team_id)
 );
INSERT INTO  team  VALUES("11044208","傅茂華","../image/11044208.jpg","經過這一學期學習多媒體程式的課程，學到了很多如何去編輯網頁的技巧，不管是單純的html網頁或者是加上CSS後的網頁效果，都是讓我獲益良多，尤其是到後期的JS語法，雖然在學的途中感到有點困難，可能是我本身的程式底子沒到很好，不過經由老師上課的教學與助教的課守時間，也還是讓我學到了很多不同的東西，學期也快結束了，這一次的期末發表也跟上學期一樣是甲乙兩班一起合作的報告，中間一樣有很多問題的產生，像是網頁的排版，在甲班使用時就會跑板等的問題，但是最後我們還是成功的解決，所以希望在報告的時侯不要有問題產生，讓我們好好表現。"); 
INSERT INTO  team  VALUES("11044212","陳睿廷","../image/11044212.jpg","在多媒體的課堂雖然學習到不少的網頁設計技巧，但是真的要實際從零開始來設計一個網頁其實並不容易，學會跟運用完全是兩回事，整個網頁從配色、排版到功能都要經過多次的修改才得出最後滿意的結果，而且有些地方也要嘗試不同方法才能做出自己想要的樣式，也不是光設計就好，還要思考後端的程式要怎麼連結也是一大問題，很高興能與甲班後端合作來做出這個網頁。"); 
INSERT INTO  team  VALUES("11044213","黃姿庭","../image/11044213.jpg","這次前端實作發現完成一個完整的網頁製作很不容易，配合網頁的功能需要用到不同的程式語言。除了上課所學到的，還有很多需要另外學習。為了做彈跳視窗嘗試了許多方法才成功，過程中也經歷了許多次大跑版，花了不少時間找出問題，還好最後順利解決，完成了網頁功能。這次的實作讓我了解自己還有許多地方需要學習，也謝謝組員的幫忙才能讓專案順利完成。"); 
INSERT INTO  team  VALUES("11044102","張尚鈞","../image/11044102.jpg","在寫後端前我其實不太懂要如何去呈現內容，直到接近專題報告時才了解到我們要做什麼，在做的過程中遇到蠻多困難的，像是連結資料庫有問題，又或者是JSP內容有誤，好幾次都面臨崩潰的邊緣，有時一直找不出錯誤的地方，導致我在原地轉很久，但也透過這次的專題讓我了解到網頁後端的內容架構是什麼，以及跟隊友合作溝通，都讓我受益良多，感謝我們這次前端的組別寫出好的程式碼讓我們後端可以順利進行，辛苦了我的隊友們。"); 
INSERT INTO  team  VALUES("11044104","李佳蓁","../image/11044104.jpg","這次的專案其實一開始蠻沒有頭緒的，不太確定要從什麼地方開始做起，而且自己本身的程式邏輯就沒有很好，原本一直很擔心做不出來或是做出來的東西沒有很完整。但還好有了上學期的經驗後，看得懂前端的程式碼，在整合方面就比較好上手。雖然過程中還是遇到了不少的困難，像是語法錯誤、連結問題等等，還好大家都會一起互相幫忙，真的辛苦組員們了。"); 
INSERT INTO  team  VALUES("11044140","張晉誠","../image/11044140.jpg","網程後端課程通常涵蓋了後端開發的基礎知識和技能。這些課程可能包括學習如何構建和管理伺服器端應用程式、資料庫管理、API 開發、安全性和效能優化等相關主題。網程後端課程可以為學生提供實用的技能，使他們能夠開發和管理強大的伺服器端應用程式。然而，實際的心得可能因課程的內容、教學方法和個人背景而有所不同。如果您正在考慮參加這樣的課程，我建議您參考課程評價、學習大綱和過去學生的回饋，以了解課程的質量和適合度。"); 