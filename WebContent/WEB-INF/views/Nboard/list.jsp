<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- el 문 -->
<table class="table table-hover">
  		<thead>
	     <tr>
    	  <th scope="col" style="width: 7%"><small>NO</small></th>
    	  <th scope="col" style="width: 50%"><small>제목</small></th>
     	  <th scope="col" style="width: 15%"><small>날짜</small></th>
     	  <th scope="col" style="width: 12%"><small >추천</small></th>
     	  <th scope="col" style="width: 12%"><small>조회수</small></th>
	     </tr>
  		</thead>
  		<tbody>
     	<c:forEach var="l" items="${list }">
     		<tr>
     			<th scope="row">${l.BOARD_NUM }</th>
     			<td>${l.BOARD_SUBJECT }</td>
     			<td>${l.BOARD_DATE }</td>
     			<td>${l.BOARD_COUNT }</td>
     			<td>${l.BOARD_LOOKUP }</td>
     		</tr>
     	</c:forEach>
    	
  </tbody>
</table>

<!-- <div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-12">게시판 넓이
            <div class="col-lg-12">
            </div>
            <div class="row">
                  <div class="col-lg-12">
                      
                  </div>
              </div>
            <div class="panel panel-default">
                <div class="panel-heading">공지사항 </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>글번호</th>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>작성일</th>	
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            
                        </tbody>
                    </ta	ble>
                    <div>
                    <div id="searchForm">
        <form>
            <select name="opt">
                <option value="0">제목</option>
                <option value="1">내용</option>
                <option value="2">제목+내용</option>
                <option value="3">글쓴이</option>
            </select>
                    <input type="text"  placeholder="검색어 입력">
                    <button>검색</button>
                    </div>
                    </div>
                 <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
				</div>
                </div>
            </div>
        </div>
    </div>
</div> -->
