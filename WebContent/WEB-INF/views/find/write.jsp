<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="alert alert-success" role="alert" style="text-align: center">
	반려견과 함께하는 공간 개놀자</div>

<form method="post" enctype="multipart/form-data"
	action="${pageContext.servletContext.contextPath}/find/list.do">
	<div style="text-align: center">
		<br />
		<h3>
			<b>강아지를 찾아주세요</b>
		</h3>
		<div style="text-align: right">
			<fmt:formatDate value="${sessionScope.date}"></fmt:formatDate>
		</div>
		<br />
		
		<div class="input-group mb-3">
 			<div class="input-group-prepend">
    			<button class="btn btn-outline-secondary" type="button">제목 입력</button>
  			</div>
  			<input style="text-align:center" type="text" class="form-control" placeholder="제목을 입력해주세요" 
  			aria-label="" aria-describedby="basic-addon1" id="findName" name="findName">
		</div>
		
		<div class="input-group mb-1">
			<div class="input-group-prepend">
				<button class="btn btn-outline-secondary" type="button"	id="findFileBt" name="findFileBt">파일 첨부</button>
			</div>
			<div class="custom-file">
				<input type="file" class="custom-file-input" aria-describedby="inputGroupFileAddon03"> 
				<label class="custom-file-label" for="inputGroupFile03"> 파일이 필요하신가요?</label>
			</div>
		</div>
		<br/>
		<div class="form-group">
			<textarea class="form-control" rows="15" cols="110" id="findComment"></textarea>
		</div>
	</div>

	<div style="text-align: center">
		<button class="btn btn-outline-secondary" type="button">작성 완료</button>
	</div>
</form>
<script>
	var check = function(target) {
		console.log(target.files.length);
		for (var i = 0; i < target.files.length; i++) {
			console.log(target.files[i].name);
		}
	}

	var findws = new WebSocket("ws://" + location.host
			+ "${pageContext.servletContext.contextPath}/find.do");
</script>