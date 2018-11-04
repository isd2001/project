<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>데려가시개(분양)</h2>
<table class="table table-hover">
  		<thead>
	     <tr>
     	  <th style="text-align: center;"><small>분양유무</small></th>
    	  <th style="text-align: center;"><small>제목</small></th>
     	  <th style="text-align: center;"><small>날짜</small></th>
	     </tr>
  		</thead>
  		<tbody>
	     	<c:forEach var="p" items="#">
	     		<tr>
					<c:choose>
						<c:when test="#">
							<td style="text-align: center;">[분양중]</td>
						</c:when>
						<c:otherwise>
							<td style="text-align: center;">[분양완료]</td>
						</c:otherwise>
					</c:choose>
	     			<td style="text-align: center;"><a href="#">#</a></td>
	     			<td style="text-align: center;"><fmt:formatDate value="#" /></small></td>
	     		</tr>
	     	</c:forEach>
		</tbody>
</table>
<h2>같이가시개</h2>
<table class="table table-hover">
  		<thead>
	     <tr>
    	  <th style="width:80px; text-align: center;"><small>지역구</small></th>
    	  <th style="width:150px; text-align: center;"><small>제목</small></th>
    	  <th style="width:50px; text-align: center;"><small>댓글내용</small></th>
    	  <th style="width:80px; text-align: center;"><small>작성자</small></th>
     	  <th style="width:80px; text-align: center;"><small>댓글작성 날짜</small></th>
	     </tr>
  		</thead>
  		<tbody>
  			<c:forEach var="tc" items="${tocmt }">
     		<tr>
				<td style="text-align: center;">${tc.AREA }</td>
     			<td style="text-align: center;"><a href="${pageContext.servletContext.contextPath }/together/detail.do?no=${tc.NO }">${tc.TITLE }</a></td>
				<td style="text-align: center;">${tc.CONTENT }</td>
     			<td style="text-align: center;">${tc.NICK_1 }</td>
				<td style="text-align: center;"><fmt:formatDate value="${tc.LEFTDATE }" /></td>
     		</tr>
     		</c:forEach>
	  </tbody>
</table>