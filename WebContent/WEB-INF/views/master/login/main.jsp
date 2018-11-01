<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>  
<c:if test="${joinSucess==1}">
	<script>
		window.alert("회원가입에 성공하셨습니다. 로그인 해주세요.");
	</script>
</c:if>
<c:if test="${loginFailed==1}">
	<script>
		window.alert("로그인실패. 확인후 다시 로그인해주세요.");
	</script>
</c:if>
  <div class="text-center" style="margin-right: 20rem;  margin-left: 20rem;">
    <form class="form-signin" action="${pageContext.servletContext.contextPath }/main/login.do" method="post">
      <img class="mb-4" src="${pageContext.servletContext.contextPath }/image/dal.jpg" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
      <label for="inputEmail" class="sr-only">아이디</label>
      <input type="text" id="id" name = "id" class="form-control" placeholder="아이디" required autofocus autocomplete="off">
      <label for="inputPassword" class="sr-only">비밀번호</label>
      <input type="password" id="pw" name = "pw" class="form-control" placeholder="비밀번호" required>
      
      <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
      <div style="margin-top : 1rem;">
      <a href="#">아이디 찾기</a>/<a href="#">비밀번호 찾기</a>
      </div>
    </form>
  </div>
  