<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">
<form method="post" enctype="multipart/form-data"
	action="${pageContext.servletContext.contextPath }/help/add.do">
	<div style="text-align: center">
			<br/>
		<h3><b>우리 강아지를 찾아주세요</b></h3>
			<br />
		<hr class="mb-4">
	</div>
	<div class="row">
		<div class="col-md-6 mb-3">
			<label for="lastName">제 목</label> <input type="text"
				class="form-control" id="title" name="title">
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">사진 첨부</label>
			<div class="custom-file ">
				<input type="file" class="custom-file-input"
					aria-describedby="inputGroupFileAddon03" id="file" name="file"
					accept="image/*, video/*"> <label class="custom-file-label"
					for="inputGroupFile03"> 파일 필요시 클릭하세요</label>
			</div>
		</div>
	</div>
	<br />
	<div>
		<div class="form-group">
			<div class="row" style="height: 250px;">
				<div class="col-6">
					<img src="" id="preview1" style="height: 240px"
						onchange="putImage(this)" class="rounded img-fluid" />
				</div>
				<div class="col-6">
					<img src="" id="preview2" style="height: 240px"
						onchange="putImage(this)" class="rounded img-fluid" />
				</div>
			</div>
			<div class="col-12">
				<textarea class="form-control" style="resize: none; height: 240px;"
					placeholder="내용을 적어주세요" id="content" name="content"></textarea>
			</div>
		</div>
	</div>
	<br />
	<div style="text-align: center">
		<div>
			<button type="button" class="btn btn-outline-primary"
				onclick="writeOn();">작성 완료</button>
			<br />
			<div style="text-align: right">
				<a href="${pageContext.servletContext.contextPath }/help/list.do">
					<button type="button" class="btn btn-outline-secondary btn-sm">뒤로가기
					</button>
				</a> <a href="${pageContext.servletContext.contextPath }/index.do">
					<button type="button" class="btn btn-outline-secondary btn-sm">메인으로
					</button>
				</a>
			</div>
			<br/>
		</div>
	</div>
</form>
<script>
		$("#picture").on("change", function() {
			var f = new FileReader();
			f.onload = function(e) {
				$("#preview1").attr("src", e.target.result);
			}
			f.readAsDataURL(this.files[0]);
		});
		
		$("#picture").on("change", function() {
			var f = new FileReader();
			f.onload = function(e) {
				$("#preview2").attr("src", e.target.result);
			}
			f.readAsDataURL(this.files[0]);
		});

		
		var writeOn = function() {
			if (document.getElementById("title").value != ""
					&& document.getElementById("content").value != "") {
				window.alert("작성 완료되었습니다.");
				$("#formAction").trigger("submit");
			} else {
				window.alert("빠짐없이 작성해주세요.");
				window.location.reload(true);
			}
		}
	</script>