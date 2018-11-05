<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<body>



<table>
	<div class="container-fluid">
		<div class="col-lg-12">
			<!--게시판 넓이 -->
			<div class="col-lg-12"></div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							ㅇㅇ
							<div class="panel-body">
								<form action="${pageContext.servletContext.contextPath}/dogTraining/write.do" method="post">
									<div class="row form-group">
										<label class="col-lg-2">제목</label>
										<div class="col-lg-12">
											<input type="text" class="form-control" id="SUB" name="SUB">
										</div>
									</div>
									</div>
		<div class="col-md-6 mb-3">
			<label for="lastName">메인이미지</label>
			<input type="file" class="form-control" id="mainimage" name="mainimage">
		</div>
									<div class="row form-group">
										<label class="col-lg-2">내용</label>
										<div class="col-lg-12">
											<textarea class="form-control" id="CON" name="CON"></textarea>
										</div>
									</div>

									<button type="submit">완료</button>
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