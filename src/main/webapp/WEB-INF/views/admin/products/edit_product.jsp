<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa sản phẩm</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="span9">
				<hr class="soft" />
				<div class="row">
					<div class="span8">
						<div class="well">
							<br />
							<form:form
								action="${pageContext.request.contextPath}/quan-tri/sua-san-pham/${ product.id }"
								method="POST" enctype="multipart/form-data"
								modelAttribute="product">
								<h3>Chỉnh sửa sản phẩm</h3>
								<h3>${ message }</h3>

								<div class="control-group">
									<label class="control-label">Chọn loại sản phẩm:<sup>*</sup></label>
									<div class="controls">
										<form:select path="id_category" items="${categories}"
											itemValue="id" itemLabel="name" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Tên sản phẩm: <sup>*</sup></label>
									<div class="controls">
										<form:input type="text" placeholder=" Nhập tên sản phẩm"
											path="name" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Giá sản phẩm:<sup>*</sup></label>
									<div class="controls">
										<form:input type="number" placeholder="Nhập giá" path="price" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Tựa đề sản phẩm<sup>*</sup></label>
									<div class="controls">
										<form:input type="text" path="title" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Chi tiết sản phẩm<sup>*</sup></label>
									<div class="controls">
										<form:textarea path="detail"></form:textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Chọn ảnh<sup>*</sup></label>
									<div class="controls">
										<input type="file" name="file" />
									</div>
								</div>


								<div class="control-group">
									<div class="controls">
										<input type="submit" name="submitAccount" value="Lưu thay đổi"
											class="shopBtn exclusive">
									</div>
								</div>
							</form:form>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</body>
</html>