<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
 <div class="text-center" style="margin-right: 20rem;  margin-left: 20rem; margin-top: 10rem;">
    <form class="form-signin" action="${pageContext.servletContext.contextPath }/main/login.do" method="post">
      <img class="mb-4" src="${pageContext.servletContext.contextPath }/image/dal.jpg" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">비밀번호 찾기</h1>
     	 
      <label for="inputEmail" class="sr-only">아이디를 입력해 주세요</label>
      <input type="text" id="id" name = "id" class="form-control" placeholder="아이디" required autofocus autocomplete="off" onchange ="getProfile(this);">        
      
      
      <div id="identify">	</div>
      
      <div style="margin-top : 1rem;">
      <a href="${pageContext.servletContext.contextPath }/main/findId.do">아이디 찾기</a>/ <a href="${pageContext.servletContext.contextPath }/main/findPassWord.do">비밀번호 찾기</a>
      </div>
    </form>
  </div>
  
  <script>
  var getProfile = function(){
	  var id = document.getElementById("id").value;
	  var url = "/gaenolja/main/getUserProfile.do";
	  var param = {
					"id"  : id					
				  };	
			
			$.get(url, param, function(rst) {					 
				//document.getElementById("content").innerHTML = "";
				
				
				console.log(rst);
				
				var html = "";
				for (var i = 0; i <rst.length; i++) {
					var talker = rst[i].TALKER;
					var content = rst[i].CONTENT;
					var picture = "${pageContext.servletContext.contextPath}" + rst[i].PICTURE;
					var address = rst[i].ADDRESS;
					var date = rst[i].WRITEDATE;
									
						html +=  "<div class=\"card\" id=\"form\">";
						html += "<div class=\"card-header d-flex bd-highlight\"><div class=\"flex-grow-1\">"+talker+"'s comment</div>";
						html += "<div class=\"bd-highlight\"><small id=\"date\" class=\"d-flex justify-content-end\">";
						html += date+"</small></div></div>";	
						html += " <div class=\"card-body\">";
						html += "<blockquote class=\"blockquote mb-0\">";
						html += "<div class=\"row align-items-center\">";
						html += "<img src=\""+picture+"\" style=\"width: 80px; height: 80px;\"class=\"rounded-circle\" id =\"image\">";
						html += " <p>"+content+"</p></div>";
						html += "<footer class=\"blockquote-footer d-flex justify-content-end \"><span id=\"address\">";
						html += "<cite title=\"Source Title\">"+address+"..</span></cite></footer>";
						html += "</blockquote>";
						html += "</div>";
						html += "</div>";			
						
						
				}
			
				document.getElementById("list").innerHTML = html;
				document.getElementById("content").value ="";
		});			
		
  }
  </script>