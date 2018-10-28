<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>

<div class="my-3 p-5 bg-white rounded shadow-sm">
	<div class="media text-muted pt-3">
		<div class="d-flex justify-content-between align-items-center w-100">
			<strong class="text-gray-dark">${list.TITLE }</strong> <strong
				class="text-gray-dark"><small>
					[${list.AREA}]${list.DAY }</small></strong>
		</div>
	</div>
	<hr />
	<div class="media text-muted pt-3">
		<div class="d-flex justify-content-between align-items-center w-100"
			style="margin: auto;">
			<strong class="text-gray-dark" style="text-align: center;">
				${list.CONTENT }</strong>

		</div>


	</div>
	<hr />
	<div class="pt-3">
		<small>주소 > ${list.ADDRESS }</small>
		<div class="d-flex justify-content-between align-items-center w-100">
			<div id="map" style="width: 50%; height: 150px; float: right;"></div>
		</div>
	</div>
	<div class="d-flex justify-content-between align-items-center w-100"
		style="float: right;">
		<div class="media text-muted pt-3" style="float: right;">
			<span class="text-gray-dark"><small>추천 > ${list.GOOD }</small></span>
			<span class="text-gray-dark"><small>조회 > ${list.LOOKUP }</small></span>
		</div>
	</div>
</div>
<!-- 댓글 -->
<div class="jumbotron" style="background-color: D7D1D0; opacity: 0.5; position: relative;height: 300px;" >
	<div style="overflow: scroll;">
		<c:forEach var="c" items="${comment }">
			▷ ${c.MENT }	<small style="float: right;">${c.day }</small>
			<br/>
		</c:forEach>
	</div>
	
<form action="${pageContext.servletContext.contextPath }/together/detail.do" method="post">
	<div style="position: absolute; left: 10px;bottom: 10px;">
		<label for="text">댓글</label><small id="size2">(0/100)</small>
		<textarea class="form-control" id="comment" name="comment"
			aria-label="With textarea" placeholder="댓글달기 "
			style="width: 300%; height: 70px; resize: none;" autocomplete="off"></textarea>
	</div>
	<div style="position: absolute; left: 580px;bottom: 30px;size: 5%;" >
	<button type="submit" class="btn btn-secondary btn-lg">댓글 올리기</button>
	</div>
</form>
</div>


<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d54ea73b1e9ac77ebe1409aa939d77e5&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(${list.LATITUDE},${list.LONGITUDE}), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(${list.LATITUDE},${list.LONGITUDE}); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>

