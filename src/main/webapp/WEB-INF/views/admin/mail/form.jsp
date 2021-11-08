<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gửi mail</title>

</head>
<body>

	<div class="container margin-bottom-20">
		<h1 class="title-head">
			<span> Gửi mail ${ toUser }</span> 
		</h1>
		<div class="row">
			<div class="col-lg-6">
				<div class="page-login margin-bottom-30">
					<div id="login">

						<form action="send" method="post">
							<input name="FormType" type="hidden" value="customer_login" /> <input
								name="utf8" type="hidden" value="true" />
							<div class="form-signup"></div>
							<div class="form-signup clearfix">
								<!-- <fieldset class="form-group">
									<label>Từ: <span class="required">*</span></label> <input
										type="text" class="form-control form-control-lg" name="from"
										placeholder="From" />
								</fieldset> -->
								<fieldset class="form-group">
									<label>Đến: <span class="required">*</span></label> <input
										type="text" class="form-control form-control-lg" name="to"
										placeholder="To"
										value='<c:if test="${ not empty toUser }">${ toUser }</c:if>' />
								</fieldset>
								<fieldset class="form-group">
									<label>Chủ đề: <span class="required">*</span>
									</label> <input type="text" class="form-control form-control-lg"
										name="subject" placeholder="Chủ đề" />
								</fieldset>
								<fieldset class="form-group">
									<label>Nội dung: <span class="required">*</span>
									</label>
									<textarea name="body" placeholder="Nội dung" rows="3"
										class="form-control form-control-lg"></textarea>
								</fieldset>
								<br> <span class="required">${message}</span><br> 
								<input
									class="btn btn-style btn-primary" type="submit"
									value="Gửi mail" />
							</div>
							<input name="returnUrl" type="hidden"
								value="https://katjewelry.vn/r-midi-triple-gem" />
						</form>
					</div>


				</div>
			</div>
		</div>
	</div>


</body>
</html>