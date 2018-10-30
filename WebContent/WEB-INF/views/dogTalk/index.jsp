<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h2>강아지 수다공간</h2>

     
   <form>
     <div class="input-group">
	  <div class="input-group-prepend">
	     <img src="${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE}" style="width: 80px; height: 80px;"class="rounded-circle">
	  </div>
	  <textarea class="form-control" aria-label="With textarea" placeholder="댕댕이가 하고싶은말을 써주세요!"></textarea>
	  <button type="submit" class="btn btn-secondary btn-med ">왈왈!</button>
	</div>
	</form>
	
	<hr/>
	
	<div class="card">
  		<div class="card-header">
	    Today's comment
	  </div>
	  <div class="card-body">
	    <blockquote class="blockquote mb-0">
	      <div class="row align-items-center">
	      <img src="${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE}" style="width: 80px; height: 80px;"class="rounded-circle">
		  
	      <p>아 산책가서 개처럼 뛰어놀고 싶다....</p></div>
	      <footer class="blockquote-footer d-flex justify-content-end ">서울시 강서구에서 <cite title="Source Title">개달이가...</cite></footer>
	   
	    </blockquote>
	  </div>
	</div>
	
	<div class="card">
  		<div class="card-header">
	    Today's comment
	  </div>
	  <div class="card-body">
	    <blockquote class="blockquote mb-0">
	      <div class="row align-items-center">
	      <img src="${pageContext.servletContext.contextPath }${userInfo.DOGPROFILE}" style="width: 80px; height: 80px;"class="rounded-circle">
		  
	      <p>아 까까나 개같이 먹고싶다....하...사료 그만좀 먹고싶다</p>
	     </div>
	     <footer class="blockquote-footer d-flex justify-content-end align-items-center ">서울시 강남구에서 <cite title="Source Title">먼지가...</cite></footer>
	      
	    </blockquote>
	  </div>
	</div>