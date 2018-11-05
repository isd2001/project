<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/sidebar.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/navcss.css">
<script>
//======================================================================
//Weather
var getWeather = function(gu) {
		console.log("function Strar !!");
		var apiURI = "http://api.openweathermap.org/data/2.5/weather";
		var param = {
			"q" : gu,
			"units" : "metric",
			"APPID" : "221d0de36835fe0cf4b1d4b196c711bb"
		};
		$.get(apiURI, param, function(rst) {
			console.log("ajax start !!");
			console.log(rst);
			console.log("ajax end ..!");
			document.getElementById("currentTemp").innerHTML = rst.main.temp
					+ "℃";
			document.getElementById("tempMax").innerHTML = rst.main.temp_max
					+ "℃";
			document.getElementById("tempMin").innerHTML = rst.main.temp_min
					+ "℃";
		});
	};
</script>
<div class="nav d-flex justify-content-around py-2 mb-2">
  <nav class="nav d-flex justify-content-between">
    <div id="sidebar" style="background-color: black; opacity: 0.7; text-align: center; color: white;">
    		<p style="margin: 10px;">MY Info</p>
    		<div style="text-align: center;"> 
    		이름 : ${userInfo.NAME } <br/>
    		 ID : ${userInfo.ID }<br/>
    		강아지 이름 : ${userInfo.DOGNAME }<br/>
    		 강아지 견종 : ${userInfo.DOGTYPE } <br/>
    		강아지 성별 : ${userInfo.DOGGENDER }<br/>
    		 </div>
    		 <hr align="center" style="border: solid 0.5px gray; width: 80%;"/>
    		 <p >MY Page</p>
    		 	<a href="${pageContext.servletContext.contextPath }/mypage.do" style="color: silver; ">마이 프로필</a><br/>
    		 	<a href="${pageContext.servletContext.contextPath }/myboard.do" style="color: silver;">내 게시글</a><br/>
    		 	<a href="${pageContext.servletContext.contextPath }/mycomment.do" style="color: silver;">내 댓글</a><br/>
    		 	<a href="${pageContext.servletContext.contextPath }/mycomment.do" style="color: silver;">회원정보 수정</a><br/>
    		 	<a href="${pageContext.servletContext.contextPath }/mycomment.do" style="color: silver;">비밀번호 변경</a>
    		 <hr align="center" style="border: solid 0.5px gray; width: 80%;"/>
    		 <c:choose>
				<c:when test="${not empty userInfo}">
					<div class="justify-content-end">
						오늘의 ${gu} 날씨 :
						<script>
								getWeather("${gu}");
							</script>
						<span id="currentTemp"></span><br>(최고 : <span id="tempMax"></span>최저:<span
							id="tempMin"></span>)
					</div>
				</c:when>
				<c:otherwise>
					<div class="justify-content-end">
						오늘의 강남구 날씨 :
						<script>
								getWeather("강남구");
							</script>
						<span id="currentTemp"></span><br>(최고 : <span id="tempMax"></span> / 최저:<span
							id="tempMin"></span>)
					</div>
				</c:otherwise>
			</c:choose>
    		 
    		 
    		 <hr align="center" style="border: solid 0.5px gray; width: 80%;"/>
    		 
    		 <!-- <ul id="navmenu">
				<li><a href="#">접속중유저</a>
					<ul class="sub1" id="connectlist">
					</ul>
				</li>
			</ul>
    		  -->
	</div>
		  <a class="toggle-btn p-2 text-muted" onclick="togglesidebar()">
		  	더보개
		  </a>		
          <a class="p-2 text-muted" href="${pageContext.servletContext.contextPath }/Nboard/list.do">공지사항</a>
          <a class="p-2 text-muted" href="${pageContext.servletContext.contextPath }/dogTalk/index.do">개톡</a>
          <a class="p-2 text-muted"	href="${pageContext.servletContext.contextPath }/board/main.do">Gaekipedia</a>
          <a class="p-2 text-muted"	href="${pageContext.servletContext.contextPath }/find/list.do">찾아주시개</a>
          <a class="p-2 text-muted" href="${pageContext.servletContext.contextPath }/parcel.do">데려가시개(분양)</a>
          <a class="p-2 text-muted" href="${pageContext.servletContext.contextPath }/together/mainboard.do">같이가시개</a>
          <div class="dropdown p-2 text-muted">
          <a class="p-2 text-muted" id="dropdownMenuButton" data-toggle="dropdown" href="#">똥개훈련</a>
	           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/dogTraining/training.do">개동</a>
			    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/dogTraining/gaejalang.do">한번보시개</a>
			    </div>
		  </div>
       	 <div class="dropdown p-2 text-muted">
       	   <a class="p-2 text-muted" id="dropdownMenuButton" data-toggle="dropdown" href="#">개아파</a>
	           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

			    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/help/list.do">도와주시개</a>
			    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/doghospital.do">개병원ㅜ</a>
			    </div>
		  </div>
		  
		   <a class="p-2 text-muted" href="${pageContext.servletContext.contextPath }/dogTalk/index.do">추천개시판</a>
        </nav>
        
</div>
<script>
function togglesidebar(){
	document.getElementById("sidebar").classList.toggle('active');	
}// sidebar 액션

/* var ws = new WebSocket("ws://" + location.host
		+ "${pageContext.servletContext.contextPath}/access.do");

ws.onmessage = function(evt) {
	var obj = JSON.parse(evt.data);
	console.log("obj > " + obj);
	var html = "";
	for (var i = 0; i < obj.length; i++) {

		html+="<li><a href=\"#\">"+obj[i]+"</a>";
		html+="<ul class=\"sub2\">";
		html+="<li><a onclick=\"openchat('"+obj[i]+"')\" value=\""+obj[i]+ "\" >1:1대화</a></li>";
		html+="<li><a data-toggle=\"modal\" data-target=\"#exampleModalCenter2\" id=\"Infomodal\" onclick=\"openmodal('"
			+ obj[i] + "')\" \">정보 보기</a></li>";
		html+="</ul>";
		html+="</li>";
	}//end for		
		
	document.getElementById("connectlist").innerHTML = html;
};


//====================================================================
// chat
var openchat = function(target) {
	console.log(target);
	window.open(
			"${pageContext.servletContext.contextPath }/onetalk.do?talk="
					+ target, "talk", "width=350,height=550");
};

//====================================================================
// modal
var openmodal = function(target) {
	console.log("openmodal start!");
	console.log(target);

	$.ajax({
			"url" : "${pageContext.servletContext.contextPath }/infomodal.do",
			"data" : {
				"nick" : target
				},
			"async" : false,
			"contentType" : "application/x-www-form-urlencoded; charset=UTF-8"
		}).done(function(rst) {
						var obj = JSON.parse(rst);
						console.log("obj = " + obj);

						document.getElementById("id").innerHTML = obj.ID;
						document.getElementById("nickname").innerHTML = obj.NICKNAME;
						document.getElementById("dogname").innerHTML = obj.DOGNAME;
						document.getElementById("dogtype").innerHTML = obj.DOGTYPE;
						document.getElementById("usercomment").innerHTML = obj.USERCOMMENT;
						var src = obj.DOGPROFILE;
						var html = "<img src=\""+src+"\" width=\"150\" height=\"150\" >";
						document.getElementById("modal-img").innerHTML = html;

		});

};//end openmodal */

</script>
