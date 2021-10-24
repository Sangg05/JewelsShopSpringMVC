<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>navigation</title>
</head>
<body>

	<div class="sidebar-menu">
		<div class="menu">
			<ul id="menu">
				<li><a
					href=<c:url value='/quan-tri/index'/>><i
						class="fa fa-home"></i><span>Home</span></a></li>
				<li><a
					href=<c:url value='/quan-tri/brand'/>><i
						class="fa fa-tags"></i><span>Brand</span></a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/product.htm"><i
						class="fa fa-copy"></i><span>Product</span></a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/user.htm"><i
						class="fa fa-users"></i><span>User</span></a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/bill.htm"><i
						class="fa fa-money"></i><span>Bill</span></a></li>
				<li><a href="${pageContext.request.contextPath}/admin/mailbox.htm"><i class="fa fa-envelope"></i><span>Mailbox</span></a>
			</ul>
		</div>
	</div>
	<div class="clearfix"></div>

	<!--slide bar menu end here-->
	<script>
		var toggle = true;

		$(".sidebar-icon").click(
				function() {
					if (toggle) {
						$(".page-container").addClass("sidebar-collapsed")
								.removeClass("sidebar-collapsed-back");
						$("#menu span").css({
							"position" : "absolute"
						});
					} else {
						$(".page-container").removeClass("sidebar-collapsed")
								.addClass("sidebar-collapsed-back");
						setTimeout(function() {
							$("#menu span").css({
								"position" : "relative"
							});
						}, 400);
					}
					toggle = !toggle;
				});
	</script>

</body>
</html>
