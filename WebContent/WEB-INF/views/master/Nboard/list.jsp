<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-hover">
	<colgroup>
		<col width="5%" />
		<col width="40%" />
		<col width="15%" />
		<col width="25%" />
		<col width="15%" />
	</colgroup>

	<thead style="text-align: center">
		<tr>
			<th scope="col"><small>NO</small></th>
			<th scope="col"><small>제목</small></th>
			<th scope="col"><small>작성자</small></th>
			<th scope="col"><small>날짜</small></th>
			<th scope="col"><small>조회수</small></th>
		</tr>
	</thead>
	<tbody style="text-align: center">
		<c:forEach var="e" items="${every}">
			<tr>
				<th scope="row">${e.BOARD_NUM }</th>
				<td><a
					href="${pageContext.servletContext.contextPath }/Nboard/detail.do?BOARD_NUM=${e.BOARD_NUM }">
						${e.BOARD_SUBJECT } </a></td>
				<td>${e.BOARD_ID }</td>
				<td>${e.BOARD_DAY }</td>
				<td>${e.BOARD_LOOKUP }</td>
			</tr>


		</c:forEach>
	</tbody>
</table>


<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="#" tabindex="-1">이전</a></li>
		<c:forEach var="p" begin="1" end="${size }">
			<c:choose>
				<c:when test="${p==current}">
					<li class="page-item active"><a class="page-link"
						href="${pageContext.servletContext.contextPath }/Nboard/list.do?p=${p}">${p }<span
							class="sr-only">(current)</span>
					</a></li>
				</c:when>
				<c:otherwise>
					<a class="page-link"
						href="${pageContext.servletContext.contextPath }/Nboard/list.do?p=${p}">${p }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<li class="page-item"><a class="page-link" href="#">다음</a></li>
	</ul>
</nav>


<c:if test="${userInfo.ID eq 'admin'}">
	<div style="text-align: right">
		<a href="${pageContext.servletContext.contextPath }/Nboard/write.do"
			class="btn btn-primary">글쓰기</a>
	</div>
</c:if>
