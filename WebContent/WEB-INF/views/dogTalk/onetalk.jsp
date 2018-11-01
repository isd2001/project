<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900"
	rel="stylesheet">

</head>
<body>
	<h4 style="text-align: center;">환영합니다. 즐겁고 , 클린한 대화 부탁드림니다.</h4>


	<div style="height: 520px; overflow-y: scroll;" id="chatView"></div>

	<div class="input-group input-group-lg">
		<div class="input-group-prepend">
			<span class="input-group-text" id="inputGroup-sizing-lg">글 입력</span>
		</div>
		<input type="text" class="form-control" id="input"
			aria-label="Sizing example input"
			aria-describedby="inputGroup-sizing-lg">
	</div>
	<script>
		var onechat = new WebSocket("ws://" + location.host
				+ "${pageContext.servletContext.contextPath}/onechat.do");
		
		document.getElementById("input").onchange= function(){
			
			console.log(this.value);
		 	var msg={
				"sender":"${userInfo.NICKNAME}",
				"recipient":"${recipient}",
				"text":this.value
			}; 
			onechat.send(JSON.stringify(msg));
			this.value="";
		};
		
		onechat.onmessage = function(evt){
			console.log("결과"+evt.data);
			var obj = JSON.parse(evt.data);
			console.log(obj);
			if (obj.sender=="${userInfo.NICKNAME}") {
				lightHandle(obj);
			}else{
				warningHandle(obj);
			}
			
		};
		
		var lightHandle = function(obj){
			var html="<small>"+obj.sender+"</small><br/>";
				html+="<div class=\"alert alert-light\" role=\"alert\">";
			html += obj.text;
			html += "</div>";
			document.getElementById("chatView").innerHTML += html;
			document.getElementById("chatView").scrollTop = 
				document.getElementById("chatView").scrollHeight; 
			
		};
		
		var warningHandle = function(obj){
			var html="<small>"+obj.sender+"</small><br/>";
				html+="<div class=\"alert alert-warning\" role=\"alert\">";
				html += obj.text;
				html += "</div>";
				document.getElementById("chatView").innerHTML += html;
				document.getElementById("chatView").scrollTop = 
			document.getElementById("chatView").scrollHeight; 
		
			
		};
		
		
	</script>
</body>
</html>

