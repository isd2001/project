<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">

<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/navcss.css">




<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<link rel="stylesheet"	href="${pageContext.servletContext.contextPath }/css/navcss.css">

<link href="https://fonts.googleapis.com/css?family=Cute+Font&amp;subset=korean" rel="stylesheet">


<style>
 span.logo{
   font-family: 'Cute Font', cursive;
   font-size: 60px;
   font-weight: 700;
 }
</style>
<script>
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

<header class="blog-header py-3"<%-- style="background: url('${pageContext.servletContext.contextPath }/image/grass.jpg') "  --%> >

	<div class="row flex-nowrap justify-content-between align-items-center">
		<div class="col-4 pt-3">			
			<a href="${pageContext.servletContext.contextPath }/main/index.do">
				<img class="mb-4 rounded-circle"
				src="${pageContext.servletContext.contextPath }/image/dal.jpg"
				alt="" width="60" height="60">
			</a>
			<a class="blog-header-logo text-dark pt-0"
				href="${pageContext.servletContext.contextPath }/main/index.do"><span class="logo">개놀자</span></a>
		</div>
		<div class="col-4 text-center">
			<div class= "row">
				<nav class="navbar navbar-light bg-light">
					<form class="form-inline"
						action="${pageContext.servletContext.contextPath }/search/result.do">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" aria-label="Search" name="search">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					</form>
				</nav>
			</div>
			<div class="row">
				추천 검색어 : &nbsp;
			<c:forEach var="keyword" items="${recommendKeywords}" begin="0" end="2">
				<a href = "${pageContext.servletContext.contextPath }/search/result.do?search=${keyword.keyWord}">#${keyword.keyWord}&nbsp;</a>
			</c:forEach>
			</div>
		</div>

	<div class="col-4 text-center">
		<c:choose>
			<c:when test="${not empty userInfo}">
				<div class=" justify-content-end align-items-center form-inline">


					<a class="btn btn-sm btn-success"
						href="${pageContext.servletContext.contextPath }/mypage.do">마이페이지</a>
					<a class="btn btn-sm btn-danger"
						href="${pageContext.servletContext.contextPath }/logout.do">로그아웃</a>
					<br/>
				</div>
					<ul id="navmenu" style="margin-left: 185px;">
						<li><a href="#">접속중유저</a>
							<ul class="sub1" id="connectlist">
							</ul>
						</li>
					</ul> 
			</c:when>
			<c:otherwise>
				<div class="justify-content-end align-items-center">
					<a class="btn btn-sm btn-success"
						href="${pageContext.servletContext.contextPath}/main/login.do">로그인</a>
					<a class="btn btn-sm btn-info"
						href="${pageContext.servletContext.contextPath }/main/terms.do">회원가입</a>
				</div>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="row justify-content-end">

		</div>
	</div>
</header>
<!-- modal view -->
<body>
	<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle2"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center;">
					<h5 class="modal-title" id="exampleModalCenterTitle2">회원정보</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-5">
							<div id="modal-img"></div>
						</div>
						<div class="col-7">
							ID ▶ <span id="id"></span><br /> 닉네임 ▶<span id="nickname"></span><br />
							강아리 이름▶ <span id="dogname"></span><br /> 강아지 종류▶ <span
								id="dogtype"></span><br /> 한마디 ▶ <span id="usercomment"></span><br />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script>	
		 var ws = new WebSocket("ws://" + location.host
				+ "${pageContext.servletContext.contextPath}/access.do");

		ws.onmessage = function(evt) {
			var obj = JSON.parse(evt.data);
			console.log("obj > " + obj);
			var mode = obj.mode;
			console.log("mode : "+mode);
			switch(mode){			
				case "loginUers" :
				   var html = "";
				   var loginList = obj.list;   				   
				   	
					for (var i = 0; i < loginList.length; i++) {				
					 	if (loginList[i].nickName=="${userInfo.NICKNAME}") {
						html+="<li><a href=\"#\">"+loginList[i].nickName+"</a>";		
						html+="</li>";
						}else{	 		
						html+="<li><a href=\"#\">"+loginList[i].nickName+"</a>";
						html+="<ul class=\"sub2\">";
						html+="<li><a onclick=\"openchat('"+ loginList[i].nickName+"')\" value=\""+loginList[i].sessionId+ "\" >1:1대화</a></li>";
						html+="<li><a data-toggle=\"modal\" data-target=\"#exampleModalCenter2\" id=\"Infomodal\" onclick=\"openmodal('"
							+ loginList.nickName + "')\" \">정보 보기</a></li>";
						html+="</ul>";
						html+="</li>";
						}//end if..else
							
					}//end for		
						
					document.getElementById("connectlist").innerHTML = html; 
					break;
				case "newChat" : 
					console.log(obj.sender);
					console.log(obj.roomNumber);
					newMessageHandle(obj);
					break;					
			
		}
		
		};
		var newMessageHandle = function(obj){		
			console.log("newMessageHandle acticated");
			var html = "<div class=\"alert alert-warning alert-dismissible fade show\" role=\"alert\">";			
			html += "<strong>【NewChatting】</strong><br/> 새로운 채팅이 있습니다.</br>";			
			html += obj.sender +"님이 채팅을 요청하였습니다. "			
			html += "<button type=\"button\" class=\"btn btn-warning \"onclick=\"openchat('"+obj.sender+"')\" >1:1대화</button>";	
			html += "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">";
			html += "<span aria-hidden=\"true\">&times;</span>";
			html += "</button>";
			html += "</div>";
			
			document.getElementById("alert").innerHTML = html;
		}
		
		
		
		//====================================================================
		// chat
		var openchat = function(nickName, roomNumber) {			
			console.log("nickName : "+nickName);
			window.open(
					"${pageContext.servletContext.contextPath }/onetalk.do?talkNick="
							+nickName+"&roomNumber="+roomNumber, nickName, "width=380,height=635");
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

		};//end openmodal 
	</script>