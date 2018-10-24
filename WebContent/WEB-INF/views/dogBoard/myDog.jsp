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

 <div class="album py-5 bg-light">
        <div class="container">

          <div class="row">
            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                <img class="card-img-top" src="${pageContext.servletContext.contextPath}/image/dal.jpg" width="400" height="300" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">
                  	요크셔테리어 !					
                  </p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary">상세정보</button>                  
                    </div>
                    <small class="text-muted">9 mins</small>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                    </div>
                    <small class="text-muted">9 mins</small>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                    </div>
                    <small class="text-muted">9 mins</small>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                    </div>
                    <small class="text-muted">9 mins</small>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                    </div>
                    <small class="text-muted">9 mins</small>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
                <div class="card-body">
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                    </div>
                    <small class="text-muted">9 mins</small>
                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                
              </div>
            </div>
            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
                
              </div>
            </div>
            <div class="col-md-4">
              <div class="card mb-4 shadow-sm">
               
              </div>
            </div>
          </div>
        </div>
      </div>