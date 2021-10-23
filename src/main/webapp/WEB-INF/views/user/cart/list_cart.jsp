<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<title>Danh sách giỏ hàng</title>
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
					<li><a itemprop="url" href="/new-collection"><span
							itemprop="name">Giỏ hàng</span></a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="container edit-brc">


		<div class="row ">
			<div class="span12">

				<div class="well well-small">
					<h1>
						Giỏ hàng <small class="pull-right"> ${ TotalQuantyCart }
							Sản phẩm trong giỏ hàng </small>
					</h1>
					<hr class="soften" />

					<table class="table table-bordered table-condensed">
						<thead>
							<tr>
								<th>Hình ảnh</th>
								<th>Mô tả</th>
								<th>Giá bán</th>
								<th>Số lượng</th>
								<th>Lưu chỉnh sửa</th>
								<th>Xóa</th>
								<th>Tổng tiền</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${ Cart }">
								
								<tr>

									<td><img width="200"
										src="<c:url value="/assets/user/images/product/${ item.value.product.image }"/>"
										alt=""></td>
									<td>${ item.value.product.name }</td>

									<td><fmt:formatNumber type="number" groupingUsed="true"
											value="${ item.value.product.price }" /> ₫</td>
									<td><input type="number" min="0" max="1000" 
										style="max-width: 100px" placeholder="1"
										id="quanty-cart-${ item.key }" size="16" type="text"
										value="${ item.value.quanty }"></td>
									<td><button data-id="${ item.key }"
											class="btn btn-mini btn-primary edit-cart" type="button">
											<i class="fa fa-edit"></i>
										</button></td>
									<td><a href="<c:url value="/DeleteCart/${ item.key }"/>"
										class="btn btn-mini btn-primary" type="button"> <i
											class="fa fa-trash"></i>
									</a></td>
									<td><fmt:formatNumber type="number" groupingUsed="true"
											value="${ item.value.totalPrice }" /> ₫</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<h1>${ message }</h1>
					<br /> <a href=<c:url value="/trang-chu"/> class="shopBtn btn-large"><span
						class="icon-arrow-left"></span> Tiếp tục mua sắm </a> <a
						href="checkout" class="shopBtn btn-large pull-right">Thanh
						toán <span class="icon-arrow-right"></span>
					</a>

				</div>
			</div>
		</div>
	</div>

	<content tag="script"> <script>
		$(".edit-cart").on("click", function() {
			var id = $(this).data("id");
			var quanty = $("#quanty-cart-" + id).val();
			window.location = "EditCart/" + id + "/" + quanty;
		})
	</script> </content>

</body>
</html>