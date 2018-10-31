<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<hr class="mb-4">
<h4 class="mb-3" align="center">분양 글쓰기</h4>

<form action="${pageContext.servletContext.contextPath }/add.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="lat" value="" id="lat"/>
	<input type="hidden" name="longi" value="" id="longi"/>
	<div class="row">
		<div class="col-md-6 mb-3">
			<label for="lastName">제목</label>
			<input type="text" class="form-control" id="title" name="title">
		</div>			
	</div>	
	<h5 class="mb-3" >강아지 정보</h5>
	<div class="row">
		<div class="col-md-6 mb-3">
			<label for="firstName">견종</label>
			<input type="text" class="form-control" id="breeds" name="breeds">
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">성별</label>
			<input type="text" class="form-control" id="gender" name="gender">
		</div>		
		<div class="col-md-6 mb-3">
			<label for="lastName">나이</label>
			<input type="text" class="form-control" id="age" name="age">
		</div>		
	</div>	
		 <div class="row justify-content-center">
		  <div class="col-sm-9">
		 <label class="">강아지 동영상</label><br>
		 <div class="row">
			  <div class="col-md-6 mb-3">		     
			  	<div class="embed-responsive embed-responsive-1by1">
				  <iframe class="embed-responsive-item " src="${pageContext.servletContext.contextPath }/image/noimage.png" style="width:300px; height:300px;" id="preview" allowfullscreen ></iframe>
				</div>  								 
			   <div class="col-md-6 mb-3">
				<input type="file" class="btn-outline-info" name="video" id="video" accept="video/*">
			   </div>
		     </div>
		 </div>
		 </div>
		 </div>
		
		
		
		
		<div class="col-md-12">
			<div class="input-group-prepend">
				<span class="input-group-text">상세내용</span>
			</div>
			<textarea class="form-control" aria-label="With textarea" id="content" name="content"></textarea>
		</div>
	
	<hr class="mb-4">
 
	<div class="row">
		<div class="col-md-6 mb-3">
			<button type="submit" class="form-control btn btn-outline-primary">Save</button>
		</div>
		<div class="col-md-6 mb-3">
			<a href="${pageContext.servletContext.contextPath }/percel.do"><button type="button" class="form-control btn btn-outline-primary" >Cencel</button></a>
		</div>
	</div>

</form>


<script>
	$("#video").on("change",function(){
		console.log(this.files[0].type);
		
		var f = new FileReader()		
		f.onload= function(e){
			$("#preview").attr("src", e.target.result);
		}
		f.readAsDataURL(this.files[0]);
	});
	//class="img-thumbnail"
</script>