<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1254"%>
<%@ page language="java" pageEncoding="windows-1254"%>
<%@ page
	import="java.util.*, java.lang.*, java.sql.*, java.io.*, java.net.*"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%
String token = null;
String resultCode = null; //authentication code
String resultName = null;
String resultMessage = null;

if (request.getParameter("token") != null)
	token = request.getParameter("token");
if (request.getParameter("resultCode") != null)
	resultCode = request.getParameter("resultCode");
if (request.getParameter("resultName") != null)
	resultName = request.getParameter("resultName");
if (request.getParameter("resultMessage") != null)
	resultMessage = request.getParameter("resultMessage").toString();
%>

<html lang="en">
<head>
<link rel="icon" type="image/png"
	href="resources/assets/styles/images/favicon.png">
<meta charset="UTF-8">
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-UTF-8">
<title><spring:message code="appTitle" /></title>

<link rel="stylesheet"
	href="resources/libs/jquery/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/assets/styles/css/base.css">
<script src="resources/libs/jquery/jquery-1.12.4.js"></script>


<%
	if (token != null && !token.equals("")) {
%>
<script type="text/javascript">
    
        $(document).ready(function () {
            var developerData = {};
    		developerData["token"] = "<%=token%>";;
    		developerData["resultCode"] =  "<%=resultCode%>";
    		developerData["resultName"] = "<%=resultName%>";
    		developerData["resultMessage"] = "<%=resultMessage%>";

				$.ajax({
					url : "fast_login_sdk",
					data : JSON.stringify(developerData),
					method : "POST",
					contentType : "application/json; charset=utf-8",
					success : function(response) {
						window.close();
					},
					error : function(xhr) {
						window.close();
						BASE.show_info_messages("error",
								"<spring:message code='error'/>",
								"<spring:message code='anErrorOccurred'/>");
					}
				});
			});
</script>
<%
	}
%>
</head>
<body>
	<div class="notTrasparentLoading"
		style="text-align: center; margin-top: 30%;">
		<img src="resources/assets/styles/images/loading_1.gif">
	</div>
</body>
</html>
