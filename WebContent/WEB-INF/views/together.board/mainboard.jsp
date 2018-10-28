<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${result eq 'yes' }">
	<script>window.alert("글이 정상적으로 처리되셨습니다.")</script>
</c:if>

<form
	action="${pageContext.servletContext.contextPath }/together/selectboard.do"
	method="post">
	<div class="accordion" id="accordionExample">
		<div class="card">
   		 <div class="card-header" id="headingTwo">
   		   <h5 class="mb-0">
    	       <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">지역을 선택해주세요</button>
	       </h5>
		 </div>
	    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
				<div class="card-body">
					<a onclick="area(강남구);" href="${pageContext.servletContext.contextPath }/together/selectboard.do?area=강남구" class="badge badge-light" style="opacity: 0.5;">강남구</a> 
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
	<!-- ======================================== -->
	<table class="table table-hover">
  		<thead>
	     <tr>
    	  <th scope="col" style="width: 3%"><small>NO</small></th>
     	  <th scope="col" style="width: 10%"><small>지역</small></th>
    	  <th scope="col" style="width: 35%"><small>제목</small></th>
      	  <th scope="col" style="width: 20%"><small>작성자</small></th>
     	  <th scope="col" style="width: 10%"><small>날짜</small></th>
     	  <th scope="col" style="width: 9%"><small >추천</small></th>
     	  <th scope="col" style="width: 9%"><small>조회수</small></th>
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
     			<td>-</td>
     			<td>${l.DAY }</td>
     			<td>${l.GOOD }</td>
     			<td>${l.LOOKUP }</td>
     			</tr>
     	</c:forEach>
    	
  </tbody>
</table>
	
	<!-- ======================================== -->
	
	<a href="${pageContext.servletContext.contextPath }/together/new.do">
	<button type="button" class="btn btn-outline-success" style="position: absolute;right: 0;">
	글 쓰기</button></a>

	<script>
	
	</script>
</form>

