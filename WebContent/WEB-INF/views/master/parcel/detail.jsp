<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!------------------------------------------------------- 분양 강아지 정보 보이는 뷰 시작 이미지 / 정보만 보임 -->
<hr class="mb-4">
<div class="row mb-2">
	<div class="col-md-6">
		<div class="bd-example bd-example-images">
			<img data-src="holder.js/400x400" class="img-thumbnail"
				alt="이미지 안나오면 엑박"
				src="${pageContext.servletContext.contextPath }${one.MAINIMAGE }"
				data-holder-rendered="true" style="width: 400px; height: 400px;">
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
					<th scope="row"><button type="button" class="btn btn-light"
							type="button" data-toggle="collapse" data-target="#collapseOne">지도
							접기</button></th>
					<td><a
						href="http://map.daum.net/link/to/분양지,${one.LAT },${one.LONGI }"><button
								type="button" class="btn btn-light">길찾기</button></a></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div id="collapseOne" class="collapse show">
	<div id="map" style="width:100%; height:350px;"></div>
</div>
<!------------------------------------------------------- 분양 강아지 정보 보이는 뷰 끝 -->

<hr class="mb-4">

<!------------------------------------------------------- 글 상세 내용 및 첨부 파일 뷰 시작 -->
<main role="main" class="container">
<div class="row">
	<div class="col-md-8 blog-main">
		<h3 class="pb-3 mb-4 font-italic border-bottom">상세내용</h3>
		<p>${one.CONTENT }</p>
		<h3 class="pb-3 mb-4 font-italic border-bottom">첨부이미지 또는 동영상</h3>
		<img alt="추가 이미지"
			src="${pageContext.servletContext.contextPath }${one.FILE1 }">
		<video src="${pageContext.servletContext.contextPath }${one.FILE2 }" />
	</div>
</div>
</main>
<!------------------------------------------------------- 글 상세 내용 및 첨부 파일 뷰 끝 -->

<hr style="margin-top: 3px; margin-bottom: 3px;" />
<!------------------------------------------------------- 게시판 댓글 내용 전체 출력 뷰 시작 -->
<label>#댓글을 클릭하시면 리플을 입력하실수 있습니다.</label>
<ul class="list-unstyled">
	<c:forEach var="c" items="${comlist }" varStatus="vs">
		<li class="media border-top-0"
			id="view-listcomment_${vs.count }" style="margin-bottom: 3px;"
			data-toggle="collapse" data-target="#collapseExample_${vs.count }"
			aria-expanded="false" aria-controls="collapseExample"
			onclick="getReComment(this, '${c.SERIAL }')"><img class="mr-3"
			src="${pageContext.servletContext.contextPath }/image/parcelimage/40.jpg"
			alt="프로필 이미지">
			<div class="media-body">
				<h5 class="mt-0 mb-1" style="font-size: 15px;">${c.TALKER }</h5>
				<div style="font-size: 13px;">${c.COMMENTS }</div>
			</div></li>
		<div class="media" id="view-recomment"></div>
		<li class="collapse" id="collapseExample_${vs.count }">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">${userInfo.NICKNAME }</span>
				</div>
				<input type="text" class="form-control" placeholder="Username"
					aria-label="Username" aria-describedby="basic-addon1">
			</div>
		</li>
		<hr style="margin-top: 3px; margin-bottom: 3px;" />
	</c:forEach>
	<div id="view_comment"></div>
</ul>
<!------------------------------------------------------- 게시판 댓글 내용 전체 출력 뷰 끝 -->

<!------------------------------------------------------- 댓글 입력할수 있는 폼 뷰 시작 -->
<button class="btn btn-link" type="button">${userInfo.NICKNAME }(${userInfo.ID })</button>
<div class="input-group mb-3" id="input-comment">
	<input type="text" class="form-control" id="new_comment" aria-describedby="button-addon2" >
	<div class="input-group-append">
		<button class="btn btn-outline-secondary" type="button" id="btn_comment">New Comment</button>
	</div>
</div>
<!------------------------------------------------------- 댓글 입력할수 있는 폼 뷰 끝 -->

