<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container" style="margin-bottom: 10%;">
<form
	action="${pageContext.servletContext.contextPath }/together/selectboard.do"
	method="post">
	<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          ������ �������ּ���
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
					<a onclick="area(������);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=������" class="badge badge-light" style="opacity: 0.5;">������</a> 
					<a onclick="area(������);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=������" class="badge badge-light" style="opacity: 0.5;">������</a>
					<a onclick="area(���ϱ�);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=���ϱ�"	class="badge badge-light" style="opacity: 0.5;">���ϱ�</a>
					<a onclick="area(������);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=������" class="badge badge-light" style="opacity: 0.5;">������</a>
					<a onclick="area(���Ǳ�);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=���Ǳ�"	class="badge badge-light" style="opacity: 0.5;">���Ǳ�</a>
					<a onclick="area(������);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=������" class="badge badge-light" style="opacity: 0.5;">������</a>
					<a onclick="area(���α�);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=���α�" class="badge badge-light" style="opacity: 0.5;">���α�</a>
					<a onclick="area(��õ��);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=��õ��" class="badge badge-light" style="opacity: 0.5;">��õ��</a>
					<a onclick="area(�����);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=�����" class="badge badge-light" style="opacity: 0.5;">�����</a>
					<a onclick="area(������);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=������" class="badge badge-light" style="opacity: 0.5;">������</a>
					<a onclick="area(���빮��);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=���빮��" class="badge badge-light" style="opacity: 0.5;">���빮��</a>
					<a onclick="area(���۱�);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=���۱�" class="badge badge-light" style="opacity: 0.5;">���۱�</a>
					<a onclick="area(������);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=������" class="badge badge-light" style="opacity: 0.5;">������</a>
					<a onclick="area(���빮��);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=���빮��" class="badge badge-light" style="opacity: 0.5;">���빮��</a>
					<a onclick="area(���ʱ�);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=���ʱ�" class="badge badge-light" style="opacity: 0.5;">���ʱ�</a>
					<a onclick="area(������);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=������" class="badge badge-light" style="opacity: 0.5;">������</a>
					<a onclick="area(���ϱ�);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=���ϱ�" class="badge badge-light" style="opacity: 0.5;">���ϱ�</a>
					<a onclick="area(���ı�);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=���ı�" class="badge badge-light" style="opacity: 0.5;">���ı�</a>
					<a onclick="area(��õ��);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=��õ��" class="badge badge-light" style="opacity: 0.5;">��õ��</a>
					<a onclick="area(��������);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=��������" class="badge badge-light" style="opacity: 0.5;">��������</a>
					<a onclick="area(��걸);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=��걸" class="badge badge-light" style="opacity: 0.5;">��걸</a>
					<a onclick="area(����);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=����" class="badge badge-light" style="opacity: 0.5;">����</a>
					<a onclick="area(���α�);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=���α�" class="badge badge-light" style="opacity: 0.5;">���α�</a>
					<a onclick="area(�߱�);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=�߱�" class="badge badge-light" style="opacity: 0.5;">�߱�</a>
					<a onclick="area(�߷���);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=�߷���" class="badge badge-light" style="opacity: 0.5;">�߷���</a>
				</div>
			</div>
		</div>
	</div>
	<hr />
	<div id="map" style="width: 100%; height: 300px;"></div>
	<table class="table table-hover">
  		<thead>
	     <tr>
    	  <th scope="col" style="width: 3%"><small>NO</small></th>
     	  <th scope="col" style="width: 10%"><small>����</small></th>
    	  <th scope="col" style="width: 35%"><small>����</small></th>
      	  <th scope="col" style="width: 20%"><small>�ۼ���</small></th>
     	  <th scope="col" style="width: 10%"><small>��¥</small></th>     	  
     	  <th scope="col" style="width: 9%"><small>��ȸ��</small></th>
	     </tr>
  		</thead>
  		<tbody>
     	<c:forEach var="l" items="${list }">
    	 		<tr>
     			<th scope="row">${l.NO }</th>
     			<td><small>${l.AREA }</small></td>
     			<td>
				<a href="${pageContext.servletContext.contextPath  }/together/detail.do?no=${l.NO }">     			
     			${l.TITLE }</a>
     			</td>
     			<td>${l.NICK }</td>
     			<td>${l.day }</td>     			
     			<td>${l.LOOKUP }</td>
     			</tr>
     	</c:forEach>
    	
  </tbody>
</table>
<!-- ======================================== -->
	<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">				
				<c:forEach var="p" begin="1" end="${size }">
						<c:choose>
							<c:when test="${p==current}">
								<li class="page-item active">
     							 <a class="page-link" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=${area }&p=${p}">${p }<span class="sr-only">(current)</span>
     							 </a></li>	
     						 </c:when>
     						 <c:otherwise>
     						 	<a class="page-link" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=${area }&p=${p}">${p }</a>
     						</c:otherwise>
     					</c:choose>					
					</c:forEach>			
			</ul>
		</nav>	
		
	
	<a href="${pageContext.servletContext.contextPath }/together/new.do" class="d-flex justify-content-end">
		<button type="button" class="btn btn-outline-success">�� ����</button>
	</a>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d54ea73b1e9ac77ebe1409aa939d77e5&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
		mapOption = {
			center : new daum.maps.LatLng(37.531464664279646,
					126.96147681424955), // ������ �߽���ǥ
			level : 9
		// ������ Ȯ�� ����
		};
		var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
		// ��Ŀ�� ǥ���� ��ġ�� ������ ������ �ִ� ��ü �迭�Դϴ� 
		var positions = [
			<c:forEach var="i" items="${list}" varStatus="vs">
			{
				"content": "<div>${i.TITLE}</div>",
				"latlng" : new daum.maps.LatLng(${i.LATITUDE}, ${i.LONGITUDE})
			}
			<c:if test="${!vs.last}">,</c:if>
			</c:forEach>
		];

		for (var i = 0; i < positions.length; i++) {
			// ��Ŀ�� �����մϴ�
			var marker = new daum.maps.Marker({
				map : map, // ��Ŀ�� ǥ���� ����
				position : positions[i].latlng
			// ��Ŀ�� ��ġ
			});

			// ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
			var infowindow = new daum.maps.InfoWindow({
				content : positions[i].content
			// ���������쿡 ǥ���� ����
			});

			// ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
			// �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
			// for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
			daum.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			daum.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
		}

		// ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}
	</script>
</form>
</div>

