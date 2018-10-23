<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="nav justify-content-center py-2 mb-2">		
        <nav class="nav d-flex justify-content-between">
          <a class="p-2 text-muted" >      </a>
          <a class="p-2 text-muted" href="#">공지사항</a>
          <a class="p-2 text-muted" href="#">출석체크</a>
          <a class="p-2 text-muted" href="#">강아지찾기</a>
          <a class="p-2 text-muted" href="#">분양</a>
          <a class="p-2 text-muted" href="#">같이가요</a>
          <div class="dropdown p-2 text-muted">
          <a class="p-2 text-muted" id="dropdownMenuButton" data-toggle="dropdown" href="#">개시판</a>
	           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/board/main.do">개종류!</a>
			    <a class="dropdown-item" href="#">개자랑!</a>
			    <a class="dropdown-item" href="#">개수다!</a>
			  </div>
		  </div>
          <a class="p-2 text-muted" href="#">추가메뉴</a>
          <a class="p-2 text-muted" href="${pageContext.servletContext.contextPath }/test.do">타일 예제</a>
          <a class="p-2 text-muted" >      </a>      
         
        </nav>	        
</div>
