<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.infotech.entity.User"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%
	User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><spring:message code="appTitle"/></title>
	<link rel="icon" type="image/png" href="resources/assets/styles/images/favicon.png">
	<link href="resources/assets/styles/fonts/googleapis.css"  rel="stylesheet"/>
	<link rel="stylesheet" href="resources/libs/Chart.js/2.8.0/Chart.min.css">
	<link rel="stylesheet" href="resources/libs/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" href="resources/libs/datatables/datatables.min.css" />
	<link rel="stylesheet" href="resources/libs/font-awesome/4.7.0/css/font-awesome.css" />
	<link href="resources/libs/font-awesome/5.13.1/css/promin.css" rel="stylesheet"/>
	<link href="resources/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="resources/libs/timepicker/1.3.5/jquery.timepicker.css">
	<link rel="stylesheet" href="resources/libs/jquery/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="resources/assets/scripts/oraclemapsv2.js" /></script>
	<script type="text/javascript" src="resources/assets/scripts/globals.js" /></script>
	<script type="text/javascript" src="resources/assets/scripts/heatmapv2.js" /></script>
	<script type="text/javascript" src="resources/assets/scripts/common.js" /></script>
</head>
<body class="heatmap_page" onload="HeatMapObject.startUp();">
	<jsp:include page='common/header.jsp'></jsp:include>
	<main>
		<div class="page_header">
			<div class="form_container column_container">
				<div class="column column_4_1">
					<h3><spring:message code="yogunlukHaritasi"/></h3>
				</div>
			</div>
		</div>
		<div class="column_container">
			<div class="column column_3_1">
				<div class="widget_container">
					<div class="filter_container search_section">
						<div class="widget_content">
							<div class="form_container form_container_alternative">
								<div class="input_wrapper">
									<label><spring:message code="yakitLayer"/></label>
								</div>
								<div class="container">
									<div class="form_container form_container_alternative column_container">
										<div class="input_wrapper toggle_wrapper">
											<input class="field" data-key="toggle" type="checkbox"
											id="inactivetotal" name="toggle" onClick="katmanguncelle(this)"> <label for="inactivetotal">
											<span>Inactive Total</span> <i
											class="far fa-toggle-on" aria-hidden="true"></i>
											</label>
										</div>
										<div class="input_wrapper toggle_wrapper">
											<input class="field" data-key="toggle" type="checkbox"
											id="akpet" name="toggle" onClick="katmanguncelle(this)"> <label for="akpet">
											<span>Akpet</span> <i
											class="far fa-toggle-on" aria-hidden="true"></i>
											</label>
										</div>
										<div class="input_wrapper toggle_wrapper">
											<input class="field" data-key="toggle" type="checkbox"
											id="turkaz" name="toggle" onClick="katmanguncelle(this)"> <label for="turkaz">
											<span>Turkaz</span> <i
											class="far fa-toggle-on" aria-hidden="true"></i>
											</label>
										</div>
										<div class="input_wrapper toggle_wrapper">
											<input class="field" data-key="toggle" type="checkbox"
											id="shell" name="toggle" onClick="katmanguncelle(this)"> <label for="shell">
											<span>Shell</span> <i
											class="far fa-toggle-on" aria-hidden="true"></i>
											</label>
										</div>
										<div class="input_wrapper toggle_wrapper">
											<input class="field" data-key="toggle" type="checkbox"
											id="opet" name="toggle" onClick="katmanguncelle(this)"> <label for="opet">
											<span>Opet</span> <i
											class="far fa-toggle-on" aria-hidden="true"></i>
											</label>
										</div>
										<div class="input_wrapper toggle_wrapper">
											<input class="field" data-key="toggle" type="checkbox"
											id="po" name="toggle" onClick="katmanguncelle(this)"> <label for="po">
											<span>Po</span> <i
											class="far fa-toggle-on" aria-hidden="true"></i>
											</label>
										</div>																																	
									</div>
								</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="column column_3_2">
			<div class="widget_container widget_map">
				<div class="map_container">
					<div id="mapHeatMap" class="map"></div>
				</div>
			</div>
		</div>
	</main>

	<jsp:include page='common/footer.jsp'></jsp:include>
	<jsp:include page='common/commonHtml.jsp'></jsp:include>
	<script src="resources/libs/Chart.js/2.8.0/Chart.min.js"></script>

	<script src="resources/libs/jquery/jquery-1.12.4.js"></script>
	<script src="resources/libs/daterangepicker/moment.min.js"></script>
	<script src="resources/libs/daterangepicker/daterangepicker.js"></script>
	<script src="resources/libs/datatables/datatables.min.js"></script>

	<jsp:include page='resources/base.jsp'></jsp:include>
	<script src="resources/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script src="resources/libs/jquery/jquery-ui.js"></script>
	<script src="resources/libs/select2/4.0.3/js/select2.min.js"></script>
	<script
		src="resources/libs/select2-multi-checkboxes/select2.multi-checkboxes.js"></script>
		<link rel="stylesheet" href="resources/assets/styles/css/infotech.css">


	<script>
		
		$(document).ready(function(){
			changActivePage(".layerPage");
			
			
		    /*
		     mainObject.setLyrTheme(mainMapObject,0, "cp_total", "MAPLINK20", "CP_TOTAL", [ 1 ], true, mainObject.mouseClickInfo);
            mainObject.setLyrTheme(mainMapObject,6, "cp_total_lpg", "MAPLINK20", "CP_TOTAL", [ 2 ], false, mainObject.mouseClickInfo);
            mainObject.setLyrTheme(mainMapObject,1, "cp_total_inactive", "MAPLINK20", "CP_TOTAL", [ 51 ], false, mainObject.mouseClickInfo);
            mainObject.setLyrTheme(mainMapObject,5, "cp_total_lost", "MAPLINK20", "CP_TOTAL", [ 52 ], false, mainObject.mouseClickInfo);
            //mapper.setLyrTheme(2, "p_brand_total_single", "MAPLINK20.P_BRAND_TOTAL_SINGLE", [ 0 ], true, mouseClickLyr);
            mainObject.setLyrTheme(mainMapObject,3, "cp_total_planlanan", "MAPLINK20", "CP_TOTAL", [ 9 ], false, mainObject.mouseClickInfo);
            mainObject.setLyrTheme(mainMapObject,4, "nufus_heatmap", "MAPLINK20", "DEMOGRAFIK_NUFUS", [ 4 ], false, null);
		    */
		//	update_vehicle_selection("#select_vehicles","#vehicle_group");
		});
		

		function update_vehicle_selection(target,source){  
			$(target).val("");	
			var developerData = {"grName": $(source).val()};
			
			showLoading();
			$.ajax({
				 url 	: "mobileListGr"
				,data : developerData
				,method	: "POST"
				,contentType : "application/x-www-form-urlencoded; charset=UTF-8"
				,success: function(response){
					initialize_select2(target,response,"<spring:message code='chooseMobile'/>");
					hideLoading();
				}
			});
		}

		function listHeatMap() {
			showLoading();

			var onEk = '';//'heatmap_';
			var isSelectedAll = $("#select_vehicles_all").prop("checked");
			var type = $("input[name='radio']:checked").val();

			var developerData = {};
			developerData["grName"] = $("#vehicle_group").val();
			developerData["stringStDate"] = $("#dateSt").val();
			developerData["stringEndDate"] = $("#dateEnd").val();
			developerData["regionType"] = type;
			developerData["workType"] = $("#work_type").val();
			developerData["mobiles"] = getSelectedListFromMulti("#select_vehicles",isSelectedAll);
			developerData["selectedAllMobiles"] = isSelectedAll ? 0 : 1;

			$.ajax({
				 url 	: "calculateHeatMap"
				,data : JSON.stringify(developerData)
				,type   :"POST"
				,contentType : "application/json; charset=utf-8"
				,success : function(response){
					if(response && response.succes){
						console.log(response.data);
			            values = response.data;
		            	HeatMapObject.showHeatData(type,response.data,onEk + '<%=user.getUsername()%>');
					}
					hideLoading();
				}
			});

		}


		function getSelectedListFromMulti(combo,all){
			var list = [];

			if(all){
    			$.each($(combo +" option:not(:selected)"), function(){
    				var num = $(this).val();            
    				list.push(num);
    		    });
    		}else{
    			$.each($(combo +" option:selected"), function(){
    				var num = $(this).val();            
    				list.push(num);
    		    });
        	}
		    return list;
		}

	function katmanguncelle(elm) {

	    if( elm.id == "total" ) {
	      if( elm.checked ) HeatMapObject.showTheme(1,"MAPLINK20","P_BRAND_TOTAL_SUBTYPE",522 ); else  HeatMapObject.removeTheme(1);
	      return;
	    }

	    if( elm.id == "totallpg" ) {
	      if( elm.checked )  HeatMapObject.showTheme(20,"MAPLINK20","P_BRAND_TOTAL_SUBTYPE",20 ); else HeatMapObject.removeTheme(20);
	      return;
	    }

	    if( elm.id == "inactivetotal" ) {
	      if( elm.checked )  HeatMapObject.showTheme(1,"MAPLINK20","CP_TOTAL",1); else HeatMapObject.removeTheme(1);
	      return;
	    }

	    if( elm.id == "losttotal" ) {
	      if( elm.checked )  HeatMapObject.showTheme(99,"MAPLINK20","P_BRAND_TOTAL_SUBTYPE",99 ); else HeatMapObject.removeTheme(99);
	      return;
	    }

	    if( elm.id == "planlanan" ) {
	      if( elm.checked ) HeatMapObject.showTheme(73,"MAPLINK20","P_BRAND_TOTAL_SUBTYPE",73 ); else HeatMapObject.removeTheme(73);
	      return;
	    }

	    if( elm.id == "heatmap" ) {
	      if( elm.checked ) HeatMapObject.showTheme(49,"MAPLINK20","P_BRAND_TOTAL_SUBTYPE",49); else HeatMapObject.removeTheme(49);
	      return;
	    }
	   
	    return;
	  } // katmanguncelle()

		
	</script>
</body>
</html>