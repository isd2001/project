<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${not empty find}">
	<div class="alert alert-info" role="alert">찾아주시개 글에서 (검색결과 :
		${fn:length(find)}개)</div>
	<div class="container">
		<div class="row">
			<c:forEach var="e" items="${find}">
				<div class="col-md-4" id="post">
					<div class="card mb-4 shadow-sm"
						style="width: 250px; max-height: 300px">
						<img class="card-img-top"
							src="${pageContext.servletContext.contextPath}${e.PICTURE}"
							width="200" height="225">
						<div class="card-body">
							<p class="card-text">
							<div class="d-flex justify-content-between align-items-center">
								<small class="text-muted"
									style="position: absolute; bottom: 30px">${e.TITLE}</small> <small
									class="text-muted" style="position: absolute; bottom: 10px">${e.NICK}
								</small>
							</div>
							<a
								href="${pageContext.servletContext.contextPath}/find/detail.do?no=${e.NO }">
								<button type="button" class="btn btn-sm btn-outline-secondary"
									style="position: absolute; right: 15px; bottom: 15px"
									id="detailBt" name="detailBt">자세히</button>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</c:if>

<c:if test="${not empty parcel}">
	<div class="alert alert-info" role="alert">키워주시개 글에서 (검색결과 :
		${fn:length(parcel)}개)</div>
	<div class="container">
		<div class="row">
			<c:forEach var="p" items="${parcel}">
				<div class="col-md-4">
					<div class="card mb-4 shadow-sm">
						<img class="card-img-top"
							src="${pageContext.servletContext.contextPath }${p.MAINIMAGE}"
							alt="Card image cap">
						<div class="card-body">
							<c:choose>
								<c:when test="${p.CHOICE == 1 }">
									<p class="card-text">[분양중]</p>
								</c:when>
								<c:otherwise>
									<p class="card-text">[분양완료]</p>
								</c:otherwise>
							</c:choose>
							<p class="card-text">${p.TITLE }</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a
										href="${pageContext.servletContext.contextPath }/detail.do?no=${p.NO }"><button
											type="button" class="btn btn-sm btn-outline-secondary">View</button></a>
								</div>
								<small class="text-muted"><fmt:formatDate
										value="${p.REGDATE }" /></small>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</c:if>

<c:if test="${not empty dogList}">
	<div class="alert alert-info" role="alert">Gaekipedia 글에서 (검색결과 : ${fn:length(dogList)}개)</div>
	<div class="container">
		<div class="row">
			<c:forEach var="list" items="${dogList}">
				<div class="col-sm-3">
					<a href="#"><img
						src="${pageContext.servletContext.contextPath}${list.IMG}"
						width="150" height="150" data-toggle="modal"
						data-target="#exampleModalCenter" data-name="${list.NAME}"
						data-engname="${list.ENGNAME}"
						data-source="${pageContext.servletContext.contextPath}${list.IMG}"
						data-info="${list.INFO }"><br/>
						<span style="text-align: center" data-toggle="modal"data-target="#exampleModalCenter" data-name="${list.NAME}" data-engname="${list.ENGNAME}"
						data-source="${pageContext.servletContext.contextPath}${list.IMG}">${list.NAME}</span></a>
				</div>
			</c:forEach>
		</div>
	</div>
</c:if>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class= "container">
				<div class="row">
					<div class="col">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalCenterTitle"></h5>
							<button type="button" class="close justify-content-end" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="row">
							<div class="col">
								<div class="modal-img"></div>
							</div>
								<div class="col">
									<div class="modal-info">
										<label class="form-control"></label>
									</div>
								</div>
							</div>
						</div>					
					</div>
					<div class="row">
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
					</div>
				</div>
		</div>
	</div>
</div>


<script>	
	
	$('#exampleModalCenter').on('show.bs.modal', function (event) {
	  console.log("original page function");
	  var button = $(event.relatedTarget) ;
	  var targetName = button.data('name');
	  var targetEng = button.data('engname');
	  var targetImg = "<img src=\""+button.data('source')+"\"  width=\"250\" height=\"300\""+">";
	  var targetInfo = button.data('info');
	  var modal = $(this)
	  modal.find('.modal-header label').val(targetName)
	  modal.find('.modal-title').text(targetName+"("+targetEng+")")	  
	  modal.find('.modal-img').html(targetImg)
	  modal.find('.modal-info').text(targetInfo)
	  
	})
</script>