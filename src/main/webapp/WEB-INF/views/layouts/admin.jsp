<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Trang quản trị viên</title>
</head>
<body>
	<div class="page-container">
		<div class="left-content">
			<%@include file="/WEB-INF/views/layouts/admin/header.jsp"%>

			<decorator:body></decorator:body>

			<%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
		</div>
		<%@include file="/WEB-INF/views/layouts/admin/navigation.jsp"%>
	</div>
</body>
</html>