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
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" onclick="target();" style="font-size: 12px;" value="강남구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="강동구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="강북구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="강서구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="관악구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="광진구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="구로구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="금천구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="노원구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="도봉구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="동대문구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="동작구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="마포구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="서대문구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="서초구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="성동구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="성북구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="송파구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="양천구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="영등포구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="용산구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="은평구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="종로구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="중구">
				<input type="button" class="btn btn-primary btn-sm btn-light" name="gu" style="font-size: 12px;" value="중랑구">
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
	<c:forEach var="dh" items="${dhlist }">
		<tr>
			<th scope="row">#</th>
				<td>#</td>
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

<script>
	var target = function() {
		var g = document.getElementsByName("gu")[0].value;
		console.log(g);
		console.log(document.getElementsByName("gu")[0].value);
		
		$.get("/doghospital.do?gu="+g).done(function(obj) {
			console.log(obj.rst);
		});
	}
	
	



</script>