<%@ page language="java" import="java.lang.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="com.infotech.entity.User"%>
<%@page import="com.infotech.config.Utils"%>
<%@ page import ="java.io.PrintWriter" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isThreadSafe="true" %>

<%
	User uname = (User) request.getSession().getAttribute("user");
   	Long rightGeo = 0L;
	String username = "";
	String comp = "";
	if (uname == null) {
		response.sendRedirect("login");
	} else {
		username = uname.getUsername();
		comp = uname.getCompany();
	}
%>
<html>

<head>
<meta charset="UTF-8">
	<title><spring:message code="appTitle"/></title>
	<link rel="icon" type="image/png" href="resources/assets/styles/images/favicon.png">
	<link href="resources/assets/styles/fonts/googleapis.css"  rel="stylesheet"/>
	<link rel="stylesheet" href="resources/libs/Chart.js/2.8.0/Chart.min.css">
	<script type="text/javascript" src="resources/assets/scripts/oraclemapsv2.js" /></script>
	<script type="text/javascript" src="resources/assets/scripts/globals.js" /></script>
	<jsp:include page='resources/mainv2.jsp'></jsp:include>
	
	<link rel="stylesheet" href="resources/libs/font-awesome/4.7.0/css/font-awesome.css" />
	<link href="resources/libs/font-awesome/5.13.1/css/promin.css" rel="stylesheet"/>
	<link rel="stylesheet" href="resources/libs/jquery/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="resources/assets/styles/css/base.css">
	<link rel="stylesheet" href="resources/assets/styles/css/oraclemapsv2.css">
	<link rel="stylesheet" href="resources/assets/styles/css/infotech.css">
	<script type="text/javascript" src="resources/assets/scripts/common.js" /></script>
</head>

