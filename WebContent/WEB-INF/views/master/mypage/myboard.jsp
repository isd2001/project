<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>찾아주시개</h2>
<table class="table table-hover">
  		<thead>
	     <tr>
    	  <th style="text-align: center;"><small>NO</small></th>
     	  <th style="text-align: center;"><small>개이름</small></th>
    	  <th style="text-align: center;"><small>제목</small></th>
    	  <th style="text-align: center;"><small>작성자</small></th>
	     </tr>
  		</thead>
  		<tbody>
    		<c:forEach var="f" items="${findList }">
     		<tr>
				<td style="text-align: center;">${f.NO }</td>
     			<td style="text-align: center;">${f.DOGNAME }</td>
     			<td style="text-align: center;"><a href="${pageContext.servletContext.contextPath }/find/detail.do?no=${f.NO }">${f.TITLE }</a></td>
				<td style="text-align: center;">${f.NICK }</td>
     		</tr>
     		</c:forEach>
	  </tbody>
</table>
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
	     	<c:forEach var="p" items="${parcelList }">
	     		<tr>
					<c:choose>
						<c:when test="${p.CHOICE == 1 }">
							<td style="text-align: center;">[분양중]</td>
						</c:when>
						<c:otherwise>
							<td style="text-align: center;">[분양완료]</td>
						</c:otherwise>
					</c:choose>
	     			<td style="text-align: center;"><a href="${pageContext.servletContext.contextPath }/detail.do?no=${p.NO }">${p.TITLE }</a></td>
	     			<td style="text-align: center;"><fmt:formatDate value="${p.REGDATE }" /></small></td>
	     		</tr>
	     	</c:forEach>
		</tbody>
</table>
<h2>같이가시개</h2>
<table class="table table-hover">
  		<thead>
	     <tr>
    	  <th style="width:50px; text-align: center;"><small>NO</small></th>
    	  <th style="width:80px; text-align: center;"><small>지역구</small></th>
    	  <th style="width:150px; text-align: center;"><small>제목</small></th>
    	  <th style="width:80px; text-align: center;"><small>작성자</small></th>
     	  <th style="width:80px; text-align: center;"><small>날짜</small></th>
     	  <th style="width:50px; text-align: center;"><small>좋아요</small></th>
     	  <th style="width:50px; text-align: center;"><small>조회수</small></th>
	     </tr>
  		</thead>
  		<tbody>
  			<c:forEach var="t" items="${togetherList }">
     		<tr>
				<td style="text-align: center;">${t.NO }</td>
				<td style="text-align: center;">${t.AREA }</td>
     			<td style="text-align: center;"><a href="${pageContext.servletContext.contextPath }/together/detail.do?no=${t.NO }">${t.TITLE }</a></td>
     			<td style="text-align: center;">${t.NICK }</td>
				<td style="text-align: center;"><fmt:formatDate value="${t.DAY }" /></td>
				<td style="text-align: center;">${t.GOOD }</td>
				<td style="text-align: center;">${t.LOOKUP }</td>
     		</tr>
     		</c:forEach>
	  </tbody>
</table>