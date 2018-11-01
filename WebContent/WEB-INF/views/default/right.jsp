<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="dropdown1">
	<button class="btn btn-light dropdown-toggle" type="button"
		id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true">
		<span>1 </span>실시간 순위 <span class="badge badge-pill badge-success">↑</span>
	</button>
	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
		<a class="dropdown-item"> <span>2 </span>실시간 순위 <span
			class="badge badge-pill badge-success">↑</span>
		</a> <a class="dropdown-item"> <span>3 </span>실시간 순위 <span
			class="badge badge-pill badge-danger">↓</span>
		</a>
	</div>
</div>

<hr />
<div class="form-group" id="loginForm">
	<c:choose>
		<c:when test="${not empty userInfo}">
			<div class="card" style="width: 16rem;">
				<img class="card-img-top"
					src="${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE}"
					alt="Card image cap" style="height: 200px">
				<div class="card-body">
					<p class="card-text">
						울집 댕댕이 : ${userInfo.DOGNAME} <br>댕댕이 주인 :
						${userInfo.NICKNAME} 님
					</p>
				</div>
			</div>

		</c:when>
		<c:otherwise>
			<form action="${pageContext.servletContext.contextPath }/login.do"
				method="post">

				<div class="small-input" style="float: left; width: 70%;">
					<input type="text" name="id" id="mb_id"
						class="form-control input-sm" placeholder="아이디" tabindex="21"
						autocomplete="off"> <input type="password" name="pw"
						id="mb_password" class="form-control input-sm" placeholder="비밀번호"
						tabindex="22">
				</div>

				<div style="float: left; width: 30%; padding-left: 0px;">
					<div class="form-group">
						<button type="submit" class="btn btn-brex-2nd btn-block en"
							style="height: 70px;" tabindex="23" id="login">로그인</button>
					</div>
				</div>
			</form>
		</c:otherwise>
	</c:choose>
</div>

<hr />
<c:choose>
	<c:when test="${not empty userInfo}">
		<script>
			var getWeather = function(gu) {
				console.log("function Strar !!");
				var apiURI = "http://api.openweathermap.org/data/2.5/weather";
				var param = {
					"q" : gu,
					"units" : "metric",
					"APPID" : "221d0de36835fe0cf4b1d4b196c711bb"
				};
				$
						.get(
								apiURI,
								param,
								function(rst) {
									document.getElementById("currentTemp").innerHTML = rst.main.temp
											+ "℃";
									document.getElementById("tempMax").innerHTML = rst.main.temp_max
											+ "℃";
									document.getElementById("tempMin").innerHTML = rst.main.temp_min
											+ "℃";
								});
			};
			getWeather("${gu}");
		</script>

		</span>
		<div class="card border-success " style="width: 100%; height: 15rem;">
			<div class="card-header">오늘의 ${gu} 날씨</div>
			<div class="card-body text-success">
				<h5 class="card-title">
					평균기온 : <span id="currentTemp"></span><br>(최고 : <span
						id="tempMax"></span>,최저:<span id="tempMin"></span>)
				</h5>
				<p class="card-text">날씨사진!</p>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="card">
			<img class="card-img-top"
				src="${pageContext.servletContext.contextPath }/image/weather.png"
				style="width: 80%; height: 10%;">
			<div class="card-body">
				<p class="card-text">오늘은 산책하기 좋은 날씨 입니다~</p>
			</div>
		</div>
	</c:otherwise>
</c:choose>

<hr />

<li class="list-group-item list-group-item-success">현재 접속자</li>
<div style="height: 150px; overflow-y: scroll;" id="connectlist">

</div>
<!-- modal -->

<div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog"
	aria-labelledby="mySmallModalLabel" id="selectmodal" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">...</div>
	</div>
</div>


<script>
	var ws = new WebSocket("ws://" + location.host
			+ "${pageContext.servletContext.contextPath}/access.do");

	ws.onmessage = function(evt) {
		var obj = JSON.parse(evt.data);
		console.log("obj > " + obj);
		var html = "";
		for (var i = 0; i < obj.length; i++) {
			html += "<div class=\"nav-dropdown\" >";
			html += "<a class=\"nav-link\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">";
			html += obj[i] + "</a>";
			html += "<div class=\"dropdown-menu\" aria-labelledby=\"dropdownMenuButton\" >";
			html += "<a name = \"f\" class=\"dropdown-item\" value=\"" + obj[i]
					+ "\" onclick=\"openchat('" + obj[i] + "');\">1:1 대화 </a>";
			html += "<a class=\"dropdown-item\" id=\"Infomodal\" onclick=\"openmodal('"
					+ obj[i] + "')\" \">회원 정보 보기</a>";
			html += "</div>";
			html += "<hr/>";
			html += "</div>";
		}//end for
		document.getElementById("connectlist").innerHTML = html;
	};

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
			"url" : "Infomodal.do",
			"data" : {
				"nick" : target
			},
			contentType : "application/x-www-form-urlencoded; charset=UTF-8"

		}).done(function(rst) {
			var obj = JSON.parse(rst);
			console.log(obj);

		

				$("#selectmodal").on("show.bs.modal", function(event) {
					console.log("event" + event);

				});//end selectmodal

		
			
		});//end ajax
	};//end openmodal
</script>
