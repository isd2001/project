<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">


	<section class="jumbotron text-center">
		<div class="container">
			<div>
				<h3><b>우리집 댕댕이는요~</b></h3>
			</div>
			<div>
				<p style="text-align: right">${today}</p>
			</div>
		</div>
	</section>
<div class="col-8">
	<table class="table">
		<thead class="thead-light">
			<tr>
				<th scope="col">#</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">날짜</th>
				<th scope="col">조회수</th>
				<th scope="col">추천</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="h" items="${help}">
				<tr>
					<th scope="row">${h.NO }</th>
					<td><a
						href="${pageContext.servletContext.contextPath  }/help/detail.do?no=${h.NO }">
							${h.TITLE }</a></td>
					<td>${h.WRITER }</td>
					<td>${h.REGDATE }</td>
					<td>${h.LOOK }</td>
					<td>${h.GOOD }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

	<br />
	<footer class="text-muted">
		<div class="container">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">Previous</a></li>
					<c:forEach var="p" begin="1" end="4">
						<li class="page-item"><a class="page-link"
							href="${pageContext.servletContext.contextPath }/help/list.do?p=${p}">${p }</a></li>
					</c:forEach>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>

			<div>
				<div style="text-align: center">
					<a href="${pageContext.servletContext.contextPath }/help/write.do">
						<button type="button" class="btn btn-outline-primary">글쓰기</button>
					</a>
				</div>
				<div style="text-align: right">
					<a href="${pageContext.servletContext.contextPath }/index.do">
						<button type="button" class="btn btn-outline-secondary btn-sm">메인으로</button>
					</a>
				</div>
			</div>
			<br />
		</div>
	</footer>