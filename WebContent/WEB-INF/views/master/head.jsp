<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">

	
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
	
</script>
<header class="blog-header py-3" <%-- style="background: url('${pageContext.servletContext.contextPath }/image/grass.jpg') "  --%> >
       
         <div class="row flex-nowrap justify-content-between align-items-center">
          <div class="col-4 pt-1" >
           	 <a class="blog-header-logo text-dark" href="${pageContext.servletContext.contextPath }/main/index.do">개놀자</a>
          <a href = "${pageContext.servletContext.contextPath }/main/index.do">
          <img class="mb-4" src="${pageContext.servletContext.contextPath }/image/dal.jpg" alt="" width="60" height="60">
          </a>
          </div>
          <div class="col-4 text-center">
           <nav class="navbar navbar-light bg-light">
			  <form class="form-inline">
			    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			  </form>
			</nav>
          	 
          </div> 
          <div class="container">    
          	<div class ="row form-inline justify-content-end ">              
		       <c:choose>
					<c:when test="${not empty userInfo}">				 
						<div class=" justify-content-end align-items-center">
			          	<a class="btn btn-sm btn-success" href="#">마이페이지</a> 
			            <a class="btn btn-sm btn-danger" href="${pageContext.servletContext.contextPath }/logout.do">로그아웃</a>
			     
			          </div>
					</c:when>
					<c:otherwise>
						<div class="justify-content-end align-items-center">
			          	<a class="btn btn-sm btn-success" href="${pageContext.servletContext.contextPath}/main/login.do">로그인</a> 
			            <a class="btn btn-sm btn-info" href="${pageContext.servletContext.contextPath }/main/terms.do">회원가입</a>
			          </div>
					</c:otherwise>				
				</c:choose>
			</div>
			<div class="row justify-content-end">
				<c:choose>
					<c:when test="${not empty userInfo}">	
						<div class="justify-content-end">오늘의 ${gu} 날씨 :
							<script>
								getWeather("${gu}");	
							</script>
						<span id="currentTemp"></span><br>(최고 : <span id="tempMax"></span>최저:<span id="tempMin"></span>)
						</div>
					</c:when>
					<c:otherwise>
						<div class="justify-content-end">오늘의 강남구 날씨 :
							<script>
								getWeather("강남구");
							</script>
						<span id="currentTemp"></span><br>(최고 : <span id="tempMax"></span>/최저:<span id="tempMin"></span>)
						</div>
					</c:otherwise>
				</c:choose>
				
				</div>
			</div>
		</div>	 
</header>


		