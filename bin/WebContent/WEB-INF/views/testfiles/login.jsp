<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>  
  <body class="text-center">
    <form class="form-signin" action="${pageContext.servletContext.contextPath }/test/login.do" method="post">
      <img class="mb-4" src="${pageContext.servletContext.contextPath }/image/dal.jpg" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
      <label for="inputEmail" class="sr-only">아이디</label>
      <input type="text" id="id" name = "id" class="form-control" placeholder="아이디" required autofocus>
      <label for="inputPassword" class="sr-only">비밀번호</label>
      <input type="password" id="pw" name = "pw" class="form-control" placeholder="비밀번호" required>
      
      <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
     
    </form>
  </body>
