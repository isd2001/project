<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">
<form method="post" enctype="multipart/form-data"
	action="${pageContext.servletContext.contextPath }/help/add.do">
	<div class="container text-center">
			<br/>
			<div>
				<h3><b>작성하신 내용입니다</b></h3>
			</div>
			<br/>
			<hr class="mb-4">
		</div>
	<div style="text-align: center" class="d-flex justify-content-center">
		<div class="my-5 p-5 bg-white rounded shadow-sm">
			<div class="card" style="width: 45rem; height:45rem;">
			
				<img class="card-img-top" style="width: 45rem; height: 25rem;" src="${pageContext.servletContext.contextPath }${data.INPUTFILE1}" 
				class="rounded img-fluid" alt="/image/noimage.png">
				<div class="card-body">
					<p><b>${data.TITLE}</b></p>
					<p style="text-align:right">${today }</p>
					<p class="card-text">${data.CONTENT}</p>
				</div>
			</div>
			<br />
			<div style="text-align: center">
				<div>
					<br />
					<div style="text-align: center" class="d-flex justify-content-center">
						<a href="${pageContext.servletContext.contextPath }/help/list.do">
							<button type="button" class="btn btn-outline-primary">목록으로
							</button>
						</a> <a href="${pageContext.servletContext.contextPath }/index.do">
							<button type="button" class="btn btn-outline-primary">메인으로
							</button>
						</a>
					</div>
					<div style="text-align: right">
						<button type="submit" class="btn btn-outline-secondary btn-sm"
							onclick="deleteBoard();">삭제</button>
						<br />
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

<script>
	var deleteBoard = function() {
		window.alert("삭제하시겠습니까?");
	}
</script>
