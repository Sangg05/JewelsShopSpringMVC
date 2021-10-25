<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>category form</title>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>

</head>
<body>
	<div class="page-container">

		<div class="left-content">

			<div class="mother-grid-inner">

				<div class="inner-block">
					<div class="inbox">
						<h2>Thêm thương hiệu</h2>
						<div class="col-md-12 compose-right">
							<div class="inbox-details-default">
								<div class="inbox-details-heading">Form thêm thương hiệu</div>
								<div class="inbox-details-body">
									<div class="alert alert-info">${message}</div>
									<form class="com-mail" >
										<label>Name</label>
										<input type="text" placeholder="name..." path="name" >
										<div>
											<errors path="name" />
										</div>
										<button type="submit">Save</button>
									</form>
								</div>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>
				</div>


			</div>

		</div>


	</div>
</body>
</html>
