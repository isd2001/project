<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<hr class="mb-4">
<div class="row mb-2">
	<div class="col-md-6">
		<div class="card flex-md-row mb-4 shadow-sm h-md-250">
			<img class="card-img-right flex-auto d-none d-lg-block" src="${one.MAINIMAGE }" alt="Thumbnail [500x500]" style="width: 500px; height: 500px;" data-holder-rendered="true">
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

<main role="main" class="container">
	<div class="row">
		<div class="col-md-8 blog-main">
			<h3 class="pb-3 mb-4 font-italic border-bottom">
				From the Firehose
			</h3>

          <div class="blog-post">
            <h2 class="blog-post-title">Sample blog post</h2>
            <p class="blog-post-meta">January 1, 2014 by <a href="#">Mark</a></p>

            <p>This blog post shows a few different types of content that's supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>
            
          </div>
		</div>
	</div>

</main>

<hr class="mb-4">

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
		
<hr class="mb-4">	
		
<div class="media">
	<img class="mr-3" src="${pageContext.servletContext.contextPath }/image/parcelimage/64x64.jpg" alt="Generic placeholder image">
	<div class="media-body">
		<div class="alert alert-secondary" role="alert">
			<h5 class="mt-0">Media heading</h5>
    			Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.
    	</div>
			<small class="d-block text-right mt-3">
				<a href="#">[comment]</a>
			</small>
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
	</div>
</div>

<hr class="mb-4">	

<div class="input-group mb-3">
	<input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="button-addon2">
	<div class="input-group-append">
		<button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
	</div>
</div>
