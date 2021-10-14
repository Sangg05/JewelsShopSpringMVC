<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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

						<form accept-charset="utf-8" action="/account/register"
							id="customer_register" method="post">
							<input name="FormType" type="hidden" value="customer_register" />
							<input name="utf8" type="hidden" value="true" /><input
								type="hidden" id="Token-b0d535ae535c46129f11ed591d45a86f"
								name="Token" />
							<script
								src="https://www.google.com/recaptcha/api.js?render=6Ldtu4IUAAAAAMQzG1gCw3wFlx_GytlZyLrXcsuK"></script>
							<script>
								grecaptcha
										.ready(function() {
											grecaptcha
													.execute(
															"6Ldtu4IUAAAAAMQzG1gCw3wFlx_GytlZyLrXcsuK",
															{
																action : "/account/register"
															})
													.then(
															function(token) {
																document
																		.getElementById("Token-b0d535ae535c46129f11ed591d45a86f").value = token
															});
										});
							</script>
							<div class="form-signup"></div>
							<div class="form-signup clearfix">
								<div class="row">
									<div class="col-md-6">
										<fieldset class="form-group">
											<label> Họ<span class="required">*</span></label> <input
												type="text" class="form-control form-control-lg" value=""
												name="lastName" id="lastName" placeholder="" required>
										</fieldset>
									</div>
									<div class="col-md-6">
										<fieldset class="form-group">
											<label>Tên <span class="required">*</span></label> <input
												type="text" class="form-control form-control-lg" value=""
												name="firstName" id="firstName" placeholder="" required>
										</fieldset>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<fieldset class="form-group">
											<label>Email <span class="required">*</span></label> <input
												type="email"
												pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$"
												class="form-control form-control-lg" value="" name="email"
												id="email" placeholder="" required="">
										</fieldset>
									</div>
									<div class="col-md-6">

										<fieldset class="form-group">
											<label>Mật khẩu <span class="required">*</span>
											</label> <input type="password" class="form-control form-control-lg"
												value="" name="password" id="password" placeholder=""
												required>
										</fieldset>
									</div>
								</div>

								<div id="social_login_widget"></div>
								<div class="col-xs-12 text-xs-left"
									style="margin-top: 30px; padding: 0">
									<button type="summit" value="Đăng ký"
										class="btn  btn-style btn-primary">Đăng ký</button>
									<a href="/account/login" class="btn-link-style btn-register"
										style="margin-left: 20px; text-decoration: underline;">Đăng
										nhập</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>