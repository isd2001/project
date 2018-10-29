<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<form method="post" enctype="multipart/form-data" action="${pageContext.servletContext.contextPath }/find/start.do" id="a">
	<div style="text-align: center">
		<br />
		<h3><b>우리 강아지를 찾아주세요</b></h3>
		<div style="text-align: right">${date }</div>
		<br />

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<button class="btn btn-outline-secondary" type="button">제목 입력</button>
			</div>
			<input style="text-align: center" type="text" class="form-control"
				placeholder=" ex) 우리  [강아지]를 찾아주세요." aria-describedby="basic-addon1"
				id="title" name="title">
		</div>

		<div class="input-group mb-1">
			<div class="input-group-prepend">
				<button class="btn btn-outline-secondary" type="button"
					id="findFileBt" name="findFileBt">파일 첨부</button>
			</div>
			<div class="custom-file">
				<input type="file" class="custom-file-input"
					aria-describedby="inputGroupFileAddon03" id="findFile" name="findFile" accept="image/*"> <label
					class="custom-file-label" for="inputGroupFile03"> 파일이 필요하신가요?</label>
			</div>
		</div>
		<br/>
	</div>
	<div class="form-group">
		<div class="row" style="height: 250px;">
			<div class="col">
				<img src="" id="preview" style="height: 240px" onchange="putImage(this)" class="rounded img-fluid"/>
			</div>
			<div class="col">
				<textarea class="form-control" style="resize: none; height: 240px;"
					placeholder="특징을 적어주세요" id="findContent1" name="findContent1"></textarea>
			</div>
		</div>
		<div class="row" style="height: 250px;">
			<div class="col">
				<textarea class="form-control" placeholder="자세한 상황, 위치 등을 적어주세요" 
				style="resize: none; height: 245px;" id="findContent2" name="findContent2"></textarea>
			</div>
		</div>
		<div id="map" style="width: 100%; height: 350px;"></div>
			<p style="text-align: center">
				<b><em>지도를 확대해서 위치를 클릭해주세요</em></b>
			</p>
		<div id="clickLatlng"></div>
	
		<div style="text-align:center">
			<button class="btn btn-outline-secondary" type="button" onclick="writeOn();">작성 완료</button>
		</div>
	</div>
</form>
		
<script>
	$("#findFile").on("change",function(){
		var f = new FileReader();
		f.onload= function(e){
			$("#preview").attr("src", e.target.result);
		}
		f.readAsDataURL(this.files[0]);
	});
	
	var writeOn = function(){
		if(document.getElementById("title").value != "" && document.getElementById("findFile").files[0] != "" 
				&& document.getElementById("findContent1").value != "" && document.getElementById("findContent2").value != ""){
			window.alert("작성 완료되었습니다.");	
			$("#a").trigger("submit");
		}else{
			window.alert("빠짐없이 작성해주세요.");
			window.location.reload(true);
		}
	}
</script>

<!-- 지도API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5194c970c18885a8e81f75b8cefdd048&libraries=services,clusterer,drawing"></script>
<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(37.566842, 126.978629), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 지도를 클릭한 위치에 표출할 마커입니다	
	var marker = new daum.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
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
    
    var message = '클릭한 위치의 위도 : ' + latlng.getLat() + "   /   " ;
    message += '클릭한 위치의 경도 : ' + latlng.getLng();
    
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
});
	
</script>
