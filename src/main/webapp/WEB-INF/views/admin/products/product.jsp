<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<section class="bread-crumb"
		style="background-image: url(//bizweb.dktcdn.net/100/302/551/themes/758295/assets/breadcrump.jpg?1628876908532);">
		<div class="container">
			<div class="row">
				<div class="col-xs-12"></div>
			</div>
		</div>
	</section>
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
							itemprop="name">${product.id}</span></a> <span>/</span></li>

					<li><strong><span itemprop="name">${product.name}</span></strong>
					<li>
				</ul>
			</div>
		</div>
	</div>

	<section class="product">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 details-product">
					<div class="row">
						<div
							class="col-xs-12 col-sm-12 col-md-6 col-lg-6 relative product-image-block ">
							<div class="large-image">

								<a
									href="//bizweb.dktcdn.net/thumb/1024x1024/100/302/551/products/sapo-cropped-dsc5458-1-copy.jpg?v=1599343011997"
									data-rel="prettyPhoto[product-gallery]"> <img id="zoom_01"
									src="<c:url value='/assets/user/images/product/${product.image}'/>"
									alt="R MIDI TRIPLE GEM" class="img-responsive center-block" />
								</a>
								<div class="hidden">

									<div class="item">
										<a
											href="https://bizweb.dktcdn.net/100/302/551/products/sapo-cropped-dsc5458-1-copy.jpg?v=1599343011997"
											data-image="https://bizweb.dktcdn.net/100/302/551/products/sapo-cropped-dsc5458-1-copy.jpg?v=1599343011997"
											data-zoom-image="https://bizweb.dktcdn.net/100/302/551/products/sapo-cropped-dsc5458-1-copy.jpg?v=1599343011997"
											data-rel="prettyPhoto[product-gallery]"> </a>
									</div>




									<div class="item">
										<a
											href="https://bizweb.dktcdn.net/100/302/551/products/sapo-cropped-dsc5459-1-copy.jpg?v=1599343014613"
											data-image="https://bizweb.dktcdn.net/100/302/551/products/sapo-cropped-dsc5459-1-copy.jpg?v=1599343014613"
											data-zoom-image="https://bizweb.dktcdn.net/100/302/551/products/sapo-cropped-dsc5459-1-copy.jpg?v=1599343014613"
											data-rel="prettyPhoto[product-gallery]"> </a>
									</div>

								</div>
							</div>

							<div id="gallery_01" class="swiper-container more-views"
								data-margin="10" data-items="5" data-direction="vertical">
								<div class="swiper-wrapper">

									<div class="swiper-slide">
										<a
											href="//bizweb.dktcdn.net/thumb/1024x1024/100/302/551/products/sapo-cropped-dsc5458-1-copy.jpg?v=1599343011997"
											class="thumb-link" title=""
											rel="//bizweb.dktcdn.net/thumb/1024x1024/100/302/551/products/sapo-cropped-dsc5458-1-copy.jpg?v=1599343011997">
											<img
											src="<c:url value='/assets/user/images/product/${product.image}'/>"
											alt="R MIDI TRIPLE GEM">
										</a>
									</div>

									<div class="swiper-slide">
										<a
											href="//bizweb.dktcdn.net/thumb/1024x1024/100/302/551/products/sapo-cropped-dsc5459-1-copy.jpg?v=1599343014613"
											class="thumb-link" title=""
											rel="//bizweb.dktcdn.net/thumb/1024x1024/100/302/551/products/sapo-cropped-dsc5459-1-copy.jpg?v=1599343014613">
											<img
											src="//bizweb.dktcdn.net/thumb/compact/100/302/551/products/sapo-cropped-dsc5459-1-copy.jpg?v=1599343014613"
											alt="R MIDI TRIPLE GEM">
										</a>
									</div>

								</div>

							</div>




						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 details-pro">
							<h1 class="title-head">${product.name}</h1>
							<div class="detail-header-info">
								Tình trạng: <a href="https://m.me/katjewelry" target="_blank"
									title="Liên hệ FB"><span class="inventory_quantity">Liên
										hệ Facebook để check số lượng</span></a> <span class="line">|</span> Mã
								SP: <span class="masp"> ${product.id} </span>
							</div>


							<div class="product_description margin-bottom-20">
								<div class="rte description rte-summary">

									<p>${product.title}</p>


								</div>
							</div>


							<div class="price-box">

								<div class="special-price">
									<span class="price product-price">Giá: ${product.price} ₫</span>
								</div>
								<!-- Giá -->


							</div>

							<div class="form-product">
								<form enctype="multipart/form-data" id="add-to-cart-form"
									action="<c:url value="/AddCart/${ product.id }"/>" method="get"
									class="form-inline margin-bottom-10">

									<div class="box-variant clearfix ">


										<input type="hidden" name="variantId" value="44240150" />


									</div>
									<div class="form-group form-groupx form-detail-action ">
										
										<button type="submit" class="shopBtn">
											<div
												style="text-align: center; border-style: solid; border-width: 10px; border-color: #2e1c11; background-color: #2e1c11;">
												<span style="color: #ffffff; font-size: 15px">Chỉnh
													sửa thông tin sản phẩm</span>
											</div>
										</button>
										<div class="abps-productdetail ab-hide"
											ab-data-productid="18810429"></div>

									</div>

									<br /> 

								</form>
								<div class="md-discount-box-inform" id="md-discount-box-inform"></div>

								<div class="social-sharing">
									<div class="row">
										<div class="col-sm-5"></div>

									</div>
								</div>


							</div>

						</div>
					</div>
				</div>
				<div class="col-xs-12">
					<div class="row margin-top-30 xs-margin-top-15">

						<div class="col-xs-12">
							<ul class="accordion nav nav-inline nav-tab-detailspro clearfix">

								<li class="nav-item active"><a class="nav-link "
									data-toggle="tab" href="javascript:;" role="tab">Our story
										- Chuyện chưa kể<span class="caret hidden"><i
											class="fa fa-plus-square"></i></span>
								</a>
									<div class="tab-pane fade in active" id="home" role="tabpanel">
										<div class="rte">
											<p>${product.detail}</p>
											<p>&nbsp;</p>
										</div>
									</div></li>



							</ul>
						</div>


					</div>







					<div class="section section-service margin-bottom-40">
						<div class="">
							<div class="section-title a-center">
								<h2 class="inline-block">
									<a href="new-collection">Sản phẩm liên quan</a>
								</h2>
							</div>
							<div class="section-content">
								<div
									class="bababa products products-view-grid owl-carousel owl-theme"
									data-lg-items="3" data-md-items="3" data-sm-items="3"
									data-xs-items="2" data-margin="15" data-nav="true">


















									<div class="product-box product-box-2">
										<div class="product-thumbnail relative">


											<div class="product-image-flip">
												<a class="db" href="/e-stud-big-circle-multi-drop-ball"
													title="E STUD BIG CIRCLE MULTI DROP BALL"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc5945-1.jpg?v=1599303857000"
													alt="E STUD BIG CIRCLE MULTI DROP BALL"
													class="img-responsive center-block" />


												</a> <a class="db pa back oh"
													href="/e-stud-big-circle-multi-drop-ball"
													title="E STUD BIG CIRCLE MULTI DROP BALL"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc5947-1.jpg?v=1599303859000"
													alt="E STUD BIG CIRCLE MULTI DROP BALL"
													class="img-responsive center-block" />


												</a>

												<div class="htheme_product_overlay_fade"></div>
											</div>
											<div class="product-action clearfix">
												<form action="/cart/add" method="post"
													class="variants form-nut-grid"
													data-id="product-actions-18810516"
													enctype="multipart/form-data">

													<div>

														<a data-toggle="tooltip" title="Yêu thích"
															class="btn btn-circle iWishAdd iwishAddWrapper"
															href="javascript:;" data-customer-id="0"
															data-product="18810516" data-variant="44240090"><i
															class="fa fa-heart"></i></a> <a data-toggle="tooltip"
															title="Bỏ yêu thích"
															class="btn btn-circle iWishAdded iwishAddWrapper iWishHidden"
															href="javascript:;" data-customer-id="0"
															data-product="18810516" data-variant="44240090"><i
															class="fa fa-heart"></i></a>


														<button class="btn btn-circle left-to "
															data-toggle="tooltip" title="Hết hàng" disabled>
															<i class="fa fa-shopping-basket"></i>
														</button>


														<a data-toggle="tooltip" title="Xem nhanh"
															href="/e-stud-big-circle-multi-drop-ball"
															data-handle="e-stud-big-circle-multi-drop-ball"
															class="btn-circle btn_view btn  right-to quick-view">
															<i class="fa fa-search-plus"></i>
														</a>

													</div>
												</form>
											</div>
										</div>





										<div class="product-info a-center">
											<h3 class="product-name">
												<a href="/e-stud-big-circle-multi-drop-ball"
													title="E STUD BIG CIRCLE MULTI DROP BALL">E STUD BIG
													CIRCLE MULTI DROP BALL</a>
											</h3>



											<div class="price-box clearfix">
												<div class="special-price">
													<span class="price product-price">290.000₫</span>
												</div>
											</div>


										</div>
									</div>



















									<div class="product-box product-box-2">
										<div class="product-thumbnail relative">


											<div class="product-image-flip">
												<a class="db" href="/b-love-your-more-sleek"
													title="B LOVE YOUR MORE SLEEK"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc6038-1.jpg?v=1599504233000"
													alt="B LOVE YOUR MORE SLEEK"
													class="img-responsive center-block" />


												</a> <a class="db pa back oh" href="/b-love-your-more-sleek"
													title="B LOVE YOUR MORE SLEEK"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc6039-1.jpg?v=1599504235000"
													alt="B LOVE YOUR MORE SLEEK"
													class="img-responsive center-block" />


												</a>

												<div class="htheme_product_overlay_fade"></div>
											</div>
											<div class="product-action clearfix">
												<form action="/cart/add" method="post"
													class="variants form-nut-grid"
													data-id="product-actions-18810515"
													enctype="multipart/form-data">

													<div>

														<a data-toggle="tooltip" title="Yêu thích"
															class="btn btn-circle iWishAdd iwishAddWrapper"
															href="javascript:;" data-customer-id="0"
															data-product="18810515" data-variant="44240091"><i
															class="fa fa-heart"></i></a> <a data-toggle="tooltip"
															title="Bỏ yêu thích"
															class="btn btn-circle iWishAdded iwishAddWrapper iWishHidden"
															href="javascript:;" data-customer-id="0"
															data-product="18810515" data-variant="44240091"><i
															class="fa fa-heart"></i></a>


														<button class="btn btn-circle left-to "
															data-toggle="tooltip" title="Hết hàng" disabled>
															<i class="fa fa-shopping-basket"></i>
														</button>


														<a data-toggle="tooltip" title="Xem nhanh"
															href="/b-love-your-more-sleek"
															data-handle="b-love-your-more-sleek"
															class="btn-circle btn_view btn  right-to quick-view">
															<i class="fa fa-search-plus"></i>
														</a>

													</div>
												</form>
											</div>
										</div>





										<div class="product-info a-center">
											<h3 class="product-name">
												<a href="/b-love-your-more-sleek"
													title="B LOVE YOUR MORE SLEEK">B LOVE YOUR MORE SLEEK</a>
											</h3>



											<div class="price-box clearfix">
												<div class="special-price">
													<span class="price product-price">690.000₫</span>
												</div>
											</div>


										</div>
									</div>



















									<div class="product-box product-box-2">
										<div class="product-thumbnail relative">


											<div class="product-image-flip">
												<a class="db" href="/e-stud-circle-ball-drop-multi-chain"
													title="E STUD CIRCLE BALL DROP MULTI CHAIN"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc7090-1-copy.jpg?v=1599306589000"
													alt="E STUD CIRCLE BALL DROP MULTI CHAIN"
													class="img-responsive center-block" />


												</a> <a class="db pa back oh"
													href="/e-stud-circle-ball-drop-multi-chain"
													title="E STUD CIRCLE BALL DROP MULTI CHAIN"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc7091-1-copy.jpg?v=1599306591000"
													alt="E STUD CIRCLE BALL DROP MULTI CHAIN"
													class="img-responsive center-block" />


												</a>

												<div class="htheme_product_overlay_fade"></div>
											</div>
											<div class="product-action clearfix">
												<form action="/cart/add" method="post"
													class="variants form-nut-grid"
													data-id="product-actions-18810512"
													enctype="multipart/form-data">

													<div>

														<a data-toggle="tooltip" title="Yêu thích"
															class="btn btn-circle iWishAdd iwishAddWrapper"
															href="javascript:;" data-customer-id="0"
															data-product="18810512" data-variant="44240094"><i
															class="fa fa-heart"></i></a> <a data-toggle="tooltip"
															title="Bỏ yêu thích"
															class="btn btn-circle iWishAdded iwishAddWrapper iWishHidden"
															href="javascript:;" data-customer-id="0"
															data-product="18810512" data-variant="44240094"><i
															class="fa fa-heart"></i></a>


														<button class="btn btn-circle left-to "
															data-toggle="tooltip" title="Hết hàng" disabled>
															<i class="fa fa-shopping-basket"></i>
														</button>


														<a data-toggle="tooltip" title="Xem nhanh"
															href="/e-stud-circle-ball-drop-multi-chain"
															data-handle="e-stud-circle-ball-drop-multi-chain"
															class="btn-circle btn_view btn  right-to quick-view">
															<i class="fa fa-search-plus"></i>
														</a>

													</div>
												</form>
											</div>
										</div>





										<div class="product-info a-center">
											<h3 class="product-name">
												<a href="/e-stud-circle-ball-drop-multi-chain"
													title="E STUD CIRCLE BALL DROP MULTI CHAIN">E STUD
													CIRCLE BALL DROP MULTI CHAIN</a>
											</h3>



											<div class="price-box clearfix">
												<div class="special-price">
													<span class="price product-price">490.000₫</span>
												</div>
											</div>


										</div>
									</div>



















									<div class="product-box product-box-2">
										<div class="product-thumbnail relative">


											<div class="product-image-flip">
												<a class="db" href="/e-stud-turtle-1" title="E STUD TURTLE">


													<img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc5928-1.jpg?v=1599303700000"
													alt="E STUD TURTLE" class="img-responsive center-block" />


												</a> <a class="db pa back oh" href="/e-stud-turtle-1"
													title="E STUD TURTLE"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc5929-1.jpg?v=1599303703000"
													alt="E STUD TURTLE" class="img-responsive center-block" />


												</a>

												<div class="htheme_product_overlay_fade"></div>
											</div>
											<div class="product-action clearfix">
												<form action="/cart/add" method="post"
													class="variants form-nut-grid"
													data-id="product-actions-18810509"
													enctype="multipart/form-data">

													<div>

														<a data-toggle="tooltip" title="Yêu thích"
															class="btn btn-circle iWishAdd iwishAddWrapper"
															href="javascript:;" data-customer-id="0"
															data-product="18810509" data-variant="44240097"><i
															class="fa fa-heart"></i></a> <a data-toggle="tooltip"
															title="Bỏ yêu thích"
															class="btn btn-circle iWishAdded iwishAddWrapper iWishHidden"
															href="javascript:;" data-customer-id="0"
															data-product="18810509" data-variant="44240097"><i
															class="fa fa-heart"></i></a>


														<button class="btn btn-circle left-to "
															data-toggle="tooltip" title="Hết hàng" disabled>
															<i class="fa fa-shopping-basket"></i>
														</button>


														<a data-toggle="tooltip" title="Xem nhanh"
															href="/e-stud-turtle-1" data-handle="e-stud-turtle-1"
															class="btn-circle btn_view btn  right-to quick-view">
															<i class="fa fa-search-plus"></i>
														</a>

													</div>
												</form>
											</div>
										</div>





										<div class="product-info a-center">
											<h3 class="product-name">
												<a href="/e-stud-turtle-1" title="E STUD TURTLE">E STUD
													TURTLE</a>
											</h3>



											<div class="price-box clearfix">
												<div class="special-price">
													<span class="price product-price">290.000₫</span>
												</div>
											</div>


										</div>
									</div>



















									<div class="product-box product-box-2">
										<div class="product-thumbnail relative">


											<div class="product-image-flip">
												<a class="db" href="/e-stud-big-circle-multiple-ball"
													title="E STUD BIG CIRCLE MULTIPLE BALL"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc5988-1.jpg?v=1599305970000"
													alt="E STUD BIG CIRCLE MULTIPLE BALL"
													class="img-responsive center-block" />


												</a> <a class="db pa back oh"
													href="/e-stud-big-circle-multiple-ball"
													title="E STUD BIG CIRCLE MULTIPLE BALL"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc5989-1.jpg?v=1599305974000"
													alt="E STUD BIG CIRCLE MULTIPLE BALL"
													class="img-responsive center-block" />


												</a>

												<div class="htheme_product_overlay_fade"></div>
											</div>
											<div class="product-action clearfix">
												<form action="/cart/add" method="post"
													class="variants form-nut-grid"
													data-id="product-actions-18810508"
													enctype="multipart/form-data">

													<div>

														<a data-toggle="tooltip" title="Yêu thích"
															class="btn btn-circle iWishAdd iwishAddWrapper"
															href="javascript:;" data-customer-id="0"
															data-product="18810508" data-variant="44240098"><i
															class="fa fa-heart"></i></a> <a data-toggle="tooltip"
															title="Bỏ yêu thích"
															class="btn btn-circle iWishAdded iwishAddWrapper iWishHidden"
															href="javascript:;" data-customer-id="0"
															data-product="18810508" data-variant="44240098"><i
															class="fa fa-heart"></i></a>


														<button class="btn btn-circle left-to "
															data-toggle="tooltip" title="Hết hàng" disabled>
															<i class="fa fa-shopping-basket"></i>
														</button>


														<a data-toggle="tooltip" title="Xem nhanh"
															href="/e-stud-big-circle-multiple-ball"
															data-handle="e-stud-big-circle-multiple-ball"
															class="btn-circle btn_view btn  right-to quick-view">
															<i class="fa fa-search-plus"></i>
														</a>

													</div>
												</form>
											</div>
										</div>





										<div class="product-info a-center">
											<h3 class="product-name">
												<a href="/e-stud-big-circle-multiple-ball"
													title="E STUD BIG CIRCLE MULTIPLE BALL">E STUD BIG
													CIRCLE MULTIPLE BALL</a>
											</h3>



											<div class="price-box clearfix">
												<div class="special-price">
													<span class="price product-price">250.000₫</span>
												</div>
											</div>


										</div>
									</div>



















									<div class="product-box product-box-2">
										<div class="product-thumbnail relative">


											<div class="product-image-flip">
												<a class="db" href="/e-stud-butterfly-2"
													title="E STUD BUTTERFLY"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc5898-3.jpg?v=1599303468000"
													alt="E STUD BUTTERFLY" class="img-responsive center-block" />


												</a> <a class="db pa back oh" href="/e-stud-butterfly-2"
													title="E STUD BUTTERFLY"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc5899-3.jpg?v=1599303470000"
													alt="E STUD BUTTERFLY" class="img-responsive center-block" />


												</a>

												<div class="htheme_product_overlay_fade"></div>
											</div>
											<div class="product-action clearfix">
												<form action="/cart/add" method="post"
													class="variants form-nut-grid"
													data-id="product-actions-18810507"
													enctype="multipart/form-data">

													<div>

														<a data-toggle="tooltip" title="Yêu thích"
															class="btn btn-circle iWishAdd iwishAddWrapper"
															href="javascript:;" data-customer-id="0"
															data-product="18810507" data-variant="44240099"><i
															class="fa fa-heart"></i></a> <a data-toggle="tooltip"
															title="Bỏ yêu thích"
															class="btn btn-circle iWishAdded iwishAddWrapper iWishHidden"
															href="javascript:;" data-customer-id="0"
															data-product="18810507" data-variant="44240099"><i
															class="fa fa-heart"></i></a>


														<button class="btn btn-circle left-to "
															data-toggle="tooltip" title="Hết hàng" disabled>
															<i class="fa fa-shopping-basket"></i>
														</button>


														<a data-toggle="tooltip" title="Xem nhanh"
															href="/e-stud-butterfly-2"
															data-handle="e-stud-butterfly-2"
															class="btn-circle btn_view btn  right-to quick-view">
															<i class="fa fa-search-plus"></i>
														</a>

													</div>
												</form>
											</div>
										</div>





										<div class="product-info a-center">
											<h3 class="product-name">
												<a href="/e-stud-butterfly-2" title="E STUD BUTTERFLY">E
													STUD BUTTERFLY</a>
											</h3>



											<div class="price-box clearfix">
												<div class="special-price">
													<span class="price product-price">220.000₫</span>
												</div>
											</div>


										</div>
									</div>



















									<div class="product-box product-box-2">
										<div class="product-thumbnail relative">


											<div class="product-image-flip">
												<a class="db" href="/e-stud-cross-ball"
													title="E STUD CROSS BALL"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc5759-1-copy.jpg?v=1599293772000"
													alt="E STUD CROSS BALL" class="img-responsive center-block" />


												</a> <a class="db pa back oh" href="/e-stud-cross-ball"
													title="E STUD CROSS BALL"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc5760-1-copy.jpg?v=1599293774000"
													alt="E STUD CROSS BALL" class="img-responsive center-block" />


												</a>

												<div class="htheme_product_overlay_fade"></div>
											</div>
											<div class="product-action clearfix">
												<form action="/cart/add" method="post"
													class="variants form-nut-grid"
													data-id="product-actions-18810505"
													enctype="multipart/form-data">

													<div>

														<a data-toggle="tooltip" title="Yêu thích"
															class="btn btn-circle iWishAdd iwishAddWrapper"
															href="javascript:;" data-customer-id="0"
															data-product="18810505" data-variant="44240101"><i
															class="fa fa-heart"></i></a> <a data-toggle="tooltip"
															title="Bỏ yêu thích"
															class="btn btn-circle iWishAdded iwishAddWrapper iWishHidden"
															href="javascript:;" data-customer-id="0"
															data-product="18810505" data-variant="44240101"><i
															class="fa fa-heart"></i></a>


														<button class="btn btn-circle left-to "
															data-toggle="tooltip" title="Hết hàng" disabled>
															<i class="fa fa-shopping-basket"></i>
														</button>


														<a data-toggle="tooltip" title="Xem nhanh"
															href="/e-stud-cross-ball" data-handle="e-stud-cross-ball"
															class="btn-circle btn_view btn  right-to quick-view">
															<i class="fa fa-search-plus"></i>
														</a>

													</div>
												</form>
											</div>
										</div>





										<div class="product-info a-center">
											<h3 class="product-name">
												<a href="/e-stud-cross-ball" title="E STUD CROSS BALL">E
													STUD CROSS BALL</a>
											</h3>



											<div class="price-box clearfix">
												<div class="special-price">
													<span class="price product-price">290.000₫</span>
												</div>
											</div>


										</div>
									</div>



















									<div class="product-box product-box-2">
										<div class="product-thumbnail relative">


											<div class="product-image-flip">
												<a class="db" href="/e-stud-bee-line"
													title="E STUD BEE LINE"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc7022-1-copy.jpg?v=1599307025000"
													alt="E STUD BEE LINE" class="img-responsive center-block" />


												</a> <a class="db pa back oh" href="/e-stud-bee-line"
													title="E STUD BEE LINE"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc5872-3.jpg?v=1599307035000"
													alt="E STUD BEE LINE" class="img-responsive center-block" />


												</a>

												<div class="htheme_product_overlay_fade"></div>
											</div>
											<div class="product-action clearfix">
												<form action="/cart/add" method="post"
													class="variants form-nut-grid"
													data-id="product-actions-18810502"
													enctype="multipart/form-data">

													<div>

														<a data-toggle="tooltip" title="Yêu thích"
															class="btn btn-circle iWishAdd iwishAddWrapper"
															href="javascript:;" data-customer-id="0"
															data-product="18810502" data-variant="44240103"><i
															class="fa fa-heart"></i></a> <a data-toggle="tooltip"
															title="Bỏ yêu thích"
															class="btn btn-circle iWishAdded iwishAddWrapper iWishHidden"
															href="javascript:;" data-customer-id="0"
															data-product="18810502" data-variant="44240103"><i
															class="fa fa-heart"></i></a>


														<button class="btn btn-circle left-to "
															data-toggle="tooltip" title="Hết hàng" disabled>
															<i class="fa fa-shopping-basket"></i>
														</button>


														<a data-toggle="tooltip" title="Xem nhanh"
															href="/e-stud-bee-line" data-handle="e-stud-bee-line"
															class="btn-circle btn_view btn  right-to quick-view">
															<i class="fa fa-search-plus"></i>
														</a>

													</div>
												</form>
											</div>
										</div>





										<div class="product-info a-center">
											<h3 class="product-name">
												<a href="/e-stud-bee-line" title="E STUD BEE LINE">E
													STUD BEE LINE</a>
											</h3>



											<div class="price-box clearfix">
												<div class="special-price">
													<span class="price product-price">220.000₫</span>
												</div>
											</div>


										</div>
									</div>



















									<div class="product-box product-box-2">
										<div class="product-thumbnail relative">


											<div class="product-image-flip">
												<a class="db" href="/e-stud-curve-nail"
													title="E STUD CURVE NAIL"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc5983-1.jpg?v=1599305845000"
													alt="E STUD CURVE NAIL" class="img-responsive center-block" />


												</a> <a class="db pa back oh" href="/e-stud-curve-nail"
													title="E STUD CURVE NAIL"> <img
													src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/rolling.svg?1628876908532"
													data-lazyload="//bizweb.dktcdn.net/thumb/grande/100/302/551/products/dsc5984-1.jpg?v=1599305848000"
													alt="E STUD CURVE NAIL" class="img-responsive center-block" />


												</a>

												<div class="htheme_product_overlay_fade"></div>
											</div>
											<div class="product-action clearfix">
												<form action="/cart/add" method="post"
													class="variants form-nut-grid"
													data-id="product-actions-18810501"
													enctype="multipart/form-data">

													<div>

														<a data-toggle="tooltip" title="Yêu thích"
															class="btn btn-circle iWishAdd iwishAddWrapper"
															href="javascript:;" data-customer-id="0"
															data-product="18810501" data-variant="44240104"><i
															class="fa fa-heart"></i></a> <a data-toggle="tooltip"
															title="Bỏ yêu thích"
															class="btn btn-circle iWishAdded iwishAddWrapper iWishHidden"
															href="javascript:;" data-customer-id="0"
															data-product="18810501" data-variant="44240104"><i
															class="fa fa-heart"></i></a>


														<button class="btn btn-circle left-to "
															data-toggle="tooltip" title="Hết hàng" disabled>
															<i class="fa fa-shopping-basket"></i>
														</button>


														<a data-toggle="tooltip" title="Xem nhanh"
															href="/e-stud-curve-nail" data-handle="e-stud-curve-nail"
															class="btn-circle btn_view btn  right-to quick-view">
															<i class="fa fa-search-plus"></i>
														</a>

													</div>
												</form>
											</div>
										</div>





										<div class="product-info a-center">
											<h3 class="product-name">
												<a href="/e-stud-curve-nail" title="E STUD CURVE NAIL">E
													STUD CURVE NAIL</a>
											</h3>



											<div class="price-box clearfix">
												<div class="special-price">
													<span class="price product-price">250.000₫</span>
												</div>
											</div>


										</div>
									</div>


								</div>
							</div>
						</div>
					</div>

					<script>
					$(document).ready(function ($) {
						var owl = $('.bababa');
						owl[0].addEventListener('mousewheel', e => {
							if (e.deltaY > 0) {
								$('.bababa.owl-carousel').trigger('next.owl');
							} else {
								$('.bababa.owl-carousel').trigger('prev.owl');
							}
							e.preventDefault();
						}, false);
					});
				</script>


				</div>
			</div>
		</div>
	</section>


</body>
</html>