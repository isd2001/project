<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<form
	action="${pageContext.servletContext.contextPath }/together/selectboard.do"
	method="post">
	<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          지역을 선택해주세요
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
					<a onclick="area(10);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=10" class="badge badge-light" style="opacity: 0.5;">강남구</a> 
					<a onclick="area(20);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=20" class="badge badge-light" style="opacity: 0.5;">강동구</a>
					<a onclick="area(30);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=30"	class="badge badge-light" style="opacity: 0.5;">강북구</a>
					<a onclick="area(40);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=40" class="badge badge-light" style="opacity: 0.5;">강서구</a>
					<a onclick="area(50);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=50"	class="badge badge-light" style="opacity: 0.5;">관악구</a>
					<a onclick="area(60);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=60" class="badge badge-light" style="opacity: 0.5;">광진구</a>
					<a onclick="area(70);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=70" class="badge badge-light" style="opacity: 0.5;">구로구</a>
					<a onclick="area(80);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=80" class="badge badge-light" style="opacity: 0.5;">금천구</a>
					<a onclick="area(90);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=90" class="badge badge-light" style="opacity: 0.5;">노원구</a>
					<a onclick="area(100);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=100" class="badge badge-light" style="opacity: 0.5;">도봉구</a>
					<a onclick="area(110);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=110" class="badge badge-light" style="opacity: 0.5;">동대문구</a>
					<a onclick="area(120);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=120" class="badge badge-light" style="opacity: 0.5;">동작구</a>
					<a onclick="area(130);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=130" class="badge badge-light" style="opacity: 0.5;">마포구</a>
					<a onclick="area(140);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=140" class="badge badge-light" style="opacity: 0.5;">서대문구</a>
					<a onclick="area(150);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=150" class="badge badge-light" style="opacity: 0.5;">서초구</a>
					<a onclick="area(160);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=160" class="badge badge-light" style="opacity: 0.5;">성동구</a>
					<a onclick="area(170);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=170" class="badge badge-light" style="opacity: 0.5;">성북구</a>
					<a onclick="area(180);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=180" class="badge badge-light" style="opacity: 0.5;">송파구</a>
					<a onclick="area(190);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=190" class="badge badge-light" style="opacity: 0.5;">양천구</a>
					<a onclick="area(200);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=200" class="badge badge-light" style="opacity: 0.5;">영등포구</a>
					<a onclick="area(210);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=210" class="badge badge-light" style="opacity: 0.5;">용산구</a>
					<a onclick="area(220);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=220" class="badge badge-light" style="opacity: 0.5;">은평구</a>
					<a onclick="area(230);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=230" class="badge badge-light" style="opacity: 0.5;">종로구</a>
					<a onclick="area(240);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=240" class="badge badge-light" style="opacity: 0.5;">중구</a>
					<a onclick="area(250);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=250" class="badge badge-light" style="opacity: 0.5;">중량구</a>
				</div>
			</div>
		</div>
	</div>
	<hr />
	<a href="${pageContext.servletContext.contextPath }/together/new.do">
	<button type="button" class="btn btn-outline-success" style="position: absolute;right: 0;">
	글 쓰기</button></a>

	<script>

		var area = function(target) {
			var area = target;
			$("${pageContext.servletContext.contextPath }/together/selectboard.do?area=10result").on("click", function() {

				console.log(area);

				area = null;
			});

		}
	</script>
</form>

