<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<hr class="mb-4">
<h4 class="mb-3" align="center">자랑하기</h4>

<form action="${pageContext.servletContext.contextPath }/dogTraining/add.do" method="post" enctype="multipart/form-data">
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
			<input type="text" class="form-control" id="breeds" name="dogType">
		</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">성별</label>
			<input type="text" class="form-control" id="gender" name="dogGender">
		</div>		
		<div class="col-md-6 mb-3">
			<label for="lastName">나이</label>
			<select class="custom-select" required name="dogAge">
						      <option value="">나이를 선택해주세요</option>
						      <c:forEach var="age" begin="1" end="50">
						      		<option value="${age}">${age}살</option>						      
						     </c:forEach> 
			</select>
		</div>		
	</div>	
		 <div class="row">
		  <div class="col-sm-9">
		 <label class="">강아지 동영상</label><br>
		 <div class="row">
			  <div class="col-md-6 mb-3">					  
				  <video class="img-thumbnail" src="${pageContext.servletContext.contextPath }/image/noimage.png"  id="preview"></video>				
			   <div class="col-md-6 mb-3">				
				<input type="file" class="btn-outline-info" name="upload" id="upload" accept="video/*">
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
			<button type="submit" class="form-control btn btn-outline-primary">글올리기</button>
		</div>
		<div class="col-md-6 mb-3">
			<a href="${pageContext.servletContext.contextPath }/dogTraining/gaejalang.do"><button type="button" class="form-control btn btn-outline-primary" >Cancel</button></a>
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