<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark ">
        <a class="navbar-brand" href="#">개놀자</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="${pageContext.servletContext.contextPath }/test/main/index.do">홈 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.servletContext.contextPath }/test/main/Nboard.do">숙지하시개</a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="${pageContext.servletContext.contextPath }/test/main/dogTalk/index.do">개톡</a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="${pageContext.servletContext.contextPath }/test/main/dogBoard.do">개키피디아</a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="${pageContext.servletContext.contextPath }/test/main/percel/index.do">입양하시개</a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="${pageContext.servletContext.contextPath }/test/main/together/index.do">같이가시개</a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="#">개훈련</a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="#">개아파</a>
            </li>
          </ul>       
          <form class="form-inline mt-2 mt-md-0">
            <a class="btn btn-sm btn-success" href="${pageContext.servletContext.contextPath }/test/main/login.do">로그인</a> 
		    <a class="btn btn-sm btn-info" href="${pageContext.servletContext.contextPath }/test/main/terms.do">회원가입</a>
          </form>
        </div>
</nav>