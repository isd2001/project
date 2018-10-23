<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h2>분양글쓰기</h2>
<form action="${pageContext.servletContext.contextPath }/add.do" method="post" >
	<div class="form-group">
		<label>제목</label> 
			<input id="title" name="title" type="text" class="form-control" >
		<label>분양 정보</label><br>
			분양중<input type="radio" name="choice" value="1">
			분양완료<input type="radio" name="choice" value="0"><br>
			분양자 ID<input id="writer" name="writer" type="text" class="form-control" >
			분양자 핸드폰 번호<input id=phone name="phone" type="text" class="form-control" >
			분양주소(상세입력)<input id="area" name="area" type="text" class="form-control" >
	</div>
	
	<div id="map" style="width:100%;height:350px;"></div>
	
	<div class="form-group">
		<label>강아지 정보</label>
			견종<input id="breeds" name="breeds" type="text" class="form-control" >
			성별<input id="gender" name="gender" type="text" class="form-control" >
			분류<input id="size" name="size" type="text" class="form-control" >
			나이<input id="age" name="age" type="text" class="form-control" >
			접종<input id="inoculation" name="inoculation" type="text" class="form-control" >
	</div>
	<div class="form-group">
		<label>상세내용 (*)</label>
			<input id="content" name="content" type="text" class="form-control" >
	</div>
 	<div class="form-group">
		<label>파일 업로드</label>
			<input name="mainimage" type="file" class="form-control" >
			<input name="file1" type="file" class="form-control" >
			<input name="file2" type="file" class="form-control" >
	</div>
	<div class="form-group">
		<button type="submit"  class="form-control btn btn-outline-primary">Send</button>
	</div>
</form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8732ddf8bab883cf85aa0180da9e413d"></script>
<script>
	var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					"제주특별자치도 제주시 첨단로 242",
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === daum.maps.services.Status.OK) {

							var coords = new daum.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new daum.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new daum.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">분양장소</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
</script>