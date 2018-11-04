<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form class="form-signin" action="${pageContext.servletContext.contextPath }/sort.do" method="post" >
			<h1 class="h3 mb-3 font-weight-normal">Please Password Change</h1>
      
			<c:if test="${!empty err }">
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
					<strong>비밀번호를 다시 한번 입력해 주시기 바랍니다.</strong>
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
      		</c:if>
      
	      	<label for="id" class="sr-only">비밀번호</label>
	      		<input type="password" id="param" name="param" class="form-control" placeholder="비밀번호" required autofocus>
	     	 <button class="btn btn-lg btn-primary btn-block" type="submit">확인</button>
		</form>
	     	 <a href="${pageContext.servletContext.contextPath }/mypage.do"><button type="button" class="btn btn-lg btn-primary btn-block" >취소</button></a>