<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="fixbg-breadcrumb">
		<section class="bread-crumb"
			style="background-image: url(//bizweb.dktcdn.net/100/302/551/themes/758295/assets/breadcrump.jpg?1628876908532);">
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

					<li><strong itemprop="name">Trang khách hàng</strong></li>

				</ul>
			</div>
		</div>
	</div>
	<section class="signup page_customer_account">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-main-acount">
					<div id="parent" class="row">
						<div id="a" class="col-xs-12 col-sm-12 col-lg-9 col-left-account">
							<div class="page-title m992">
								<h1 class="title-head margin-top-0">
									<a href="#">Thông tin tài khoản</a>
								</h1>
							</div>
							<div class="form-signup name-account m992">
								<p>
									<strong>Xin chào, <a href="/account/addresses"
										style="color: #42210b;">${ LoginInfo.lastname }</a>&nbsp;!
									</strong>
								</p>
							</div>
							<div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
								<div class="my-account">
									<div class="dashboard">

										<div class="recent-orders">
											<div class="table-responsive tab-all"
												style="overflow-x: auto;">
												<table class="table table-cart" id="my-orders-table">
													<thead class="thead-default">
														<tr>
															<th>Đơn hàng</th>
															<th>Ngày</th>

															<th>Địa chỉ</th>
															<th>Giá trị đơn hàng</th>
															<th>Tình trạng thanh toán</th>
															<th>Trạng thái</th>
														</tr>
													</thead>

													<tbody>

														<tr>
															<td colspan="6"><p>Không có đơn hàng nào.</p></td>
														</tr>

													</tbody>


												</table>

											</div>

											<div class="text-xs-right"></div>
										</div>
										<div class="paginate-pages pull-right page-account">
											<nav class="clearfix">
												<ul class="pagination clearfix f-right">

													<li class="page-item disabled"><a class="page-link"
														href="#">«</a></li>





													<li class="page-item disabled"><a class="page-link"
														href="#">»</a></li>

												</ul>
											</nav>
										</div>
									</div>

								</div>
							</div>
						</div>
						<div id="b"
							class="col-xs-12 col-sm-12 col-lg-3 col-right-account margin-top-20">
							<div class="page-title mx991">
								<h1 class="title-head">
									<a href="#">Thông tin tài khoản</a>
								</h1>
							</div>
							<div class="form-signup body_right mx991">
								<p>
									<strong>Xin chào, <a href="/account/addresses"
										style="color: #42210b;">${ LoginInfo.lastname }</a>&nbsp;!
									</strong>
								</p>
							</div>
							<div class="block-account">
								<div class="block-title-account">
									<h5>Tài khoản của tôi</h5>
								</div>
								<div class="block-content form-signup">
									<p>
										Tên tài khoản: <strong style="line-height: 20px;"> ${ LoginInfo.lastname }</strong>
									</p>
									<p>
										<i class="fa fa-home font-some" aria-hidden="true"></i> <span>Địa
											chỉ: ${ LoginInfo.address } </span>
									</p>
									<p>
										<i class="fa fa-mobile font-some" aria-hidden="true"></i> <span>Điện
											thoại: </span>
									</p>

									<p>
										<i class="fa fa-yelp font-some" aria-hidden="true"></i> <span>
											Công ty: </span>
									</p>
									<p>
										<i class="fa fa-plane font-some" aria-hidden="true"></i> <span>
											Quốc gia :</span>
									</p>



								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>


</body>
</html>