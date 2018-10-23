<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link
	href="${pageContext.servletContext.contextPath }/css/bootstrap.css"
	rel="stylesheet">
<body>
<div class="alert alert-success" role="alert" style="text-align: center">

  반려견과 함께하는 공간 개놀자

</div>
	<div class="row">
	<div class="col-md-6">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100"
							src="${pageContext.servletContext.contextPath }/image/dal.jpg" 
							 width="400" height="300" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="${pageContext.servletContext.contextPath }/image/dog2.jpg" 
							width="400" height="300" alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="${pageContext.servletContext.contextPath }/image/dog3.webp" 
							width="400" height="300" alt="Third slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="${pageContext.servletContext.contextPath }/image/dog1.png" 
							 width="400" height="300" alt="Fourth slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	
		<div class="col-md-6">
		<img class="d-block w-100"
							src="${pageContext.servletContext.contextPath }/image/ad1.jpg" 
							width="400" height="300">
							By. 개놀자
		</div>

		<div class="col-md-6">
		
		<div class="my-3 p-3 bg-white rounded shadow-sm">
			<h6 class="border-bottom border-gray pb-2 mb-0">Recent updates</h6>
			<div id="recent"></div>
			<div style="height: 200px; overflow-y: scroll;" id="recentUpdates">
			<div class="media text-muted pt-3">
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<strong class="d-block text-gray-dark">@달이</strong> 오늘 까치산으로 산책갑니당.
				</p>
			</div>
			<div class="media text-muted pt-3">
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<strong class="d-block text-gray-dark">@개달이</strong>
					오늘 산책갔다와서 개저아
				</p>
			</div>
			
			<div class="media text-muted pt-3">
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<strong class="d-block text-gray-dark">@복돌이</strong>
					오늘 바빠서 산책 못시킴 ㅜㅜ흑흑
				</p>
			</div>
			<div class="media text-muted pt-3">
				<p
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<strong class="d-block text-gray-dark">@럭키</strong>
					나는 맨날 까까가 먹고싶다.
				</p>
			</div>
			</div>
			</div>

			<small class="d-block text-right mt-3"> <a href="#">All
					updates</a>
			</small>
		</div>
		
		<div class="col-md-6">
		<div class="my-3 p-3 bg-white rounded shadow-sm">
			<h6 class="border-bottom border-gray pb-2 mb-0">Suggestions</h6>
			<div class="media text-muted pt-3">
				<div
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<div
						class="d-flex justify-content-between align-items-center w-100">
						<strong class="text-gray-dark">Full Name</strong> <a href="#">Follow</a>
					</div>
					<span class="d-block">@username</span>
				</div>
			</div>
			<div class="media text-muted pt-3">
				<div
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<div
						class="d-flex justify-content-between align-items-center w-100">
						<strong class="text-gray-dark">Full Name</strong> <a href="#">Follow</a>
					</div>
					<span class="d-block">@username</span>
				</div>
			</div>
			<div class="media text-muted pt-3">
				<div
					class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<div
						class="d-flex justify-content-between align-items-center w-100">
						<strong class="text-gray-dark">Full Name</strong> <a href="#">Follow</a>
					</div>
					<span class="d-block">@username</span>
				</div>
			</div>
			<small class="d-block text-right mt-3"> <a href="#">All
					suggestions</a>
			</small>
		</div>
	</div>
	</div>


	<script>
   
   /*
   
   var ws = new WebSocket("ws://"+location.host+
         "${pageContext.servletContext.contextPath}/conn.do");
   
   ws.onmessage = function(got){   
      //매개 변수 설정하면 받은 내용에 관련된 객체를 넘겨주면서 콜이 일어나고 ,      
      var obj = JSON.parse(got.data);     
      switch (obj.mode) {
	      case "needId":	    	  
	    	  var info = {"mode":"login","userId":"${userId}"};
	    	  ws.send(JSON.stringify(info));
	         break;
	      case "login":	    	  
	    	  var name = obj.user.NAME;
	    	  var dep = obj.user.DNAME;
	    	  var posi = obj.user.PNAME;
	    	  var time = obj.user.loginTime;
	    	  var html = 
	    		 "<div class=\"media text-muted pt-3\"><p class=\"media-body pb-3 mb-0 small lh-125 border-bottom border-gray\">";
	          html += "<strong class=\"d-block text-gray-dark\">"+name+" 님 ("+dep+"-"+posi+")</strong>";
	          html += "로그인 하셨습니다. ("+time+") </p> </div>";
	          document.getElementById("recent").innerHTML+=html;
	          break;
      }
   };
   
   */
   </script>

</body>
