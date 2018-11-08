<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<table class="table table-hover">

  		<thead>
  		</thead>
  		<tbody>
	     <tr>
	     
    	 
    	  <tr>
    	  <th scope="row" style="width: 50%"><small>제목</small></th>
    	   <td>${read.BOARD_SUBJECT}</td>
    	   </tr>
    	   <tr>
    	  <th scope="row" style="width: 7%"><small>ID</small></th>
    	   <td>${read.BOARD_ID}</td>
    	   </tr>
    	   <tr>
     	  <th scope="row" style="width: 15%"><small>날짜</small></th>
     	    <td>${read.BOARD_DATE}</td>
     	    </tr>
     	    <tr>
     	  <th scope="row" style="width: 12%"><small>조회수</small></th>
     	    <td>${read.BOARD_LOOKUP}</td>
	      </tr>
	      <th scope="row" style="width: 12%"><small>내용</small></th>
	      <td>${read.BOARD_CONTENT}</td>
	      </tbody>
  		
  
     	
</table>
     	<div style="text-align: right">
     <a href="${pageContext.servletContext.contextPath }/Nboard/list.do" class="btn btn-primary">목록으로</a>
      
       <c:if test="${sessionScope.userInfo.ID eq 'admin' }">
         <button type="button" class="btn btn-primary" id="endbtn">글 삭제</button>
         <script>
			$("#endbtn").on("click",function(){
			var end=window.confirm("정말 삭제 하시겠습니까??");
			if (end==true) {
				window.location.href="${pageContext.servletContext.contextPath}/Nboard/delete.do?no=${read.BOARD_NUM}";				
				};
			});
	</script>
       </c:if>
     </div>
     	
    </html>



