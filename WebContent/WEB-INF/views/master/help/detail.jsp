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
				<h2><b>우리집 댕댕이는요~</b></h2>
			</div>
			<br/>
			<div>
				<p style="text-align: right">${today}</p>
			</div>
			<hr class="mb-4">
		</div>
	
	<div class="row" >
		<div class="col-md-6 mb-3">
			<label for="lastName">제 목</label> <input type="text" readonly
				class="form-control">${data.TITLE}
		</div>
	</div>
	<br />
	<div>
		<div class="row">
			<div class="col-md-6 mb-3" style="height: 300px;">
				<div class="col-6" style="background-size:100% 100%;">
					<img src="${pageContext.servletContext.contextPath }${data.INPUTFILE1}" style="width:300px; height: 290px;"
						onchange="putImage(this)" class="rounded img-fluid" />
				</div>
			</div>
			<div class="col-md-6 mb-3" style="height: 300px;">
				<div class="col-6">
					<img src="${pageContext.servletContext.contextPath }${data.INPUTFILE2}" style="width:300px; height: 290px;"
						onchange="putImage(this)" class="rounded img-fluid"  />
				</div>
			</div>
		</div>
	</div>
		<div>
			<div class="col-13">
				<label for="lasName">내 용</label>
				<textarea class="form-control" style="resize: none; height: 240px;"
					  readonly>${data.CONTENT}</textarea>
			</div>
		</div>
	
	<br />
	<div style="text-align: center">
		<a href="${pageContext.servletContext.contextPath }/help/list.do">
			<button type="button" class="btn btn-outline-primary">목록으로</button>
		</a> <a href="${pageContext.servletContext.contextPath }/index.do">
			<button type="button" class="btn btn-outline-primary">메인으로</button>
		</a>
		<div style="text-align: right">
			<a href="${pageContext.servletContext.contextPath }/index.do">
				<button type="button" class="btn btn-outline-secondary btn-sm">삭제</button>
			</a>
		</div>
	</div>
</form>
