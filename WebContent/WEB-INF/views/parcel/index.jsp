<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="album py-5 bg-light">
	<div class="container">
		<div class="row">
			<c:forEach var="p" items="${list }">
            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                <img class="card-img-top" src="${pageContext.servletContext.contextPath }${p.MAINIMAGE}" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">${p.TITLE }</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <a href="${pageContext.servletContext.contextPath }/detail.do?no=${p.NO }"><button type="button" class="btn btn-sm btn-outline-secondary">View</button></a>
                    </div>
                    <small class="text-muted"><fmt:formatDate value="${p.REGDATE }" /></small>
                  </div>
                </div>
              </div>
			</div>
			</c:forEach>
		</div>
	</div>
	<a href="${pageContext.servletContext.contextPath }/new.do" class="btn btn-sm btn-outline-secondary" >글쓰기</a>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
			</li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
			</li>
		</ul>
	</nav>
</div>




