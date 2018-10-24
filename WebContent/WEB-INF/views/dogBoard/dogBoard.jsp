<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<ul class="nav nav-tabs" id="myTab" role="tablist">
	<li class="nav-item"><a class="nav-link active" id="all-tab"
		data-toggle="tab" href="#home" role="tab" aria-controls="all"
		aria-selected="true">전체</a></li>
	<li class="nav-item"><a class="nav-link" id="bigDog-tab"
		data-toggle="tab" href="#bigDog" role="tab" aria-controls="bigDog"
		aria-selected="false">대형견</a></li>
	<li class="nav-item"><a class="nav-link" id="medDog-tab"
		data-toggle="tab" href="#medDog" role="tab" aria-controls="medDog"
		aria-selected="false">중형견</a></li>
	<li class="nav-item"><a class="nav-link" id="smallDog-tab"
		data-toggle="tab" href="#smallDog" role="tab" aria-controls="smallDog"
		aria-selected="false">소형견</a></li>
</ul>
<div class="tab-content" id="myTabContent">
	<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="all-tab">
		<div class="alert-info text-success justify-content-between row"  id="connectList">	
				<c:forEach var="list" items="${allList}" >											
								  <div class="col-sm-3"><input type="checkbox" value="list">${list}</div>
				</c:forEach>
		</div>
	</div>
	<div class="tab-pane fade" id="bigDog" role="tabpanel"	aria-labelledby="bigDog-tab">
		<div class="alert-info text-success justify-content-between row"  id="connectList">	
				<c:forEach var="list" items="${bigDogList}" >											
								  <div class="col-sm-3"><input type="checkbox" value="list">${list}</div>
				</c:forEach>
		</div>
	</div>
	<div class="tab-pane fade" id="medDog" role="tabpanel"	aria-labelledby="medDog-tab">
		<div class="alert-info text-success justify-content-between row"  id="connectList">	
				<c:forEach var="list" items="${medDogList}" >											
								  <div class="col-sm-3"><input type="checkbox" value="list">${list}</div>
				</c:forEach>
		</div>
	</div>
	<div class="tab-pane fade" id="smallDog" role="tabpanel" aria-labelledby="smallDog-tab">
		<div class="alert-info text-success justify-content-between row"  id="connectList">	
				<c:forEach var="list" items="${smallDogList}" >											
								  <div class="col-sm-3"><input type="checkbox" value="list">${list}</div>
				</c:forEach>
		</div>
	</div>
</div>

<hr/>



					
<div class = "dogList">
	<img src="${pageContext.servletContext.contextPath}/image/afghanHound.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/alaskanMalamute.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/bloodHound.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/borzoi.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/boxer.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/collie.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/dalmatian.png" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/dal.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/dogueDeBordeaux.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/germanShepherd.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/goldenRetriever.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/greatDane.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/greyHound.png" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/ibizanHound.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/kuvasz.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/portugueseWaterDog.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/siberianHusky.jpg" width="150" height="150">
	<img src="${pageContext.servletContext.contextPath}/image/weimaraner.jpg" width="150" height="150">	
</div>




