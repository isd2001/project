<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<div class="container-fluid">
        <div class="col-lg-12"><!--게시판 넓이 -->
            <div class="col-lg-12">
               </div>
               <div class="row">
               <div class="col-lg-12">
             <div class="panel panel-default">
                <div class="panel-heading">공지사항 </div>
                <div class="panel-body">
                    <form id="boardFrm" name="boardFrm" action="" method="post">
                        <div class="row form-group">
                            <label class="col-lg-2">제목</label>
                            <div class="col-lg-12">
                                <input type="text" class="form-control" id="ntitle" name="ntitle" min="1" max="3">
                             </div>
                        </div>
                           <div class="row form-group">
                           <label class="col-lg-2">내용</label>
                           <div class="col-lg-12">
                               <textarea class="form-control" id="ncontent" name="ncontent"></textarea>
                           </div>
                       </div>
                  </form>
                       <button class="btn btn-outline btn-info" onclick="fn_MoveToUrl('/Nboard/list.do','저장')">저장하기</button>
                          <button class="btn btn-outline btn-primary" onclick="location.href='">리스트</button>
                </div>
            </div>
        </div>
    </div>
</div>
</head>
<body>

</body>
</html>