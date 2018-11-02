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
			  <form class="form-inline" action="${pageContext.servletContext.contextPath }/search/result.do">
			    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="search">
			    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			  </form>
			</nav>
          	 
          </div> 
          <div class="container">    
          	<div class ="row form-inline justify-content-end ">              
		       <c:choose>
					<c:when test="${not empty userInfo}">				 
						<div class=" justify-content-end align-items-center">					
						<!-- <div class="dropdown">
						  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						   	 접속자 리스트
						  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" id="connectlist">
						    <a class="dropdown-item" href="#">Action</a>
						    <a class="dropdown-item" href="#">Another action</a>
						    <a class="dropdown-item" href="#">Something else here</a>
						  </div>
						</div> -->
						<div class="btn-group dropleft">
						  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="dropdownMenuButton1">
						    Dropleft
						  </button>
						  <div class="dropdown-menu"  aria-labelledby="dropdownMenuButton1">
						 	 <a class="dropdown-item" href="#">Action</a>
						    <a class="dropdown-item" href="#">Another action</a>
						    <a class="dropdown-item" href="#">Something else here</a>
						  </div>
						</div>
						
						<div class="btn-group dropleft">
						  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    Dropleft
						  </button>
						  <div class="dropdown-menu">
						     <a class="dropdown-item" href="#">Action</a>
						  </div>
						</div>
						
			          	<a class="btn btn-sm btn-success" href="${pageContext.servletContext.contextPath }/mypage.do">마이페이지</a> 
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

<script>
	var ws = new WebSocket("ws://" + location.host
			+ "${pageContext.servletContext.contextPath}/access.do");

	ws.onmessage = function(evt) {
		var obj = JSON.parse(evt.data);
		console.log("obj > " + obj);
		var html = "";
		for (var i = 0; i < obj.length; i++) {	
			
			<div class="dropdown">
			  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			   	 접속자 리스트
			  </button>
			  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" id="connectlist">
			    <!-- <a class="dropdown-item" href="#">Action</a>
			    <a class="dropdown-item" href="#">Another action</a>
			    <a class="dropdown-item" href="#">Something else here</a> -->
			  </div>
			</div>
			
			/* <div class="btn-group dropleft">
			  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="dropdownMenuButton1">
			    Dropleft
			  </button>
			  <div class="dropdown-menu"  aria-labelledby="dropdownMenuButton1">
			 	 <a class="dropdown-item" href="#">Action</a>
			    <a class="dropdown-item" href="#">Another action</a>
			    <a class="dropdown-item" href="#">Something else here</a>
			  </div>
			</div>
			 */
			
		    html += "<div class=\"dropdown-item nav-dropdown\" >";
			html += "<a class=\"nav-link\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">";
			html += obj[i] + "</a>";
			html += "<div class=\"dropdown-menu\" aria-labelledby=\"dropdownMenuButton\" >";
			html += "<a name = \"f\" class=\"dropdown-item\" value=\"" + obj[i]
					+ "\" onclick=\"openchat('" + obj[i] + "');\">1:1 대화 </a>";
			html += "<a class=\"dropdown-item\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\"  id=\"Infomodal\" onclick=\"openmodal('"
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
			"async" : false,
			contentType : "application/x-www-form-urlencoded; charset=UTF-8"
		}).done(function(rst) {
			var obj = JSON.parse(rst);
			console.log(obj);

			document.getElementById("id").innerHTML = obj.ID;
			document.getElementById("nickname").innerHTML = obj.NICKNAME;
			document.getElementById("dogname").innerHTML = obj.DOGNAME;
			document.getElementById("dogtype").innerHTML = obj.DOGTYPE;
			document.getElementById("usercomment").innerHTML = obj.USERCOMMENT;
			var src=obj.DOGPROFILE;
			var html = "<img src=\""+src+"\" width=\"150\" height=\"150\" >";
			document.getElementById("modal-img").innerHTML = html;

		});

	};//end openmodal
</script>

		