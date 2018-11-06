<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/blog.css">
<form method="post" enctype="multipart/form-data"
	action="${pageContext.servletContext.contextPath }/help/add.do">
	<hr size="30px" width="100%">
	<div class="container my-7 p-7 bg-white rounded shadow-sm">
		<div class="row " >
			<div class="col-md-6" style="text-align: center">
				<div style="text-align: right">
					<button type="submit" class="btn btn-outline-secondary btn-sm"
						onclick="updateBoard();">수정</button>
				</div>
				<p> <h3><b>${data.TITLE }</b></h3> </p>
				<p style="text-align: right">${today }</p>
				<br />
				<div class="row-6">	
					<div class="card" style="width: 400px; height:400px;" >
						<img class="card-img-top" style="width: 400px; height:200px ;" src="${pageContext.servletContext.contextPath}${data.INPUTFILE1}"
							alt="Card image cap">
						<div class="card-body" style="width: 400px; height:200px;"> 
							<p class="card-text">${data.CONTENT}</p>
						</div>
					</div>
					
				</div>
			</div>	
			<hr style="width:0.5px;height:500px;margin-left:-500px;margin-right:500px;"/>
			<!-- 채팅 -->
			<div class="col-md-6" id="list">
			
			</div>
		</div>
			<br/>
			<div>
				<div class="input-group">
					<div class="input-group-prepend">
						<img
							src="${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE}"
							style="width: 80px; height: 80px;" class="rounded-circle">
					</div>
					<textarea class="form-control" aria-label="With textarea"
						placeholder="댓글을 작성해주세요" id="content"></textarea>
					<button type="submit" class="btn btn-secondary btn-med "
						onclick="addComment();">작성하기</button>
				</div>

				<div style="text-align: center"
					class="d-flex justify-content-center">
					<div>
						<br />
						<div style="text-align: center"
							class="d-flex justify-content-center">
							<a href="${pageContext.servletContext.contextPath }/help/list.do">
								<button type="button" class="btn btn-outline-primary">목록으로</button></a>
							<a href="${pageContext.servletContext.contextPath }/index.do">
								<button type="button" class="btn btn-outline-primary">메인으로</button></a>
						</div>
							<br/>
					</div>
				</div>
			</div>
	</div>
</form>

<script>
	var updateBoard = function() {
		window.alert("수정하시겠습니까?");
	}
	
	var addComment = function(){
		console.log("addComment Function");
		var url = "/gaenolja/dogTalk/add.do";
		console.log(document.getElementById("content").value);
		console.log("${userInfo.DOGPROFILE}");		
		var param = {
				"talker"  : "${userInfo.DOGNAME}",
				"content" : document.getElementById("content").value,
				"picture" : "${userInfo.DOGPROFILE}",
				"address" : "${userInfo.ADDRESS}"
		};	
		
		$.get(url, param, function(rst) {					 
			window.alert("글이 등록되었습니다.")
			document.getElementById("content").innerHTML = "";
			
			
			console.log(rst.length);
			console.log("rst.length = "+rst.length);
			var html = "";
			for (var i = 0; i <rst.length; i++) {
				var talker = rst[i].TALKER;
				var content = rst[i].CONTENT;
				var picture = "${pageContext.servletContext.contextPath}" + rst[i].PICTURE;
				var address = rst[i].ADDRESS;
				var date = rst[i].WRITEDATE;
								
					html +=  "<div class=\"card\" id=\"form\">";
					html += "<div class=\"card-header d-flex bd-highlight\"><div class=\"flex-grow-1\">"+talker+"'s comment</div>";
					html += "<div class=\"bd-highlight\"><small id=\"date\" class=\"d-flex justify-content-end\">";
					html += date+"</small></div></div>";	
					html += " <div class=\"card-body\">";
					html += "<blockquote class=\"blockquote mb-0\">";
					html += "<div class=\"row align-items-center\">";
					html += "<img src=\""+picture+"\" style=\"width: 80px; height: 80px;\"class=\"rounded-circle\" id =\"image\">";
					html += " <p>"+content+"</p></div>";
					html += "<footer class=\"blockquote-footer d-flex justify-content-end \"><span id=\"address\">";
					html += "<cite title=\"Source Title\">"+address+"..</span></cite></footer>";
					html += "</blockquote>";
					html += "</div>";
					html += "</div>";			
					
					
			}
		
			document.getElementById("list").innerHTML = html;
			document.getElementById("content").value ="";
		});			
	};
</script>
