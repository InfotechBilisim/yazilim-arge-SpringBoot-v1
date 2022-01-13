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
	<link rel="stylesheet" href="resources/assets/styles/css/infotech.css">
</head>
<body class="heatmap_page" onload="HeatMapObject.startUp();">
	<jsp:include page='common/header.jsp'></jsp:include>
	<main>
		<div class="page_header">
			<div class="form_container column_container">
				<div class="column column_4_1">
					<h3><spring:message code="bolgeHaritasi"/></h3>
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
									<label><spring:message code="regionLayer"/></label>
									<select id="bolge">
									</select>
									<label><spring:message code="LbsCity"/></label>
									<select id="il">
										<option value="0"><spring:message code="allTumu"/></option>
									</select>
									<label><spring:message code="LbsDistrict"/></label>
									<select id="ilce">
										<option value="0"><spring:message code="allTumu"/></option>
									</select>
									<br>
									<div class="button_container">
										<a href="javascript:;" class="button" onclick="bolgeGoster('bolge');"><spring:message code="show"/></a>
										<a href="javascript:;" class="button" onclick="analiz();"><spring:message code="btnAnaliz"/></a>
									</div>
								</div>
								
								<!-- div class="container">
									<div class="form_container form_container_alternative column_container">
						                <ul>
											 <div class="container m-0 p-0">
											 <div class="row m-3">
											 	  <div class="col-6 p-0 select">
											 		<select   class="form-control pr-0"  id="bolge" ></select>
											 	  </div>
											 	  <div class="col-6 p-0" style="text-align:right">
											 			<button onclick="bolgeGoster('bolge')" class="btn btn-infotech" style="padding-top: 9.750;"> <i class="far  fa-location-arrow"></i> </button>
											 			<button  class="btn btn-infotech"     style="visibility: hidden";><span><spring:message code="btnAnaliz" /> </span></button>
											 	  </div>
											  </div>
											   <div class="row m-3">
											 	  <div class="col-6 select p-0" >
											 		<select   class="form-control pr-0"  id="Il"  onChange="getilceler(''); getmahalleler('');">
											 		</select>
											 	  </div>
											      <div class="col-6 p-0" style="text-align:right">
											        <button onclick="bolgeGoster('Il')" class="btn btn-infotech " style="padding-top: 9.750;"> <i class="far  fa-location-arrow"></i></button>
											   	   <button onclick="ilanaliz()" class="btn btn-infotech " > <span><spring:message code="btnAnaliz" /> </span> </button>
											      </div>
											   </div>
											   <div class="row m-3">
											 	  <div class="col-6 p-0 select">
											 		<select   class="form-control pr-0"  id="Ilce"  onChange="getmahalleler('')"></select>
											 	  </div>
											 	  <div class="col-6 p-0" style="text-align:right">
											 	   <button onclick="bolgeGoster('Ilce')" class="btn btn-infotech" style="padding-top: 9.750;"> <i class="far  fa-location-arrow"></i> </button>
											 	   <button onclick="ilceanaliz()" class="btn btn-infotech" ><span><spring:message code="btnAnaliz" /> </span></button>
											 	  </div>
											   </div>
											 </div>
										</ul>

									

									</div>
								</div-->
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
	<script src="resources/libs/select2-multi-checkboxes/select2.multi-checkboxes.js"></script>
	
	<script>
		
		$(document).ready(function(){
			changActivePage(".regionPage");

			$.ajax({
                url: "index/bolgeList",
                method: "GET",
                success: function(response){
					$("#bolge").empty();
					 var slct;
					 var bolgeSelect = document.getElementById('bolge');
					    clearOptions(bolgeSelect);
					    addOption(bolgeSelect, "Tüm Türkiye", 0, true);
						var len = response.data.length;
					for(var i=0;i<len;i++) {
						 addOption(bolgeSelect, response.data[i].name, response.data[i].id, slct, true);
					};
				}
            });	
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
	  
        function bolgeGoster(bolgeId) {
            var elm = document.getElementById(bolgeId);
            var id = elm.value;
            if( id == null || id == 0 ) {
            	showMapCenteredAndZoom(39.0, 35.0, 2, mainMapObject);
              return;
            }

            var data = getField(bolgeler, id);
            var ext = data.extent;
            mapper.showMapBB(ext.x1, ext.y1, ext.x2, ext.y2);
            return;
          } // bolgegoster()
          
        function clearOptions(opts) {
            
            opts.length = 0;
            return;
        }
        
        function addOption(opts, txt, value, slct, mouseOver, mouseOut, bgcolor) {
            if( opts ) {
              var inx = opts.length;
              opts.options[inx] = new Option(txt, value);
              opts.options[inx].selected = slct;
        	  opts.options[inx].title=txt;
        	  if(typeof(bgcolor)!='undefined')
                opts.options[inx].style.background =bgcolor;
              if( mouseOver ) opts.options[inx].onmouseover = function(evt){ mouseOver(evt, inx); }
              if( mouseOut ) opts.options[inx].onmouseout = mouseOut;
            }
            return;
          }	  

		
	</script>
</body>
</html>