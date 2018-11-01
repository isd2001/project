<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">

<body>
	<main role="main">
		<section class="jumbotron text-center">
			<div class="container">
				<h2><b>우리 강아지를 찾아주세요</b></h2>
			</div>
			<br/>
			<div>
				<p style="text-align: right">${date }</p>
			</div>
		</section>	
		
		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row">
					<c:forEach var="e" items="${every}">
						<div class="col-md-4" id="post">
							<div class="card mb-4 shadow-sm" style="width: 250px; max-height: 300px">
								<img class="card-img-top"
								src="${pageContext.servletContext.contextPath}${e.PICTURE}"
								width="200" height="225">
								<div class="card-body">
									<p class="card-text">
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted"
											style="position: absolute; bottom: 30px">${e.TITLE}</small> <small
											class="text-muted" style="position: absolute; bottom: 10px">${e.NICK}
										</small>
									</div>
									<a href="${pageContext.servletContext.contextPath}/find/detail.do?no=${e.NO }">
									<button type="button" class="btn btn-sm btn-outline-secondary"
										style="position: absolute; right: 15px; bottom: 15px"
										id="detailBt" name="detailBt">자세히</button></a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		
	</main>
	<br/>	
	<footer class="text-muted">
		<div class="container">
			<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">Previous</a></li>
				<c:forEach var="p" begin="1" end="4">
				<li class="page-item"><a class="page-link" href="${pageContext.servletContext.contextPath }/find/list.do?p=${p}">${p }</a></li>
				</c:forEach>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
			</nav>
			
			<div>
				<div style="text-align:center">
				<a href="${pageContext.servletContext.contextPath }/find/write.do">
				<button type="button" class="btn btn-outline-primary">글쓰기</button></a>
				</div>
				<div style="text-align:right">
					<a href="${pageContext.servletContext.contextPath }/index.do">
				<button type="button" class="btn btn-outline-secondary btn-sm">메인으로</button></a>
				</div>
			</div>
			<br/>
		</div>		
	</footer>
</body>

