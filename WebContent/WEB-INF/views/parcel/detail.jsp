<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<hr class="mb-4">
<div class="row mb-2">
	<div class="col-md-6">
		<div class="bd-example bd-example-images">
	  		<img data-src="holder.js/400x400" class="img-thumbnail" alt="이미지 안나오면 엑박" src="${pageContext.servletContext.contextPath }${one.MAINIMAGE }" data-holder-rendered="true" style="width: 400px; height: 400px;">
		</div>
	</div>
	<div class="bd-example">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">${one.TITLE }</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">견종</th>
					<td>${one.BREEDS }</td>
				</tr>
				<tr>
					<th scope="row">성별</th>
					<td>${one.GENDER }</td>
				</tr>
				<tr>
					<th scope="row">나이</th>
					<td>${one.AGE }</td>
				</tr>
				<tr>
					<th scope="row">분류</th>
					<td>${one.SORT }</td>
				</tr>
				<tr>
					<th scope="row">성격</th>
					<td>${one.CHARACTER }</td>
				</tr>
				<tr>
					<th scope="row">접종</th>
					<td>${one.INOCULATION }</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<hr class="mb-4">	

<main role="main" class="container">
	<div class="row">
		<div class="col-md-8 blog-main">
			<h3 class="pb-3 mb-4 font-italic border-bottom">
				상세내용
			</h3>
        	    <p>${one.CONTENT }</p>
			<h3 class="pb-3 mb-4 font-italic border-bottom">
				첨부이미지 또는 동영상
			</h3>
		</div>
	</div>
</main>
<hr class="mb-4">
<%-- 
<div class="card">
	<div class="card-body">
		<div class="media">
			<img class="mr-3" src="${pageContext.servletContext.contextPath }/image/parcelimage/64x64.jpg" alt="Generic placeholder image">
			<div class="media-body">
				<div class="alert alert-secondary" role="alert">
					<h5 class="mt-0">Media heading</h5>
					Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.
				</div>
			</div>
		</div>
	</div>
</div>
		 --%>
<hr class="mb-4">	
		
<div class="media">
	<img class="mr-3" src="${pageContext.servletContext.contextPath }/image/parcelimage/64x64.jpg" alt="Generic placeholder image">
	<div class="media-body">
		<div class="alert alert-secondary" role="alert">
			<h5 class="mt-0">Media heading</h5>
    			Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.
    	</div>
			<small class="d-block text-right mt-3">
				<a href="#" id="comment" name="comment">[comment]</a>
			</small>
<%--     
    <hr class="mb-4">
		<div class="media mt-3">
			<a class="pr-3" href="#">
				<img src="${pageContext.servletContext.contextPath }/image/parcelimage/64x64.jpg" alt="Generic placeholder image">
			</a>
			<div class="media-body">
				<div class="alert alert-secondary" role="alert">
					<h5 class="mt-0">Media heading</h5>
	        		Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.
	        	</div>
			</div>
		</div>
--%>
	</div>
</div>

<hr class="mb-4">	

<div class="input-group mb-3" >
	<input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
	<div class="input-group-append">
		<button class="btn btn-outline-secondary" type="button" id="button-addon2">New Comment</button>
	</div>
</div>

<script>
	${"$comment"}.on("click", function() {
		$("")
	});

</script>
