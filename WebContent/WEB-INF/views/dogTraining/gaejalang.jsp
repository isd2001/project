<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">

<body>
<form action = "${pageContext.servletContext.contextPath}/dogTraining/add.do">
	<button type="submit" class="btn btn-outline-info btn-lg btn-block">우리 강아지 자랑하기!</button>
</form>
	<section class="jumbotron text-center">
		<br />
		<h3>
			<b>개자랑</b>
		</h3>
		<div style="text-align: right">${date }</div>
		<br />
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
										class="text-muted" style="position: absolute; bottom: 10px">닉네임
									</small>
								</div>
								<button type="button" class="btn btn-sm btn-outline-secondary"
									style="position: absolute; right: 15px; bottom: 15px"
									id="detailBt" name="detailBt" onclick="move();">자세히</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		</section>
<%--  			<div class="col-md-4">
				<div class="card mb-4 shadow-sm" style="width: 250px; max-height: 300px">
					<img class="card-img-top"
						src="${pageContext.servletContext.contextPath}/image/dal.jpg"
						width="200" height="225">
					<div class="card-body">
						<br/>
						<div class="d-flex justify-content-between align-items-center">
							<small class="text-muted"
								style="position: absolute; bottom: 30px">닉네임</small> <small
								class="text-muted" style="position: absolute; bottom: 10px">날짜</small>
							<button type="button" class="btn btn-sm btn-outline-secondary"
								style="position: absolute; right: 15px; bottom: 15px">자세히</button>
						</div>
					</div>
				</div>
			</div> --%>

		<div class="row">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</div>
		<br />
		<div class="col-12 d-flex justify-content-end align-items-center">
			<a class="btn btn-sm btn-outline-secondary"
				href="${pageContext.servletContext.contextPath }/find/write.do">글쓰기</a>
		</div>
	
</body>