<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-hover">
	<thead>
	</thead>
	<tbody>
		<tr>

			<th scope="row" style="width: 7%"><small>NO</small></th>
			<td>${read.NO}</td>
		</tr>
		<tr>
			<th scope="row" style="width: 50%"><small>제목</small></th>
			<td>${read.TITLE}</td>
		</tr>
		<tr>
			<th scope="row" style="width: 15%"><small>날짜</small></th>
			<td>${read.UPDAY}</td>
		</tr>
		<tr>
			<th scope="row" style="width: 12%"><small>조회수</small></th>
			<td>${read.LOOKUP}</td>
		</tr>
		<tr>
			<th scope="row" style="width: 4%"><small>ID</small></th>
			<td>${read.DTID}</td>
		</tr>
		<tr>
			<th scope="row" style="width: 12%"> <small>내용</small></th>
			<td>${read.CONTENT}</td>
		</tr>
		<tr>
			<th scope="row" style="width: 12%"> <small>동영상</small></th>
			<td><video src="${read.UPLOAD}" controls="controls"></video></td>
		</tr>
	</tbody>


</table>

<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col" style="text-align: center;">COMMENT</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach var="c" items="${comment }">
    <tr>
      <th scope="row">${c.ID }<small>(${c.UPDAY }) </small><br/>
      <span class="badge badge-pill badge-warning">${c.CONTENT }</span><br/>
      </th>
    </tr>
  	</c:forEach>
    
  </tbody>
</table>
<label for="newReplyText">댓글작성 </label>
<form action="${pageContext.servletContext.contextPath}/dogTraining/detail.do?no=${read.NO}" method="post"> 
<input type="text" class="form-control"
				aria-describedby="basic-addon1" id="content" name="content" autocomplete="off" placeholder="댓글 입력 후 Enter를 눌러주세요.">
</form>


