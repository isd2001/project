<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="nav nav-pills nav-fill">
  <li class="nav-item">
    <a class="nav-link active" href="${pageContext.servletContext.contextPath }/mypage.do">마이 프로필</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.servletContext.contextPath }/myboard.do">내 게시글</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.servletContext.contextPath }/mycomment.do">내 댓글</a>
  </li>
</ul>