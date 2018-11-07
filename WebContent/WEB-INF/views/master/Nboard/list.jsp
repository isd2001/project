<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<table class="table table-hover" width="80%">

        <colgroup>
         <col width="10%"/>
          <col width="60%"/>
           <col width="15%"/>
            <col width="15%"/>
            </colgroup>
  
      <thead >                
	     <tr>
    	  <th scope="col" colspan="center"><small>NO</small></th>
    	  <th scope="col"colspan="center"><small>제목</small></th>
     	  <th scope="col" colspan="center"><small>날짜</small></th>
     	  <th scope="col" colspan="center"><small>조회수</small></th>
	     </tr>
         </thead>
  		<tbody>
     	<c:forEach var="e" items="${every}">
     		<tr>
     			<th scope="row">${e.BOARD_NUM }</th>
     			<td>
     			<a href="${pageContext.servletContext.contextPath }/Nboard/detail.do?BOARD_NUM=${e.BOARD_NUM }">
     			${e.BOARD_SUBJECT }
     			</a></td>
     			<td>${e.BOARD_DATE }</td>
     		
     			<td>${e.BOARD_LOOKUP }</td>
     		</tr>
     		
     		
     	</c:forEach> 
  </tbody>
</table>
     	<tr>
     
     	<footer class="text-muted">
		<div class="container">
			<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">이전</a></li>
				<c:forEach var="p" begin="1" end="4">
				<li class="page-item"><a class="page-link" href="${pageContext.servletContext.contextPath }/Nboard/list.do?p=${p}">${p }</a></li>
				</c:forEach>
				<li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
			</nav>
     	</tr>
     	<div style="text-align:right">
    <a href="${pageContext.servletContext.contextPath }/Nboard/write.do" class="btn btn-primary" >글쓰기</a>
     	</div>


