<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${r eq 1}"> 
 	<script>
 	
 	 window.alert("게시글 삭제 완료.");
 	
 	</script>
 		
</c:if>

<div class="d-flex justify-content-center col-10" style="margin-left: auto; margin-right: auto;">
<table class="table table-hover" >
        <colgroup>
         <col width="10%" />
          <col width="45%"/>
          <col width="15%"/>
           <col width="15%"/>
            <col width="15%"/>
            </colgroup>
  
		<thead style="text-align:center">
	     <tr>
    	  <th scope="col" colspan="center"><small>NO</small></th>
    	  <th scope="col"colspan="center"><small>제목</small></th>
    	   <th scope="col" colspan="center"><small>작성자</small></th>
     	  <th scope="col" colspan="center"><small>날짜</small></th>
     	  <th scope="col" colspan="center"><small>조회수</small></th>
	     </tr>
         </thead>
  				<tbody style="text-align:center">
     	<c:forEach var="e" items="${every}">
     		<tr>
     			<th scope="row">${e.BOARD_NUM }</th>
     			<td>
     			<a href="${pageContext.servletContext.contextPath }/Nboard/detail.do?BOARD_NUM=${e.BOARD_NUM }">
     			${e.BOARD_SUBJECT }
     			</a></td>
     			<td>${e.BOARD_ID }</td>
     			<td>${e.BOARD_DATE }</td>
     			<td>${e.BOARD_LOOKUP }</td>
     		</tr>
     		
     		
     	</c:forEach> 
  </tbody>
</table>
</div>
     	    
<footer class="text-muted">
		<div class="container">
			<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">Previous</a></li>
				<c:forEach var="p" begin="1" end="4">
				<li class="page-item"><a class="page-link" href="${pageContext.servletContext.contextPath }/Nboard/list.do?p=${p}">${p }</a></li>
				</c:forEach>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
			</nav>
     	
     	<div style="text-align:right">
     	       <c:if test="${sessionScope.userInfo.ID eq 'admin' }">
    <a href="${pageContext.servletContext.contextPath }/Nboard/write.do" class="btn btn-primary" >글쓰기</a>
               </c:if>
     	</div>
</div>
</footer>
