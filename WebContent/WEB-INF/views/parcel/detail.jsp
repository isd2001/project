<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!-- 분양 강아지 정보 보이는 뷰 시작 이미지 / 정보만 보임 -->
<hr class="mb-4">
<div class="row mb-2">
	<div class="col-md-6">
		<div class="bd-example bd-example-images">
	  		<img data-src="holder.js/400x400" class="img-thumbnail" alt="이미지 안나오면 엑박" src="${pageContext.servletContext.contextPath }${one.MAINIMAGE }" data-holder-rendered="true" style="width: 400px; height: 400px;">
		</div>
	</div>
	<div class="bd-example">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">${one.TITLE }</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">견종</th>
					<td>${one.BREEDS }</td>
				</tr>
				<tr>
					<th scope="row">성별</th>
					<td>${one.GENDER }</td>
				</tr>
				<tr>
					<th scope="row">나이</th>
					<td>${one.AGE }</td>
				</tr>
				<tr>
					<th scope="row">분류</th>
					<td>${one.SORT }</td>
				</tr>
				<tr>
					<th scope="row">성격</th>
					<td>${one.CHARACTER }</td>
				</tr>
				<tr>
					<th scope="row">접종</th>
					<td>${one.INOCULATION }</td>
				</tr>
				<tr>
					<th scope="row">분양주소</th>
					<td><small>${one.AREA }</small></td>
				</tr>
				<tr>
					<th scope="row"><button type="button" class="btn btn-light" type="button" data-toggle="collapse" data-target="#collapseOne" >지도 접기</button></th>
					<td><a href="http://map.daum.net/link/to/분양지,${one.LAT },${one.LONGI }"><button type="button" class="btn btn-light">길찾기</button></a></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div id="collapseOne" class="collapse show" >
    <div id="map" style="width:100%;height:350px;"></div>
</div>

<!-- 분양 강아지 정보 보이는 뷰 끝 -->

<hr class="mb-4">

<!-- 글 상세 내용 및 첨부 파일 뷰 시작 -->

<main role="main" class="container">
	<div class="row">
		<div class="col-md-8 blog-main">
			<h3 class="pb-3 mb-4 font-italic border-bottom">
				상세내용
			</h3>
        	    <p>${one.CONTENT }</p>
			<h3 class="pb-3 mb-4 font-italic border-bottom">
				첨부이미지 또는 동영상
			</h3>
				<img alt="추가 이미지" src="${pageContext.servletContext.contextPath }${one.FILE1 }" >
				<video src="${pageContext.servletContext.contextPath }${one.FILE2 }" />
		</div>
	</div>
</main>

<!-- 글 상세 내용 및 첨부 파일 뷰 끝 -->

<hr class="mb-4">

<!-- 타 사용자가 입력한 댓글 내용 보고 리댓글 입력 할수 있는 뷰 시작 -->

<div class="media" id="view-comment">
<hr class="mb-4">
</div>

<%--     리 댓글 입력 후 구현될 폼 뷰
    <hr class="mb-4">
		<div class="media mt-3">
			<a class="pr-3" href="#">
				<img src="${pageContext.servletContext.contextPath }/image/parcelimage/64x64.jpg" alt="Generic placeholder image">
			</a>
			<div class="media-body">
				<div class="alert alert-secondary" role="alert">
					<h5 class="mt-0">Media heading</h5>
	        		Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.
	        	</div>
			</div>
		</div>
--%>

<!-- 타 사용자가 입력한 댓글 내용 보고 리댓글 입력 할수 있는 뷰 끝 -->

<div class="media" id="view-recomment">
</div>

<c:forEach var="c" items="${comlist }">
	<div class="media" id="view-listcomment">
		<img class="mr-3" src="${pageContext.servletContext.contextPath }/image/parcelimage/64x64.jpg" alt="Generic placeholder image">
		<div class="media-body">
			<div class="alert alert-secondary" role="alert">
				<h5 class="mt-0">${c.TALKER }</h5>
					${c.COMMENTS }
			</div>
			<small class="d-block text-right mt-3">
				<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
					[recomment]
				</button>
			</small>
			<div class="collapse" id="collapseExample">
				<div class="card card-body">
					<button class="btn btn-link" type="button">리댓글 입력하는 사용자 아이디 또는 닉네임 들어갈 예정</button>
					<div class="input-group mb-3" id="input-recomment">
						<input type="text" class="form-control" id="new-recomment" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button\" id="btn-recomment">Re Comment</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr class="mb-4">
</c:forEach>


<hr class="mb-4">

<!-- 댓글 입력할수 있는 폼 뷰 시작 -->

<button class="btn btn-link" type="button" >아이디 또는 닉네임 들어갈 곳</button>
<div class="input-group mb-3" id="input-comment"  >
	<input type="text" class="form-control" id="new-comment" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
	<div class="input-group-append">
		<button class="btn btn-outline-secondary" type="button" id="btn-comment">New Comment</button>
	</div>
</div>

<!-- 댓글 입력할수 있는 폼 뷰 끝 -->


<div class="bd-example">
	<a href="${pageContext.servletContext.contextPath }/percel.do"><button type="button" class="btn btn-secondary btn-lg btn-block">Back</button></a>
</div>


