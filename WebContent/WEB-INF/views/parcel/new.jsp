<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<hr class="mb-4">
<h4 class="mb-3" align="center">분양 글쓰기</h4>

<form action="${pageContext.servletContext.contextPath }/add.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="lat" value="" id="lat"/>
	<input type="hidden" name="longi" value="" id="longi"/>
	<div class="row">
		<div class="col-md-6 mb-3">
			<label for="lastName">제목</label>
			<input type="text" class="form-control" id="title" name="title">
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">메인이미지</label>
			<input type="file" class="form-control" id="mainimage" name="mainimage">
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">분양정보</label>
			<div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="choice" value="1"> <label class="form-check-label" for="inlineCheckbox1">분양중</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="choice" value="0"> <label class="form-check-label" for="inlineCheckbox2">분양완료</label>
				</div>
			</div>
		</div>
		
		<div class="col-md-6 mb-3">
			<label for="lastName">분양자 ID</label>
			<input type="text" class="form-control" id="writer" name="writer">
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">분양자 핸드폰 번호</label>
			<input type="text" class="form-control" id="phone" name="phone"">
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">분양장소(상세주소입력)</label>
			<input type="text" class="form-control" id="area" name="area" onchange="address();">
		</div>
	</div>
	<hr class="mb-4">
		<div id="map" style="width:100%;height:350px;"></div>
	<hr class="mb-4">
	<h5 class="mb-3" >강아지 정보</h5>
	<div class="row">
		<div class="col-md-6 mb-3">
			<label for="firstName">견종</label>
			<input type="text" class="form-control" id="breeds" name="breeds">
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">성별</label>
			<input type="text" class="form-control" id="gender" name="gender">
		</div>	
		<div class="col-md-6 mb-3">
			<label for="lastName">분류</label>
			<input type="text" class="form-control" id="sort" name="sort">
		</div>	
		<div class="col-md-6 mb-3">
			<label for="lastName">나이</label>
			<input type="text" class="form-control" id="age" name="age">
		</div>	
		<div class="col-md-6 mb-3">
			<label for="lastName">성격</label>
			<input type="text" class="form-control" id="character" name="character ">
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">접종</label>
			<input type="text" class="form-control" id="inoculation" name="inoculation">
		</div>
		
		<div class="col-md-12">
			<div class="input-group-prepend">
				<span class="input-group-text">상세내용</span>
			</div>
			<textarea class="form-control" aria-label="With textarea" id="content" name="content"></textarea>
		</div>
		
	</div>
	<hr class="mb-4">
 	<div class="form-group">
		<label>파일 업로드</label>
			<input name="file1" type="file" class="form-control" >
			<input name="file2" type="file" class="form-control" >
	</div>
	<div class="row">
		<div class="col-md-6 mb-3">
			<button type="submit" class="form-control btn btn-outline-primary">Save</button>
		</div>
		<div class="col-md-6 mb-3">
			<a href="${pageContext.servletContext.contextPath }/percel.do"><button type="button" class="form-control btn btn-outline-primary" >Cencel</button></a>
		</div>
	</div>

</form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8732ddf8bab883cf85aa0180da9e413d&libraries=services,clusterer,drawing"></script>
<script>
/* 	var address = function() {
		// 주소 작성 값 추출
		var area = document.getElementById("area").value;
		console.log(area);
	} */

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
	
	var address = function() {
		// 주소 작성 값 추출
		var area = $("#area").val();
	
	// 주소로 좌표를 검색합니다
		geocoder.addressSearch(area, function(result, status) {
	
		// 정상적으로 검색이 완료됐으면 
			if (status === daum.maps.services.Status.OK) {
		
				var coords = new daum.maps.LatLng(result[0].y, result[0].x);
				console.log(coords);
				var lat = new daum.maps.LatLng(result[0].y);
				console.log(lat);
				var longi = new daum.maps.LatLng(result[0].x);
				console.log(longi);
				console.log(lat + " , " + longi);
				
				
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
				
				var data = {"lat" : result[0].y,"longi" : result[0].x}
				console.log(data);
				$("#lat").val(result[0].y);
				$("#longi").val(result[0].x);
			}
		});
	}
	
</script>