<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="accordion" id="accordionExample">
	<div class="card">
		<div class="card-header" id="headingOne">
			<h5 class="mb-0">
				<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					지역구를 선택 하시면 해당 지역구의 동물병원이 나옵니다. 원하시는 지역구를 선택 하세요.
        		</button>
      		</h5>
		</div>
		<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
			<div class="card-body">
				<a onclick="area(강남구);" href="#" class="badge badge-light" style="opacity: 0.5;">강남구</a> 
				<a onclick="area(강동구);" href="#" class="badge badge-light" style="opacity: 0.5;">강동구</a>
				<a onclick="area(강북구);" href="#"	class="badge badge-light" style="opacity: 0.5;">강북구</a>
				<a onclick="area(강서구);" href="#" class="badge badge-light" style="opacity: 0.5;">강서구</a>
				<a onclick="area(관악구);" href="#"	class="badge badge-light" style="opacity: 0.5;">관악구</a>
				<a onclick="area(광진구);" href="#" class="badge badge-light" style="opacity: 0.5;">광진구</a>
				<a onclick="area(구로구);" href="#" class="badge badge-light" style="opacity: 0.5;">구로구</a>
				<a onclick="area(금천구);" href="#" class="badge badge-light" style="opacity: 0.5;">금천구</a>
				<a onclick="area(노원구);" href="#" class="badge badge-light" style="opacity: 0.5;">노원구</a>
				<a onclick="area(도봉구);" href="#" class="badge badge-light" style="opacity: 0.5;">도봉구</a>
				<a onclick="area(동대문구);" href="#" class="badge badge-light" style="opacity: 0.5;">동대문구</a>
				<a onclick="area(동작구);" href="#" class="badge badge-light" style="opacity: 0.5;">동작구</a>
				<a onclick="area(마포구);" href="#" class="badge badge-light" style="opacity: 0.5;">마포구</a>
				<a onclick="area(서대문구);" href="#" class="badge badge-light" style="opacity: 0.5;">서대문구</a>
				<a onclick="area(서초구);" href="#" class="badge badge-light" style="opacity: 0.5;">서초구</a>
				<a onclick="area(성동구);" href="#" class="badge badge-light" style="opacity: 0.5;">성동구</a>
				<a onclick="area(성북구);" href="#" class="badge badge-light" style="opacity: 0.5;">성북구</a>
				<a onclick="area(송파구);" href="#" class="badge badge-light" style="opacity: 0.5;">송파구</a>
				<a onclick="area(양천구);" href="#" class="badge badge-light" style="opacity: 0.5;">양천구</a>
				<a onclick="area(영등포구);" href="# class="badge badge-light" style="opacity: 0.5;">영등포구</a>
				<a onclick="area(용산구);" href="#" class="badge badge-light" style="opacity: 0.5;">용산구</a>
				<a onclick="area(은평구);" href="#" class="badge badge-light" style="opacity: 0.5;">은평구</a>
				<a onclick="area(종로구);" href="#" class="badge badge-light" style="opacity: 0.5;">종로구</a>
				<a onclick="area(중구);" href="#" class="badge badge-light" style="opacity: 0.5;">중구</a>
				<a onclick="area(중량구);" href="#" class="badge badge-light" style="opacity: 0.5;">중량구</a>
			</div>
		</div>
	</div>
</div>
<hr />
<div id="map" style="width: 100%; height: 300px;"></div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col" style="width: 10%"><small>지역</small></th>
				<th scope="col" style="width: 35%"><small>구분</small></th>
				<th scope="col" style="width: 20%"><small>병원이름</small></th>
				<th scope="col" style="width: 10%"><small>주소</small></th>
				<th scope="col" style="width: 9%"><small >전화번호</small></th>
				<th scope="col" style="width: 9%"><small>우편번호</small></th>
			</tr>
		</thead>
	<tbody>
	<c:forEach var="" items="">
		<tr>
			<th scope="row">#</th>
				<td><small>#</small></td>
				<td>
					<a href="#">#</a>
				</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
				<td>#</td>
		</tr>
	</c:forEach>
	</tbody>
</table>