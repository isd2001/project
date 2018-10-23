<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="dropdown1" >
  <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true"  >
    <span>1 </span>실시간 순위 <span class="badge badge-pill badge-success">↑</span>
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <a class="dropdown-item">
			<span>2 </span>실시간 순위 <span class="badge badge-pill badge-success">↑</span>
	</a>
	<a class="dropdown-item">
			<span>3 </span>실시간 순위 <span class="badge badge-pill badge-danger">↓</span>
	</a>
  </div>
</div>
<hr />
<div class="form-group">
	<div class="small-input" style="float: left; width: 70%;">
		<input type="text" name="mb_id" id="mb_id"
			class="form-control input-sm" placeholder="아이디" tabindex="21"
			autocomplete="off"> <input type="password" name="mb_password"
			id="mb_password" class="form-control input-sm" placeholder="비밀번호"
			tabindex="22">
	</div>
	<div style="float: left; width: 30%; padding-left: 0px;">
		<div class="form-group">
			<button type="submit" class="btn btn-brex-2nd btn-block en"
				style="height: 70px;" tabindex="23">로그인</button>
		</div>
	</div>
</div>
<hr />
<div class="card">
	<img class="card-img-top"
		src="${pageContext.servletContext.contextPath }/image/weather.png"
		style="width: 80%; height: 10%;">
	<div class="card-body">
		<p class="card-text">오늘은 산책하기 좋은 날씨 입니다~</p>

	</div>
</div>
<hr />

<li class="list-group-item list-group-item-success">현재 접속자</li>
<div style="height: 150px; overflow-y: scroll;" id="connectList">
	<ul class="list-group">
		<li class="list-group-item">접속자 1</li>
		<li class="list-group-item">접속자 2</li>
		<li class="list-group-item">접속자 3</li>
		<li class="list-group-item">접속자 4</li>
		<li class="list-group-item">접속자 5</li>
	</ul>

</div>

<script>	
/* 	$("#dropdownMenuButton1").on("mouse", function(){	
		$("#dropdownMenuButton1").trigger("click");
	})
	  */
</script>
