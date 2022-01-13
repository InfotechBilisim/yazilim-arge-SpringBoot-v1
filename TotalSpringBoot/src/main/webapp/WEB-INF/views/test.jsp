<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code='appTitle' /></title>
<link href="resources/assets/styles/fonts/googleapis.css"  rel="stylesheet"/>

<!-- FONT AWESOME -->
<link rel="stylesheet" href="resources/libs/font-awesome/4.7.0/css/font-awesome.css" />

<link rel="stylesheet" href="resources/libs/datatables/datatables.min.css" />
<link rel="stylesheet"
	href="resources/libs/jquery/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/assets/styles/css/base.css">
<script src="resources/libs/jquery/jquery-1.12.4.js"></script>
</head>
<body class="">
	<jsp:include page='common/header.jsp'></jsp:include>

	<div class="menu_overlay" onClick="BASE.toggle_menu();"></div>
	<main>
		<div class="page_header">
			<div class="form_container column_container">
				<div>
					<h1>TEST</h1>
				</div>
			</div>
		</div>

		<div class="widget_container widget_datatable trip_table_container">
			<div class="widget_header column_container">
				<div class="column">
					<h2>TEST</h2>
				</div>
				<div class="column right"></div>
			</div>

			<div class="widget_content">
			<div class="table_wrapper">
					<table id="datatable" class="fs_datatable">
						<tfoot></tfoot>
					</table>
				</div>
			</div>
		</div>
	</main>

	<!-- TEMPLATE -->
	<jsp:include page='common/footer.jsp'></jsp:include>
	<jsp:include page='common/commonHtml.jsp'></jsp:include>
	<!-- TEMPLATE -->

	<script src="https://kit.fontawesome.com/99da2561bd.js"></script>
	<script src="resources/libs/jquery/jquery-1.12.4.js"></script>
	<script src="resources/libs/datatables/datatables.min.js"></script>
	<jsp:include page='resources/base.jsp'></jsp:include>
	<script src="resources/libs/js/jquery.inputmask.js"></script>
	<script src="resources/libs/jquery/jquery-ui.js"></script>
	<script>
	var datatable = null;
	var columns= [
		   {"data":"mobile"						,"name":"mobile"						,"title":"Mobile"},
		   {"data":"alias"						,"name":"alias"							,"title":"Plaka"},
		   {"data":"totalDistanceTravelled"		,"name":"totalDistanceTravelled"		,"title":"Toplam Mesafe"}
			];
		$(document).ready(function() {
			getMobileList();
		});

		function getMobileList() {
			_query("getMobilesFromMobileWS","GET",{},false).then(function(data) {
				if(!data)
					getMobileList();
				else{
					var data = data.data.mobile;

					APP_CONFIG.datatable_default_options.data = data;
					APP_CONFIG.datatable_default_options.columns = columns;
					APP_CONFIG.datatable_default_options.filter = true;
					APP_CONFIG.datatable_default_options.stateSave = false;
					APP_CONFIG.datatable_default_options.order = [];
					 if (datatable) {
						 datatable.clear();
						 datatable.destroy();
						 $("#datatable tfoot tr").remove();
						} 

					 datatable =  $('#datatable').DataTable(
								$.extend({},
										APP_CONFIG.datatable_default_options,
										{
											 "serverSide"	:false
										}
									)
								);
				}
			});
		}

		function _query(url, method, data, isStringify) {
			var sendData = isStringify ? JSON.stringify(data) : data;
			return new Promise(function(resolve, reject) {

				$.ajax({
					url : url,
					type : method,
					data : sendData,
					 headers: {
					        'Content-Type': "application/json; charset=utf-8"
					    },
					contentType : "application/json; charset=utf-8",
					success : function(res) {
						if (res && (res.data || res.succes)) {
							resolve(res);
						}
					},
					error : function(xhr) {
						resolve(false);
					}
				});
			});

		}
	</script>
</body>
</html>
