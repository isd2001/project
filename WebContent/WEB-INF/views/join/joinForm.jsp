<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
	<div class="row  justify-content-center">	
		<div class="col-md-8 offset-md-2">
			<div class="alert alert-warning row" role="alert">
			  로그인 정보 입력
			</div>		
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">아이디</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="id"
						placeholder="아이디">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">비밀번호</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" id="inputPassword"
						placeholder="비밀번호">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">비밀번호확인</label>
				<div class="col-sm-6">
					<input type="password" class="form-control"
						id="inputPasswordConfirm" placeholder="비밀번호 확인">
				</div>
			</div>
		</div>
		
<!--  ============================================================ -->
		<div class="col-md-8 offset-md-2">
			<div class="alert alert-warning row" role="alert">
			개인 정보 입력
			</div>
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">이름</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="name"
						placeholder="아이디">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">닉네임</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="nickName"
						placeholder="비밀번호">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="address"
						placeholder="주소">
				</div>
				<button type="button" class="btn btn-secondary" id="address">주소검색</button>
			</div>
			
		</div>
</div>
</div>
	


<div class="form-group row">
	<div class="col-sm-10">
		<button type="submit" class="btn btn-primary">Sign in</button>
	</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script >

	$("#address").on("click",function(){
		window.open("${pageContext.servletContext.contextPath }/address.do",
				"map", "width=600,height=450");
		
	});
	

</script>




