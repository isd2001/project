<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<form class="needs-validation"
	action="${pageContext.servletContext.contextPath }/dogTraining/write.do"
	method="post">
<h6 style="text-align: center;">현재 페이지는 강아지 트레이닝 게시판 등록 페이지입니다.<br/><br/>
파일 업로드는 사진 및 동영상으로 부탁드림니다.<br/><br/>
(*) 는 필수 항목입니다. 다시 한번 확인해주세요.
</h6>	

<hr/>	
<div class="mb-3">
		<label for="text">(*)제 목 <span class="text-muted"></span> <small
			id="size1">(0/15)</small>
		</label> <input type="text" class="form-control" id="title" name="title"
			placeholder="15글자 내외로 작성해주세요" autocomplete="off">
</div>
<hr/>
<div class="mb-3">
		<label for="text">(*)내 용</label><small id="size2">(0/500)</small>
		<textarea class="form-control" id="content" name="content" aria-label="With textarea"
			style="width: 99%; height: 100px; resize: none;" autocomplete="off"></textarea>
</div>
<hr/>
<div class="mb-3">
		<label for="text">파일 업로드  </label>
		<input type="file" class="form-control" name="upload">
</div>
<hr/>
<button class="btn btn-secondary btn-lg btn-block" type="submit" id="b">등록하기</button>

</form>


