<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="dropdown1" >
	  <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true"  >
	    <span>1 </span>실시간 순위 <span class="badge badge-pill badge-success">↑</span>
	  </button>
	  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
	    <a class="dropdown-item">
				<span>2 </span>실시간 순위 <span class="badge badge-pill badge-success">↑</span>
		</a>
		<a class="dropdown-item">
				<span>3 </span>실시간 순위 <span class="badge badge-pill badge-danger">↓</span>
		</a>
	  </div>
</div>

<hr/>
<div class="form-group" id="loginForm">
<c:choose>
	<c:when test="${not empty userInfo}">	
		 <div class="card" style="width: 16rem; ">
			  <img class="card-img-top" src="${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE}" alt="Card image cap" style="height: 200px">
			  <div class="card-body">
			    <p class="card-text">울집 댕댕이 : ${userInfo.DOGNAME} <br>댕댕이 주인 : ${userInfo.NICKNAME}님 </p>
			  </div>
		</div>
	
	</c:when>
	<c:otherwise>
		<form action ="${pageContext.servletContext.contextPath }/login.do" method="post">
	
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
		  var getWeather = function(gu){
			console.log("function Strar !!");	
			var apiURI = "http://api.openweathermap.org/data/2.5/weather";
			var param = {
					"q":gu,
					"units":"metric",
					"APPID":"221d0de36835fe0cf4b1d4b196c711bb"
			};	
				$.get(apiURI, param, function(rst) {					 
					console.log("ajax start !!");
					console.log(rst);
					console.log("구름  : "+ (rst.clouds.all) +"%" )
					console.log("도시:"+rst.name);
					console.log("바람   : "+ rst.wind.speed );
					console.log("현재습도 : "+ rst.main.humidity);
					console.log("현재온도 : "+ rst.main.temp);
					console.log("최저온도 : "+ rst.main.temp_min);
					console.log("최고온도 : "+ rst.main.temp_max);
					console.log("ajax end ..!");
					document.getElementById("currentTemp").innerHTML = rst.main.temp+"℃";
					document.getElementById("tempMax").innerHTML = rst.main.temp_max+"℃";
					document.getElementById("tempMin").innerHTML = rst.main.temp_min+"℃";
				});			
			};
		getWeather("${gu}");
		
		</script>
		<div class="card border-success " style="width: 100%; height: 15rem;">
		  <div class="card-header">오늘의 ${gu} 날씨</div>
		  <div class="card-body text-success">
		    <h5 class="card-title"><span id="currentTemp"></span><br>(최고 : <span id="tempMax"></span>최저:<span id="tempMin"></span>)</h5>
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
<div style="height: 150px; overflow-y: scroll;" id="connectList">
	<ul class="list-group">
		<li class="list-group-item">접속자 1</li>
		<li class="list-group-item">접속자 2</li>
		<li class="list-group-item">접속자 3</li>
		<li class="list-group-item">접속자 4</li>
		<li class="list-group-item">접속자 5</li>
	</ul>

</div>

<script>
	/* 	$("#dropdownMenuButton1").on("mouse", function(){	
	 $("#dropdownMenuButton1").trigger("click");
	 })
	 */
	/*   $.ajax({
	      url: apiURI,
	      dataType: "json",
	      type: "GET",
	      async: "false",
	      success: function(resp) {
	          console.log(resp);
	          console.log("현재습도 : "+ resp.main.humidity);
	          console.log("날씨 : "+ resp.weather[0].main );
	          console.log("상세날씨설명 : "+ resp.weather[0].description );
	          console.log("날씨 이미지 : "+ resp.weather[0].icon );
	          console.log("바람   : "+ resp.wind.speed );
	          console.log("나라   : "+ resp.sys.country );
	          console.log("도시이름  : "+ resp.name );
	          console.log("구름  : "+ (resp.clouds.all) +"%" );  
	      }
	  }) */
	
	 
/* 	$("#login").on("click", function() {
		$.ajax({   
			"url" : "http://api.openweathermap.org/data/2.5/weather?q=seoul&units=metric&APPID=221d0de36835fe0cf4b1d4b196c711bb",
			
			"method" : "get" // 기본이 GET으로 요청 들어간다.
			,
			"async" : true
		} // 비동기도 기본이 true
		).done(function(rst) {
			// onreadystatechange , 에 readyState 4 잡아서 처리했던 부분이다.
			// 매개변수로(rst)로 받겠다고 설정한게 응답문서가 된다.
			console.log(rst);
			

		});

	});
	   */


</script>
