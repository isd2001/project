<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">

<body>
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