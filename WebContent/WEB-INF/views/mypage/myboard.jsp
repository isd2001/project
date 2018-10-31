<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="table table-hover">
  		<thead>
	     <tr>
     	  <th scope="col" style="width: 12%"><small>분양유무</small></th>
    	  <th scope="col" style="width: 50%"><small>제목</small></th>
     	  <th scope="col" style="width: 15%"><small>날짜</small></th>
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