<body class="home_page">
	<jsp:include page='common/header.jsp'></jsp:include>
	<main>
		<div class="map_container">
			<body>
				<div id="mainMap"
					style="width: 100%; height: 100%; overflow: hidden; position: absolute; top: 0; left: 0;"></div>
			</body>
			<div class="map_footer">
				<div class="logo_container"></div>
			</div>
			<div class="map_action_container">
				<div class="action_group_wrapper">
					<div class="action_group">
						<a href="javascript:;toogleMapBtnColor('icon_map_fullscreen');"
							onClick="map_toggle_fullscreen();"
							tooltip_title="<spring:message code='fullScreen' />"><i class="icon icon_map_fullscreen"></i>
						</a>
					</div>
					<div class="action_group">
						<a href="javascript:mainObject.zoomIn();" 
							tooltip_title="<spring:message code='zoomIn' />"><i class="icon icon_map_zoomin"></i>
						</a>
						<a href="javascript:mainObject.zoomOut();"
							tooltip_title="<spring:message code='zoomOut' />"><i class="icon icon_map_zoomout"></i>
						</a>
						<a href="javascript:toogleMapBtnColor('icon_map_satelitte');javascript:mainObject.switchSat();"
							tooltip_title="<spring:message code='satellite' />" 
							id="satellite"><i class="icon icon_map_satelitte"></i>
						</a>
					</div>
				</div>
			</div>

			<div class="right_click_popup">
				<div class="sub_menu">
					<span class="boldLabel"><spring:message code='calculateRoute' /></span>
					<ul class="list">
						<li class="list_item sagTikHrefs"><a
							href="javascript:mainObject.setRouteStartPoint();"><i
								class="right_click_popup_icon_start"></i><spring:message code='routeStartPoint'/></a>
						</li>
						<li class="list_item sagTikHrefs"><a
							href="javascript:mainObject.addRouteMidPoint();"><i
								class="right_click_popup_icon_middle"></i><spring:message code='addIntermediatePoint' /> </a>
						</li>
						<li class="list_item sagTikHrefs"><a
							href="javascript:mainObject.setRouteEndPoint();"><i
								class="right_click_popup_icon_finish"></i><spring:message code='addRouteFinishPointtTime' /> </a>
						</li>
						<li class="list_item sagTikHrefs"><a
							href="javascript:mainObject.setRouteEndPointMesafe();"><i
								class="right_click_popup_icon_finish"></i><spring:message code='addRouteFinishPointtDistance' /> </a>
						</li>
						<li class="list_item sagTikHrefs"><a
							href="javascript:mainObject.deleteRoute();"><i
								class="right_click_popup_icon_delete"></i><spring:message code='deleteRoute' /></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- adres arama kismi -->
		<div class="search_results_outer_container">
			<div class="search_result_close_overlay"
				onClick="vehicle_list_functions.close_search_form();">
			</div>
			<div class="search_results_outer_scroll_container">
				<div class="search_results_container">
					<!-- div class="result_vehicles result_container">
						<h2><spring:message code='interestMobiles' /></h2>
						<ul class="list vehicles_list">
						</ul>
					</div-->
					<!-- div class="result_points result_container">
						<h2><spring:message code='interestPois' /></h2>
						<ul class="list points_list">
						</ul>
					</div-->
					<div class="result_addresses result_container">
						<h2><spring:message code='interestAddresses' /></h2>
						<ul class="list addresses_list">
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="search_container">
			<div class="search_form_container search_section">
				<input type="text" placeholder="<spring:message code='searchInMap' />"> <a
					href="javascript:;" class="search_button active"
					onClick="vehicle_list_functions.search_in_map();"><i
					class="far fa-search" style="line-height: inherit;"></i></a> <a
					href="javascript:;" class="close_button"
					onClick="vehicle_list_functions.close_search_form();"><i
					class="icon icon_close"></i></a> <a class="toggle_menu"
					onClick="BASE.toggle_menu();" href="javascript:;"></a>
			</div>
			
			<div class="search_section search_results">
				<div class="scroll_container">
					<div class="filter_container">
						<div class="search_section_header">
							<h2><spring:message code='filter' /></h2>
							<a href="javascript:;" class="icon_container no_border"
								onClick="vehicle_list_functions.toggle_filter();"><i
								class="far fa-times"></i></a>
						</div>
						<div class="form_container form_container_alternative">
							<div class="input_wrapper">
								<label for="filter_vehicle_group"><spring:message code='byGroup' /></label> <select
									id="filter_vehicle_group">
									<option value="Hepsi"><spring:message code='all' /></option>
								</select>
							</div>
							<div class="input_wrapper radio_wrapper">
								<label><spring:message code='byStatus' /></label>
								<div>
									<input type='radio' id='radio_0' name="radio" value="0" checked="checked">
									<label for='radio_0'><span><spring:message code='all' /></span></label>
									
									<input type='radio' id='radio_1' name="radio" value="1">
									<label for='radio_1'><span><spring:message code='activeMobiles' /></span></label>
									
									<input type='radio' id='radio_2' name="radio" value="2">
									<label for='radio_2'><span><spring:message code='pasiveMobiles' /></span></label>
									
									<input type='radio' id='radio_3' name="radio" value="3">
									<label for='radio_3'><span><spring:message code='movedMobiles' /></span></label>
									
									<input type='radio' id='radio_8' name="radio" value="8">
									<label for='radio_8'><span><spring:message code='inIdleMobiles' /></span></label>
									
									<input type='radio' id='radio_4' name="radio" value="4">
									<label for='radio_4'><span><spring:message code='stoppedMobiles' /></span></label>
									
								</div>
							</div>
							<div class="button_container">
								<a class="button"
									onClick="vehicle_list_functions.toggle_filter(); vehicle_list_functions.search(true);"><spring:message code='doFilter' /></a>
							</div>
						</div>
					</div>
					<div class="vehicle_list_container">
						<div
							class="widget_container widget_doughnut_chart search_overview active">
							<div class="search_section_header">
								<h2>
									<strong><spring:message code='commonStatus' /></strong>
								</h2>
								<a href="javascript:;" class="icon_container no_border"
									onClick="vehicle_list_functions.toggle_overview_chart();"><i
									class="far fa-angle-down"></i></a>
							</div>
							<div class="widget_content">
								<canvas id="doughnut_chart_1" width="100" height="100"></canvas>
								<div class="summary">
									<strong></strong><span><spring:message code='sum' /></span>
								</div>
								<div class="legend"></div>
							</div>
						</div>
						<div class="list_container ">
							<div class="search_section_header">
								<h2>
									<strong><spring:message code='mobilesTitle' /></strong>
								</h2>
								<a href="javascript:;" class="icon_container"
									onClick="vehicle_list_functions.toggle_filter();"
									title="<spring:message code='doFilter' />"><i class="far fa-filter"></i></a>
							</div>
							<ul class="list list_vehicles" id="vehicle_list">

							</ul>
						</div>
					</div>

					<div class="vehicle_detail_container">
						<div class="vehicle_info_tabs_header">
							<div
								class="widget_container widget_vehicle_summary vehicle_trips active"
								id="vehicle_summary">
								<div class="vehicle_icon_container vehicle_status_active">
									<i class="icon"> <img id="vehicleDetailImageIcon"
										height="55" width="55"
										src="resources/assets/styles/images/iconTypes/ICON_0.png" />
									</i>
								</div>

								<div class="vehicle_header_container">
									<strong class="vehicle_name"></strong> <span
										class="last_event_location"><i
										class="fas fa-map-marker-alt"></i><span></span></span> <span
										class="last_event_time"><i class="fas fa-clock"></i> <span></span></span>
								</div>

								

								<a href="javascript:;" class="toggle_vehicle_extra_info"
									onClick="vehicle_list_functions.toggle_vehicle_extra_info()"><i
									class="far fa-angle-down"></i><spring:message code='detail' /></a>
								<div class="vehicle_extra_info_container">
									<h2><spring:message code='detail' /></h2>
									<ul class="list list_extra_info"></ul>
								</div>
							</div>
						</div>
						<div class="vehicle_info_tabs widget_container">
							<div class="tab_menu">
								<span
									onclick="vehicle_list_functions.switch_tab(this,'vehicle_trips');"
									class="active" title="<spring:message code='trips' />"><i
									class="icon icon_trips"></i>
									
								</span> 
									
									<span
									title="<spring:message code='favoriteReports' />"><i class="icon icon_reports"></i></span>
							</div>
							<div class="vehicle_trips vehicle_tab active">
								<div class="widget_header column_container">
									<div class="column">
										<h2><spring:message code='trips' /></h2>
									</div>
									<div class="column right">
										<a class="button button_inverted"
											onClick="goToPageWithParameter('trips');">
												<spring:message code='gotoTrips' />
											</a>
									</div>
								</div>
								<ul class="list list_trips"></ul>
							</div>
							
					
							<div class="vehicle_tab vehicle_report">
								<div class="widget_header column_container">
									<div class="column">
										<h2><spring:message code='favoriteReports' /></h2>
									</div>
									<div class="column right">
										<a href="#" class="button button_inverted"
											onClick="goToPageWithParameter('reports');">
												<spring:message code='gotoFavorites' />
										</a>
									</div>
								</div>
								<div class="widget_content">
									<p>
										<spring:message code='indexFavoritesMessage' />
									</p>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="search_overlay_bg"></div>

	</main>


	<jsp:include page='common/footer.jsp'></jsp:include>
	<jsp:include page='common/commonHtml.jsp'></jsp:include>

	
	
	<script src="resources/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script src="resources/libs/jquery/jquery-1.12.4.js"></script>
	<jsp:include page='resources/base.jsp'></jsp:include>
	<script src="resources/libs/jquery/jquery-ui.js"></script>
	
	
	
	<script>
		var isInMobileDetail = false;
		var isCameFromInterval = false;
		var  refreshPeriodSetted = false;
		var intervaldeBekleyenIstekAdedi  = 0;
		var selectMobileAuto = false;
		
 	   	var autoSelectedMobile;
        $(document).ready(() => {
           
        	if ( window.history.replaceState ) {
            	//Anasayfada, sayfası yenile dediğimizde çıkan 
            	//yeniden form gönderme işlemini onayla alert'inin çıkmaması için eklenmiştir.
        		  window.history.replaceState( null, null,"index");
        		}
        	changActivePage(".mapPage");


            var count = 0;
            $('.search_form_container input').keyup((e) => {
                if ($('.search_form_container input').val() != ""){
                	//clearRefreshInterval();
                	count++;
	                	setTimeout(function(){ 
							count--;
							if(count == 0){	 
								vehicle_list_functions.search_in_map();
							}
	                	}, 1000);
                    }
                else
                    vehicle_list_functions.close_search_form();
            });

            setTimeout(function(){ 
            	$("#flxTtxt").css("display","none");
            	$("#flxTbr").css("display","none");
            }, 1500);

        });
        



        function katmanguncelle(elm) {
          
            return;
          } // katmanguncelle()

        var vehicleList = null;
        var mobileNo = null;
        var groupName;
        var queryMode;
        var alias;
        var sVehicles;
        var sPoints;
        var sAddresses;
        var isIntervalPaused = false;
		var username = '<%=username%>';
		var isNotFirstCallForFilter = false;
		var zoomLevel = 15;
		var interval = null;
		var filterId=null;
		var solAracListesiAcik = false;

        var vehicle_list_functions = {
            search_result_selected: (id, mode,x,y,f) => {
                if (mode == 1) {
                    $(".search_container").addClass("open");    

             	   	if(!vehicleList || vehicleList.length < 1){
                 	   	selectMobileAuto = true;
                 	   	autoSelectedMobile = id;
                 	   solAracListesiAcik = true;
             	   		vehicle_list_functions.search();
                 	}else{
                    	vehicle_list_functions.select_vehicle(id);
                   		vehicle_list_functions.close_search_form();
                 	}

                } else if (mode == 2) {
                    var m = sPoints.filter(a => a.id == id);
                    if (m && m.length > 0)
                        showMapCenteredWithMarkerAndZoomLocal(m[0].xCoor, m[0].yCoor);
                    	toogleMapBtnColor('icon_map_points',true);
                } else if (mode == 3) {
                    var m = sAddresses.filter(a => a.id == id);
                    if (m && m.length > 0){
                        m =  m[0];
            			var sugData = {
            					id:  m.id,
            					ft: m.fromTable,
            					x: m.yCoor,
            					y: m.xCoor
            			}
            			mainObject.setSugData(sugData);
                    	mainObject.showSugData();
                    }
                        
                        //showMapCenteredWithMarkerAndZoomLocal(m[0].xCoor, m[0].yCoor);
                }
            },
            search: (cameFromFilterBtn) => {

                groupName = $("#filter_vehicle_group").val();
                queryMode = $("input[name='radio']:checked").val();

                if(!solAracListesiAcik)
                    return false;

                if(!isCameFromInterval)
                	showLoading();

                var tempQueryMode = queryMode;
                if(queryMode != "1"){
                    if(queryMode != "0"){
                		filterId = queryMode == 3  ? 0 : (queryMode == 8  ?  1 : (queryMode == 4 ? 2 : 3));
                    }else if(queryMode == "0" && cameFromFilterBtn){
                    	filterId = null;
                    }
                    tempQueryMode = "0"; //Aktif araçlar normal çalışacak.
                }else{
                	filterId = null;
                }

				if(isNotFirstCallForFilter){ //  &&(queryMode == "1" || queryMode == "0") 2121
               		filterMap();
				}

				

            },

            filter: (status_id = null) => {
                console.log("Filter:" + status_id);
                var secilecek = 0;
				if(status_id == 1)
					secilecek = 3
				else if(status_id ==2)
					secilecek = 8
				else if(status_id == 0)
					secilecek = 4
				else if(status_id == -1)
					secilecek = 2
				else
					secilecek = 0
					
                $("#radio_"+secilecek).prop("checked", true);
                if(!status_id)
                    filterId = null;
                filterMap();
                
                if (status_id == null) {
                    $("#vehicle_list li").show();
                    return true;
                }

                $("#vehicle_list li:not([data-status='" + status_id + "'])").hide();
                $("#vehicle_list li[data-status='" + status_id + "']").show();
            },
            filter_by_group_name: (group_name = null) => {
                console.log("Filter: group_name = " + group_name);
                if (group_name == null) {
                    $("#vehicle_list li").show();
                    return true;
                }

                $("#vehicle_list li:not([data-group='" + group_name + "'])").hide();
                $("#vehicle_list li[data-group='" + group_name + "']").show();
            },
            filter_by_activity_status: (status = null) => {
                console.log("Filter: filter_by_activity_status = " + status);
                if (status == null) {
                    $("#vehicle_list li").show();
                    return true;
                }

                $("#vehicle_list li:not([data-activity-status='" + status + "'])").hide();
                $("#vehicle_list li[data-activity-status='" + status + "']").show();
            },
            select_vehicle: (to_select) => {
            	isInMobileDetail = true;
                $(".search_container .list_toggle").removeClass("active");
                $(".search_container .vehicle_list_container").removeClass("active");
                if(!$(".search_container .list_toggle").hasClass("vehicle_open"))
                	$(".vehicle_detail_container").slideToggle();

                var selectedMobile = vehicleList.filter(function(d) {
                    return d.mobile == to_select;
                });

                if (selectedMobile && selectedMobile.length > 0) {
                    selectedMobile = selectedMobile[0];
                }

                if(!$(".search_container .list_toggle").hasClass("vehicle_open"))
                	$(".search_container .list_toggle").addClass("vehicle_open");
            },
            toggle_vehicle_extra_info: () => {
                $(".vehicle_extra_info_container").slideToggle(200);
                $(".toggle_vehicle_extra_info").toggleClass("active");
            },
            switch_tab: (this_element, to_select) => {

                //The menu
                $(".tab_menu span").removeClass("active");
                $(this_element).addClass("active");

                //The summary header
                $(".vehicle_tab.active").fadeOut(100, function() {
                    $(this).removeClass("active");
                    $(".vehicle_info_tabs ." + to_select).fadeIn(100).addClass("active");
                });

            },
            toggle_list: () => {
                $(".search_container .list_toggle").toggleClass("active");
                $(".search_container .vehicle_list_container").toggleClass("active");

                $(".vehicle_detail_container").slideUp(function() {
                    vehicle_list_functions.check_search_container();
                });

                $(".search_container .list_toggle").removeClass("vehicle_open");
                //clearRefreshInterval();
                isInMobileDetail = false;
            },
            toggle_overview_chart: () => {
                $(".search_overview").toggleClass("active");
            },
            toggle_filter: () => {

                $(".filter_container").fadeToggle(200, function() {
                    vehicle_list_functions.check_search_container();
                    if ($(".filter_container").is(":visible")) {
                        $(".vehicle_list_container").css({
                            "max-height": $(".filter_container").height(),
                            "overflow": "hidden",
                            "padding": "0"
                        });
                    } else {
                        $(".vehicle_list_container").removeAttr("style");
                    }
                });

            },
            check_search_container: () => {
                if ($(".filter_container").is(":visible") || $(".vehicle_detail_container").is(":visible") || $(".vehicle_list_container").hasClass("active")){
                    $(".search_container").addClass("open");
                	solAracListesiAcik = true;
                	if(!isNotFirstCallForFilter){
                		intervaldeBekleyenIstekAdedi++;
                		vehicle_list_functions.search();
                    }
                }
                else {
                    $(".search_container").removeClass("open");
                    solAracListesiAcik = false;
                }
            },
            search_in_map: () => {
				console.log("search_in_map ok");
                $("body").addClass("no_scroll");
                $(".search_button").removeClass("active");
                $(".close_button").addClass("active");
                $(".search_results_outer_container").addClass("active");
                $(".search_overlay_bg").addClass("active");
                $(".search_container .scroll_container").addClass("no_scroll");
                vehicle_list_functions.disable_scroll();
                if (!$(".search_container .list_toggle").hasClass("active"))
                    $(".search_container .list_toggle").hide();

                var searchKey = $(".search_form_container input").val();

                $(".result_vehicles ul.vehicles_list").html("");
                $(".result_points ul.points_list").html("");
                $(".result_addresses ul.addresses_list").html("");

                var pattern = new RegExp(searchKey, 'gi');

                getSearchResult(searchKey,pattern);
                
                <!--Address-->
								

            },
            close_search_form: () => {
                vehicle_list_functions.release_scroll();
                $("body").removeClass("no_scroll");
                $('.search_form_container input').val("");
                $(".close_button").removeClass("active");
                $(".search_button").addClass("active");
                $(".search_results_outer_container").removeClass("active");
                $(".search_container .scroll_container").addClass("no_scroll");
                $(".search_overlay_bg").removeClass("active");
                if (!$(".search_container .list_toggle").hasClass("active"))
                    setTimeout(function() {
                        $(".search_container .list_toggle").show();
                    }, 400)
            },
            disable_scroll: () => {
                $('.search_container .scroll_container').bind("mousewheel", function() {
                    if ($('.search_container .scroll_container').hasClass('no_scroll')) {
                        return false;
                    }
                });
            },
            release_scroll: () => {
                $('.search_container .scroll_container').unbind("mousewheel");
            }
        };
     
        var showedTrips = {};
        var last;

        var addrsSuggest;

        function createRequestObject() {
            var browser = navigator.appName;
            if( browser == "Microsoft Internet Explorer" ) return( new ActiveXObject("Microsoft.XMLHTTP") );

            return( new XMLHttpRequest() );
        }
        
        function getSearchResult(suggestKeyword,pattern) {

        	console.log("suggestKeyword : " + suggestKeyword);
            if( suggestKeyword == "" ) return;
        	var getUrl = "https://suggestion.locationbox.com.tr/suggestion/ss?Keyword=" + encodeURIComponent(suggestKeyword) + "&Count=5"; savedKeyword = suggestKeyword; suggestKeyword = "";
            httpClient = createRequestObject();
            httpClient.open("GET", getUrl, true);

        	httpClient.onreadystatechange = function(){
        		if (httpClient.readyState == 4) {
        			if( httpClient.responseText ) {
        			  addrsSuggest = eval('(' + httpClient.responseText + ');');
        			  
                      sAddresses = [];
                      sAddresses = addrsSuggest.name;

                      $(".result_addresses ul.addresses_list").html("");

        			  var txt = '';
        			  for( var i = 0; i < addrsSuggest.length; i++ ) {
                          // var kalan = "";
                          var value = addrsSuggest[i].name;
                          //if (value) var kalan = value.replace(pattern, "<strong>" + value + "</strong>");
                          var val = '<span class="result_text">' + value + '</span>';
                          $(".result_addresses ul.addresses_list").append('<li><span class="icon_container"><i class="icon"></i></span><a href="javascript:;" onclick="suggestGoster(' + i + ');">' + val + '</a></li>');
        			  } // for()
        			} // if()
        		} // if()		
        	}
        	httpClient.send(null);
            return;
          } // getSearchResult()  
          
          
		  function suggestGoster(inx) {
		    window.scrollTo(0, 0);
		    var sugData = addrsSuggest[inx];

			mainObject.clearMap();
			if (sugData.ft == "IL" || sugData.ft == "ILCE" || sugData.ft == "MAHALLE"
					|| sugData.ft == "YOL") {
				mainObject.addJdbcTheme(sugData);
			} else if( sugData.ft == "POI") {
		      showMapCenteredWithMarkerAndZoomLocal(sugData.x, sugData.y);  
			} else if ( sugData.ft == "KAPI") {
			  showMapCenteredWithMarkerAndZoomLocal(sugData.x, sugData.y);
			} else if ( sugData.ft == "SEMT" ) {
			  showMapCenteredWithMarkerAndZoomLocal(sugData.x, sugData.y);
			}
		    toogleMapBtnColor('icon_map_points',true);
		    return;
		  } // suggestGoster()          
          
          
        function map_highlight_trip(km,mobile, st, end, avgSpeed, startDateMS,_this) {

            if (showedTrips[startDateMS]) {
                mainObject.hideTripOnMap();
                showedTrips[startDateMS] = false;
                isIntervalPaused = false;
                setSelectedTripsColor(false,_this);
            } else {
                if (!showedTrips.hasOwnProperty(startDateMS)) {
                    mainObject.hideTripOnMap();
                    showedTrips[last] = false;
                }
                last = startDateMS;
                mainObject.showTripOnMap(km,mobile, st, end);
                showedTrips[startDateMS] = true;
                isIntervalPaused = true;
	            setSelectedTripsColor(true,_this);
            }
                
        }

        function goToPageWithParameter(page) {
            location.replace(page + '?m=' + mobileNo);
        }

        
        function goToMobileLocation(x, y) {
            showMapCenteredAndZoom(x, y, zoomLevel, mainMapObject);
        }

        function showMapCenteredWithMarkerAndZoomLocal(x, y) {
            showMapCenteredWithMarkerAndZoomCustom(x, y, zoomLevel, mainMapObject,true);
        }

        function filterMap(){

            groupName = $("#filter_vehicle_group").val();
            var queryModeTemp;
            console.log("filterId : " + filterId);
            if(filterId != null && filterId != undefined)
            	 queryModeTemp = filterId == 0 ? 3 : (filterId == 1 ? 8 : (filterId == 2 ? 4 : 2));
            else
            	queryModeTemp = $("input[name='radio']:checked").val();
          	 
        	mainObject.setFilterMobilesCriterias(parseInt(queryModeTemp),username,groupName.toUpperCase());
        	mainObject.filterMobiles();
        }

        

        function getAndSetFavoriteReports(mobileNo){
            $.ajax({
                url: "reports/getFavoriteReports",
                data: {
                    "mobile": mobileNo
                },
                type: "GET",
                dataType: 'json',
                success: function(data) {
                    var favorite_reports;
                    if (data && data.data) {
                    	favorite_reports = data.data;
                    }

					if(favorite_reports && favorite_reports.length > 0){
						$(".vehicle_tab.vehicle_report .widget_content").html("").html("<ul class='list favorite_reports_list'></ul>");
						$.each(favorite_reports,(key,data)=>{
							$(".vehicle_tab.vehicle_report .widget_content ul").append("<li class='favorite_report_item list_item'> <a href='reports?vehicle_id="+mobileNo+"&report_id="+data.rowno+"'>"+data.report_name+"</a></li>");
						});
					}else{
						$(".vehicle_tab.vehicle_report .widget_content").html("<p><spring:message code='indexFavoritesMessage' /></p>");	
					}

                },
                error: function(xhr) {
                    //Do Something to handle error
                }
            });
        }


		toogleMapBtnColor('icon_map_vehicle',true);
		toogleMapBtnColor('icon_map_tag',true);
		toogleMapBtnColor('icon_map_tag',false);



		function setSelectedTripsColor(select,_this){
				$(".list .list_item_trip").removeClass("active");
			if(select) {
				$(_this).addClass("active");
			}
		}
		
		mainObject.mobilesClick = function (pos){
			var mobileId = parseInt(parseFloat(pos.feature.attributes["ID"]));
			var mouseLocOri = mainMapObject.getCursorLocation();
			var mouseLoc = mouseLocOri.transform(8307);
			var x = mouseLoc.coordinates[0];
			var y = mouseLoc.coordinates[1];

			vehicle_list_functions.search_result_selected(mobileId,1,x,y);
		}

		mainObject.addCustomerRegionFinish = function(data) {
			var transOr = redline.getGeometry();
			var trans = transOr.coordinates[0];
			var poly = new OM.geometry.Polygon(trans, 3857);
			poly = poly.transform(8307);
			var newPolygonStyle = new OM.style.Color({
				styleName : "polygonToolStyle",
				fillOpacity : 0.7,
				stroke : "#ff00C0",
				fill : "#0000FF",
				strokeThickness : 3
			});
			redline.setStyle({
				type : OM.tool.RedlineTool.TYPE_POLYGON,
				style : newPolygonStyle
			});
			
			var newRegionCoords = poly.coordinates[0];


			var dataT;
			if(newRegionCoords && newRegionCoords.length > 2){
				newRegionCoords = newRegionCoords.join("&&&&");
				dataT = {key: "regionIdTemp", val: newRegionCoords};
			}else{
				return false;
			}

			setSession("region_settings",dataT);
		}
		
		mainObject.custRegionClick = function(pos) {
			var dataT;
			if(pos && pos.feature &&  pos.feature.attributes){
				var regionId = pos.feature.attributes["ID"];
				dataT = {key: "regionId", val: regionId};
			}else{
				return false;
			}
			setSession("region_settings",dataT);
		}

		mainObject.addCustomerPoint = function(actionEvent) {
			mainMapObject.closeInfoWindows();
			var mouseLoc = mainMapObject.getCursorLocation();
			mouseLoc = mouseLoc.transform(8307);

			var x = mouseLoc.coordinates[0];
			var y = mouseLoc.coordinates[1];

			if(!x || !y){
				return false;
			}

			dataT = {key: "pointIdTemp", val: x + "&&&&"+ y};
			
            setSession("point_settings",dataT);
			
		}

		mainObject.custPointClick = function(pos) {
			var dataT;
			if(pos && pos.feature &&  pos.feature.attributes){
				var pointId = pos.feature.attributes["ID"];
				dataT = {key: "pointId", val: pointId};
			}else{
				return false;
			} 

			setSession("point_settings",dataT);
		}

		mainObject.custRouteClick = function (pos){
			var dataT;
			if(pos && pos.feature &&  pos.feature.attributes){
				var rotaId = pos.feature.attributes["ROTA ID"];
				dataT = {key: "routeId", val: rotaId};
			}else if(pos) {
				dataT = {key: "pathId", val: pos};
			}else{
				return false;
			}

			setSession("route_settings",dataT);
		}

		mainObject.routeClick = function (pos){
			var dataT;
			if(pos && pos.feature &&  pos.feature.attributes){
				var rotaId = pos.feature.attributes["ID"];
				dataT = {key: "pathId", val: rotaId};
			}else if(pos) {
				dataT = {key: "pathId", val: pos};
			}else{
				return false;
			}

			setSession("route_settings",dataT);
		}


		function initMap(){
            mainObject.setMobileCount(10);
            mainObject.startUp('<%=username%>','<%=comp%>');

            mainObject.setLyrTheme(mainMapObject,0, "cp_total", "MAPLINK20", "CP_TOTAL", [ 1 ], true, mainObject.mouseClickInfo);
           
            /*if (mobileCount >= 1000) {
            	toogleMapBtnColorMobile();
            }*/
		}

		initMap();

		function setSession(adrHref,dataT){
			showLoading();
            $.ajax({
                url: "index/setSession",
                data: dataT,
                type: "GET",
                dataType: 'json',
                success: function(data) {
                	if(data && data.succes){
						location.href = adrHref;
					}else if(data && !data.succes && data.data == 0){
						BASE.show_info_messages("warning","<spring:message code='warning' />",data.message);
					}  

                	hideLoading();
                },
                error: function(xhr) {
                	hideLoading();
                }
            });
		}

        function defineScroolFunc(){
			var offset = $('.scroll_container li').length;
			$('.scroll_container').endlessScroll({
				fireOnce: false,
				fireDelay: false,
				loader: '',
				insertAfter: '.scroll_container li:last',
				content: function(i) {
					return loadMore();
				}
			});
        }


    </script>
</body>

</html>