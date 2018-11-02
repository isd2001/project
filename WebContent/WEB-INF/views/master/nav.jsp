<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="nav d-flex justify-content-around py-2 mb-2">		
        <nav class="nav d-flex justify-content-between">
          <a class="p-2 text-muted" >      </a>

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
