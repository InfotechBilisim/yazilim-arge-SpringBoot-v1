<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="com.infotech.config.Utils"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<html id="h1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
.DivPicture {
	position: absolute;
	top: 150px;
	left: 10px;
	z-index: -1;
	color: black;
	visibility: visible;
}

.DivIFrame {
	top: 0px;
	left: 0px;
	width: 800px;
	height: 600px;
	z-index: 1;
}

#frmContent {
	/*display: none; */
}
</style>
<script type="text/javascript">
      function startup() { 
        window.onresize = resizeHandler;
      }
      
      function resizeHandler() {
        var frmContent = document.getElementById("frmContent");

        var theWidth;
        if (window.innerWidth)
          theWidth = window.innerWidth;
        else if (document.documentElement && document.documentElement.clientWidth)
          theWidth = document.documentElement.clientWidth;
        else if (document.body)
          theWidth = document.body.clientWidth;
      
        var theHeight;
        if (window.innerHeight)
          theHeight = window.innerHeight;
        else if (document.documentElement && document.documentElement.clientHeight)
          theHeight = document.documentElement.clientHeight;
        else if (document.body)
          theHeight = document.body.clientHeight;

        theWidth = theWidth - 5;
        theHeight = theHeight;
        frmContent.style.width = theWidth + "px";
        frmContent.style.height = theHeight + "px";
      }
      
      function closeWindow(ifClosed) {
          if (ifClosed) {
              window.close();
          }
      }
    </script>
<%
	boolean isClosed = true;
	String reportName = "";
	String mainImageFolder = "";
	String url = "";
	try {
		isClosed = false;

	} catch (Exception ex) {
		System.out.println(
				"reportOpen.jsp session invalid !....................................reportOpen..........");
		ex.printStackTrace();
	}
%>


<title><%=reportName%></title>
<head>
<body id="b1">
	<div class="DivPicture">
		<p align="left"></p>
		<table cellpadding="0" cellspacing="0" border="0" summary=""
			role="presentation" id="pgl1" class="x1a">
			<tbody>
				<tr>
					<td><img src="resources/assets/styles/images/report/loading.gif" height="64"
						width="64" alt="0"></td>
					<td><span id="ot1"><spring:message code="loading"/></span></td>
				</tr>
			</tbody>
		</table>
		<img id="s1" src="resources/assets/styles/images/report/t.gif" alt="" width="10"
			height="50">
		<table cellpadding="0" cellspacing="0" border="0" summary=""
			role="presentation" id="pgl2" class="x1a">
			<tbody>
				<tr>
					<td><img id="i1" class="xkm"
						src="<spring:message code='downloadInfoPngUrl'/>"></td>
				</tr>
			</tbody>
		</table>

		<br>
		<p></p>
	</div>
	
	<iframe id="frmContent" src="reportsIframe" class="DivIFrame"></iframe>
	
	
</body>
</html>