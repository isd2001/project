<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Cute+Font&amp;subset=korean" rel="stylesheet">


<style>

 nav.nav {
   font-family: 'Cute Font', cursive;
   font-size: 30px;
   font-weight: 700;
 }
 a.dropdown-item{
 	font-family: 'Cute Font', cursive;
   font-size: 25px;
   font-weight: 700;
 }

#sidebar {
	position: fixed;
	width: 210px;
	height: 130%;
	background: black;
	left: -210px;
	transition : all 500ms linear;
	opacity: 0.3;
}
#sidebar.active {
	left: 0px;

}
#sidebar ul li {
	color: rgba(230, 230, 230, 0.9);
	list-style: none;
	padding: 15px 10px;
	border-bottom: 1px solid rgba(100, 100, 100, 0.3);
}
#sidebar .toggle-btn {
	position: absolute;
	left: 230px;
	top: 20px;
}
#sidebar .toggle-btn span{ 
	display: block;
	width: 30px;
	height: 5px; 
	background: black;	
	margin: 5px 0px ;
}
</style>

<div class="nav menu d-flex justify-content-around py-2 mb-2">
  <nav class="nav d-flex justify-content-between">
    		 <div id="sidebar" style="background-color: black; opacity: 0.5; text-align: center; color: white;">
    		 테스트중 입니다.
    		 
			</div>
		  <a class="toggle-btn p-2 font-weight-bold" style="color:black;" onclick="togglesidebar()">
		  	더보개
		  </a>		
          <a class="p-2 font-weight-bold" style="color:black;" href="${pageContext.servletContext.contextPath }/Nboard/list.do">공지사항</a>
          <a class="p-2 font-weight-bold" style="color:black;" href="${pageContext.servletContext.contextPath }/dogTalk/index.do">개톡</a>
          <a class="p-2 font-weight-bold" style="color:black;"	href="${pageContext.servletContext.contextPath }/board/main.do">Gaekipedia</a>
          <a class="p-2 font-weight-bold"	style="color:black;"href="${pageContext.servletContext.contextPath }/find/list.do">찾아주시개</a>
          <a class="p-2  font-weight-bold"  style="color:black;" href="${pageContext.servletContext.contextPath }/parcel.do">데려가시개(분양)</a>
          <a class="p-2  font-weight-bold"  style="color:black;" href="${pageContext.servletContext.contextPath }/together/mainboard.do">같이가시개</a>
          <div class="dropdown p-2 text-muted">
          <a class="p-2 font-weight-bold"  style="color:black;" id="dropdownMenuButton" data-toggle="dropdown" href="#">똥개훈련</a>
	           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			    <a class="dropdown-item font-weight-bold" href="${pageContext.servletContext.contextPath}/dogTraining/training.do">개동</a>
			    <a class="dropdown-item font-weight-bold" href="${pageContext.servletContext.contextPath}/dogTraining/gaejalang.do">한번보시개</a>
			    </div>
		  </div>
       	 <div class="dropdown p-2">
       	   <a class="p-2 font-weight-bold"  style="color:black;" id="dropdownMenuButton" data-toggle="dropdown" href="#">개아파</a>
	           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

			    <a class="dropdown-item font-weight-bold"  href="${pageContext.servletContext.contextPath}/help/list.do">도와주시개</a>
			    <a class="dropdown-item font-weight-bold" href="${pageContext.servletContext.contextPath}/doghospital.do">개병원ㅜ</a>
			    </div>
		  </div>		  
		   <a class="p-2 font-weight-bold"  style="color:black;" href="${pageContext.servletContext.contextPath }/dogTalk/index.do">추천개시판</a>
        </nav>
        
</div>
<script>
function togglesidebar(){
	document.getElementById("sidebar").classList.toggle('active');	
}
</script>
