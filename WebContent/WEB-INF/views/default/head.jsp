<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">
<header class="blog-header py-3" <%-- style="background: url('${pageContext.servletContext.contextPath }/image/grass.jpg') "  --%> >
       
         <div class="row flex-nowrap justify-content-between align-items-center">
          <div class="col-4 pt-1" >
           	 <a class="blog-header-logo text-dark" href="${pageContext.servletContext.contextPath }/index.do">개놀자</a>
          <a href = "${pageContext.servletContext.contextPath }/index.do">
          <img class="mb-4" src="${pageContext.servletContext.contextPath }/image/dal.jpg" alt="" width="60" height="60">
          </a>
          </div>
          <div class="col-4 text-center">
           <nav class="navbar navbar-light bg-light">
			  <form class="form-inline">
			    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			  </form>
			</nav>
          	 
          </div>
    
          <div class="col-4 d-flex justify-content-end align-items-center"> 
            <a class="btn btn-sm btn-outline-secondary" href="#">회원가입</a>
          </div>
        </div>          
</header>