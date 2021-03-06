<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<form class="form-signin" action="${pageContext.servletContext.contextPath }/change_pw.do" method="post" >
		<h1 class="h3 mb-3 font-weight-normal">Please Password Change</h1>
     
		<c:if test="${!empty err }">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<strong>실패!</strong> 입력하신 기존 비밀번호가 다릅니다. 확인 하시고 다시 입력 부탁 드립니다.
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
     		</c:if>
     
      	<label for="id" class="sr-only">기존 비밀번호</label>
      		<input type="password" id="originpass" name="originpass" class="form-control" placeholder="기존 비밀번호" required autofocus>
      	<label for="pass" class="sr-only">신규 비밀번호</label>
      		<input type="password" id="newpass" name="newpass" class="form-control" placeholder="신규 비밀번호" required>
      	<label for="pass" class="sr-only">신규 비밀번호 재입력</label>
      		<input type="password" id="renewpass" name="newpass" class="form-control" placeholder="신규 비밀번호 재입력" required>
      		<span id="msg"></span>
     	 <button class="btn btn-lg btn-primary btn-block" type="submit" id="btn" disabled>수정</button>
	</form>
	<div class="col-md-6 mb-3">
			<a href="${pageContext.servletContext.contextPath }/mypage.do"><button type="button" class="form-control btn btn-outline-primary" >취소</button></a>
		</div>


<script>
	var ar = [false];
	console.log(ar);
	var vaild = function() {
		if(ar.includes(false)) {
			$("#btn").prop("disabled", false);
		}else {
			$("#btn").prop("disabled", true);
		}
	}
	
	$("#renewpass").on("change", function() {
		console.log($("#newpass").val());
		console.log($("#renewpass").val());
		
		if($("#newpass").val() == $("#renewpass").val()) {
			$("#msg").html("비밀번호가 정상적으로 입력 되었습니다.");
			$("#msg").css("color", "green");
		}else {
			$("#msg").html("입력하신 비밀번호가 맞지 않습니다. 다시 확인하시고 입력해 주시기 바랍니다.");
			$("#msg").css("color", "red");
		}
		vaild();
	});

</script>