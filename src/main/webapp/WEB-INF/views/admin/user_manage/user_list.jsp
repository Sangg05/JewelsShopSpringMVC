<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách người dùng</title>
</head>
<body>
	<div class="inner-block">
		<div class="inbox">

			<section class="signup page_customer_account">

				<div class="container">
					<div class="row">
						<h2>Quản lí tài khoản người dùng</h2>
						<div class="col-xs-12 col-sm-12 col-md-12 col-main-acount">
							<div id="parent" class="row">
								<div id="a"
									class="col-xs-12 col-sm-12 col-lg-9 col-left-account">
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
														<c:if test="${ empty users }">
															<tr>
																<td colspan="6"><p>Không người dùng nào.</p></td>
															</tr>
														</c:if>


														<table class="table table-cart" id="my-orders-table">
															<thead class="thead-default">
																<tr>
																	<th>STT</th>
																	<th>ID</th>
																	<th>Họ</th>
																	<th>Tên</th>
																	<th>Email</th>
																	<th>Vai trò</th>
																	<th>Số đơn hàng</th>
																	<th>Trạng thái</th>
																</tr>
															</thead>

															<tbody>

																<c:forEach var="item" items="${ users }"
																	varStatus="loop">

																	<c:if test="${ not empty LoginInfo }">
																		<tr>
																			<th>${ loop.index + 1 }</th>
																			<th>${ item.id }</th>
																			<th>${ item.lastname }</th>
																			<th>${ item.firstname }</th>
																			<th><a
																				href=<c:url value="/quan-tri/hop-thu/${ item.email }"/>>${ item.email }</a>
																			</th>
																			<th><c:if test="${ item.role == 1 }">Người dùng</c:if>
																				<c:if test="${ item.role == 0 }">Quản trị viên</c:if>
																			</th>
																			<th>${ countBills[loop.index] }đơnhàng</th>

																			<th><a
																				href="<c:url value="/ChangeStatusUser/${item.id}/${item.active}"/>"
																				class="btn btn-mini btn-primary" type="button">
																					<c:if test="${ item.active == 1 }">Đang hoạt động</c:if>
																					<c:if test="${ item.active == 0 }">Vô hiệu hóa</c:if>
																			</a></th>

																		</tr>
																	</c:if>
																</c:forEach>

															</tbody>
														</table>

														<hr>


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
												Tên tài khoản: <strong style="line-height: 20px;">
													${ LoginInfo.lastname }</strong>
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
			<div class="clearfix"></div>
		</div>
	</div>

</body>
</html>
