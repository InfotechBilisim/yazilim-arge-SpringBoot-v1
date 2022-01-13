<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%
	String css = (String) request.getSession().getAttribute("css");
	String favicon = (String) request.getSession().getAttribute("param");
	System.out.println("favicon:" + favicon);
%>

<link rel="stylesheet" href="<%=css%>">

<script>       
  function changeFavicon(src) {
	    $('link[rel="icon"]').attr('href', src);
	}
	changeFavicon("resources/assets/styles/images/favicon_"+ '<%=favicon%>'	+ ".png");
</script>

<header>
	<a class="toggle_menu" onClick="toggle_menu();" href="javascript:;"></a>
	<a class="logo_container" href="index"></a>
	<div class="toggle_container">
		<ul class="list list_toggles">
			<li class="list_item"><a class="toggle toggle_user"
				href="javascript:;"></a>
				<div class="sub_menu">
					<ul class="list">					
						<li class="list_item"><a href="logout"> <i
								class="fas fa-power-off"></i> <spring:message code="logout" />
						</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
</header>

<div class="menu_container">
	<nav>
		<a href="index" class="mapPage">  
			<span><spring:message code="map" /> </span> 
			<i class="icon icon_maps"></i>
		</a>
		
		<a href="heatmap" class="layerPage"> 
			<span><spring:message code="yakitLayer" /></span> 
			<i class="icon icon_heatmap"></i>
		</a>
                 
		<a href="regionmap" class="regionPage"> 
			<span><spring:message code="regionLayer" /></span> 
			<i class="icon icon_events"></i>
		</a>
		
		<a href="coordsmap" class="coordsPage"> 
			<span><spring:message code="coorsLayer" /></span> 
			<i class="icon icon_overview"></i>
		</a>		  
	</nav>

	<div class="menu_footer">
		<span id="yilSpan">2020</span>
	</div>
</div>
<div class="menu_overlay" onClick="toggle_menu();"></div>


<script type="text/javascript">
	var yilSpan = document.getElementById("yilSpan");
	var date = new Date()
	var yil = date.getFullYear()
	yilSpan.innerText = "©" + yil + " Infotech";

	function changActivePage(elem){
		$(elem).addClass("active");
		$(elem + " i").addClass("icon_active");
	}
</script>
