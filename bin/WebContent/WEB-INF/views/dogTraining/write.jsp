<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<body>



<table>
	<div class="container-fluid">
		<div class="col-lg-12">
			<!--�Խ��� ���� -->
			<div class="col-lg-12"></div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							
							<div class="panel-body">
								<form action="${pageContext.servletContext.contextPath}/dogTraining/write.do" method="post">
									<div class="row form-group">
										<label class="col-lg-2">����</label>
										<div class="col-lg-12">
											<input type="text" class="form-control" id="SUB" name="SUB">
										</div>
									</div>
									</div>
									<form id="fileForm" action="fileUpload" method="post"
        enctype="multipart/form-data">
        <input type="file" id="fileUp" name="fileUp"/><br/><br/>
          
        ���̵� : <input type="text" name="id" />
        ��й�ȣ : <input type="password" name="pw" /><br/><br/>
        <input type="button" value="�����ϱ�" onClick="fileSubmit();">
    </form>
 
<script>
    function fileSubmit() {
        var formData = new FormData($("#fileForm")[0]);
        $.ajax({
            type : 'post',
            url : 'fileUpload',
            data : formData,
            processData : false,
            contentType : false,
            success : function(html) {
                alert("���� ���ε��Ͽ����ϴ�.");
            },
            error : function(error) {
                alert("���� ���ε忡 �����Ͽ����ϴ�.");
                console.log(error);
                console.log(error.status);
            }
        });
    }
</script>				
											                            
									<div class="row form-group">
										<label class="col-lg-2">����</label>
										<div class="col-lg-12">
											<textarea class="form-control" id="CON" name="CON"></textarea>
										</div>
									</div>

									<button type="submit">�۾���</button>
									</form>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</table>

</head>

</body>
</html>