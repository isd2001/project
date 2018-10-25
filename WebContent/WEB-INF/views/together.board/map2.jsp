<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>키워드로 장소검색하기</title>

</head>
<body>
	<div>
		지역검색 > <input type="text" id="name">
	</div>
	<div id="map" style="width: 100%; height: 350px;"></div>

	<div id="clickLatlng"></div>
	<button type="submit" id="result">확인</button>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=117ad48755b824c438ab2ac9c6b6ad6e&libraries=services"></script>
	<script>
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new daum.maps.InfoWindow({
			zIndex : 1
		});

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();

		//키워드로 장소를 검색합니다
		document.getElementById("name").onchange = function() {
			var name = document.getElementById("name").value;
			console.log(name)
			ps.keywordSearch(name, placesSearchCB);

		};

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === daum.maps.services.Status.OK) {

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new daum.maps.LatLngBounds();

				for (var i = 0; i < data.length; i++) {
					/* displayMarker(data[i]); */
					bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
				}

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = new daum.maps.Marker({
				map : map,
				position : new daum.maps.LatLng(place.y, place.x)
			});

			// 마커에 클릭이벤트를 등록합니다
			daum.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow.setContent('<div style="padding:5px;font-size:12px;">'
								+ place.place_name + '</div>');
				infowindow.open(map, marker);
			});

		}
		//================================================================================
		var imageSrc = "${pageContext.servletContext.contextPath }/image/marker.png", // 마커이미지의 주소입니다    
		imageSize = new daum.maps.Size(50, 55), // 마커이미지의 크기입니다
		imageOption = {
			offset : new daum.maps.Point(18, 40)
		}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
				imageOption), markerPosition = new daum.maps.LatLng(37.54699,
				127.09598); // 마커가 표시될 위치입니다

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition,
			image : markerImage
		// 마커이미지 설정 
		});

		//================================================================================
		// 지도를 클릭한 위치에 표출할 마커입니다
		/* var marker = new daum.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			position : map.getCenter()
		}); */

		//지도에 마커를 표시합니다
		marker.setMap(map);

		//지도에 클릭 이벤트를 등록합니다
		//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		daum.maps.event.addListener(map, 'click', function(mouseEvent) {

			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;

			// 마커 위치를 클릭한 위치로 옮깁니다
			marker.setPosition(latlng);

			var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			message += '경도는 ' + latlng.getLng() + ' 입니다';
			
			

			document.getElementById('clickLatlng').innerHTML = message;
				
			document.getElementById("result").onclick=function(){
				console.log(latlng.getLat());
				console.log(latlng.getLng());
				
				
				
				
			};
			

		});
		//=======================================================================
		
		
		
			
			
	</script>
</body>
</html>