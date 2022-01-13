<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@page import="com.infotech.config.Utils"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="appTitle" /></title>
<link rel="stylesheet" href="resources/assets/styles/css/404.css">
</head>
<body>
	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
				<h1>Oops!</h1>
			</div>
			<h2>404 - Page not found</h2>
			<p>The page you are looking for might have been removed had its
				name changed or is temporarily unavailable.</p>
			<a href="index">Go To Homepage</a>
		</div>
	</div>
</body>
</html>