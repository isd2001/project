<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">
<c:if test="${err eq 'off' }">
	<script>window.alert("글이 정상적으로 등록되었습니다.")</script>
</c:if>
	
	<div class="album py-5 bg-light" style="margin-top: 10%;">
			<div class="container">
				<div class="row">
					<c:forEach var="l" items="${list}">
						<div class="col-md-4" id="post">
							<div class="card mb-4 shadow-sm" style="width: 250px; max-height: 300px">
								<video class="card-img-top" src="${l.UPLOAD }"	width="200" height="225" controls="controls"></video>
								<div class="card-body">
									<p class="card-text">
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted"
											style="position: absolute; bottom: 30px">${l.TITLE}</small> <small
											class="text-muted" style="position: absolute; bottom: 10px">${l.DTID}
										</small>
									</div>									
									<a href="${pageContext.servletContext.contextPath}/dogTraining/detail.do?NUM=${l.NO }">
									<button type="button" class="btn btn-sm btn-outline-secondary"	style="position: absolute; right: 15px; bottom: 15px"
										id="detailBt" name="detailBt">자세히</button></a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<br/>	
		<!-- ======================================== -->
		<nav aria-label="Page navigation example" style="margin-left: 500px;">
		  <ul class="pagination">
		    <li class="page-item"><a class="page-link" href="${pageContext.servletContext.contextPath }/dogTraining/training.do?p=1">1</a></li>
		    <li class="page-item"><a class="page-link" href="${pageContext.servletContext.contextPath }/dogTraining/training.do?p=2">2</a></li>
		    <li class="page-item"><a class="page-link" href="${pageContext.servletContext.contextPath }/dogTraining/training.do?p=3">3</a></li>
		    <li class="page-item"><a class="page-link" href="#">Next</a></li>
		  </ul>
		</nav>
			<div>
				<div style="text-align:center">
				<a href="${pageContext.servletContext.contextPath }/dogTraining/write.do">
				<button type="button" class="btn btn-outline-primary">글쓰기</button></a>
				</div>
				<div style="text-align:right">
					<a href="${pageContext.servletContext.contextPath }/main/index.do">
				<button type="button" class="btn btn-outline-secondary btn-sm">메인으로</button></a>
				</div>
			</div>
			<br/>
		


