
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>product list</title>
</head>
<body>
	<h1>${ cate.size() }</h1>
	<div class="bg-light p-5 rounded">
		<jsp:useBean id="pagedListHolder" scope="request"
			type="org.springframework.beans.support.PagedListHolder" />
		<c:url value="/quan-tri/category/${id}" var="pagedLink">
			<c:param name="p" value="~" />
		</c:url>
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
												<a class="db" href="/JewelsShop/quan-tri/product/${item.id}"
													title="${item.name}"> <img
													src="<c:url value='/assets/user/images/product/${item.image}'/>"
													alt="NEW COLLECTIONS - E STUD BIG CIRCLE MULTI DROP BALL"
													class="img-responsive center-block" />


												</a> <a class="db pa back oh"
													href="/JewelsShop/quan-tri/product/${item.id}" title="${item.name}">
													<img
													src="<c:url value='/assets/user/images/product/${item.image}'/>"
													alt="NEW COLLECTIONS - E STUD BIG CIRCLE MULTI DROP BALL"
													class="img-responsive center-block" />


												</a>

												<div class="htheme_product_overlay_fade"></div>
											</div>
											<div class="product-action clearfix">
												<form action=""
													method="get" class="variants form-nut-grid"
													data-id="product-actions-18810516"
													enctype="multipart/form-data">

													<div>

														


														<button class="btn btn-circle left-to "
															data-toggle="tooltip" title="Thêm giỏ hàng">
															<i class="fa fa-shopping-basket"></i>
														</button>


													</div>
												</form>
											</div>
										</div>
										<div class="product-info a-center">
											<p class="product-name">
												<a href="/JewelsShop/quan-tri/product/${item.id}"
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
					} else {
						filter.addValue(group, field, value, operator);
					}

					$(".catalog_filters li[data-handle='" + filterItemId + "']")
							.toggleClass("active");
				}

				function renderFilterdItems() {
					var $container = $(".filter-container__selected-filter-list ul");
					$container.html("");

					$(".filter-container input[type=checkbox]").each(
							function(index) {
								if ($(this).is(':checked')) {
									var id = $(this).attr("id");
									var name = $(this).closest("label").text();

									addFilteredItem(name, id);
								}
							});

					if ($(".filter-container input[type=checkbox]:checked").length > 0)
						$(".filter-container__selected-filter").show();
					else
						$(".filter-container__selected-filter").hide();
				}

				function addFilteredItem(name, id) {
					var filteredItemTemplate = "<li class='filter-container__selected-filter-item' for='{3}'><a href='javascript:void(0)' onclick=\"{0}\"><i class='fa fa-close'></i> {1}</a></li>";
					filteredItemTemplate = filteredItemTemplate.replace("{0}",
							"removeFilteredItem('" + id + "')");
					filteredItemTemplate = filteredItemTemplate.replace("{1}",
							name);
					filteredItemTemplate = filteredItemTemplate.replace("{3}",
							id);
					var $container = $(".filter-container__selected-filter-list ul");
					$container.append(filteredItemTemplate);
				}

				function removeFilteredItem(id) {
					$(".filter-container #" + id).trigger("click");
				}

				function clearAllFiltered() {
					filter = new Bizweb.SearchFilter();

					filter.addValue("collection", "collections", "2185324",
							"AND");

					$(".filter-container__selected-filter-list ul").html("");
					$(".filter-container input[type=checkbox]").attr('checked',
							false);
					$(".filter-container__selected-filter").hide();

					doSearch(1);
				}

				function doSearch(page, options) {
					if (!options)
						options = {};

					//NProgress.start();
					$('.aside.aside-mini-products-list.filter').removeClass(
							'active');
					awe.showPopup('.loading');
					filter.search({
						view : selectedViewData,
						page : page,
						sortby : selectedSortby,
						success : function(html) {
							var $html = $(html);
							// Muốn thay thẻ DIV nào khi filter thì viết như này
							var $categoryProducts = $($html[0]);
							var xxx = $categoryProducts.find('.call-count');

							$('.tt span').text(xxx.text());

							$(".category-products").html(
									$categoryProducts.html());
							pushCurrentFilterState({
								sortby : selectedSortby,
								page : page
							});
							awe.hidePopup('.loading');
							initQuickView();
							lazyloadImage();
							$('[data-toggle="tooltip"]').tooltip({
								container : 'body'
							});
							$('.add_to_cart').click(function(e) {
								e.preventDefault();
								var $this = $(this);
								var form = $this.parents('form');
								$.ajax({
									type : 'POST',
									url : '/cart/add.js',
									async : false,
									data : form.serialize(),
									dataType : 'json',
									error : addToCartFail,
									beforeSend : function() {
										if (window.theme_load == "icon") {
											awe.showLoading('.btn-addToCart');
										} else {
											awe.showPopup('.loading');
										}
									},
									success : addToCartSuccess,
									cache : false
								});
							});
							$('html, body').animate(
									{
										scrollTop : $('.category-products')
												.offset().top
									}, 0);

							resortby(selectedSortby);
							product_action();
							callbackW();
							$('.open-filters').removeClass('open');
							$('.dqdt-sidebar').removeClass('open');

							return window.BPR.initDomEls(), window.BPR
									.loadBadges();

						}
					});

				}

				function sortby(sort) {
					switch (sort) {
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
					switch (sort) {
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
					switch (sort) {
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

					if (!options)
						options = {};
					var url = filter.buildSearchUrl(options);
					var queryString = url.slice(url.indexOf('?'));
					if (selectedViewData == 'data_list') {
						queryString = queryString + '&view=list';
					} else {
						queryString = queryString + '&view=grid';
					}

					pushState(queryString);
				}

				function pushState(url) {
					window.history.pushState({
						turbolinks : true,
						url : url
					}, null, url)
				}
				function switchView(view) {
					switch (view) {
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

					if (filters && filters.length > 0) {
						filters.forEach(function(item) {
							item = item.replace(/\(\(/g, "(");
							var element = $(".filter-container input[value='"
									+ item + "']");
							element.attr("checked", "checked");
							_toggleFilter(element);
						});

						isFilter = true;
					}

					var sortOrder = getParameter(url, "sortby");
					if (sortOrder) {
						_selectSortby(sortOrder);
					}

					if (isFilter) {
						doSearch(1);
					}
				}

				function getParameter(url, name) {
					name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
					var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
							.exec(url);
					return results === null ? ""
							: decodeURIComponent(results[1].replace(/\+/g, " "));
				}

				$(document)
						.ready(
								function() {
									selectFilterByCurrentQuery();
									$('.filter-group .filter-group-title')
											.click(
													function(e) {
														$(this)
																.parent()
																.toggleClass(
																		'active');
													});

									$('.filter-mobile')
											.click(
													function(e) {
														$(
																'.aside.aside-mini-products-list.filter')
																.toggleClass(
																		'active');
													});

									$('#show-admin-bar')
											.click(
													function(e) {
														$(
																'.aside.aside-mini-products-list.filter')
																.toggleClass(
																		'active');
													});

									$(
											'.filter-container__selected-filter-header-title')
											.click(
													function(e) {
														$(
																'.aside.aside-mini-products-list.filter')
																.toggleClass(
																		'active');
													});
								});
			</script>

		</div>
	</div>

</body>
</html>
