<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<form action="${pageContext.servletContext.contextPath }/together/selectboard.do" method="post">
	<div class="accordion" id="accordionExample">
		<div class="card">
			<div class="card-header" id="headingOne">
				<h5 class="mb-0">
					<button class="btn btn-link collapsed" type="button"
						data-toggle="collapse" data-target="#collapseOne"
						aria-expanded="false" aria-controls="collapseOne"
						style="align-content: center;">지역을 선택해주세요</button>
				</h5>
			</div>
			<div id="collapseOne" class="collapse show"
				aria-labelledby="headingOne" data-parent="#accordionExample">
				<div class="card-body">
					<a onclick="area(10);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=10" class="badge badge-light"
						style="opacity: 0.5;">강남구</a> <a onclick="area(20);" href="#"
						class="badge badge-light" style="opacity: 0.5;">강동구</a> <a
						onclick="area(30);" href="#" class="badge badge-light"
						style="opacity: 0.5;">강북구</a> <a onclick="area(40);" href="#"
						class="badge badge-light" style="opacity: 0.5;">강서구</a> <a
						onclick="area(50);" href="#" class="badge badge-light"
						style="opacity: 0.5;">관악구</a> <a onclick="area(60);" href="#"
						class="badge badge-light" style="opacity: 0.5;">광진구</a> <a
						onclick="area(70);" href="#" class="badge badge-light"
						style="opacity: 0.5;">구로구</a> <a onclick="area(80);" href="#"
						class="badge badge-light" style="opacity: 0.5;">금천구</a> <a
						onclick="area(90);" href="#" class="badge badge-light"
						style="opacity: 0.5;">노원구</a> <a onclick="area(100);" href="#"
						class="badge badge-light" style="opacity: 0.5;">도봉구</a> <a
						onclick="area(110);" href="#" class="badge badge-light"
						style="opacity: 0.5;">동대문구</a> <a onclick="area(120);" href="#"
						class="badge badge-light" style="opacity: 0.5;">동작구</a> <a
						onclick="area(130);" href="#" class="badge badge-light"
						style="opacity: 0.5;">마포구</a> <a onclick="area(140);" href="#"
						class="badge badge-light" style="opacity: 0.5;">서대문구</a> <a
						onclick="area(150);" href="#" class="badge badge-light"
						style="opacity: 0.5;">서초구</a> <a onclick="area(160);" href="#"
						class="badge badge-light" style="opacity: 0.5;">성동구</a> <a
						onclick="area(170);" href="#" class="badge badge-light"
						style="opacity: 0.5;">성북구</a> <a onclick="area(180);" href="#"
						class="badge badge-light" style="opacity: 0.5;">송파구</a> <a
						onclick="area(190);" href="#" class="badge badge-light"
						style="opacity: 0.5;">양천구</a> <a onclick="area(200);" href="#"
						class="badge badge-light" style="opacity: 0.5;">영등포구</a> <a
						onclick="area(210);" href="#" class="badge badge-light"
						style="opacity: 0.5;">용산구</a> <a onclick="area(220);" href="#"
						class="badge badge-light" style="opacity: 0.5;">은평구</a> <a
						onclick="area(230);" href="#" class="badge badge-light"
						style="opacity: 0.5;">종로구</a> <a onclick="area(240);" href="#"
						class="badge badge-light" style="opacity: 0.5;">중구</a> <a
						onclick="area(250);" href="#" class="badge badge-light"
						style="opacity: 0.5;">중량구</a>
				</div>
			</div>
		</div>
	</div>
	<hr />
	<button type="submit" id="result"
		class="btn btn-secondary btn-lg btn-block">검색</button>


	<script>
		/* 		$("ul#area li").on("click", function() {
		 $("#area").css("color","black");
		 console.log($("#ar").val());

		 }); */

		var area = function(target) {
			var area = target;
			$("#result").on("click", function() {

				console.log(area);

				area = null;
			});

		}
	</script>
</form>

