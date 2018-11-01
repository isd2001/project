<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="bd-example bd-example-images">
	<img data-src="holder.js/450x520" class="img-thumbnail"
		alt="이미지 안나오면 엑박"
		src="${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE }"
		data-holder-rendered="true" style="width: 400px; height: 400px;">
</div>
<table class="table">
  <thead>
    <tr>
      <th style="text-align: center;">내정보</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>아이디</th>
      <td>${userInfo.ID }</td>
    </tr>
    <tr>
      <th>닉네임</th>
      <td>${userInfo.NICKNAME }</td>
    </tr>
  </tbody>
</table>

<table class="table">
  <thead>
    <tr>
      <th style="text-align: center;">강아지 정보</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>개 이름</th>
      <td>${userInfo.DOGNAME }</td>
    </tr>
    <tr>
      <th>개 종류</th>
      <td>${userInfo.DOGTYPE }</td>
    </tr>
    <tr>
      <th>개 성별</th>
      <td>${userInfo.DOGGENDER }</td>
    </tr>
  </tbody>
</table>

<table class="table">
  <thead>
    <tr>
      <th scope="col" style="text-align: center;">하고싶은 말</th>
    </tr>
  </thead>
  <tbody>
  <tr>
      <th>${userInfo.USERCOMMENT }</th>
    </tr>
 </tbody>
</table>

	<div class="row">
		<div class="col-md-6 mb-3">
			<a href="${pageContext.servletContext.contextPath }/check.do?mode=memberInfo"><button type="button" class="form-control btn btn-outline-primary" >회원정보 수정</button></a>
		</div>
		<div class="col-md-6 mb-3">
			<a href="${pageContext.servletContext.contextPath }/check.do?mode=password"><button type="button" class="form-control btn btn-outline-primary" >비밀번호 수정</button></a>
		</div>
	</div>
