<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sản phẩm</title>
</head>
<body>

	<div class="bg-light p-5 rounded">
		<jsp:useBean id="pagedListHolder" scope="request"
			type="org.springframework.beans.support.PagedListHolder" />
		<c:url value="/search?query=${query}" var="pagedLink">
			<c:param name="p" value="~" />
		</c:url>
	</div>


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


					<li><strong><span itemprop="name"> NEW
								COLLECTIONS</strong></li>


				</ul>
			</div>
		</div>
	</div>


	<div class="container fix-col">
		<div class="row">
			<section class="main_container collection col-lg-12 col-md-12 ">

				<div class="category-products products style">

					<div class="sortPagiBar margin-bottom-30">
						<div class="row">
							<div class="col-xs-5 col-sm-8 col-lg-9 hidden-xs">
								<div class="view-mode">


									<h1 class="collection-title margin-top-0 inline-block tttt">

										NEW COLLECTION</h1>
									<div class="tt hidden-sm hidden-xs inline-block">
										<span class="hidden-sm hidden-xs"> (${ cate.size() }
											sản phẩm) </span>
									</div>
								</div>
							</div>
							<div
								class="col-xs-12 col-sm-4 col-lg-3 text-xs-left text-sm-right">
								<div class="viewmore f-left">
									<a href="javascript:;" data-view="grid"> <b
										class="btn button-view-mode view-mode-grid active "> <i
											class="fa fa-th" aria-hidden="true"></i>
									</b>
									</a> <a href="javascript:;" data-view="list"
										onclick="switchView('list')"> <b
										class="btn button-view-mode view-mode-list "> <i
											class="fa fa-bars" aria-hidden="true"></i>
									</b>
									</a>
								</div>
								<div id="sort-by">
									<label class="left hidden hidden-xs"></label>
									<ul>
										<li><span>Sắp xếp theo</span>
											<ul>
												<li><a href="javascript:;" onclick="sortby('default')">Mặc
														định</a></li>
												<li><a href="javascript:;"
													onclick="sortby('alpha-asc')">A &rarr; Z</a></li>
												<li><a href="javascript:;"
													onclick="sortby('alpha-desc')">Z &rarr; A</a></li>
												<li><a href="javascript:;"
													onclick="sortby('price-asc')">Giá tăng dần</a></li>
												<li><a href="javascript:;"
													onclick="sortby('price-desc')">Giá giảm dần</a></li>
												<li><a href="javascript:;"
													onclick="sortby('created-desc')">Hàng mới nhất</a></li>
												<li><a href="javascript:;"
													onclick="sortby('created-asc')">Hàng cũ nhất</a></li>
											</ul></li>
									</ul>
								</div>
							</div>
						</div>
					</div>


					<section class="products-view products-view-grid test1">
						<div class="row">

							<c:forEach var="item" items="${pagedListHolder.pageList}">

								<div class="col-xs-6 col-sm-4 col-md-4 col-lg-3">

									<div class="product-box">
										<div class="product-thumbnail relative">


											<div class="product-image-flip">
												<a class="db" href="/JewelsShop/product/${item.id}"
													title="${item.name}"> <img
													src="<c:url value='/assets/user/images/product/${item.image}'/>"
													alt="NEW COLLECTIONS - E STUD BIG CIRCLE MULTI DROP BALL"
													class="img-responsive center-block" />


												</a> <a class="db pa back oh"
													href="/JewelsShop/product/${item.id}" title="${item.name}">
													<img
													src="<c:url value='/assets/user/images/product/${item.image}'/>"
													alt="NEW COLLECTIONS - E STUD BIG CIRCLE MULTI DROP BALL"
													class="img-responsive center-block" />


												</a>

												<div class="htheme_product_overlay_fade"></div>
											</div>
											<div class="product-action clearfix">
												<form action="<c:url value="/AddCart/${item.id}"/>"
													method="get" class="variants form-nut-grid"
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
															href="#" data-customer-id="0" data-product="18810516"
															data-variant="44240090"><i class="fa fa-heart"></i></a>


														<button class="btn btn-circle left-to "
															data-toggle="tooltip" title="Thêm giỏ hàng">
															<i class="fa fa-shopping-basket"></i>
														</button>




														<a data-toggle="tooltip" title="Xem nhanh"
															href="/JewelsShop/product/${item.id}"
															data-handle="e-stud-big-circle-multi-drop-ball"
															class="btn-circle btn_view btn  right-to quick-view">
															<i class="fa fa-search-plus"></i>
														</a>

													</div>
												</form>
											</div>
										</div>
										<div class="product-info a-center">
											<p class="product-name">
												<a href="/JewelsShop/product/${item.id}"
													title="E STUD BIG CIRCLE MULTI DROP BALL"
													class="line-clamp">${ item.name }</a>
											</p>


											<div class="price-box clearfix">

												<div class="special-price">
													<span class="price product-price"><fmt:formatNumber
															value="${item.price}" currencySymbol="VND"
															type="currency" /></span>
												</div>
											</div>


										</div>


									</div>
								</div>

							</c:forEach>


						</div>
						<div class="text-xs-right">
							<nav class="clearfix pagination clearfix f-right">
								<tg:paging pagedListHolder="${pagedListHolder}"
									pagedLink="${pagedLink}" />
							</nav>

						</div>
						<div style></div>
					</section>

				</div>
			</section>

			<script
				src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/search_filter.js?1628876908532"
				type="text/javascript"></script>
			<script>
			var selectedSortby;
			var tt = 'Thứ tự';
			var selectedViewData = "data";
			var filter = new Bizweb.SearchFilter()
			
			filter.addValue("collection", "collections", "2185324", "AND");
			 
			 function toggleFilter(e) {
				 _toggleFilter(e);
				 renderFilterdItems();
				 doSearch(1);
			 }
			  function _toggleFilterdqdt(e) {
				  var $element = $(e);
				  var group = 'Khoảng giá';
				  var field = 'price_min';
				  var operator = 'OR';	 
				  var value = $element.attr("data-value");	
				  filter.deleteValuedqdt(group, field, value, operator);
				  filter.addValue(group, field, value, operator);

				  renderFilterdItems();
				  doSearch(1);
			  }

			  function _toggleFilter(e) {
				  var $element = $(e);
				  var group = $element.attr("data-group");
				  var field = $element.attr("data-field");
				  var text = $element.attr("data-text");
				  var value = $element.attr("value");
				  var operator = $element.attr("data-operator");
				  var filterItemId = $element.attr("id");

				  if (!$element.is(':checked')) {
					  filter.deleteValue(group, field, value, operator);
				  }
				  else{
					  filter.addValue(group, field, value, operator);
				  }

				  $(".catalog_filters li[data-handle='" + filterItemId + "']").toggleClass("active");
			  }

			  function renderFilterdItems() {
				  var $container = $(".filter-container__selected-filter-list ul");
				  $container.html("");

				  $(".filter-container input[type=checkbox]").each(function(index) {
					  if ($(this).is(':checked')) {
						  var id = $(this).attr("id");
						  var name = $(this).closest("label").text();

						  addFilteredItem(name, id);
					  }
				  });

				  if($(".filter-container input[type=checkbox]:checked").length > 0)
					  $(".filter-container__selected-filter").show();
				  else
					  $(".filter-container__selected-filter").hide();
			  }

			  function addFilteredItem(name, id) {
				  var filteredItemTemplate = "<li class='filter-container__selected-filter-item' for='{3}'><a href='javascript:void(0)' onclick=\"{0}\"><i class='fa fa-close'></i> {1}</a></li>";
				  filteredItemTemplate = filteredItemTemplate.replace("{0}", "removeFilteredItem('" + id + "')");
				  filteredItemTemplate = filteredItemTemplate.replace("{1}", name);
				  filteredItemTemplate = filteredItemTemplate.replace("{3}", id);
				  var $container = $(".filter-container__selected-filter-list ul");
				  $container.append(filteredItemTemplate);
			  }

			  function removeFilteredItem(id) {
				  $(".filter-container #" + id).trigger("click");
			  }

			  function clearAllFiltered() {
				  filter = new Bizweb.SearchFilter();
				  
				  filter.addValue("collection", "collections", "2185324", "AND");
				   

				   $(".filter-container__selected-filter-list ul").html("");
					$(".filter-container input[type=checkbox]").attr('checked', false);
					$(".filter-container__selected-filter").hide();

					doSearch(1);
				   }

				   function doSearch(page, options) {
					   if(!options) options = {};

					   //NProgress.start();
					   $('.aside.aside-mini-products-list.filter').removeClass('active');
					   awe.showPopup('.loading');
					   filter.search({
						   view: selectedViewData,
						   page: page,
						   sortby: selectedSortby,
						   success: function (html) {
							   var $html = $(html);
							   // Muốn thay thẻ DIV nào khi filter thì viết như này
							   var $categoryProducts = $($html[0]); 
							   var xxx = $categoryProducts.find('.call-count');

							   $('.tt span').text(xxx.text());


							   $(".category-products").html($categoryProducts.html());
							   pushCurrentFilterState({sortby: selectedSortby, page: page});
							   awe.hidePopup('.loading');
							   initQuickView();
							   lazyloadImage();
							   $('[data-toggle="tooltip"]').tooltip({container: 'body'}); 
							   $('.add_to_cart').click(function(e){
								   e.preventDefault();
								   var $this = $(this);						   
								   var form = $this.parents('form');						   
								   $.ajax({
									   type: 'POST',
									   url: '/cart/add.js',
									   async: false,
									   data: form.serialize(),
									   dataType: 'json',
									   error: addToCartFail,
									   beforeSend: function() {  
										   if(window.theme_load == "icon"){
											   awe.showLoading('.btn-addToCart');
										   } else{
											   awe.showPopup('.loading');
										   }
									   },
									   success: addToCartSuccess,
									   cache: false
								   });
							   });
							   $('html, body').animate({
								   scrollTop: $('.category-products').offset().top
							   }, 0);


							   resortby(selectedSortby);
							   product_action();
							   callbackW();
							   $('.open-filters').removeClass('open');
							   $('.dqdt-sidebar').removeClass('open');

							   return window.BPR.initDomEls(), window.BPR.loadBadges();

						   }
					   });		

				   }

				   function sortby(sort) {			 
					   switch(sort) {
						   case "price-asc":
							   selectedSortby = "price_min:asc";					   
							   break;
						   case "price-desc":
							   selectedSortby = "price_min:desc";
							   break;
						   case "alpha-asc":
							   selectedSortby = "name:asc";
							   break;
						   case "alpha-desc":
							   selectedSortby = "name:desc";
							   break;
						   case "created-desc":
							   selectedSortby = "created_on:desc";
							   break;
						   case "created-asc":
							   selectedSortby = "created_on:asc";
							   break;
						   default:
							   selectedSortby = "";
							   break;
					   }

					   doSearch(1);
				   }

				   function resortby(sort) {
					   switch(sort) {				  
						   case "price_min:asc":
							   tt = "Giá tăng dần";
							   break;
						   case "price_min:desc":
							   tt = "Giá giảm dần";
							   break;
						   case "name:asc":
							   tt = "Tên A → Z";
							   break;
						   case "name:desc":
							   tt = "Tên Z → A";
							   break;
						   case "created_on:desc":
							   tt = "Hàng mới nhất";
							   break;
						   case "created_on:asc":
							   tt = "Hàng cũ nhất";
							   break;
						   default:
							   tt = "Mặc định";
							   break;
					   }			   
					   $('#sort-by > ul > li > span').html(tt);

				   }


				   function _selectSortby(sort) {			 
					   resortby(sort);
					   switch(sort) {
						   case "price-asc":
							   selectedSortby = "price_min:asc";
							   break;
						   case "price-desc":
							   selectedSortby = "price_min:desc";
							   break;
						   case "alpha-asc":
							   selectedSortby = "name:asc";
							   break;
						   case "alpha-desc":
							   selectedSortby = "name:desc";
							   break;
						   case "created-desc":
							   selectedSortby = "created_on:desc";
							   break;
						   case "created-asc":
							   selectedSortby = "created_on:asc";
							   break;
						   default:
							   selectedSortby = sort;
							   break;
					   }
				   }

				   function toggleCheckbox(id) {
					   $(id).click();
				   }

				   function pushCurrentFilterState(options) {

					   if(!options) options = {};
					   var url = filter.buildSearchUrl(options);
					   var queryString = url.slice(url.indexOf('?'));			  
					   if(selectedViewData == 'data_list'){
						   queryString = queryString + '&view=list';				 
					   }
					   else{
						   queryString = queryString + '&view=grid';				   
					   }

					   pushState(queryString);
				   }

				   function pushState(url) {
					   window.history.pushState({
						   turbolinks: true,
						   url: url
					   }, null, url)
				   }
				   function switchView(view) {			  
					   switch(view) {
						   case "list":
							   selectedViewData = "data_list";					   
							   break;
						   default:
							   selectedViewData = "data";

							   break;
					   }			   
					   doSearch(1);
				   }

				   function selectFilterByCurrentQuery() {
					   var isFilter = false;
					   var url = window.location.href;
					   var queryString = decodeURI(window.location.search);
					   var filters = queryString.match(/\(.*?\)/g);

					   if(filters && filters.length > 0) {
						   filters.forEach(function(item) {
							   item = item.replace(/\(\(/g, "(");
							   var element = $(".filter-container input[value='" + item + "']");
							   element.attr("checked", "checked");
							   _toggleFilter(element);
						   });

						   isFilter = true;
					   }

					   var sortOrder = getParameter(url, "sortby");
					   if(sortOrder) {
						   _selectSortby(sortOrder);
					   }

					   if(isFilter) {
						   doSearch(1);
					   }
				   }

				   function getParameter(url, name) {
					   name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
					   var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
						   results = regex.exec(url);
					   return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
				   }

				   $( document ).ready(function() {
					   selectFilterByCurrentQuery();
					   $('.filter-group .filter-group-title').click(function(e){
						   $(this).parent().toggleClass('active');
					   });

					   $('.filter-mobile').click(function(e){
						   $('.aside.aside-mini-products-list.filter').toggleClass('active');
					   });

					   $('#show-admin-bar').click(function(e){
						   $('.aside.aside-mini-products-list.filter').toggleClass('active');
					   });

					   $('.filter-container__selected-filter-header-title').click(function(e){
						   $('.aside.aside-mini-products-list.filter').toggleClass('active');
					   });
				   });
		</script>

		</div>
	</div>

	<script defer
		src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/iwish.js?1628876908532"></script>

	<!-- Plugin JS -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script
		src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/cs.script.js?1628876908532"></script>


	<script
		src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/quickview.js?1628876908532"></script>


	<div id="quick-view-product" class="quickview-product"
		style="display: none;">
		<div class="quickview-overlay fancybox-overlay fancybox-overlay-fixed"></div>
		<div class="quick-view-product"></div>
		<div id="quickview-modal" style="display: none;">
			<div class="block-quickview primary_block row">
				<div class="product-left-column col-xs-12 col-sm-4 col-md-5">
					<div class="clearfix image-block">
						<span class="view_full_size"> <a class="img-product"
							title="" href="#"> <img id="product-featured-image-quickview"
								class="img-responsive product-featured-image-quickview"
								src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/logo.png?1628876908532"
								alt="quickview" />
						</a>
						</span>
						<div class="loading-imgquickview" style="display: none;"></div>
					</div>
					<div class="more-view-wrapper clearfix">
						<div id="thumbs_list_quickview">
							<ul class="product-photo-thumbs quickview-more-views-owlslider"
								id="thumblist_quickview"></ul>
						</div>
					</div>
				</div>
				<div
					class="product-center-column product-info product-item col-xs-12 col-sm-8 col-md-7">
					<h3>
						<a class="qwp-name" href="">&nbsp;</a>
					</h3>
					<div class="qv-header-info">
						Tình trạng: <span class="inventory_quantity">Còn hàng</span> <span
							class="line">|</span> Mã SP: <span class="masp">Chưa cập
							nhật</span>
					</div>
					<div class="product-description rte rte-summary"></div>

					<div class="quickview-info">
						<span class="prices"> <span class="price"></span> <del
								class="old-price"></del>
						</span>
					</div>

					<form action="/cart/add" method="post"
						enctype="multipart/form-data" class="variants form-ajaxtocart">

						<select name='variantId' class="hidden" style="display: none"></select>
						<div class="clearfix"></div>
						<div class="quantity_wanted_p">
							<label for="quantity-detail" class="quantity-selector">Số
								lượng: </label>
							<div class="custom custom-btn-number">
								<span class="qtyminus" data-field="quantity">-</span> <input
									type="text" id="quantity-detail" data-field='quantity'
									name="quantity" value="1" class="quantity-selector text-center">
								<span class="qtyplus" data-field="quantity">+</span>

							</div>

							<!--<button type="submit" name="add" class="btn btn-primary add_to_cart add_to_cart_detail ajax_addtocart">
							<span >THÊM VÀO GIỎ HÀNG</span>
						</button>-->
						</div>
						<div class="total-price" style="display: none">
							<label>Tổng cộng: </label> <span></span>
						</div>

					</form>
				</div>

			</div>
			<a title="Close" class="quickview-close close-window"
				href="javascript:;"><i class="fa   fa-times-circle"></i></a>
		</div>
	</div>

	<script type="text/javascript">  
	Bizweb.doNotTriggerClickOnThumb = false;
	function changeImageQuickView(img, selector) {
		var src = $(img).attr("src");
		src = src.replace("_compact", "");
		$(selector).attr("src", src);
	}
	var selectCallbackQuickView = function(variant, selector) {
		$('#quick-view-product form').show();
		var productItem = jQuery('.quick-view-product .product-item');
		addToCart = productItem.find('.add_to_cart_detail'),
			iq = productItem.find('.inventory_quantity'),
			sku = productItem.find('.masp'),
			productPrice = productItem.find('.price'),
			comparePrice = productItem.find('.old-price'),
			totalPrice = productItem.find('.total-price span');
		if(variant && variant.sku ){
			sku.text(variant.sku);
		}else{
			sku.text('Đang cập nhật');
		}
		if (variant && variant.available) {
			var form = jQuery('#' + selector.domIdPrefix).closest('form');
			for (var i=0,length=variant.options.length; i<length; i++) {
				var radioButton = form.find('.swatch[data-option-index="' + i + '"] :radio[value="' + variant.options[i] +'"]');
				if (radioButton.size()) {
					radioButton.get(0).checked = true;
				}
			}						
			if(variant.inventory_management == 'bizweb'){
				if(variant.inventory_quantity == 0){
					iq.text("Hết hàng");
				}else{
					iq.text("Còn "+variant.inventory_quantity +" sản phẩm");
				}
			}else{
				iq.text("Còn hàng");
			}
			addToCart.removeClass('disabled').removeAttr('disabled');
			$(addToCart).find("span").text("THÊM VÀO GIỎ HÀNG");

			if(variant.price < 1){			   
				$("#quick-view-product .price").html('Liên hệ');
				$("#quick-view-product del, #quick-view-product .quantity_wanted_p").hide();
				$("#quick-view-product .prices .old-price").hide();

			}else{
				productPrice.html(Bizweb.formatMoney(variant.price, "{{amount_no_decimals_with_comma_separator}}₫"));
				if ( variant.compare_at_price > variant.price ) {
					comparePrice.html(Bizweb.formatMoney(variant.compare_at_price, "{{amount_no_decimals_with_comma_separator}}₫")).show();         
					productPrice.addClass('on-sale');
				} else {
					comparePrice.hide();
					productPrice.removeClass('on-sale');
				}

				$(".quantity_wanted_p").show();


			}


			
			 updatePricingQuickView();
			  
			   /*begin variant image*/
			   if (variant && variant.featured_image) {

				   var originalImage = $("#product-featured-image-quickview");
				   var newImage = variant.featured_image;
				   var element = originalImage[0];
				   Bizweb.Image.switchImage(newImage, element, function (newImageSizedSrc, newImage, element) {
					   $('#thumblist_quickview img').each(function() {
						   var parentThumbImg = $(this).parent();
						   var productImage = $(this).parent().data("image");
						   if (newImageSizedSrc.includes(productImage)) {
							   $(this).parent().trigger('click');
							   return false;
						   }
					   });
				   });
				   $('#product-featured-image-quickview').attr('src',variant.featured_image.src);
			   }
			   } else {
				   addToCart.addClass('disabled').attr('disabled', 'disabled');
				   $('.inventory_quantity').text("Hết hàng");	
				   $(addToCart).find("span").text("Hết hàng");	
				   if(variant){
					   if(variant.price < 1){			   
						   $("#quick-view-product .price").html('Liên hệ');
						   $("#quick-view-product del").hide();
						   $("#quick-view-product .quantity_wanted_p").hide();
						   $("#quick-view-product .prices .old-price").hide();
						   comparePrice.hide();
						   productPrice.removeClass('on-sale');
						   addToCart.addClass('disabled').attr('disabled', 'disabled');
						   $('.inventory_quantity').text("Hết hàng");	
						   $(addToCart).find("span").text("Hết hàng");				   
					   }else{
						   if ( variant.compare_at_price > variant.price ) {
							   comparePrice.html(Bizweb.formatMoney(variant.compare_at_price, "{{amount_no_decimals_with_comma_separator}}₫")).show();         
							   productPrice.addClass('on-sale');
						   } else {
							   comparePrice.hide();
							   productPrice.removeClass('on-sale');
						   }
						   $("#quick-view-product .price").html(Bizweb.formatMoney(variant.price, "{{amount_no_decimals_with_comma_separator}}₫"));
						   if ( variant.compare_at_price > variant.price ) {
							   $("#quick-view-product .prices .old-price").show();
						   }
						   $("#quick-view-product .quantity_wanted_p").show();


						   addToCart.addClass('disabled').attr('disabled', 'disabled');
						   $('.inventory_quantity').text("Hết hàng");	
						   $(addToCart).find("span").text("Hết hàng");
					   }
				   }else{
					   $("#quick-view-product .price").html('Liên hệ');
					   $("#quick-view-product del").hide();
					   $("#quick-view-product .quantity_wanted_p").hide();
					   $("#quick-view-product .prices .old-price").hide();
					   comparePrice.hide();
					   productPrice.removeClass('on-sale');
					   addToCart.addClass('disabled').attr('disabled', 'disabled');
					   $('.inventory_quantity').text("Hết hàng");	
					   $(addToCart).find("span").text("Hết hàng");	
				   }
			   }


			  };
</script>


	<script>
			document.addEventListener("DOMContentLoaded",function(){for(var t=document.getElementsByTagName("INPUT"),e=0;e<t.length;e++)t[e].oninvalid=function(t){t.target.setCustomValidity(""),t.target.validity.valid||(console.log(t.srcElement),"email"==t.srcElement.type?t.target.setCustomValidity("Email không đúng định dạng"):t.target.setCustomValidity("Không được bỏ trống"))},t[e].oninput=function(t){t.target.setCustomValidity("")}}),document.addEventListener("DOMContentLoaded",function(){for(var t=document.getElementsByTagName("textarea"),e=0;e<t.length;e++)t[e].oninvalid=function(t){t.target.setCustomValidity(""),t.target.validity.valid||(console.log(t.srcElement),"email"==t.srcElement.type?t.target.setCustomValidity("Email không đúng định dạng"):t.target.setCustomValidity("Không được bỏ trống"))},t[e].oninput=function(t){t.target.setCustomValidity("")}});
		</script>

	<script>
			
			(function(e){e.fn.appear=function(t,n){var r=e.extend({data:undefined,one:true,accX:0,accY:0},n);return this.each(function(){var n=e(this);n.appeared=false;if(!t){n.trigger("appear",r.data);return}var i=e(window);var s=function(){if(!n.is(":visible")){n.appeared=false;return}var e=i.scrollLeft();var t=i.scrollTop();var s=n.offset();var o=s.left;var u=s.top;var a=r.accX;var f=r.accY;var l=n.height();var c=i.height();var h=n.width();var p=i.width();if(u+l+f>=t&&u<=t+c+f&&o+h+a>=e&&o<=e+p+a){if(!n.appeared)n.trigger("appear",r.data)}else{n.appeared=false}};var o=function(){n.appeared=true;if(r.one){i.unbind("scroll",s);var o=e.inArray(s,e.fn.appear.checks);if(o>=0)e.fn.appear.checks.splice(o,1)}t.apply(this,arguments)};if(r.one)n.one("appear",r.data,o);else n.bind("appear",r.data,o);i.scroll(s);e.fn.appear.checks.push(s);s()})};e.extend(e.fn.appear,{checks:[],timeout:null,checkAll:function(){var t=e.fn.appear.checks.length;if(t>0)while(t--)e.fn.appear.checks[t]()},run:function(){if(e.fn.appear.timeout)clearTimeout(e.fn.appear.timeout);e.fn.appear.timeout=setTimeout(e.fn.appear.checkAll,20)}});e.each(["append","prepend","after","before","attr","removeAttr","addClass","removeClass","toggleClass","remove","css","show","hide"],function(t,n){var r=e.fn[n];if(r){e.fn[n]=function(){var t=r.apply(this,arguments);e.fn.appear.run();return t}}})})(jQuery);
		</script>

	<script
		src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/main.js?1628876908532"></script>
	<script
		src="//bizweb.dktcdn.net/100/302/551/themes/758295/assets/owl.carousel.min.js?1628876908532"></script>



</body>
</html>