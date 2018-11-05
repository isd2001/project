<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<section class="jumbotron text-center">
	<div class="container">
		<h3>
			<b>우리 강아지를 찾아주세요</b>
		</h3>
		<p style="text-align: right">${date }</p>
	</div>
</section>

<div class="row mb-2 d-flex justify-content-center">
	<div class="col-md-7 ">
		<div class="bd-example bd-example-images">
			<img data-src="holder.js/400x400" class="img-thumbnail"
				alt="이미지 안나오면 엑박"
				src="${pageContext.servletContext.contextPath }${data.PICTURE }"
				data-holder-rendered="true" style="width: 400px; height: 400px;">
		</div>
	</div>
	<div class="bd-example col-md-5">
		<br />
		<table class="table">
			<thead class="d-flex justify-content-center">
				<tr>
					<th scope="col">${data.TITLE }</th>
				</tr>
			<thead>
			<tbody>
				<tr>
					<th scope="row">강아지 이름</th>
					<td>${data.DOGNAME }</td>
				</tr>
				<tr>
					<th scope="row">연락처</th>
					<td>${data.PHONE }</td>
				</tr>
				<tr>
					<th scope="row">특징</th>
					<td>${data.FCONTENT }</td>
				</tr>
				<tr>
					<th scope="row">상세 설명</th>
					<td>${data.SCONTENT }</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<br/>
<div class="d-flex justify-content-center">	
		<div id="map" style="width: 100%; height: 350px;"></div>	
</div>
<br />
<div style="text-align: center">
	<a href="${pageContext.servletContext.contextPath }/find/list.do">
		<button type="button" class="btn btn-outline-primary">목록으로</button>
	</a> <a href="${pageContext.servletContext.contextPath }/main/index.do">
		<button type="button" class="btn btn-outline-primary">메인으로</button>
	</a>
	<div style="text-align: right">
		<a href="${pageContext.servletContext.contextPath }/index.do">
			<button type="button" class="btn btn-outline-secondary btn-sm">삭제</button>
		</a>
	</div>
</div>



<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5194c970c18885a8e81f75b8cefdd048&libraries=services"></script>

<script>
var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
	mapOption = {
	
		center : new daum.maps.LatLng(${data.MAPX}, ${data.MAPY}), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도를 클릭한 위치에 표출할 마커입니다	
var marker = new daum.maps.Marker({
	// 지도 중심좌표에 마커를 생성합니다 
	position : map.getCenter()
});
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
daum.maps.event.addListener(map, 'click', function(mouseEvent) {

	// 클릭한 위도, 경도 정보를 가져옵니다 
	var latlng = mouseEvent.latLng;

	// 마커 위치를 클릭한 위치로 옮깁니다
	marker.setPosition(latlng);

	var message = '클릭한 위치의 위도 : ' + latlng.getLat() + "   /   ";
	message += '클릭한 위치의 경도 : ' + latlng.getLng();

	var resultDiv = document.getElementById('clickLatlng');
	resultDiv.innerHTML = message;
});
</script>