<div class="bd-example">
	<c:choose>
		<c:when test="${userInfo.ID == one.WRITER }">
			<a href="${pageContext.servletContext.contextPath }/detailmodify.do?no=${one.NO }"><button type="button" class="btn btn-primary btn-lg btn-block" >수정</button></a>
			<a href="${pageContext.servletContext.contextPath }/parcel.do"><button type="button" class="btn btn-secondary btn-lg btn-block" style="margin-top: 10px;">취소</button></a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.servletContext.contextPath }/parcel.do"><button type="button" class="btn btn-secondary btn-lg btn-block">Back</button></a>
		</c:otherwise>
	</c:choose>
</div>

<!-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8732ddf8bab883cf85aa0180da9e413d&libraries=services,clusterer,drawing"></script>
<script>
	var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
	
	// 지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 마커가 표시될 위치입니다
	var markerPosition  = new daum.maps.LatLng( ${one.LAT}, ${one.LONGI} );

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
//=============================================================================================================
	
	var getReComment = function(target, serial) {
		var code = serial;
		var param = {"code" : code};
		console.log(param);
		$.post("${pageContext.servletContext.contextPath }/getrecomment.do", param, function(rst) {
			var obj = JSON.parse(rst);
			console.log(rst);
			console.log(obj);
		});
	};
	
// 댓글 저장
	$("#new_comment").on("change", function() {
		var comment = $("#new_comment").val();
		console.log(comment);
		var html = "<li class=\"media border-top-0\" id=\"view-listcomment_${vs.count }\" style=\"margin-bottom: 3px;\" data-toggle=\"collapse\" data-target=\"#collapseExample_${vs.count }\" aria-expanded=\"false\" aria-controls=\"collapseExample\ onclick=\"getReComment(this, '${c.SERIAL }')\">";
		//	html += "<img class=\"mr-3\" src=\"${pageContext.servletContext.contextPath }/image/parcelimage/40.jpg\" alt=\"프로필 이미지\">";
			html += "<div class=\"media-body\">";
			html += "<h5 class=\"mt-0 mb-1\" style=\"font-size: 15px;\">${userInfo.NICKNAME }(${userInfo.ID })</h5>";
			html += "<div style=\"font-size: 13px;\">" + comment + "</div>";
			html += "</div></li>";
			html += "<div class=\"media\" id=\"view_recomment\"></div>";
			html += "<li class=\"collapse\" id=\"collapseExample_${vs.count }\">";
			html += "<div class=\"input-group mb-3\">";
			html += "<div class=\"input-group-prepend\">";
			html += "<span class=\"input-group-text\" id=\"basic-addon1\">${userInfo.NICKNAME }(${userInfo.ID })</span>";
			html += "</div>";
			html += "<input type=\"text\" class=\"form-control\" aria-describedby=\"basic-addon1\">";
			html += "</div></li>";
			html += "<hr style=\"margin-top: 3px; margin-bottom: 3px;\"/>";

		$("#view_comment").append(html);
		document.getElementById("new_comment").value = "";
		
		var ino = ${one.NO}
		var talker = ${userInfo.ID}
		var nick = ${userInfo.NICKNAME}
		var param = {"ino":ino,"talker":talker,"comments":comment,"nick":nick};
		$.post("${pageContext.servletContext.contextPath }/addcomment.do", param, function(rst) {

		});
	});
	
	
// 리플 저장
	var addReComment =function (target, serial) {
		console.log($(target).val() + "/ " +serial);
		var code = serial;
		var recomments = $(target).val();
		var html = "<hr class=\"mb-4\">";
			html += "<div class=\"media mt-3\">";
	//		html += "<a class=\"pr-3\" href=\"#\">";
	//		html += "<img src=\"${pageContext.servletContext.contextPath }/image/parcelimage/40.jpg\" alt=\"Generic placeholder image\">";
	//		html += "</a>"
			html += "<div class=\"media-body\">";
			html += "<div class=\"alert alert-secondary\" role=\"alert\">";
			html += "<h5 class=\"mt-0\">${userInfo.NICKNAME }(${userInfo.ID })</h5>";
		    html += $(target).val()
		    html += "</div>";
			html += "</div>";
			html += "</div>";
			
		$("#view_recomment").append(html);
		document.getElementById(code).value = "";
		
		var retalker = ${userInfo.ID}
		var nick = ${userInfo.NICKNAME}
		var param = {"code":code,"retalker":retalker,"recomments":recomments,"nick":nick};
		console.log(param);
		$.post("${pageContext.servletContext.contextPath }/addrecomment.do", param, function(rst) {

		});
	};
	


</script>
