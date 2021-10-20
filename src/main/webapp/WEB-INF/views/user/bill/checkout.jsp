<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container edit-brc">
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb" itemscope
					itemtype="http://schema.org/BreadcrumbList">
					<li class="home" itemprop="itemListElement" itemscope
						itemtype="http://schema.org/ListItem"><a itemprop="url"
						itemprop="item" href="/"><span itemprop="name"><i
								class="fa fa-home"></i> Trang chủ</span>
							<meta itemprop="position" content="1" /></a> <span>/</span></li>

					<li><strong itemprop="name">Trang khách hàng</strong></li>

				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="span9">
				<h3>Người dùng</h3>
				<hr class="soft" />
				<div class="row">
					<div class="span8">
						<div class="well">
							<br />
							<form:form action="checkout" method="POST" modelAttribute="bill">
								<h3>Thanh toán đơn hàng</h3>
								<div class="control-group">
									<label class="control-label">Họ & tên <sup>*</sup></label>
									<div class="controls">
										<form:input type="text" placeholder=" Nhập họ và tên"
											path="display_name" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Email<sup>*</sup></label>
									<div class="controls">
										<form:input type="email" placeholder="Nhập email" path="email" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Số điện thoại<sup>*</sup></label>
									<div class="controls">
										<form:input type="number" placeholder="+84" path="phone" />
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Địa chỉ<sup>*</sup></label>
									<div class="controls">
										<form:textarea path="address"></form:textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Ghi chú<sup></sup></label>
									<div class="controls">
										<form:textarea path="note"></form:textarea>
									</div>
								</div>
								<div class="control-group">
									<div class="controls">
										<input type="submit" name="submitAccount" value="Thanh toán"
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