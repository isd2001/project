<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>강아지 찾기</h2>
<table class="table table-hover">
  		<thead>
	     <tr>
    	  <th><small>NO</small></th>
    	  <th><small>제목</small></th>
    	  <th><small>작성자</small></th>
     	  <th><small>날짜</small></th>
	     </tr>
  		</thead>
  		<tbody>
     		<tr>
				<td></td>
				<td></td>
     			<td><a href="#"></a></td>
     			<td></td>
     		</tr>
	  </tbody>
</table>
<h2>데려가시개(분양)</h2>
<table class="table table-hover">
  		<thead>
	     <tr>
     	  <th><small>분양유무</small></th>
    	  <th><small>제목</small></th>
     	  <th><small>날짜</small></th>
	     </tr>
  		</thead>
  		<tbody>
	     	<c:forEach var="p" items="${parcelList }">
	     		<tr>
					<c:choose>
						<c:when test="${p.CHOICE == 1 }">
							<td>[분양중]</td>
						</c:when>
						<c:otherwise>
							<td>[분양완료]</td>
						</c:otherwise>
					</c:choose>
	     			<td><a href="${pageContext.servletContext.contextPath }/detail.do?no=${p.NO }">${p.TITLE }</a></td>
	     			<td><fmt:formatDate value="${p.REGDATE }" /></small></td>
	     		</tr>
	     	</c:forEach>
    	
  </tbody>
</table>
<h2>강아지 찾기</h2>
<table class="table table-hover">
  		<thead>
	     <tr>
    	  <th><small>NO</small></th>
    	  <th><small>제목</small></th>
    	  <th><small>작성자</small></th>
     	  <th><small>날짜</small></th>
	     </tr>
  		</thead>
  		<tbody>
     		<tr>
				<td></td>
				<td></td>
     			<td><a href="#"></a></td>
     			<td></td>
     		</tr>
	  </tbody>
</table>