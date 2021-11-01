<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<div class="inner-block">
		<div class="chit-chat-layer1">
			<div class="inbox-details-body">
				<form action="admin/product/insert.htm" class="com-mail"
					methods="POST">

					<label>Tên sản phẩm</label> <input type="text" placeholder="ABC" />

					<label>Giá</label> <input type="number" placeholder="123,000 VNĐ">

					<label>Số lượng</label> <input type="number" placeholder="200" />

					<label>Năm sản xuất</label> <input type="number" placeholder="2010">
					<br> <label>Nguồn gốc</label> <input type="text"
						placeholder="..." /> <label>Hình ảnh</label> <input type="text"
						placeholder="" /> <label>Description</label>
					<textarea rows="6" placeholder="description..."></textarea>

					<label>Giới tính</label>
					<!-- Combo box -->
					<select items="${sexs}" itemValue="id" itemLabel="name"></select> <label>Loại
						sản phẩm</label>
					<!-- Combo box -->
					<select items="${brands}" itemValue="id" itemLabel="name"></select>
					<label>Show room</label>
					<!-- Combo box -->
					<select items="${showroom}" itemValue="id" itemLabel="name"></select>
					<label>Tình trạng</label>
					<!-- Combo box -->
					<select items="${productStatus}" itemValue="id" itemLabel="name"></select>
					<br>
					<button type="submit">Save</button>
				</form>

			</div>


		</div>

	</div>




</body>
</html>