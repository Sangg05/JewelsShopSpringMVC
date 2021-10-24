<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Đăng nhập tài khoản</title>
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

					<li><strong itemprop="name">Đăng nhập tài khoản</strong></li>

				</ul>
			</div>
		</div>
	</div>

	<div class="container margin-bottom-20">
		<h1 class="title-head">
			<span>Đăng nhập tài khoản</span>
		</h1>
		
		<div class="row">
			<div class="col-lg-6">
				<div class="page-login margin-bottom-30">
					<div id="login">
						<span> Nếu bạn đã có tài khoản, đăng nhập tại đây. </span>
						<form:form action="dang-nhap" method="post" modelAttribute="user">
							<input name="FormType" type="hidden" value="customer_login" />
							<input name="utf8" type="hidden" value="true" />
							<div class="form-signup"></div>
							<div class="form-signup clearfix">
								<fieldset class="form-group">
									<label>Email <span class="required">*</span></label>
									<form:input type="email"
										pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$"
										class="form-control form-control-lg" value="" name="email"
										id="email" placeholder="" required="" path="email" />
								</fieldset>
								<fieldset class="form-group">
									<label>Mật khẩu <span class="required">*</span>
									</label>
									<form:input type="password"
										class="form-control form-control-lg" value="" name="password"
										id="password" placeholder="" required="" path="password" />
								</fieldset>

								<div id="social_login_widget"></div>

								<div class="pull-xs-left" style="margin-top: 25px;">
									<input class="btn btn-style btn-primary" type="submit"
										value="Đăng nhập" /> <a href="<c:url value='/dang-ky'/>"
										class="btn-link-style btn-register"
										style="margin-left: 20px; text-decoration: underline;">Đăng
										ký</a>
								</div>
							</div>
							<input name="returnUrl" type="hidden"
								value="https://katjewelry.vn/r-midi-triple-gem" />
						</form:form>
					</div>


				</div>
			</div>
			<div class="col-lg-6">

				<div id="recover-password" class="form-signup">
					<span> Bạn quên mật khẩu? Nhập địa chỉ email để lấy lại mật
						khẩu qua email. </span>
					<form accept-charset="utf-8" action="/account/recover"
						id="recover_customer_password" method="post">
						<input name="FormType" type="hidden"
							value="recover_customer_password" /> <input name="utf8"
							type="hidden" value="true" />
						<div class="form-signup aaaaaaaa"></div>
						<div class="form-signup clearfix">
							<fieldset class="form-group">
								<label>Email <span class="required">*</span></label> <input
									type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$"
									class="form-control form-control-lg" value="" name="Email"
									id="recover-email" placeholder="Email" Required>
							</fieldset>
						</div>
						<div class="action_bottom">
							<input class="btn btn-style btn-primary"
								style="margin-top: 25px;" type="submit" value="Lấy lại mật khẩu" />

						</div>
						<input name="returnUrl" type="hidden"
							value="https://katjewelry.vn/r-midi-triple-gem" />
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>