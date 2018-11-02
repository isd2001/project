<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div style="text-align: center">
	<div class="card" style="width: 51rem; height:51rem;">
		<img class="card-img-top"
			src="${pageContext.servletContext.contextPath}${map.inputfile1 }"
			alt="Card image cap"> <img class="card-img-bottom"
			src="${pageContext.servletContext.contextPath}${map.inputfile2 }"
			alt="Card image cap">
		<div class="card-body">
			<h3 class="card-title">{map.title}</h3>
			<p class="card-text">${map.content }</p>
		</div>
	</div>
	<br/>
		<div style="text-align: center">
			<a href="${pageContext.servletContext.contextPath }/help/list.do">
				<button type="button" class="btn btn-outline-primary ">목록으로
				</button>
			</a>
		</div>
</div>