<%-- <script src="${pageContext.servletContext.contextPath }/js/recomment.js"></script> --%>

<script>
	$("#new-comment").on("change", function() {
		var comment = $("#new-comment").val();
		var html = "<img class=\"mr-3\" src=\"${pageContext.servletContext.contextPath }/image/parcelimage/64x64.jpg\" alt=\"Generic placeholder image\">";
			html += "<div class=\"media-body\">";
			html += "<div class=\"alert alert-secondary\" role=\"alert\">";
			html += "<h5 class=\"mt-0\">여기에 댓글 입력한 사용자 아이디 또는 닉네임 들어갈 예정</h5>";
			html += comment;
			html += "</div>";
			html += "<small class=\"d-block text-right mt-3\">";
			html += "<button class=\"btn btn-link\" type=\"button\" data-toggle=\"collapse\" data-target=\"#collapseExample\" aria-expanded=\"false\" aria-controls=\"collapseExample\">";
			html += "[recomment]";
			html += "</button>";
			html += "</small>";
			html += "<div class=\"collapse\" id=\"collapseExample\">";
			html += "<div class=\"card card-body\">";
			html += "<button class=\"btn btn-link\" type=\"button\">리댓글 입력하는 사용자 아이디 또는 닉네임 들어갈 예정</button>";
			html += "<div class=\"input-group mb-3\" id=\"input-recomment\">";
			html += "<input type=\"text\" class=\"form-control\" id=\"new-recomment\" placeholder=\"Recipient's username\" aria-label=\"Recipient's username\" aria-describedby=\"button-addon2\">";
			html += "<div class=\"input-group-append\">";
			html += "<button class=\"btn btn-outline-secondary\" type=\"button\" id=\"btn-recomment\">Re Comment</button>";
			html += "</div>";
			html += "</div>";
			html += "</div>";
			html += "</div>";
			html += "</div>";
			html += "<hr class=\"mb-4\">";

		$("#view-comment").append(html);
		document.getElementById("new-comment").value = "";
		
		var ino = ${one.NO };
		var param = {"ino" : ino,"talker" : "test_talker","comments" : comment};
		$.post("${pageContext.servletContext.contextPath }/addcomment.do", param, function(rst) {
			var obj = JSON.parse(rst);
			listcomment();
		});
	});

	// 지도를 표시할 div 
	var mapContainer = document.getElementById("map"),
	    mapOption = {
			// 지도의 중심좌표
	        center: new daum.maps.LatLng(${one.LAT }, ${one.LONGI }),
	     	// 지도의 확대 레벨
	        level: 3
	    };
	
	// 지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 마커가 표시될 위치입니다
	var markerPosition  = new daum.maps.LatLng(${one.LAT }, ${one.LONGI });

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
/* 	
	$("#new-comment").on("change", function() {
		var comment = $("#new-comment").val();
		var ino = ${one.NO };
		var param = {"ino" : ino,"talker" : "test_talker","comments" : comment};
		$.post("${pageContext.servletContext.contextPath }/addcomment.do", param, function(rst) {
			var obj = JSON.parse(rst);
			console.log(obj.rst);
		});
	});
	 */
	
/* 
	$("#new-recomment").on("change", function() {
		var recommnet = $("#new-recomment").val();
		console.log(recommnet);
		var html = "<hr class=\"mb-4\">";
			html += "<div class=\"media mt-3\">";
			html += "<a class=\"pr-3\" href=\"#\">";
			html += "<img src=\"${pageContext.servletContext.contextPath }/image/parcelimage/64x64.jpg\" alt=\"Generic placeholder image\">";
			html += "</a>"
			html += "<div class=\"media-body\">";
			html += "<div class=\"alert alert-secondary\" role=\"alert\">";
			html += "<h5 class=\"mt-0\">Media heading</h5>";
		    html += recommnet;
		    html += "</div>";
			html += "</div>";
			html += "</div>";
			
		$("#view-recomment").append(html);
		document.getElementById("new-recomment").value = "";
	})
	 */
	 
/* 	
	$(document).ready(function(){
		$("#new-recomment").live("change", function() {
			var recommnet = $("#new-recomment").val();
			console.log(recommnet);
			var html = "<hr class=\"mb-4\">";
				html += "<div class=\"media mt-3\">";
				html += "<a class=\"pr-3\" href=\"#\">";
				html += "<img src=\"${pageContext.servletContext.contextPath }/image/parcelimage/64x64.jpg\" alt=\"Generic placeholder image\">";
				html += "</a>"
				html += "<div class=\"media-body\">";
				html += "<div class=\"alert alert-secondary\" role=\"alert\">";
				html += "<h5 class=\"mt-0\">Media heading</h5>";
			    html += recommnet;
			    html += "</div>";
				html += "</div>";
				html += "</div>";
		});
		$("#view-recomment").append(html);
		document.getElementById("new-recomment").value = "";
	});
	 */
	
	
	// recomment 입력 이벤트 function 추가 해야 함. 이건 script에 넣어 보고 이벤트 실행 안되면 js 파일로 하나 만들어 놓고 script 짜서 링크 걸어 둔다음 test 해봐야 됨.
	// 예제 C:\Users\rogem\Desktop\eclipse-workspace\workspace web\basic05\WebContent\part1 에서 3번 6번 참고.
	
</script>
