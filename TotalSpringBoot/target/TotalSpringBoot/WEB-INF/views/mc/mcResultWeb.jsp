<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1254"%>
<%@ page language="java" pageEncoding="windows-1254"%> 
<%@ page import="java.util.*, java.lang.*, java.sql.*, java.io.*, java.net.*"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%
  String ret_key = null; 
  String ret_code = null; //authentication code
  String ret_state = null;
  String ret_error = null;    
  
  if ( request.getParameter("code") != null ) 
    ret_key = request.getParameter("code");
 
  if (ret_key != null && ret_key.equalsIgnoreCase("infomobil")) {
    ret_code = (String)session.getAttribute("fastautcode");
    ret_state = (String)session.getAttribute("fastautstate");
    ret_error = (String)session.getAttribute("fastauterror");
  } else {
    if ( request.getParameter("code") != null ) ret_code = request.getParameter("code");
    if ( request.getParameter("state") != null ) ret_state = request.getParameter("state");
    if ( request.getParameter("error") != null ) ret_error = request.getParameter("error").toString();
  }
%>

<html lang="en">
<head>    
    <link rel="icon" type="image/png" href="resources/assets/styles/images/favicon.png">
    <meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=windows-UTF-8">
    <title><spring:message code="appTitle"/></title>
    
    <link rel="stylesheet" href="resources/libs/font-awesome/4.7.0/css/font-awesome.css" />
    <link href="resources/libs/font-awesome/5.13.1/css/promin.css" rel="stylesheet"/>
	<link rel="stylesheet" href="resources/libs/jquery/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="resources/assets/styles/css/base.css">
	<script src="resources/libs/jquery/jquery-1.12.4.js"></script>


<%if(ret_code != null && 	!ret_code.equals("")){ %>
    <script type="text/javascript">
    
        $(document).ready(function () {
            var aut_key =  "<%=ret_key%>";
            var ret_code = "<%=ret_code%>";
            var ret_state = "<%=ret_state%>";
            var ret_error = "<%=ret_error%>";

            var developerData = {};
    		developerData["aut_key"] = aut_key;
    		developerData["ret_code"] = ret_code;
    		developerData["ret_state"] = ret_state;
    		developerData["ret_error"] = ret_error;
            
    		$.ajax({
    			 url 	: "fast_login"
    			,data : JSON.stringify(developerData)		
    			,method	: "POST"				
    			,contentType: "application/json; charset=utf-8"
    			,success: function(response){
    				window.close();
    			},
				error : function(xhr) {
					window.close();
					BASE.show_info_messages("error","<spring:message code='error'/>","<spring:message code='anErrorOccurred'/>");
				}
		});	
        }); 

       
    </script>
 <% } %>
</head>
<body>
	<div class="notTrasparentLoading" style="text-align: center;margin-top: 30%;">
	<img
		src="resources/assets/styles/images/loading_1.gif">
	</div>
</body>
</html>
