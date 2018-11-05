<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div style="text-align: center">
	<div class="card" style="width: 40rem; height:40rem;">
		<img src="${pageContext.servletContext.contextPath}${map.inputfile1 }">
		<img src="${pageContext.servletContext.contextPath}${map.inputfile2 }">
		<div class="card-body">
			<c:forEach var ="u" items="${user }">
			<h3 class="card-title">${map.title}</h3>
			<p class="card-text"><b>작성 완료했어요~</b><br/>
			다른 회원님들이 ${nick }님의 게시물에 답변을 달아주실거에요!<br/>
			기다려 주세요:-)</p>
			</c:forEach>
		</div>
	</div>
	<br/>
		<div>
			<a href="${pageContext.servletContext.contextPath }/help/list.do">
				<button type="button" class="btn btn-outline-primary ">목록으로
				</button>
			</a>
		</div>
</div>