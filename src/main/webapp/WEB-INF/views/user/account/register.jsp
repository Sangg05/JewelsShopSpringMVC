<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Đăng ký tài khoản</title>
</head>
<body>
	<div class="fixbg-breadcrumb">
		<section class="bread-crumb">
			<div class="container">
				<div class="row">
					<div class="col-xs-12"></div>
				</div>
			</div>
		</section>
	</div>
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

					<li><strong itemprop="name">Đăng ký tài khoản</strong></li>

				</ul>
			</div>
		</div>
	</div>
	<div class="container margin-bottom-20">
		<h1 class="title-head">
			<a href="#">Đăng ký tài khoản</a>
		</h1>
		<div class="row">
			<div class="col-lg-12 ">
				<div class="page-login">
					<div id="login">
						<span>Nếu chưa có tài khoản vui lòng đăng ký tại đây</span>
						<form:form action="${pageContext.request.contextPath}/dang-ky"
							method="POST" modelAttribute="user" enctype="multipart/form-data">
							<div class="form-signup"></div>
							<div class="form-signup clearfix">
								<div class="row">
									<div class="col-md-6">
										<fieldset class="form-group">
											<label> Họ<span class="required">*</span></label>
											<form:input type="text" placeholder="" path="lastname" />
										</fieldset>
									</div>
									<div class="col-md-6">
										<fieldset class="form-group">
											<label>Tên <span class="required">*</span></label>
											<form:input type="text" path="firstname" />
										</fieldset>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<fieldset class="form-group">
											<label>Email <span class="required">*</span></label>
											<form:input type="email"
												pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$"
												class="form-control form-control-lg" value="" name="email"
												id="email" placeholder="" required="" path="email" />
										</fieldset>
									</div>
									<div class="col-md-6">

										<fieldset class="form-group">
											<label>Mật khẩu <span class="required">*</span>
											</label>
											<form:input type="password"
												class="form-control form-control-lg" value=""
												name="password" id="password" placeholder="" required=""
												path="password" />
										</fieldset>
									</div>
								</div>
								<p style="color: red;">${ status }</p>
								<div id="social_login_widget"></div>
								<div class="col-xs-12 text-xs-left"
									style="margin-top: 30px; padding: 0">
									<button type="summit" value="Đăng ký"
										class="btn  btn-style btn-primary">Đăng ký</button>
									<a href="<c:url value='/dang-nhap'/>"
										class="btn-link-style btn-register"
										style="margin-left: 20px; text-decoration: underline;">Đăng
										nhập</a>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>