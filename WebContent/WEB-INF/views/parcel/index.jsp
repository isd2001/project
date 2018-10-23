<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="gallery">
  <a target="_blank" href="#">
    <img src="#" alt="Cinque Terre" width="300" height="200">
  </a>
  <div class="desc">Add a description of the image here</div>
</div>

<div class="gallery">
  <a target="_blank" href="#">
    <img src="#" alt="Forest" width="300" height="200">
  </a>
  <div class="desc">Add a description of the image here</div>
</div>

<div class="gallery">
  <a target="_blank" href="#">
    <img src="#" alt="Northern Lights" width="300" height="200">
  </a>
  <div class="desc">Add a description of the image here</div>
</div>

<div class="gallery">
  <a target="_blank" href="#">
    <img src="#" alt="Mountains" width="300" height="200">
  </a>
  <div class="desc">Add a description of the image here</div>
</div>
<a href="${pageContext.servletContext.contextPath }/new.do" class="btn btn-sm btn-outline-secondary" >글쓰기</a>
