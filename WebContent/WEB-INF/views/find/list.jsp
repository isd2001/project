<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">
<div style="text-align: center">
	<br />
	<h3>
		<b>우리 강아지를 찾아주세요</b>
	</h3>
	<div style="text-align: right">${date }</div>
	<br />
	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row">
				<c:forEach var="e" items="${every}">
					<div class="col-md-4">
						<div class="card mb-4 shadow-sm"
							style="width: 250px; height: 300px">
							<img class="card-img-top"
								src="${pageContext.servletContext.contextPath}${e.FILE}">
							<div class="card-body">
								<p class="card-text">
								<div class="d-flex justify-content-between align-items-center">
									<small class="text-muted"
										style="position: absolute; bottom: 45px">${e.TITLE} </small>
									<button type="button" class="btn btn-sm btn-outline-secondary"
										style="position: absolute; bottom: 10px">${e.NICK }</button>
								</div>
								<div style="position: absolute; right: 30px; bottom: 10px">
									<small class="text-muted">
									<fmt:formatDate value="${e.REGDATE }" /></small>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<br />
		<div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#" tabindex="+1">Next</a></li>
				</ul>
			</nav>
			<br />
			<div class="col-12 d-flex justify-content-end align-items-center">
				<a class="btn btn-sm btn-outline-secondary"
					href="${pageContext.servletContext.contextPath }/find/write.do">글쓰기</a>
			</div>
			<!-- 		<p style="text-align: center">
					<input type="text" placeholder="검색어 입력">
					<button type="button">검색</button>
				</p>
	 -->
		</div>
	</div>
</div>
