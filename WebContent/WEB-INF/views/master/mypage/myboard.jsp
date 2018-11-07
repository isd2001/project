<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2 style="margin-left: 100px; margin-top: 20px;">찾아주시개</h2>
<table class="table table-hover" style="width: 900px; margin: auto;">
  		<thead>
	     <tr>
    	  <th style="text-align: center;">NO</th>
     	  <th style="text-align: center;">개이름</th>
    	  <th style="text-align: center;">제목</th>
    	  <th style="text-align: center;">작성자</th>
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
<h2 style="margin-left: 100px; margin-top: 20px;">데려가시개(분양)</h2>
<table class="table table-hover" style="width: 900px; margin: auto;">
  		<thead>
	     <tr>
     	  <th style="text-align: center;">분양유무</th>
    	  <th style="text-align: center;">제목</th>
     	  <th style="text-align: center;">날짜</th>
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
<h2 style="margin-left: 100px; margin-top: 20px;">같이가시개</h2>
<table class="table table-hover" style="width: 900px; margin: auto;">
  		<thead>
	     <tr>
    	  <th style="width:50px; text-align: center;">NO</th>
    	  <th style="width:80px; text-align: center;">지역구</th>
    	  <th style="width:150px; text-align: center;">제목</th>
    	  <th style="width:80px; text-align: center;">작성자</th>
     	  <th style="width:80px; text-align: center;">날짜</th>
     	  <th style="width:50px; text-align: center;">좋아요</th>
     	  <th style="width:50px; text-align: center;">조회수</th>
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