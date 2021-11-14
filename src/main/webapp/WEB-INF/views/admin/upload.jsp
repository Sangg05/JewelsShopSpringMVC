<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/upload"
		enctype="multipart/form-data" method="post">
		<input type="file" name="file" /> <input type="submit"
			value="Upload file">
	</form>
	<h1>${ image }</h1>
	<h1>${ message }</h1>
	<img alt="" src=<c:url value="${ image }"/>>
</body>
</html>