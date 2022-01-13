<%@ page language="java" import="java.lang.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@page import="com.infotech.config.Utils"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<script type="text/javascript">
var mainMapObject;
var username;
var routeTheme;
var distanceTool;
var myEvent;
var mapInfoEvent;
var routePointFOIStyleName_Start = __mapStylesDataSourceName + ".M.N_ROUTE_START";
var routePointFOIStyleName_End = __mapStylesDataSourceName + ".M.N_ROUTE_END";
var routePointFOIStyleName_Middle = __mapStylesDataSourceName + ".M.N_ROUTE_MIDDLE";
var themeAnimateIconUrlMain = ___applicationName + "/images/mycompany/imagesmenu/" + "pinTracker2.png";
var routePointFOIs = new Array();
var middlePointList = new Array();
var middlePoints = new Array();
var startRoutePoint;
var endRoutePoint;
var tmctheme;
var tmcOn = false;
var trafficEventsTheme;
var cpTheGroupname;
var cpTheQueryMode;
var cpTheUsername;
var jdbcTheme;
var labelMode = false;// default mobil etiketi aciktir.
var labelModeRegion = false;// default bolge,nokta etiketi kapalidir.
var redline;
var moveCustId = 0;
var mainImageFolder;
var printCallback = null;
var temizleFlag = 1;
var temizleFlagRectangle = 1;
var themeFlag = 1;
var backSpace = 1;
var rectangleTool;
var mobileCount = 1;
var tripTheme;
var themeName = 'tripTheme';
var sugData;
var cpTheQueryMode;
var cpTheUsername;
var cpTheGroupname;
var numberStyleEnd;

var selectedTripKm;
gotoStartPointOrZoomToThemeSiniri = 2;

var themeLineStartName = themeName + "_linestart";
var themeLineEndName = themeName + "_lineend";
var numberStyle1;
var tripStyle1;


var themeLineName = "main_themeLineName";

var mapConfig = {
	"mapTileLayer" : "OSM_MERCATOR",
	"format" : "PNG",
	"coordSys" : {
		"srid" : 3857,
		"type" : "PROJECTED",
		"distConvFactor" : 1.0,
		"minX" : -2.0037508E7,
		"minY" : -2.0037508E7,
		"maxX" : 2.0037508E7,
		"maxY" : 2.0037508E7
	},
	"zoomLevels" : [ {
		"zoomLevel" : 0,
		"name" : "",
		"tileWidth" : 2.0037508E7,
		"tileHeight" : 2.0037508E7,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 1,
		"name" : "",
		"tileWidth" : 1.0018754E7,
		"tileHeight" : 1.0018754E7,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 2,
		"name" : "",
		"tileWidth" : 5009377.0,
		"tileHeight" : 5009377.0,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 3,
		"name" : "",
		"tileWidth" : 2504688.5,
		"tileHeight" : 2504688.5,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 4,
		"name" : "",
		"tileWidth" : 1252344.25,
		"tileHeight" : 1252344.25,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 5,
		"name" : "",
		"tileWidth" : 626172.125,
		"tileHeight" : 626172.125,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 6,
		"name" : "",
		"tileWidth" : 313086.0625,
		"tileHeight" : 313086.0625,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 7,
		"name" : "",
		"tileWidth" : 156543.03125,
		"tileHeight" : 156543.03125,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 8,
		"name" : "",
		"tileWidth" : 78271.515625,
		"tileHeight" : 78271.515625,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 9,
		"name" : "",
		"tileWidth" : 39135.7578125,
		"tileHeight" : 39135.7578125,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 10,
		"name" : "",
		"tileWidth" : 19567.87890625,
		"tileHeight" : 19567.87890625,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 11,
		"name" : "",
		"tileWidth" : 9783.939453125,
		"tileHeight" : 9783.939453125,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 12,
		"name" : "",
		"tileWidth" : 4891.9697265625,
		"tileHeight" : 4891.9697265625,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 13,
		"name" : "",
		"tileWidth" : 2445.98486328125,
		"tileHeight" : 2445.98486328125,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 14,
		"name" : "",
		"tileWidth" : 1222.992431640625,
		"tileHeight" : 1222.992431640625,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 15,
		"name" : "",
		"tileWidth" : 611.4962158203125,
		"tileHeight" : 611.4962158203125,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 16,
		"name" : "",
		"tileWidth" : 305.74810791015625,
		"tileHeight" : 305.74810791015625,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 17,
		"name" : "",
		"tileWidth" : 152.87405395507812,
		"tileHeight" : 152.87405395507812,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	}, {
		"zoomLevel" : 18,
		"name" : "",
		"tileWidth" : 76.43702697753906,
		"tileHeight" : 76.43702697753906,
		"tileImageWidth" : 256,
		"tileImageHeight" : 256
	} ]
};

var lyrTheme;

Main = function() {
	this.custRegionTheme = null;
	this.custRegionThemeObj = null;
	this.custTheme = null;
	this.custThemeEtkiAlani = null;
	this.custRouteTheme = null;
	this.custRouteThemeObj = null;
	this.userTheme = null;
	this.userTheme1 = null;
	this.userTheme2 = null;
	this.routeTheme = null;
	this.ilTheme = null;
	this.ilceTheme = null;
	this.mahalleTheme = null;
	this.yolTheme = null;
	this.weatherTheme = null;
	this.infBaseMap = null;
	this.hereBasemap = null;
	this.infTransparentBaseMap = null;
	this.tripTheme = null;
	this.lyrTheme = new Array(128);
}

var mainObject = new Main();

Main.prototype.setMobileCount = function(count){
	mobileCount = count;
}

Main.prototype.startUp = function(username, company) {
	// mainObject.setCurrentDate();
	// mainObject.loadMobiles();
	OM.gv.setResourcePath(__oracleMapsUrlbase + "/jslib/v2/");
	var mainMapDiv = document.getElementById('mainMap');
	
	this.themeLineStartName = themeLineStartName;
	this.themeLineEndName = themeLineEndName;
	this.themeLineName = themeLineName;
	this.tripPointLayerIndexes = [];
	// var component = actionEvent.getSource();
	// mainImageFolder = component.getProperty('imageFolder');
	username = username;
	var company = company;
	// mobileCount = component.getProperty('mobileCount');
	mainMapObject = new OM.Map(mainMapDiv, {
		mapviewerURL : __oracleMapsUrlbase,
		autoLoadCss : false
	});
	// tilelayer
	this.infBaseMap = new OM.layer.TileLayer("baseMap", {
		dataSource : "INFOMAP",
		tileLayer : "INFOTECH_TILELAYER",
		tileServerURL : __oracleMapsUrlbase + "/mcserver"
	});

	this.infBaseMap.setVisible(true);
	mainMapObject.addLayer(this.infBaseMap);
	mainMapObject.setMapCenter(new OM.geometry.Point(29.1, 41.1, 8307));
	mainMapObject.setMapZoomLevel(18);

	this.hereBasemap = new OM.layer.GoogleTileLayer("hereBaseMap", {
		key : __googleKey,
		mapType : OM.layer.GoogleTileLayer.TYPE_SATELLITE,
		tilt : 0
	});

	// this.hereBasemap.setZoomLevelOffset(1);
	this.hereBasemap.setVisible(false);
	// this.mainMapObject.addLayer(this.hereBasemap);
	// this.hereBasemap.setVisible(false);

	this.infTransparentBaseMap = new OM.layer.TileLayer(
			"infTransparentBaseMap", {
				dataSource : "INFOMAP",
				tileLayer : "INFOTECH_TILELAYER_TURKEY_H",
				tileServerURL : __oracleMapsUrlbase + "/mcserver"
			});
	// this.infTransparentBaseMap.setVisible(false);
	// this.mainMapObject.addLayer(this.infTransparentBaseMap);
	// this.infTransparentBaseMap.setZoomLevelRange(0,50);
	this.infTransparentBaseMap.setVisible(false);

	// Lejant panel
	var html = '<table height="100%" width="100%" class="white">';
	html += '  <tr><td>&nbsp;</td><td style="width:60px; background: #DB0000; border-color: #00FF00; margin: 5px;"></td><td style="width: 50px;">0-10</td></tr><tr><td colspan="2"></td></tr><tr><td colspan="3"></td></tr>';
	html += '  <tr><td>&nbsp;</td><td style="width:60px; background: #FF9900; border-color: #E6ABAB; margin: 5px;"></td><td style="width: 50px;">10-30</td></tr><tr><td colspan="2"></td></tr><tr><td colspan="3"></td></tr>';
	html += '  <tr><td>&nbsp;</td><td style="width:60px; background: #00CC00; border-color: #FD6868; margin: 5px;"></td><td style="width: 50px;">30-60</td></tr><tr><td colspan="2"></td></tr><tr><td colspan="3"></td></tr>';
	html += '  <tr><td>&nbsp;</td><td style="width:60px; background: #00FF00; border-color: #DB0000; margin: 5px;"></td><td style="width: 50px;">60 +</td></tr><tr><td colspan="2"></td></tr><tr><td colspan="3"></td></tr>';

	// navigational panel
	var navigationPanelBar = new OM.control.NavigationPanelBar();
	mainMapObject.addMapDecoration(navigationPanelBar);

	// scale bar
	var mapScaleBar = new OM.control.ScaleBar();
	mainMapObject.addMapDecoration(mapScaleBar);

	// copyright note
	var copyright = new OM.control.CopyRight({
		anchorPosition : 6,
		textValue : __copyRightNote,
		fontSize : 12,
		fontFamily : "Arial",
		fontColor : "black"
	});
	// this.mainMapObject.addMapDecoration(copyright);

	// set map zoom level
	showMapCenteredAndZoom(35.24, 38.95, 5, mainMapObject);

	// rightClick add listener
	// this.myEvent = actionEvent;
	// mainMapObject.addListener(OM.event.MouseEvent.MOUSE_RIGHT_CLICK,
	// mainObject.mouseRightClick);
	mainMapObject.init();
	// this.mainMapObject.addListener(OM.event.MapEvent.MAP_RECENTERED,
	// mainObject.updateTrafficView);
	// this.mainMapObject.addListener(OM.event.MapEvent.MAP_AFTER_ZOOM,
	// mainObject.updateTrafficView);

	setTimeout(function() {

		console.log("merhaba ....");
		// route_path
		mainObject.routeTheme = new OM.layer.VectorLayer("custRouteTheme", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_ROUTE_PATH",
				url : __oracleMapsUrlbase
			}
		});
		mainObject.routeTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK,
				mainObject.routeClick);
		mainObject.routeTheme.setQueryParameters(0);
		mainObject.routeTheme.setVisible(true);
		mainMapObject.addLayer(mainObject.routeTheme);

		// route
		mainObject.custRouteTheme = new OM.layer.VectorLayer("routeTheme", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_F_ROUTE_COMP",
				url : __oracleMapsUrlbase
			}
		});
		mainObject.custRouteTheme.setQueryParameters(company);
		mainObject.custRouteTheme.setVisible(false);
		mainObject.custRouteTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK,
				mainObject.custRouteClick);
		this.mainMapObject.addLayer(mainObject.custRouteTheme);
		// routeObj(rotalar haritaya git icin)
		mainObject.custRouteThemeObj = new OM.layer.VectorLayer("routeTheme2",
				{
					infoWindow : false,
					def : {
						type : OM.layer.VectorLayer.TYPE_PREDEFINED,
						dataSource : __mapDataSource,
						theme : "N_F_ROUTE_OBJ",
						url : __oracleMapsUrlbase
					}
				});
		mainObject.custRouteThemeObj.setQueryParameters(company);
		mainObject.custRouteThemeObj.setVisible(false);
		this.mainMapObject.addLayer(mainObject.custRouteThemeObj);

		// point
		mainObject.custTheme = new OM.layer.VectorLayer("custTheme", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_F_CPOINT_COMP",
				url : __oracleMapsUrlbase
			}
		});
		mainObject.custTheme.setQueryParameters(company);
		mainObject.custTheme.setVisible(false);
		mainObject.custTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK,
				mainObject.custPointClick);
		this.mainMapObject.addLayer(mainObject.custTheme);

		// point etki alani
		mainObject.custThemeEtkiAlani = new OM.layer.VectorLayer(
				"custThemeEtkiAlani", {
					infoWindow : false,
					def : {
						type : OM.layer.VectorLayer.TYPE_PREDEFINED,
						dataSource : __mapDataSource,
						theme : "N_F_CPOINT_COMP_ETKIALANI",
						url : __oracleMapsUrlbase
					}
				});
		mainObject.custThemeEtkiAlani.setQueryParameters(company);
		mainObject.custThemeEtkiAlani.setVisible(false);
		mainObject.custThemeEtkiAlani.addListener(
				OM.event.MouseEvent.MOUSE_CLICK, mainObject.custPointClick);
		this.mainMapObject.addLayer(mainObject.custThemeEtkiAlani);

		// region
		mainObject.custRegionTheme = new OM.layer.VectorLayer(
				"custRegionTheme", {
					infoWindow : false,
					def : {
						type : OM.layer.VectorLayer.TYPE_PREDEFINED,
						dataSource : __mapDataSource,
						theme : "N_F_REGION_COMP",
						url : __oracleMapsUrlbase
					}
				});
		mainObject.custRegionTheme.setQueryParameters(company);
		mainObject.custRegionTheme.setVisible(false);
		mainObject.custRegionTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK,
				mainObject.custRegionClick);
		this.mainMapObject.addLayer(mainObject.custRegionTheme);

		// region(bolgeler haritaya git icin)
		mainObject.custRegionThemeObj = new OM.layer.VectorLayer(
				"custRegionTheme2", {
					infoWindow : false,
					def : {
						type : OM.layer.VectorLayer.TYPE_PREDEFINED,
						dataSource : __mapDataSource,
						theme : "N_F_REGION_OBJ",
						url : __oracleMapsUrlbase
					}
				});
		mainObject.custRegionThemeObj.setVisible(false);
		this.mainMapObject.addLayer(mainObject.custRegionThemeObj);

		this.tripTheme = new OM.layer.VectorLayer(themeName, {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_MAP_THEME_TRIP",
				url : __oracleMapsUrlbase
			}
		});
		this.mainMapObject.addLayer(this.tripTheme);

		// this.tripTheme.setVisible(false);

		// mobiles
		if (!cpTheQueryMode) {
			cpTheQueryMode = 0;
			cpTheUsername = username;
			cpTheGroupname = 'HEPSI';
		}

		if (mobileCount < 1000) {
			// userTheme
			mainObject.userTheme1 = new OM.layer.VectorLayer("userTheme", {
				infoWindow : false,
				def : {
					type : OM.layer.VectorLayer.TYPE_PREDEFINED,
					dataSource : __mapDataSource,
					theme : "N_MAP_THEME_USER_MOBILE",
					url : __oracleMapsUrlbase,
					loadOnDemand : false
				}
			});
			mainObject.userTheme1.setLabelColumn(mobileMapLabel);

			mainObject.userTheme1.setQueryParameters(cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheUsername,
					cpTheGroupname);
			mainObject.userTheme1.setLabelsVisible(labelMode);
			
			mainObject.userTheme1.addListener(OM.event.MouseEvent.MOUSE_CLICK,
					mainObject.mobilesClick);
			mainObject.userTheme1.setVisible(true);
			// mainObject.userTheme1.setBoundingTheme(true);
			mainObject.userTheme1.setBringToTopOnMouseOver(true);
			mainObject.userTheme1.enableDisplayInBatch(true, {
				interval : 5,
				numberInBatch : 1000
			});
			// mainObject.userTheme1.setOpacity(0.6);
			// mainObject.userTheme1.setLabelColumn("ID");
			mainObject.userTheme1.setLabelingStyle(new OM.style.Text({
				styleName : "txt",
				fill : "#000000",
				fontFamily : "Arial Rounded MT",
				fillOpacity : 50,
				fontSize : 10,
				sizeUnit : "pixel",
				fontStyle : OM.style.Text.FONTSTYLE_NORMAL,
				fontWeight : OM.Text.FONTWEIGHT_NORMAL
			}));
			this.mainMapObject.addLayer(mainObject.userTheme1);
			mainObject.userTheme = mainObject.userTheme1;
			mainObject.userTheme.setLabelsVisible(labelMode);
			mainObject.userTheme.zoomToTheme();

			mainObject.userTheme2 = new OM.layer.VectorLayer("userTheme2", {
				infoWindow : false,
				def : {
					type : OM.layer.VectorLayer.TYPE_PREDEFINED,
					dataSource : __mapDataSource,
					theme : "N_MAP_THEME_USER_MOBILE",
					url : __oracleMapsUrlbase,
					loadOnDemand : false
				}
			});
			mainObject.userTheme2.setLabelColumn(mobileMapLabel);
			
			OM.style.StyleStore.getServerSideStyle(__mapDataSource,
					"M.N_HISTORY_START", {
						url : __oracleMapsUrlbase,
						callback : function(rangeBuckets) {
							numberStyle1 = rangeBuckets;
						}
					});
		    OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_HISTORY_END", 
		            {
		                url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
		                    numberStyleEnd=rangeBuckets;
		                }
		            });

            OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HISTORY_01", 
                    {
                        url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                     	   tripStyle1=rangeBuckets;
                        }
                    });
			

			mainObject.userTheme2.setQueryParameters(cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheUsername,
					cpTheGroupname);
			mainObject.userTheme2.addListener(OM.event.MouseEvent.MOUSE_CLICK,
					mainObject.mobilesClick);
			mainObject.userTheme2.setLabelsVisible(labelMode);
			mainObject.userTheme2.setVisible(false);
			mainObject.userTheme2.setBoundingTheme(true);
			mainObject.userTheme2.setBringToTopOnMouseOver(true);
			mainObject.userTheme2.enableDisplayInBatch(true, {
				interval : 5,
				numberInBatch : 1000
			});
			// mainObject.userTheme2.setLabelColumn("ALIAS");
			// mainObject.userTheme2.setLabelsVisible(false);
			mainObject.userTheme2.setLabelingStyle(new OM.style.Text({
				styleName : "txt",
				fill : "#000000",
				fontFamily : "Arial Rounded MT",
				fillOpacity : 50,
				fontSize : 10,
				sizeUnit : "pixel",
				fontStyle : OM.style.Text.FONTSTYLE_NORMAL,
				fontWeight : OM.Text.FONTWEIGHT_NORMAL
			}));
			this.mainMapObject.addLayer(mainObject.userTheme2);
		} else {
			//var bt = AdfPage.PAGE.findComponent('ctbnav01');
			//bt.setIcon("images/mycompany/imagesmenu/nav01.png");
		}

	}, 500);
	// guvenlik ve diger alarm kontrolu. (alarm iconu cikarmak icin)
	/*
	 * setTimeout(function () { AdfCustomEvent.queue(myEvent.getSource(),
	 * "initializeAndCheck", { }, true); }, 1000);
	 */
	return;

}

// ------------------------------------
Main.prototype.getMapInfo = function() {
	// var bt = AdfPage.PAGE.findComponent('ctbnav08');
	// bt.setIcon("images/mycompany/imagesmenu/nav08_a.png");
	mainMapObject.addListener(OM.event.MouseEvent.MOUSE_CLICK,
			mainObject.mouseClickInfo);
}
// getPointGeometryObject
// ---------------------------------------
Main.prototype.mouseRightClick = function() {
	var mouseLocOri = mainMapObject.getCursorLocation();
	var mouseLoc = mouseLocOri.transform(8307);
	AdfCustomEvent.queue(myEvent.getSource(), "getMapRightClick", {
		x : mouseLoc.coordinates[0],
		y : mouseLoc.coordinates[1],
		xOri : mouseLocOri.coordinates[0],
		yOri : mouseLocOri.coordinates[1]
	}, true);

}

// -----------------------------------------------
Main.prototype.switchSat = function() {
	// var satellite = document.getElementById('satellite');
	if (this.hereBasemap.visible) {
		this.hereBasemap.setVisible(false);
		this.infTransparentBaseMap.setVisible(false);
		mainMapObject.addLayer(this.infBaseMap);
		this.infBaseMap.setVisible(true);
		mainObject.updateTrafficView();
		// satellite.style.background = "";
	} else {
		this.infBaseMap.setVisible(false);
		mainMapObject.addLayer(this.hereBasemap);
		mainMapObject.addLayer(this.infTransparentBaseMap);
		this.hereBasemap.setVisible(true);
		mainObject.updateTrafficView();
		mainMapObject.removeLayer(this.infBaseMap);
		// satellite.style.background = "#2979FF";
		this.infTransparentBaseMap.setVisible(true);
	}
}

Main.prototype.mouseCustPointRightClick = function(coorY, coorX, custId) {
	AdfCustomEvent.queue(myEvent.getSource(), "getCustPointRightClick", {
		x : coorX,
		y : coorY,
		id : custId
	}, true);
}

Main.prototype.mouseMobileRightClick = function(coorY, coorX, custId, alias) {
	var point = new OM.geometry.Point(coorX, coorY, 3857);
	point = point.transform(8307);
	AdfCustomEvent.queue(myEvent.getSource(), "getMouseMobileRightClick", {
		x : point.coordinates[0],
		y : point.coordinates[1],
		id : custId
	}, true);
}

// ------------------------------------------------------------
Main.prototype.mouseLocationInfoClick = function(coorY, coorX, custId, alias) {
	if (coorY && coorX) {
		var point = new OM.geometry.Point(coorX, coorY, 3857);
		point = point.transform(8307);

		AdfCustomEvent.queue(myEvent.getSource(), "getMouseLocationInfoClick",
				{
					x : point.getX(),
					y : point.getY(),
					id : custId
				}, true);
	}
}

// ------------------------------------------------------------
Main.prototype.showRoute = function(id) {
	mainObject.routeTheme.setVisible(true);
	mainObject.routeTheme.setQueryParameters(id);
	mainObject.routeTheme.zoomToTheme();
}

// -------------------------------------------------------------
Main.prototype.mouseCustRegionRightClick = function(coorY, coorX, custId) {
	AdfCustomEvent.queue(myEvent.getSource(), "getCustRegionRightClick", {
		x : coorX,
		y : coorY,
		id : custId
	}, true);
}

Main.prototype.mouseClickInfo = function() {
	// var bt = AdfPage.PAGE.findComponent('ctbnav08');
	mainMapObject.deleteListener(OM.event.MouseEvent.MOUSE_CLICK,
			mainObject.mouseClickInfo);
	var mouseLocOri = mainMapObject.getCursorLocation();
	var mouseLoc = mouseLocOri.transform(8307);

	var mapData = {
		x : mouseLoc.coordinates[0],
		y : mouseLoc.coordinates[1],
		xOri : mouseLocOri.coordinates[0],
		yOri : mouseLocOri.coordinates[1]
	}
	$.ajax({
		type : "POST",
		url : "getMapInfo",
		data : mapData,
		success : function(result) {
			alert(result);
		},
		error : function(result) {
		}
	});
}

Main.prototype.showCustomerPoints = function() {
	if (mainObject.custTheme && mainObject.custTheme.visible) {
		mainObject.custTheme.setVisible(false);
		return;
	}
	mainObject.custTheme.setVisible(true);
	mainObject.custTheme.refresh(false);
	return;
}

Main.prototype.showCustPointsTolerance = function(actionEvent) {
	var bt = AdfPage.PAGE.findComponent('l3');
	if (mainObject.custThemeEtkiAlani.visible) {
		mainObject.custThemeEtkiAlani.setVisible(false);
		bt.setIcon(mainImageFolder + "/imagesmenu/nav20.png");
		return;
	}
	mainObject.custThemeEtkiAlani.setVisible(true);
	actionEvent.cancel();
	bt.setIcon(mainImageFolder + "/imagesmenu/nav20_a.png");
	return;
}

Main.prototype.showCustomerPointsAfterAdd = function(company) {
	mainObject.custTheme.refresh(false);
	mainObject.custTheme.setQueryParameters(company);
	mainObject.custTheme.setVisible(true);
	return;
}

// ---------------------------------------------------
Main.prototype.showCustomerRegions = function() {
	if (mainObject.custRegionTheme && mainObject.custRegionTheme.visible) {
		mainObject.custRegionTheme.setVisible(false);
		return;
	}
	mainObject.custRegionTheme.setVisible(true);
	mainObject.custRegionTheme.refresh(false);
	return;
}

// ---------------------------------------------------
Main.prototype.showCustomerRegionsAfterAdd = function(company) {
	mainObject.custRegionTheme.setVisible(true);
	mainObject.custRegionTheme.refresh(false);

	return;
}

Main.prototype.setFilterMobilesCriterias = function(mode, username, groupname) {
	cpTheQueryMode = mode;
	cpTheUsername = username;
	cpTheGroupname = groupname;
}

Main.prototype.loadMobileThemes = function() {
	mainObject.userTheme1 = new OM.layer.VectorLayer("userTheme", {
		infoWindow : false,
		def : {
			type : OM.layer.VectorLayer.TYPE_PREDEFINED,
			dataSource : __mapDataSource,
			theme : "N_MAP_THEME_USER_MOBILE",
			url : __oracleMapsUrlbase,
			loadOnDemand : false
		}
	});
	mainObject.userTheme1.setLabelColumn(mobileMapLabel);

	mainObject.userTheme1.setQueryParameters(cpTheQueryMode,
			cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
			cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
			cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
			cpTheQueryMode, cpTheQueryMode, cpTheUsername,
			cpTheGroupname);
	mainObject.userTheme1.setLabelsVisible(false);
	mainObject.userTheme1.addListener(OM.event.MouseEvent.MOUSE_CLICK,
			mainObject.mobilesClick);
	mainObject.userTheme1.setVisible(false);
	// mainObject.userTheme1.setBoundingTheme(true);
	mainObject.userTheme1.setBringToTopOnMouseOver(true);
	mainObject.userTheme1.enableDisplayInBatch(true, {
		interval : 5,
		numberInBatch : 1000
	});
	// mainObject.userTheme1.setOpacity(0.6);
	// mainObject.userTheme1.setLabelColumn("ID");
	mainObject.userTheme1.setLabelingStyle(new OM.style.Text({
		styleName : "txt",
		fill : "#000000",
		fontFamily : "Arial Rounded MT",
		fillOpacity : 50,
		fontSize : 10,
		sizeUnit : "pixel",
		fontStyle : OM.style.Text.FONTSTYLE_NORMAL,
		fontWeight : OM.Text.FONTWEIGHT_NORMAL
	}));
	mainMapObject.addLayer(mainObject.userTheme1);
	mainObject.userTheme = mainObject.userTheme1;
	mainObject.userTheme.setLabelsVisible(false);

	mainObject.userTheme2 = new OM.layer.VectorLayer("userTheme2", {
		infoWindow : false,
		def : {
			type : OM.layer.VectorLayer.TYPE_PREDEFINED,
			dataSource : __mapDataSource,
			theme : "N_MAP_THEME_USER_MOBILE",
			url : __oracleMapsUrlbase,
			loadOnDemand : false
		}
	});
	mainObject.userTheme2.setLabelColumn(mobileMapLabel);
	
	
	OM.style.StyleStore.getServerSideStyle(__mapDataSource,
			"M.N_HISTORY_START", {
				url : __oracleMapsUrlbase,
				callback : function(rangeBuckets) {
					numberStyle1 = rangeBuckets;
				}
			});
    OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_HISTORY_END", 
            {
                url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                    numberStyleEnd=rangeBuckets;
                }
            });

    OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HISTORY_01", 
            {
                url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
             	   tripStyle1=rangeBuckets;
                }
            });
	

	mainObject.userTheme2.setQueryParameters(cpTheQueryMode,
			cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
			cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
			cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
			cpTheQueryMode, cpTheQueryMode, cpTheUsername,
			cpTheGroupname);
	mainObject.userTheme2.addListener(OM.event.MouseEvent.MOUSE_CLICK,
			mainObject.mobilesClick);
	mainObject.userTheme2.setLabelsVisible(false);
	mainObject.userTheme2.setVisible(false);
	mainObject.userTheme2.setBoundingTheme(true);
	mainObject.userTheme2.setBringToTopOnMouseOver(true);
	mainObject.userTheme2.enableDisplayInBatch(true, {
		interval : 5,
		numberInBatch : 1000
	});
	// mainObject.userTheme2.setLabelColumn("ALIAS");
	// mainObject.userTheme2.setLabelsVisible(false);
	mainObject.userTheme2.setLabelingStyle(new OM.style.Text({
		styleName : "txt",
		fill : "#000000",
		fontFamily : "Arial Rounded MT",
		fillOpacity : 50,
		fontSize : 10,
		sizeUnit : "pixel",
		fontStyle : OM.style.Text.FONTSTYLE_NORMAL,
		fontWeight : OM.Text.FONTWEIGHT_NORMAL
	}));
	mainMapObject.addLayer(mainObject.userTheme2);
}



Main.prototype.filterMobiles = function() {
	if(!mainObject || !mainObject.userTheme || !mainObject.userTheme1 || !mainObject.userTheme2)
		return false;
		//mainObject.loadMobileThemes();
	
	mainObject.userTheme.setQueryParameters(cpTheQueryMode, cpTheQueryMode,
			cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
			cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
			cpTheQueryMode, cpTheQueryMode, cpTheUsername, cpTheGroupname);
	mainObject.userTheme.refresh(true);

	if (mainObject.userTheme1.isVisible()) {
		mainObject.userTheme2.setQueryParameters(cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheUsername,
				cpTheGroupname);
		mainObject.userTheme2.refresh(true);
	}
	if (mainObject.userTheme2.isVisible()) {
		mainObject.userTheme1.setQueryParameters(cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheUsername,
				cpTheGroupname);
		mainObject.userTheme1.refresh(true);
	}

}

Main.prototype.showMobiles = function() {
	// var mobileIcon = document.getElementsByClassName('icon_map_tag')[0];
	if (mainObject.userTheme1 == null) {
		// userTheme
		mainObject.userTheme1 = new OM.layer.VectorLayer("userTheme", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_MAP_THEME_USER_MOBILE",
				url : __oracleMapsUrlbase,
				loadOnDemand : false
			}
		});

		mainObject.userTheme1.setQueryParameters(cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheUsername,
				cpTheGroupname);
		mainObject.userTheme1.setLabelsVisible(labelMode);
		mainObject.userTheme1.setLabelColumn(mobileMapLabel);
		
		mainObject.userTheme1.addListener(OM.event.MouseEvent.MOUSE_CLICK,
				mainObject.mobilesClick);
		mainObject.userTheme1.enableDisplayInBatch(true, {
			interval : 5,
			numberInBatch : 1000
		});
		mainObject.userTheme1.setLabelingStyle(new OM.style.Text({
			styleName : "txt",
			fill : "#000000",
			fontFamily : "Arial Rounded MT",
			fillOpacity : 50,
			fontSize : 10,
			sizeUnit : "pixel",
			fontStyle : OM.style.Text.FONTSTYLE_NORMAL,
			fontWeight : OM.Text.FONTWEIGHT_NORMAL
		}));
		mainMapObject.addLayer(mainObject.userTheme1);
		mainObject.userTheme = mainObject.userTheme1;

		mainObject.userTheme2 = new OM.layer.VectorLayer("userTheme2", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_MAP_THEME_USER_MOBILE",
				url : __oracleMapsUrlbase,
				loadOnDemand : false
			}
		});
		mainObject.userTheme2.setLabelColumn(mobileMapLabel);

		mainObject.userTheme2.setQueryParameters(cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheUsername,
				cpTheGroupname);
		mainObject.userTheme2.addListener(OM.event.MouseEvent.MOUSE_CLICK,
				mainObject.mobilesClick);
		mainObject.userTheme2.setLabelsVisible(labelMode);
		mainObject.userTheme2.setVisible(false);
		mainObject.userTheme2.enableDisplayInBatch(true, {
			interval : 5,
			numberInBatch : 1000
		});
		mainObject.userTheme2.setLabelingStyle(new OM.style.Text({
			styleName : "txt",
			fill : "#000000",
			fontFamily : "Arial Rounded MT",
			fillOpacity : 50,
			fontSize : 10,
			sizeUnit : "pixel",
			fontStyle : OM.style.Text.FONTSTYLE_NORMAL,
			fontWeight : OM.Text.FONTWEIGHT_NORMAL
		}));
		mainMapObject.addLayer(mainObject.userTheme2);
		// mobileIcon.style.background = "#2979FF";
	} else {
		
		
		if (mainObject.userTheme.visible) {

			if (mainObject.userTheme1.visible) {
				mainObject.userTheme2.setVisible(false);
				mainObject.userTheme2.refresh();
			} else if (mainObject.userTheme2.visible) {
				mainObject.userTheme1.setVisible(false);
				mainObject.userTheme1.refresh();
			}

			mainObject.userTheme.setVisible(false);
			mainObject.userTheme.refresh();
			
			// mobileIcon.style.background = "";
			return;
		}else{

		}
	
		/*
		mainObject.userTheme1.setHoverStyle({
            dataSource: "INFOAPP",
            name: "default_style",
            url: "https://login.infomobil.com.tr/mapviewerats"
        });
		
		mainObject.userTheme2.setHoverStyle({
            dataSource: "INFOAPP",
            name: "default_style",
            url: "https://login.infomobil.com.tr/mapviewerats"
        });
		
		mainObject.userTheme.setHoverStyle({
            dataSource: "INFOAPP",
            name: "default_style",
            url: "https://login.infomobil.com.tr/mapviewerats"
        });*/

		themeFlag = 1;
		mainObject.userTheme1.setVisible(true);
		mainObject.userTheme = mainObject.userTheme1;

		mainObject.userTheme.setVisible(true);
		//mainObject.userTheme.refresh(false);
		// mobileIcon.style.background = "#2979FF";
		return;
	}
}
// showMobiles
// ------------------------------- RIGHT CLICK MAP MENU
// --------------------------//
Main.prototype.clearMap = function(actionEvent) {
	var mf = mainMapObject.getLayerByName("marker");
	if (mf)
		mainMapObject.removeLayer(mf);
	mf = mainMapObject.getLayerByName("addCustMarker");
	if (mf)
		mainMapObject.removeLayer(mf);
	mf = mainMapObject.getLayerByName("moveCustMarker");
	if (mf)
		mainMapObject.removeLayer(mf);
	mf = mainMapObject.getLayerByName("coorFind");
	if (mf)
		mainMapObject.removeLayer(mf);
	if (distanceTool) {
		distanceTool.clear();
	}
	if (redline) {
		redline.clear();
	}
	mainObject.deleteRoute();
}

// -----------------------------------------------------
Main.prototype.showPointOnMap = function() {
	setTimeout(function() {
		mainObject.clearMap();
		showMapCenteredAndZoom(sugData.x, sugData.y, 15, this.mainMapObject);
		var markerWave = null;
		var mpoint = new OM.geometry.Point(sugData.x, sugData.y, 8307);

		markerWave = new OM.layer.VectorLayer("marker", {
			def : {
				type : OM.layer.VectorLayer.TYPE_LOCAL
			}
		});
		var nStyle = new OM.style.Marker({
			src : themeAnimateIconUrlMain
		});
		var feature = new OM.Feature("marker", mpoint, {
			renderingStyle : nStyle
		});

		markerWave.addFeature(feature);
		mainMapObject.addLayer(markerWave);
		mainObject.custTheme.setVisible(true);
		var bt = AdfPage.PAGE.findComponent('ctbnav02');
		bt.setIcon(mainImageFolder + "/imagesmenu/nav02_a.png");
	}, 500);

	return;
}

Main.prototype.addRegionOnMapTheme = function(actionEvent) {
	setTimeout(function() {
		mainObject.custRegionTheme.setVisible(true);
		mainObject.custRegionThemeObj.setQueryParameters(sugData.id);
		mainObject.custRegionThemeObj.setVisible(true);
		mainObject.custRegionThemeObj.zoomToTheme();
		mainObject.custRegionThemeObj.setVisible(false);
		var bt = AdfPage.PAGE.findComponent('ctbnav05');
		bt.setIcon(mainImageFolder + "/imagesmenu/nav05_a.png");
	}, 500);

	return;
}

Main.prototype.addRouteOnMapTheme = function() {
	setTimeout(function() {
		mainObject.custRouteTheme.setVisible(true);
		mainObject.custRouteThemeObj.setQueryParameters(sugData.id);
		mainObject.custRouteThemeObj.setVisible(true);
		mainObject.custRouteThemeObj.zoomToTheme();
		mainObject.custRouteThemeObj.setVisible(false);
		var bt = AdfPage.PAGE.findComponent('ctbnav06');
		bt.setIcon(mainImageFolder + "/imagesmenu/nav06_a.png");
	}, 500);

	return;
}

Main.prototype.addCustomerRegion = function(actionEvent) {
	mainMapObject.closeInfoWindows();
	redline = new OM.tool.RedlineTool(mainMapObject,
			OM.tool.RedlineTool.TYPE_POLYGON);
	redline.on(OM.event.ToolEvent.TOOL_END, mainObject.addCustomerRegionFinish);
	redline.start();
}

Main.prototype.addRoute = function(actionEvent) {
	mainMapObject.closeInfoWindows();
	if (!distanceTool) {
		distanceTool = new OM.tool.DistanceTool(mainMapObject);
	}
	distanceTool.on(OM.event.ToolEvent.TOOL_END, mainObject.addRouteFinish);
	distanceTool.start();
}

Main.prototype.addRouteFinish = function(data) {
	coords = distanceTool.getGeometry();
	var moveRegionCoords = [];
	for (var i = 0; i < coords.coordinates.length; i = i + 2) {
		var endPoint = new OM.geometry.Point(coords.coordinates[i],
				coords.coordinates[i + 1], 3857);
		var mouseLoc = endPoint.transform(8307);
		moveRegionCoords[i] = mouseLoc.getX();
		moveRegionCoords[i + 1] = mouseLoc.getY();
	}
	distanceTool.deleteListener(OM.event.MouseEvent.MOUSE_CLICK,
			mainObject.addRouteFinish);
	AdfCustomEvent.queue(myEvent.getSource(), "openAddRoutePopup", {
		coords : moveRegionCoords
	}, true);
}

Main.prototype.transformOrdinatesGeom = function(oarray, fromSr, toSr) {
	var srid = fromSr;
	var myOr = new Array();
	var ordinates = "";
	for (var i = 0; i < oarray.length; i += 2) {
		var pos = new OM.geometry.Point(oarray[i], oarray[i + 1], srid);
		var pos2 = pos.transform(toSr);
		if (i > 0)
			ordinates += ",";
		ordinates += pos2.getX() + "," + pos2.getY();
		myOr.push(pos2.getX());
		myOr.push(pos2.getY());
	} // for()
	return myOr;
}

// -----------------------------------------------------------
Main.prototype.nearestVehicles = function() {
	var mouseLocOri = mainMapObject.getCursorLocation();
	mouseLoc = mouseLocOri.transform(8307);
	AdfCustomEvent.queue(myEvent.getSource(), "nearestVehicles", {
		x : mouseLoc.coordinates[0],
		y : mouseLoc.coordinates[1],
		xOri : mouseLocOri.coordinates[0],
		yOri : mouseLocOri.coordinates[1]
	}, true);
}
// nearestVehicles
// ----------------------------
Main.prototype.setRouteStartPoint = function() {
	var mouseLoc = mainMapObject.getCursorLocation();
	mouseLoc = mouseLoc.transform(8307);
	var xCoord = mouseLoc.coordinates[0];
	var yCoord = mouseLoc.coordinates[1];
	var startPoint = new OM.geometry.Point(xCoord, yCoord, 8307);
	var foiId = "ROUTE_POINT_START";
	var routePoint = new mainObject.NetworkAnalysisRoutePoint(xCoord, yCoord);
	startRoutePoint = routePoint;

	var vectorLayer = mainMapObject.getLayerByName(foiId);
	if (vectorLayer) {
		vectorLayer.removeAllFeatures();
		mainMapObject.removeLayer(vectorLayer);
	}

	var feature = new OM.Feature(foiId, startPoint, {
		renderingStyle : null
	});
	vectorLayer = new OM.layer.VectorLayer(foiId, {
		def : {
			type : OM.layer.VectorLayer.TYPE_LOCAL
		}
	});

	OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_ROUTE_START",
			{
				url : __oracleMapsUrlbase,
				callback : function(rangeBuckets) {
					feature.setRenderingStyle(rangeBuckets);
				}
			});

	vectorLayer.addFeature(feature);
	mainMapObject.addLayer(vectorLayer);
	routePointFOIs.push(foiId);
	// mainMapObject.closeInfoWindows();
}
// setRouteStartPoint
// --------------------------------------------------------
Main.prototype.addRouteMidPoint = function() {
	var mouseLoc = mainMapObject.getCursorLocation();
	mouseLoc = mouseLoc.transform(8307);
	var xCoord = mouseLoc.coordinates[0];
	var yCoord = mouseLoc.coordinates[1];
	var endPoint = new OM.geometry.Point(xCoord, yCoord, 8307);
	var index = Math.floor((Math.random() * 100) + 1);
	if (middlePointList.length > 10) {
		alert(pageMessages['map_route_limit']);
		return;
	}
	var foiId = "ROUTE_POINT_MIDDLE_" + index;

	var vectorLayer = mainMapObject.getLayerByName(foiId);
	if (vectorLayer) {
		vectorLayer.removeAllFeatures();
		mainMapObject.removeLayer(vectorLayer);
	}

	feature = new OM.Feature(foiId, endPoint, {
		renderingStyle : null
	});
	vectorLayer = new OM.layer.VectorLayer(foiId, {
		def : {
			type : OM.layer.VectorLayer.TYPE_LOCAL
		}
	});

	OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_ROUTE_MIDDLE",
			{
				url : __oracleMapsUrlbase,
				callback : function(rangeBuckets) {
					feature.setRenderingStyle(rangeBuckets);
				}
			});

	vectorLayer.addListener(OM.event.MouseEvent.MOUSE_CLICK,
			mainObject.middlePointClick);

	vectorLayer.addFeature(feature);
	mainMapObject.addLayer(vectorLayer);
	middlePointList.push(foiId);
	middlePoints.push(xCoord);
	middlePoints.push(yCoord);
	routePointFOIs.push(foiId);
	mainMapObject.closeInfoWindows();
}
// addRouteMidPoint
// -------------------------------------------------------
Main.prototype.middlePointClick = function(pos, foi) {
	var dene = pos.feature.id;
	var mouseLocOri = mainMapObject.getCursorLocation();
	var mouseLoc = mouseLocOri.transform(8307);
	AdfCustomEvent.queue(myEvent.getSource(), "middlePointClick", {
		x : mouseLoc.coordinates[0],
		y : mouseLoc.coordinates[1],
		xOri : mouseLocOri.coordinates[0],
		yOri : mouseLocOri.coordinates[1],
		dene : dene
	}, true);

}
// middlePointClick
// --------------------------------------------------------
Main.prototype.deleteMidPoint = function(fId) {
	var id = fId;
	var index = middlePointList.indexOf(id);
	var mf = mainMapObject.getLayerByName(id);
	if (mf != null) {
		mainMapObject.removeLayer(mf);
		middlePointList.slice(index, 1);
		if (index == 0) {
			middlePoints.splice(index, 2);
		} else {
			middlePoints.splice(index * 2, 2);
		}

	}
	mainMapObject.closeInfoWindows();
}
// deleteMidPoint
// --------------------------------------------------------
Main.prototype.setRouteEndPoint = function() {

	var mouseLoc = mainMapObject.getCursorLocation();
	mouseLoc = mouseLoc.transform(8307);
	var xCoord = mouseLoc.coordinates[0];
	var yCoord = mouseLoc.coordinates[1];
	var endPoint = new OM.geometry.Point(xCoord, yCoord, 8307);
	var foiId = "ROUTE_POINT_END";
	var routePoint = new mainObject.NetworkAnalysisRoutePoint(xCoord, yCoord);
	endRoutePoint = routePoint;
	var vectorLayer = mainMapObject.getLayerByName(foiId);
	if (vectorLayer) {
		mainMapObject.removeLayer(vectorLayer);
	}

	var feature = new OM.Feature(foiId, endPoint, {
		renderingStyle : null
	});
	vectorLayer = new OM.layer.VectorLayer(foiId, {
		def : {
			type : OM.layer.VectorLayer.TYPE_LOCAL
		}
	});

	OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_ROUTE_END", {
		url : __oracleMapsUrlbase,
		callback : function(rangeBuckets) {
			feature.setRenderingStyle(rangeBuckets);
		}
	});
	vectorLayer.addFeature(feature);
	routePointFOIs.push(foiId);
	mainMapObject.closeInfoWindows();
	mainMapObject.addLayer(vectorLayer);
	mainObject.calculateRouteDuration();
}
// setRouteEndPoint
// --------------------------------------------------------------------
Main.prototype.setRouteEndPointMesafe = function(actionEvent) {
	var mouseLoc = mainMapObject.getCursorLocation();
	mouseLoc = mouseLoc.transform(8307);
	var xCoord = mouseLoc.coordinates[0];
	var yCoord = mouseLoc.coordinates[1];
	var endPoint = new OM.geometry.Point(xCoord, yCoord, 8307);
	var foiId = "ROUTE_POINT_END";
	var routePoint = new mainObject.NetworkAnalysisRoutePoint(xCoord, yCoord);
	endRoutePoint = routePoint;

	var vectorLayer = mainMapObject.getLayerByName(foiId);
	if (vectorLayer) {
		mainMapObject.removeLayer(vectorLayer);
		var feature = vectorLayer.getFeature(foiId);
		if (feature) {
			mainMapObject.removeLayer(feature);
		}
	}

	var feature = new OM.Feature(foiId, endPoint, {
		renderingStyle : null
	});
	vectorLayer = new OM.layer.VectorLayer(foiId, {
		def : {
			type : OM.layer.VectorLayer.TYPE_LOCAL
		}
	});

	OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_ROUTE_END", {
		url : __oracleMapsUrlbase,
		callback : function(rangeBuckets) {
			feature.setRenderingStyle(rangeBuckets);
		}
	});
	vectorLayer.addFeature(feature);
	routePointFOIs.push(foiId);
	mainMapObject.closeInfoWindows();
	mainMapObject.addLayer(vectorLayer);
	mainObject.calculateRouteDistance();
}

// --------------------------------------------------------------------
Main.prototype.calculateRouteDuration = function(actionEvent) {
	var mouseLocOri = mainMapObject.getCursorLocation();
	var mouseLoc = mouseLocOri.transform(8307);
	var mapData = {
		startX : startRoutePoint.latitude,
		startY : startRoutePoint.longitude,
		endX : endRoutePoint.latitude,
		endY : endRoutePoint.longitude,
		x : mouseLoc.coordinates[0],
		y : mouseLoc.coordinates[1],
		midPoints : middlePoints,
		typ : "dur"
	}
	console.log(middlePoints);
	console.log(mapData);
	$.ajax({
		type : "POST",
		url : "calcRoute",
		data : mapData,
		success : function(result) {
			mainObject.showRoute(result[0]);
			mainObject.showHtml(result);
			console.log(result);
			// eval(result);
			// $('.search_section_header').html($.parseHTML(result));
		},
		error : function(result) {
			//alert(result);
		}
	});

}
// calculateRouteDuration
// -------------------------------------------------------------------
Main.prototype.calculateRouteDistance = function(actionEvent) {
	var mouseLocOri = mainMapObject.getCursorLocation();
	var mouseLoc = mouseLocOri.transform(8307);
	var mapData = {
		startX : startRoutePoint.latitude,
		startY : startRoutePoint.longitude,
		endX : endRoutePoint.latitude,
		endY : endRoutePoint.longitude,
		x : mouseLoc.coordinates[0],
		y : mouseLoc.coordinates[1],
		midPoints : middlePoints,
		typ : "dist"
	}
	console.log(middlePoints);
	console.log(mapData);
	$.ajax({
		type : "POST",
		url : "calcRoute",
		data : mapData,
		success : function(result) {
			mainObject.showRoute(result[0]);
			mainObject.showHtml(result);
			console.log(result);
			// eval(result);
			// $('.search_section_header').html($.parseHTML(result));
		},
		error : function(result) {
			//alert(result);
		}
	});
}
// -------------------------------------------------------------------
// --------------------------------------------------------------------
Main.prototype.routeClick = function(pos) {
	var mouseLoc = mainMapObject.getCursorLocation();
	mouseLoc = mouseLoc.transform(8307);
	var xCoord = mouseLoc.coordinates[0];
	var yCoord = mouseLoc.coordinates[1];
	var point = new OM.geometry.Point(xCoord, yCoord, 8307);
	var id = 0;
	var cnt = 0;
	var html = '';
	var saat = "";
	var val = null;
	html += '<table height="100%" style="font-size:11px;width:200px;">';
	for ( var key in pos.feature.attributes) {
		val = null;
		if (key == 'ID') {
			id = parseInt(parseFloat(pos.feature.attributes[key]));
			continue;
		}
		cnt++;
		if ((cnt & 1) == 1)
			bgcolor = '#BBBBBB';
		else
			bgcolor = '#DDDDDD';
		if (key == 'MESAFE') {
			val = parseInt(parseFloat(pos.feature.attributes[key])) / 1000
					+ " <spring:message code='km' />";
		} else if (key == 'ZAMAN') {
			if (parseInt(parseFloat(pos.feature.attributes[key])) < 60) {
				val = parseInt(parseFloat(pos.feature.attributes[key]))
						+ " <spring:message code='minute' />";
			} else {
				val = parseInt(parseFloat(pos.feature.attributes[key])) / 60;
				var nn = pos.feature.attributes[key].toString().split(".");
				var aa = nn[nn.length - 1].split("");
				aa = aa[0];
				var dakika = parseInt(aa);
				dakika = dakika * 6;
				saat = nn[0] + " <spring:message code='hour' /> " + dakika + " <spring:message code='minute' /> ";
				pos.feature.attributes[key] = saat;
			}
		} else if (key.substring(0, 5) == 'TRAFI') {

			if (parseInt(parseFloat(pos.feature.attributes[key])) < 60) {
				val = parseInt(parseFloat(pos.feature.attributes[key]))
						+ " <spring:message code='minute' />";
			} else {
				val = parseInt(parseFloat(pos.feature.attributes[key])) / 60;
				var nn = pos.feature.attributes[key].toString().split(".");
				var aa = nn[nn.length - 1].split("");
				aa = aa[0];
				var dakika = parseInt(aa);
				dakika = dakika * 6;
				saat = nn[0] + " <spring:message code='hour' /> " + dakika + " <spring:message code='minute' /> ";
				val = saat;
			}

			// continue;
		} else if (key == 'ROTA ADI') {
			val = pos.feature.attributes[key]
		}
		html += '  <tr bgcolor=' + bgcolor + '><td>' + key
				+ '</td><td align="left">' + (val ? val : '-') + '</td></tr>';
	}
	// for()
	cnt++;
/*	if (pageMessages['map_right_geo'])
		html += '  <tr><td>&nbsp;</td><td><a href=# onclick="mainObject.mouseRouteRightClick('
				+ yCoord
				+ ','
				+ xCoord
				+ ','
				+ id
				+ ')">'
				+ pageMessages["map_route_operations"]
				+ '</a>&nbsp;&nbsp;&nbsp;&nbsp;';
	html += '</table>';
*/
	mainMapObject.displayInfoWindow(point, html);
}
// --------------------------------------------------------------------
Main.prototype.deleteRoute = function(actionEvent) {
	var pointStart = mainMapObject.getLayerByName("ROUTE_POINT_START");
	if (pointStart) {
		mainMapObject.removeLayer(pointStart);
		pointStart.removeAllFeatures();
	}
	var pointEnd = mainMapObject.getLayerByName("ROUTE_POINT_END");
	if (pointEnd) {
		mainMapObject.removeLayer(pointEnd);
		pointEnd.removeAllFeatures();
	}
	if (middlePointList) {
		for (var i = 0; i < middlePointList.length; i++) {
			var middlePoint = mainMapObject.getLayerByName(middlePointList[i]);
			if (middlePoint) {
				mainMapObject.removeLayer(middlePoint);
				middlePoint.removeAllFeatures();
			}
		}
		middlePointList = new Array();
		middlePoints = new Array();
	}
	if (mainObject.routeTheme) {
		mainObject.routeTheme.setVisible(false);
		// mainMapObject.removeLayer(mainObject.routeTheme);
	}
	mainMapObject.closeInfoWindows();
}
// -------------------------------------------------------------------
Main.prototype.mouseRouteRightClick = function(coorY, coorX, custId) {
	AdfCustomEvent.queue(myEvent.getSource(), "getMouseRouteRightClick", {
		x : coorX,
		y : coorY,
		id : custId
	}, true);
}
// mouseRouteRightClick
// -------------------------------------------------------------------
Main.prototype.addRouteToRoute = function(custId) {
	mainMapObject.closeInfoWindows();
	AdfCustomEvent.queue(myEvent.getSource(), "addRouteToRoute", {
		id : custId
	}, true);
}
// --------------------------------------------------------------------
Main.prototype.NetworkAnalysisRoutePoint = function(longitude, latitude) {
	this.longitude = longitude;
	this.latitude = latitude;
}

// -----------------------------------------------------------------
Main.prototype.changeLabelModeForMobile = function() {
	labelMode = !labelMode;

	if (mainObject.userTheme1.visible) {
		mainObject.userTheme2.setLabelsVisible(labelMode);
	}
	if (mainObject.userTheme2.visible) {
		mainObject.userTheme1.setLabelsVisible(labelMode);
	}

	mainObject.userTheme.setLabelsVisible(labelMode);
	mainObject.userTheme.refresh(false);
	// var labelIcon = document.getElementById('labelIcon');
	// if (labelMode)
	// labelIcon.style.background = "#2979FF";
	// else
	// labelIcon.style.background = "";
}
// ---------------------------------------------------------------------
Main.prototype.changeLabelModeForRegion = function() {
	labelModeRegion = !labelModeRegion;

	if (mainObject.custTheme.visible) {
		mainObject.custTheme.setLabelsVisible(labelModeRegion);
		mainObject.custTheme.refresh(false);
	}

	if (mainObject.custRouteTheme.visible) {
		mainObject.custRouteTheme.setLabelsVisible(labelModeRegion);
		mainObject.custRouteTheme.refresh(false);
	}

	if (mainObject.custRegionTheme.visible) {
		mainObject.custRegionTheme.setLabelsVisible(labelModeRegion);
		mainObject.custRegionTheme.refresh(false);
	}

	var bt = AdfPage.PAGE.findComponent('cil6');
	if (labelModeRegion)
		bt.setIcon(mainImageFolder + "/imagesmenu/nav03_a.png");
	else
		bt.setIcon(mainImageFolder + "/imagesmenu/nav03.png");
}

// -------------------------------------------------
Main.prototype.getTrafficEvents = function() {
	/*
	 * var cpts = trafficEvents.events; for (var i = 0;i < cpts.length;i++) {
	 * var foiId = "cpts_" + i; var id = cpts[i].id; var name = cpts[i].name;
	 * var typ = cpts[i].typ; var latitude = cpts[i].pt.y; var longitude =
	 * cpts[i].pt.x; var pt =new OM.geometry.Point(longitude, latitude, 8307);
	 * var mf = mainMapObject.getLayerByName(foiId); if (mf != null)
	 * mainMapObject.removeLayer(mf); var sym = "M.N_TRAFFIC" + "_"; switch
	 * (typ) { case 0: sym += "00"; break; case 1: sym += "01"; break; case 2:
	 * sym += "02"; break; case 3: sym += "03"; break; case 4: sym += "04";
	 * break; case 5: sym += "05"; break; case 6: sym += "06"; break; case 7:
	 * sym += "07"; break; case 8: sym += "08"; break; case 9: sym += "09";
	 * break; default : sym += typ; break; } // switch() mf = new
	 * OM.layer.VectorLayer(foiId, { def : { type :
	 * OM.layer.VectorLayer.TYPE_LOCAL } }); feature = new OM.Feature(foiId,
	 * pt); console.log("foiId"+foiId);
	 * OM.style.StyleStore.getServerSideStyle(__mapDataSource, sym, { url :
	 * __oracleMapsUrlbase, callback : function (rangeBuckets) {
	 * feature.setRenderingStyle(rangeBuckets); console.log("callback
	 * started->"+JSON.stringify(rangeBuckets)); } }); mf.addFeature(feature);
	 * if (mainObject.trafficEventClick)
	 * mf.addListener(OM.event.MouseEvent.MOUSE_CLICK,
	 * mainObject.trafficEventClick); mainMapObject.addLayer(mf); } // for()
	 * return;
	 */
}

// ------------------------------------
Main.prototype.trafficEventClick = function(pos) {
	var id = pos.feature.id;
	var inx = parseInt(id.substring(id.indexOf("_") + 1));
	var olay = trafficEvents.events[inx];
	var html = '';
	html += '<table style="width:220px;font-size:12px">';
	html += '  <tr><td>Yol Adı<\/td><td>' + olay.road + '<\/td><\/tr>';
	html += '  <tr><td>Başlık<\/td><td>' + olay.sloc
			+ '<\/td><\/tr>';
	html += '  <tr><td>Bitiş<\/td><td>' + olay.eloc + '<\/td><\/tr>';
	html += '  <tr><td colspan="2"><font color="#FF0000">' + olay.name
			+ '<\/font><\/td><\/tr>';
	html += '  <tr><td>Gecikme<\/td><td>'
			+ mainObject.formatDuration(parseInt(olay.delay / 60 + 0.5))
			+ '<\/td><\/tr>';
	html += '  <tr><td width="100">Ortalama Hız<\/td><td>'
			+ parseInt(olay.speed) + ' km\/sa<\/td><\/tr>';
	html += '<\/table>';
	mainMapObject.displayInfoWindow(pos.feature.geo, html);
	return;
}

// -----------------------------------------
Main.prototype.formatDuration = function(duration) {
	if (!duration && duration != 0)
		return '?dk';

	if (duration < 60)
		return duration + ' dk.';

	return parseInt(duration / 60) + ' sa. ' + parseInt(duration % 60) + ' dk.';
}
// formatDuration()

// ----------------------------------------------
Main.prototype.showTrafficView = function(actionEvent) {
	// var traffic = document.getElementById('traffic');
	if (tmctheme) {
		mainMapObject.removeLayer(tmctheme);
		tmctheme = null;
		tmcOn = false;
		return;
	}
	tmcOn = true;
	mainObject.updateTrafficView();
	return;
}
// showTrafficView
// ---------------------------------------------------------
Main.prototype.updateTrafficView = function(actionEvent) {
	if (tmcOn) {
		if (tmctheme)
			mainMapObject.removeLayer(tmctheme);
		tmctheme = null;
		tmctheme = new OM.layer.TileLayer("baseMapTmc", {
			dataSource : "INFOMAP",
			tileLayer : "INFOTECH_TILELAYER",
			getTileURL : mainObject.getMapTileURL
		});
		mainMapObject.addLayer(tmctheme);
		tmcOn = true;
	}
	return;
}
// updateTrafficView

// tilelarin hesaplanmasi icin gerekli fonksiyon
Main.prototype.getMapTileURL = function(level, minx, miny, bound) {
	var tx = bound.getMinX();
	var ty = bound.getMinY();

	// x ve y coordinant degil tile index
	var x = (tx - mapConfig.coordSys.minX)
			/ mapConfig.zoomLevels[level].tileWidth;
	var y = (mapConfig.coordSys.maxY - ty)
			/ mapConfig.zoomLevels[level].tileHeight - 1;
	return "http://map.be-mobile.be/customer/infotech/tr/los/" + (level + 1)
			+ "/" + x + "/" + y + ".png";
}

// --------- TOOLBAR SECOND GROUP ---------- info,distance,locked,marqueZoom
// --//
Main.prototype.calcDistance = function() {
	if (temizleFlag == 1) {
		temizleFlag = 2;
		if (!this.distanceTool) {
			this.distanceTool = new OM.tool.DistanceTool(mainMapObject);
		}
		this.distanceTool.start();
		$("#" + this.distanceTool._distanceInfo.id).css("top", "unset");
		$("#" + this.distanceTool._distanceInfo.id).css("bottom", "60px");
		$("#" + this.distanceTool._distanceInfo.id).css("right", "15px");
		$("#" + this.distanceTool._distanceInfo.id).css("left", "unset");
	} else {
		mainObject.clearDistanceObjects();
		temizleFlag = 1;
		// distanceTool.clear();
	}
}

Main.prototype.marqueeZoom = function(actionEvent) {
	var mode = OM.tool.MarqueeZoomTool.ONE_TIME;
	var marqueeZoomTool = new OM.tool.MarqueeZoomTool(mainMapObject, mode);
	marqueeZoomTool.start();
}

Main.prototype.clearDistanceObjects = function() {
	temizleFlag = 1;
	this.distanceTool.clear();
}

Main.prototype.calcRectangle = function(actionEvent) {
	// var bt = AdfPage.PAGE.findComponent('ctbnav07');
	if (temizleFlagRectangle == 1) {
		temizleFlagRectangle = 2;
		// bt.setIcon(mainImageFolder + "/imagesmenu/nav07_a.png");
		if (!rectangleTool) {
			rectangleTool = new OM.tool.RectangleTool(mainMapObject);
		}
		rectangleTool.on(OM.event.ToolEvent.TOOL_END,
				mainObject.clearRectangleObjects);
		rectangleTool.on(OM.event.ToolEvent.TOOL_CLEAR,
				mainObject.refreshRectangleObjects);
		rectangleTool.start();
		actionEvent.cancel();
	} else {
		bt.setIcon(mainImageFolder + "/imagesmenu/nav07.png");
		mainObject.clearDistanceObjects();
		temizleFlagRectangle = 1;
		// distanceTool.clear();
	}
}

Main.prototype.clearRectangleObjects = function(actionEvent) {
	var transOr = mainObject.transformOrdinatesGeom(rectangleTool.getGeometry()
			.getOrdinates(), 3857, 8307);
	temizleFlagRectangle = 1;
	// var bt = AdfPage.PAGE.findComponent('ctbnav07');
	// bt.setIcon(mainImageFolder + "/imagesmenu/nav07.png");
	rectangleTool.clear();
	AdfCustomEvent.queue(myEvent.getSource(), "openRectanglePopup", {
		coords : transOr
	}, true);
}

Main.prototype.refreshRectangleObjects = function(actionEvent) {
	if (temizleFlagRectangle == 2) {
		distanceTool.attachEventListener(MVEvent.FINISH,
				mainObject.clearRectangleObjects);
		distanceTool.attachEventListener(MVEvent.CLEAR,
				mainObject.refreshRectangleObjects);
		distanceTool.init();
		actionEvent.cancel();
	}
	temizleFlagRectangle = 1;
}

// ----------- TOOLBAR THIRD GORUP ------
// satellite,weather,fullScreenMap,normalScreenMap /

Main.prototype.weatherChange = function() {
	// var weather = document.getElementById('weather');
	if (!mainObject.weatherTheme) {
		mainObject.weatherTheme = new OM.layer.VectorLayer('weatherTheme', {
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_WEATHER_REPORT",
				url : __oracleMapsUrlbase
			}
		});
		mainObject.weatherTheme.setLabelsVisible(true);
		mainMapObject.addLayer(mainObject.weatherTheme);
		// weather.style.background = "#2979FF";
	} else {
		if (mainObject.weatherTheme.visible) {
			mainObject.weatherTheme.setVisible(false);
			// weather.style.background = "";
		} else {
			mainObject.weatherTheme.setVisible(true);
			// weather.style.background = "#2979FF";
		}
	}

}

// ---------------------------------------------------------------------
Main.prototype.refreshPoll = function() {
	if(!(mainObject.userTheme1 && mainObject.userTheme && mainObject.userTheme2)){
		return false;
	}
		
	if ((mainObject.userTheme1 && mainObject.userTheme1.visible) || (mainObject.userTheme2 && mainObject.userTheme2.visible)) {
		if (themeFlag == 1) {
			mainObject.userTheme2.setLabelsVisible(labelMode);
			mainObject.userTheme2.setVisible(true);
			mainObject.userTheme = mainObject.userTheme2;
			mainObject.userTheme.setLabelsVisible(labelMode);
			/*
			 * AdfCustomEvent.queue(myEvent.getSource(), "refreshMapData", {
			 * coords : mainMapObject.getMapWindowBoundingBox().getMBR() },
			 * true);
			 */
			setTimeout(function() {
				mainObject.userTheme1.setVisible(false);
				mainObject.userTheme1.refresh(true);
				themeFlag = 2;
			}, 500);
		} else {
			
			mainObject.userTheme1.setVisible(true);
			mainObject.userTheme = mainObject.userTheme1;
			mainObject.userTheme.setLabelsVisible(labelMode);
			/*
			 * AdfCustomEvent.queue(myEvent.getSource(), "refreshMapData", {
			 * coords : mainMapObject.getMapWindowBoundingBox().getMBR() },
			 * true);
			 */
			setTimeout(function() {
				mainObject.userTheme2.setVisible(false);
				mainObject.userTheme2.refresh(true);
				themeFlag = 1;
			}, 500);
		}
	}
}

// ---------------------------ARAC ISLEMLERI-------------------
Main.prototype.assignPointToMobile = function(custId) {
	mainMapObject.closeInfoWindows();
	// alert("assignPointToMobile");
	AdfCustomEvent.queue(myEvent.getSource(), "assignPointToMobile", {
		id : custId
	}, true);
}
// assignPointToMobile
Main.prototype.assignRegionToMobile = function(custId) {
	mainMapObject.closeInfoWindows();
	// alert("assignRegionToMobile");
	AdfCustomEvent.queue(myEvent.getSource(), "assignRegionToMobile", {
		id : custId
	}, true);
}

Main.prototype.assignRouteToMobile = function(custId) {
	mainMapObject.closeInfoWindows();
	// alert("assignRegionToMobile");
	AdfCustomEvent.queue(myEvent.getSource(), "assignRouteToMobile", {
		id : custId
	}, true);
}

Main.prototype.openInfoPanel = function(custId, alias) {
	mainMapObject.closeInfoWindows();
	AdfCustomEvent.queue(myEvent.getSource(), "openInfoPanel", {
		id : custId
	}, true);

}

// ---------------------------GE�M�� KONUM---------------------
Main.prototype.lastLoc1Hour = function(custId) {
	mainMapObject.closeInfoWindows();
	AdfCustomEvent.queue(myEvent.getSource(), "lastLoc1Hour", {
		id : custId
	}, true);
}

Main.prototype.lastLoc6Hour = function(custId) {
	mainMapObject.closeInfoWindows();
	AdfCustomEvent.queue(myEvent.getSource(), "lastLoc6Hour", {
		id : custId
	}, true);
}

Main.prototype.lastLoc24Hour = function(custId) {
	mainMapObject.closeInfoWindows();
	AdfCustomEvent.queue(myEvent.getSource(), "lastLoc24Hour", {
		id : custId
	}, true);
}

Main.prototype.lastLoc1Week = function(custId) {
	mainMapObject.closeInfoWindows();
	AdfCustomEvent.queue(myEvent.getSource(), "lastLoc1Week", {
		id : custId
	}, true);
}

// -----------------------SUGGEST FIELD------------
Main.prototype.handleKeyUpOnSuggestField = function(evt) {
	if (evt.getKeyCode() == AdfKeyStroke.ENTER_KEY) {
		suggestPopup = evt.getSource().findComponent("suggestPopup");
		inputField = evt.getSource();
		valueStr = inputField.getSubmittedValue();
		var coords = valueStr.split(" ");
		var coordsPoint = valueStr.split(",");
		// if (coords.length != 2 || ) return false;
		if (!isNaN(coords[0]) && !isNaN(coords[1])) {
			setTimeout(function() {
				var markerWave = null;
				var pt = new OM.geometry.Point(parseFloat(coordsPoint[1]),
						parseFloat(coordsPoint[0]), 8307);
				markerWave = new OM.layer.VectorLayer("marker", {
					def : {
						type : OM.layer.VectorLayer.TYPE_LOCAL
					}
				});
				markerWave = new OM.layer.VectorLayer("marker", {
					def : {
						type : OM.layer.VectorLayer.TYPE_LOCAL
					}
				});
				var nStyle = new OM.style.Marker({
					src : themeAnimateIconUrlMain
				});
				var feature = new OM.Feature("marker", pt, {
					renderingStyle : nStyle
				});
				markerWave.addFeature(feature);
				mainMapObject.addLayer(markerWave);
				mainObject.unLoadMarker();
				showMapCenteredAndZoom(parseFloat(coordsPoint[1]),
						parseFloat(coordsPoint[0]), 10, this.mainMapObject);
				mainObject.hidePopup(evt);

			}, 500);
			return false;
		} else {
			if (!isNaN(coordsPoint[0]) && !isNaN(coordsPoint[1])) {
				setTimeout(
						function() {
							var markerWave = null;
							var pt = new OM.geometry.Point(
									parseFloat(coordsPoint[1]),
									parseFloat(coordsPoint[0]), 8307);
							markerWave = new OM.layer.VectorLayer("marker", {
								def : {
									type : OM.layer.VectorLayer.TYPE_LOCAL
								}
							});
							markerWave = new OM.layer.VectorLayer("marker", {
								def : {
									type : OM.layer.VectorLayer.TYPE_LOCAL
								}
							});
							var nStyle = new OM.style.Marker({
								src : themeAnimateIconUrlMain
							});
							var feature = new OM.Feature("marker", pt, {
								renderingStyle : nStyle
							});
							markerWave.addFeature(feature);
							mainMapObject.addLayer(markerWave);
							mainObject.unLoadMarker();
							showMapCenteredAndZoom(parseFloat(coordsPoint[1]),
									parseFloat(coordsPoint[0]), 16,
									this.mainMapObject);
							mainObject.hidePopup(evt);
						}, 500);
				return false;
			} else {
				return;
			}
		}
	}
	// if(evt.getKeyCode() == AdfKeyStroke.ENTER_KEY) return;
	suggestPopup = evt.getSource().findComponent("suggestPopup");
	inputField = evt.getSource();
	if (suggestPopup.isShowing() == false
			&& evt.getKeyCode() != AdfKeyStroke.TAB_KEY) {
		hints = {
			align : AdfRichPopup.ALIGN_AFTER_START,
			alignId : evt.getSource().getClientId() + "::content"
		};
		suggestPopup.show(hints);
		suggestPopup.hide = function() {
		}
	}
	if (evt.getKeyCode() == AdfKeyStroke.ARROWLEFT_KEY
			|| evt.getKeyCode() == AdfKeyStroke.ARROWRIGHT_KEY
			|| evt.getKeyCode() == AdfKeyStroke.ARROWDOWN_KEY
			|| evt.getKeyCode() == AdfKeyStroke.SHIFT_MASK
			|| evt.getKeyCode() == AdfKeyStroke.END_KEY
			|| evt.getKeyCode() == AdfKeyStroke.ALT_KEY
			|| evt.getKeyCode() == AdfKeyStroke.HOME_KEY) {
		return false;
	}
	if (evt.getKeyCode() == AdfKeyStroke.ESC_KEY) {
		mainObject.hidePopup(evt);
		return false;
	}

	valueStr = inputField.getSubmittedValue();
	AdfCustomEvent.queue(suggestPopup, "suggestServerListener", {
		filterString : valueStr
	}, true);
	setTimeout("inputField.focus();", 50);
}

// --------------------------------------------
Main.prototype.handleKeyDownOnSuggestField = function(evt) {

	var browserName = navigator.appName;
	if (browserName != "Microsoft Internet Explorer") {
		if (evt.getKeyCode() == AdfKeyStroke.ARROWDOWN_KEY) {
			selectList = evt.getSource().findComponent("sugTbl");
			selectList.setSelectedRowKeys(selectList.DISPLAY_ROW_FIRST);
			selectList.focus();
			return false;
		} else {
			return false;
		}
	} else {
		return null;
	}

}
// ----------------------------------------------------

Main.prototype.setSugData = function(data) {
	sugData = data;
}
Main.prototype.showSugData = function() {
	mainObject.clearMap();
	if (sugData.ft == "IL" || sugData.ft == "ILCE" || sugData.ft == "MAHALLE"
			|| sugData.ft == "YOL") {
		mainObject.addJdbcTheme(sugData);
	} else {
		if (mainObject.userTheme1 == null) {
			// userTheme
			mainObject.userTheme1 = new OM.layer.VectorLayer("userTheme", {
				infoWindow : false,
				def : {
					type : OM.layer.VectorLayer.TYPE_PREDEFINED,
					dataSource : __mapDataSource,
					theme : "N_MAP_THEME_USER_MOBILE",
					url : __oracleMapsUrlbase,
					loadOnDemand : false
				}
			});
			mainObject.userTheme1.setLabelColumn(mobileMapLabel);

			mainObject.userTheme1.setQueryParameters(cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheUsername,
					cpTheGroupname);
			mainObject.userTheme1.addListener(OM.event.MouseEvent.MOUSE_CLICK,
					mainObject.mobilesClick);
			mainObject.userTheme1.enableDisplayInBatch(true, {
				interval : 5,
				numberInBatch : 1000
			});
			mainObject.userTheme1.setLabelingStyle(new OM.style.Text({
				styleName : "txt",
				fill : "#000000",
				fontFamily : "Arial Rounded MT",
				fillOpacity : 50,
				fontSize : 10,
				sizeUnit : "pixel",
				fontStyle : OM.style.Text.FONTSTYLE_NORMAL,
				fontWeight : OM.Text.FONTWEIGHT_NORMAL
			}));
			mainMapObject.addLayer(mainObject.userTheme1);
			mainObject.userTheme1.setLabelsVisible(labelMode);
			mainObject.userTheme = mainObject.userTheme1;

			mainObject.userTheme2 = new OM.layer.VectorLayer("userTheme2", {
				infoWindow : false,
				def : {
					type : OM.layer.VectorLayer.TYPE_PREDEFINED,
					dataSource : __mapDataSource,
					theme : "N_MAP_THEME_USER_MOBILE",
					url : __oracleMapsUrlbase,
					loadOnDemand : false
				}
			});
			mainObject.userTheme2.setLabelColumn(mobileMapLabel);

			mainObject.userTheme2.setQueryParameters(cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
					cpTheQueryMode, cpTheQueryMode, cpTheUsername,
					cpTheGroupname);
			mainObject.userTheme2.addListener(OM.event.MouseEvent.MOUSE_CLICK,
					mainObject.mobilesClick);
			mainObject.userTheme2.setVisible(false);
			mainObject.userTheme2.setLabelsVisible(labelMode);
			// mainObject.userTheme2.setBoundingTheme(true);
			// mainObject.userTheme2.setBringToTopOnMouseOver(true);
			mainObject.userTheme2.enableDisplayInBatch(true, {
				interval : 5,
				numberInBatch : 1000
			});
			mainObject.userTheme2.setLabelingStyle(new OM.style.Text({
				styleName : "txt",
				fill : "#000000",
				fontFamily : "Arial Rounded MT",
				fillOpacity : 50,
				fontSize : 10,
				sizeUnit : "pixel",
				fontStyle : OM.style.Text.FONTSTYLE_NORMAL,
				fontWeight : OM.Text.FONTWEIGHT_NORMAL
			}));
			mainMapObject.addLayer(mainObject.userTheme2);
		}
		showMapCenteredAndZoom(sugData.y, sugData.x, 17, mainMapObject);
		var markerWave = null;
		var mpoint = new OM.geometry.Point(sugData.y, sugData.x, 8307);
		var nStyle = new OM.style.Marker({
			src : themeAnimateIconUrlMain
		});

		var feature = new OM.Feature("marker", mpoint, {
			renderingStyle : nStyle
		});
		markerWave = new OM.layer.VectorLayer("marker", {
			def : {
				type : OM.layer.VectorLayer.TYPE_LOCAL
			}
		});
		markerWave.addFeature(feature);
		mainMapObject.addLayer(markerWave);
		mainObject.unLoadMarker();
	}

	return;
}

// -----------------------------------------------------
Main.prototype.addJdbcTheme = function(data) {
	if (this.jdbcTheme) {
		mainMapObject.removeLayer(this.jdbcTheme);
		this.jdbcTheme = null;
	}
	if (data.ft == 'IL') {
		mainMapObject.removeLayer(mainObject.ilTheme);

		mainObject.ilTheme = new OM.layer.VectorLayer("ilTheme", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_SUG_IL",
				url : __oracleMapsUrlbase
			}
		});

		mainObject.ilTheme.setQueryParameters(data.id);
		mainObject.ilTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK,
				mainObject.ilRightClick);
		mainObject.ilTheme.zoomToTheme();
		mainObject.ilTheme.setVisible(true);
		mainMapObject.addLayer(mainObject.ilTheme);
	}
	if (data.ft == 'ILCE') {
		mainMapObject.removeLayer(mainObject.ilceTheme);
		mainObject.ilceTheme = new OM.layer.VectorLayer("ilceTheme", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_SUG_ILCE",
				url : __oracleMapsUrlbase
			}
		});

		mainObject.ilceTheme.setQueryParameters(data.id);
		mainObject.ilceTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK,
				mainObject.ilceRightClick);
		mainObject.ilceTheme.zoomToTheme();
		mainObject.ilceTheme.setVisible(true);
		mainMapObject.addLayer(mainObject.ilceTheme);
	}
	if (data.ft == 'MAHALLE') {
		mainMapObject.removeLayer(mainObject.mahalleTheme);
		mainObject.mahalleTheme = new OM.layer.VectorLayer("mahalleTheme", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_SUG_MAHALLE",
				url : __oracleMapsUrlbase
			}
		});

		mainObject.mahalleTheme.setQueryParameters(data.id);
		mainObject.mahalleTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK,
				mainObject.mahalleRightClick);
		mainObject.mahalleTheme.zoomToTheme();
		mainObject.mahalleTheme.setVisible(true);
		mainMapObject.addLayer(mainObject.mahalleTheme);
	}
	if (data.ft == 'YOL') {
		mainMapObject.removeLayer(mainObject.yolTheme);
		mainObject.yolTheme = new OM.layer.VectorLayer("yolTheme", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_SUG_YOL",
				url : __oracleMapsUrlbase
			}
		});

		mainObject.yolTheme.setQueryParameters(data.id);
		mainObject.yolTheme.zoomToTheme();
		mainObject.yolTheme.setVisible(true);
		mainMapObject.addLayer(mainObject.yolTheme);
	}
	return;
}

// ------------------------------------------------

// ekrana konulan marker belli bir zaman sonra kaldirilir.(alt katmanlari
// etkilememesi icin)
Main.prototype.unLoadMarker = function() {
	setTimeout(function() {
		var mf = mainMapObject.getLayerByName("marker");
		if (mf != null)
			mainMapObject.removeLayer(mf);
	}, 6000);
}
// ------------------------------------
Main.prototype.ilRightClick = function(pos) {
	var id = 0;
	for ( var i in pos.feature.attributes) {
		if (i == 'ID') {
			id = parseInt(parseFloat(pos.feature.attributes[i]))
		}
	}
	var mouseLocOri = mainMapObject.getCursorLocation();
	var mouseLoc = mouseLocOri.transform(8307);
	AdfCustomEvent.queue(myEvent.getSource(), "ilceRightClick", {
		x : mouseLoc.coordinates[0],
		y : mouseLoc.coordinates[1],
		xOri : mouseLocOri.coordinates[0],
		yOri : mouseLocOri.coordinates[1],
		id : id,
		param : "3"
	}, true);
}

// -------------------------------------------------
Main.prototype.ilceRightClick = function(pos) {
	var id = 0;
	for ( var i in pos.feature.attributes) {
		if (i == 'ID') {
			id = parseInt(parseFloat(pos.feature.attributes[i]))
		}
	}
	var mouseLocOri = mainMapObject.getCursorLocation();
	var mouseLoc = mouseLocOri.transform(8307);

	AdfCustomEvent.queue(myEvent.getSource(), "ilceRightClick", {
		x : mouseLoc.coordinates[0],
		y : mouseLoc.coordinates[1],
		xOri : mouseLocOri.coordinates[0],
		yOri : mouseLocOri.coordinates[1],
		id : id,
		param : "1"
	}, true);
}

// -------------------------------------------------
Main.prototype.mahalleRightClick = function(pos, foi) {
	var id = 0;
	for ( var i in pos.feature.attributes) {
		if (i == 'ID') {
			id = parseInt(parseFloat(pos.feature.attributes[i]))
		}
	}
	var mouseLocOri = mainMapObject.getCursorLocation();
	var mouseLoc = mouseLocOri.transform(8307);

	AdfCustomEvent.queue(myEvent.getSource(), "ilceRightClick", {
		x : mouseLoc.coordinates[0],
		y : mouseLoc.coordinates[1],
		xOri : mouseLocOri.coordinates[0],
		yOri : mouseLocOri.coordinates[1],
		id : id,
		param : "2"
	}, true);
}
// ----------------------------------------------------
Main.prototype.addIlceToRegion = function(id, param) {
	AdfCustomEvent.queue(myEvent.getSource(), "openRegionPopup", {
		id : id,
		param : param
	}, true);
}

// ----------------------------------------------------
Main.prototype.handleListSelection = function(evt) {
	if (evt.getKeyCode() == AdfKeyStroke.ENTER_KEY
			|| evt.getType() == AdfUIInputEvent.CLICK_EVENT_TYPE) {
		AdfCustomEvent.queue(evt.getSource(), "suggestSelectListener", {
			filterString : ""
		}, true);
		mainObject.hidePopup(evt);
	} else if (evt.getKeyCode() == AdfKeyStroke.ESC_KEY) {
		mainObject.hidePopup(evt);
	}
}

// -----------------------------------------------
Main.prototype.handleListClick = function(actionEvent) {
	AdfCustomEvent.queue(actionEvent.getSource(), "suggestSelectListener", {
		filterString : ""
	}, true);
	mainObject.hidePopup(actionEvent);
}
// -----------------------------------------------

Main.prototype.handleListKeyPress = function(evt) {
	if (evt.getKeyCode() == AdfKeyStroke.BACKSPACE_KEY) {
		evt.cancel();
		return;
	}
}

// -------------------------------------------------
Main.prototype.hidePopup = function(evt) {
	var suggestPopup = evt.getSource().findComponent("suggestPopup");
	suggestPopup.hide = AdfRichPopup.prototype.hide;
	suggestPopup.hide();
}

// -----------------LEFT SIDE CONTEXT-MENU---------------
Main.prototype.gotoMobileOnMap = function(actionEvent) {
	if (mainObject.userTheme1 == null) {
		// userTheme
		mainObject.userTheme1 = new OM.layer.VectorLayer("userTheme", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_MAP_THEME_USER_MOBILE",
				url : __oracleMapsUrlbase,
				loadOnDemand : false
			}
		});
		mainObject.userTheme1.setLabelColumn(mobileMapLabel);

		mainObject.userTheme1.setQueryParameters(cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheUsername,
				cpTheGroupname);
		mainObject.userTheme1.setLabelsVisible(labelMode);
		mainObject.userTheme1.addListener(OM.event.MouseEvent.MOUSE_CLICK,
				mainObject.mobilesClick);
		mainObject.userTheme1.enableDisplayInBatch(true, {
			interval : 5,
			numberInBatch : 1000
		});
		mainObject.userTheme1.setLabelingStyle(new OM.style.Text({
			styleName : "txt",
			fill : "#000000",
			fontFamily : "Arial Rounded MT",
			fillOpacity : 50,
			fontSize : 10,
			sizeUnit : "pixel",
			fontStyle : OM.style.Text.FONTSTYLE_NORMAL,
			fontWeight : OM.Text.FONTWEIGHT_NORMAL
		}));
		this.mainMapObject.addLayer(mainObject.userTheme1);
		mainObject.userTheme = mainObject.userTheme1;

		mainObject.userTheme2 = new OM.layer.VectorLayer("userTheme2", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_MAP_THEME_USER_MOBILE",
				url : __oracleMapsUrlbase,
				loadOnDemand : false
			}
		});
		mainObject.userTheme2.setLabelColumn(mobileMapLabel);

		mainObject.userTheme2.setQueryParameters(cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheQueryMode,
				cpTheQueryMode, cpTheQueryMode, cpTheQueryMode, cpTheUsername,
				cpTheGroupname);
		mainObject.userTheme2.addListener(OM.event.MouseEvent.MOUSE_CLICK,
				mainObject.mobilesClick);
		mainObject.userTheme2.setVisible(false);
		mainObject.userTheme2.setLabelsVisible(labelMode);
		// mainObject.userTheme2.setBoundingTheme(true);
		// mainObject.userTheme2.setBringToTopOnMouseOver(true);
		mainObject.userTheme2.enableDisplayInBatch(true, {
			interval : 5,
			numberInBatch : 1000
		});
		mainObject.userTheme2.setLabelingStyle(new OM.style.Text({
			styleName : "txt",
			fill : "#000000",
			fontFamily : "Arial Rounded MT",
			fillOpacity : 50,
			fontSize : 10,
			sizeUnit : "pixel",
			fontStyle : OM.style.Text.FONTSTYLE_NORMAL,
			fontWeight : OM.Text.FONTWEIGHT_NORMAL
		}));
		this.mainMapObject.addLayer(mainObject.userTheme2);
	}
	var cmdItem = actionEvent.getSource();
	var posLat = cmdItem.getProperty("posLat");
	var posLon = cmdItem.getProperty("posLon");
	showMapCenteredAndZoom(posLon, posLat, 17, this.mainMapObject);

	return;
}

// ----------------------UTILS---------------------//
function getPointGeometry(x, y, srid) {
	if (!srid) {
		srid = 3857;
		if (x < 180 && x > -180 && y < 90 && y > -90)
			srid = 8307;
	}
	return new OM.geometry.Point(x, y, srid);
}

function showMapCenteredAndZoom(longitude, latitude, mapZoom, mapview) {
	var pt = getPointGeometryObject(longitude, latitude, mapview);
	if (mapZoom)
		mapview.setMapCenterAndZoomLevel(pt, mapZoom, false);
	else
		mapview.setMapCenter(pt, false);
}

function showMapCenteredWithMarkerAndZoom(longitude, latitude, mapZoom, mapview) {
	setTimeout(function() {
		mainObject.clearMap();
		showMapCenteredAndZoom(longitude, latitude, mapZoom, mapview);

		// var points = document.getElementById('points');
		if (mainObject.custTheme && mainObject.custTheme.visible) {
			mainObject.custTheme.setVisible(false);
			// points.style.background = "";
			return;
		}
		mainObject.custTheme.setVisible(true);
		mainObject.custTheme.refresh(false);
		// points.style.background = "#2979FF";
		return;

	}, 500);

	return;
}

function showMapCenteredWithMarkerAndZoomCustom(longitude, latitude, mapZoom,
		mapview, isOpenForce) {
	setTimeout(function() {
		mainObject.clearMap();
		showMapCenteredAndZoom(longitude, latitude, mapZoom, mapview);

		if (mainObject.custTheme && mainObject.custTheme.visible
				&& isOpenForce !== true) {
			mainObject.custTheme.setVisible(false);
			return;
		}
		mainObject.custTheme.setVisible(true);
		mainObject.custTheme.refresh(false);
		return;

	}, 500);

	return;
}
// showMapCenteredAndZoom()
// ------------------------------------
function getPointGeometryObject(longitude, latitude, mapview) {
	var pt;
	if (latitude < 90 && longitude < 180)
		pt = new OM.geometry.Point(longitude, latitude, 8307);
	else {
		var srid = this.mainMapObject.getUniverse().getSRID();
		//if (IMapper && IMapper.mustTransform)
		//	srid = 3857;
		pt = new OM.geometry.Point(longitude, latitude, srid);
	}
	return pt;
}


Main.prototype.splitterChange = function() {
	AdfCustomEvent.queue(myEvent.getSource(), "splitterChange", {}, true);
}

Main.prototype.showCustomerRoutesAfterAdd = function(company) {
	mainObject.custRouteTheme.setVisible(true);
	mainObject.custRouteTheme.refresh(false);
	return;
}

Main.prototype.showCustomerRoutes = function() {
	if (mainObject.custRouteTheme && mainObject.custRouteTheme.visible) {
		mainObject.custRouteTheme.setVisible(false);
		return;
	}
	mainObject.custRouteTheme.setVisible(true);
	mainObject.custRouteTheme.refresh(false);
	return;
}

Main.prototype.moveCustRegion = function(custId) {
	mainMapObject.closeInfoWindows();
	redline = new OM.tool.RedlineTool(mainMapObject,
			OM.tool.RedlineTool.TYPE_POLYGON);
	redline.start();

	mainObject.custRegionTheme.deleteListener(OM.event.MouseEvent.MOUSE_CLICK,
			mainObject.custRegionClick);
	// redline.start();
	moveCustId = custId;

	AdfCustomEvent.queue(myEvent.getSource(), "startMoveCustRegion", {
		id : custId
	}, true);

}

Main.prototype.editCustomerRegionFinish = function() {
	var transOr = redline.getGeometry();
	var trans = transOr.coordinates[0];
	var poly = new OM.geometry.Polygon(trans, 3857);
	poly = poly.transform(8307);
	mainObject.custRegionTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK,
			mainObject.custRegionClick);
	AdfCustomEvent.queue(myEvent.getSource(), "finishMoveCustRegion", {
		coords : poly.coordinates[0],
		id : moveCustId
	}, true);
}

Main.prototype.deleteCustomerRegion = function(custId) {
	mainMapObject.closeInfoWindows();
	AdfCustomEvent.queue(myEvent.getSource(), "deleteCustomerRegion", {
		id : custId
	}, true);
}

Main.prototype.assignMobileToCustomerRegion = function(custId) {
	mainMapObject.closeInfoWindows();
	AdfCustomEvent.queue(myEvent.getSource(), "assignMobileToCustomerRegion", {
		id : custId
	}, true);
}

Main.prototype.deleteCustomerPoint = function(custId) {
	mainMapObject.closeInfoWindows();
	AdfCustomEvent.queue(myEvent.getSource(), "deleteCustomerPoint", {
		id : custId
	}, true);
}

Main.prototype.moveCustPoint = function(custId) {
	mainMapObject.closeInfoWindows();
	moveCustId = custId;
	mainMapObject.addListener(OM.event.MouseEvent.MOUSE_CLICK,
			mainObject.moveCustPointFinish);
}

Main.prototype.moveCustPointFinish = function() {
	var mouseLocOri = mainMapObject.getCursorLocation();
	var mouseLoc = mouseLocOri.transform(8307);
	mainMapObject.deleteListener(OM.event.MouseEvent.MOUSE_CLICK,
			mainObject.moveCustPointFinish);
	var pt = new OM.geometry.Point(mouseLoc.coordinates[0],
			mouseLoc.coordinates[1], 8307);
	var mf = mainMapObject.getLayerByName("moveCustMarker");
	if (mf != null)
		mainMapObject.removeLayer(mf);

	mf = new OM.layer.VectorLayer("moveCustMarker", {
		def : {
			type : OM.layer.VectorLayer.TYPE_LOCAL
		}
	});
	var feature = new OM.Feature("moveCustMarker", pt);
	OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_BULLS_EYE", {
		url : __oracleMapsUrlbase,
		callback : function(rangeBuckets) {
			feature.setRenderingStyle(rangeBuckets);
		}
	});
	mf.addFeature(feature);
	mainMapObject.addLayer(mf);

	AdfCustomEvent.queue(myEvent.getSource(), "moveCustPoint", {
		x : mouseLoc.coordinates[0],
		y : mouseLoc.coordinates[1],
		id : moveCustId
	}, true);
	moveCustId = 0;

}

Main.prototype.editCustPoint = function(custId) {
	mainMapObject.closeInfoWindows();
	AdfCustomEvent.queue(myEvent.getSource(), "editCustPoint", {
		id : custId
	}, true);
}

Main.prototype.editCustRegion = function(custId) {
	mainMapObject.closeInfoWindows();
	AdfCustomEvent.queue(myEvent.getSource(), "editCustRegion", {
		id : custId
	}, true);
}

Main.prototype.assignMobileToCustomerPoint = function(custId) {
	mainMapObject.closeInfoWindows();
	AdfCustomEvent.queue(myEvent.getSource(), "assignMobileToCustomerPoint", {
		id : custId
	}, true);
}

Main.prototype.zoomIn = function() {
	mainMapObject.setMapZoomLevel(mainMapObject.getMapZoomLevel() + 1);
}

Main.prototype.zoomOut = function() {
	mainMapObject.setMapZoomLevel(mainMapObject.getMapZoomLevel() - 1);
}

Main.prototype.connectFoi = function() {
	var j = 0;
	var nameLine = 0;
	var stFoiLine = 0;
	var isFirst = true;
	var startPoint;
	mainObject.hideTripOnMap();
	
	if (tripTheme != null && tripTheme.featureArray.length > 1 ) {
		mainMapObject.foiIdArray = new Array();
		var foiData = tripTheme.featureArray;
		if (foiData != null) {
			
			var lineArray = new Array();
			var stLineArray = new Array();
			var coors = new Array();
			for (var i = 0; i < foiData.length; i++) {
				var x = foiData[i].geo.coordinates[0];
				var y = foiData[i].geo.coordinates[1];

				var point3857 = new OM.geometry.Point(x, y, 3857);
				var pOri = point3857.transform(8307);
				var attrs = foiData[i + 1] ? foiData[i + 1].attributes : foiData[i].attributes; //eyyp

				if(isFirst){
					isFirst = false;
					foiId = this.themeLineStartName;
					var startFOI = mainMapObject.getLayerByName(foiId);
					startFOI = null;
					var point = new OM.geometry.Point(
							foiData[i].geo.coordinates[0],
							foiData[i].geo.coordinates[1], 3857);
	
					startPoint = point.transform(8307);
	
					var feature = new OM.Feature(foiId, startPoint, {
						renderingStyle : numberStyle1
					});
					startFOI = new OM.layer.VectorLayer(foiId, {
						def : {
							type : OM.layer.VectorLayer.TYPE_LOCAL
						}
					});
					startFOI.addFeature(feature);
					stLineArray.push(startFOI);
				}
				
				if((foiData.length -2) == i){//Son point
					foiId = this.themeLineEndName;
	                var endFOI = mainMapObject.getLayerByName(foiId);
	                endFOI = null;
	                point = new OM.geometry.Point(foiData[foiData.length-1].geo.coordinates[0], foiData[foiData.length-1].geo.coordinates[1], 3857);
	                
	                var endPoint = point.transform(8307);
	                var feature = new OM.Feature(foiId, endPoint, 
	                {
	                    renderingStyle : numberStyleEnd
	                });
	                endFOI = new OM.layer.VectorLayer(foiId, 
	                {
	                    def :  {
	                        type : OM.layer.VectorLayer.TYPE_LOCAL
	                    }
	                });
	                endFOI.addFeature(feature);
	                stLineArray.push(endFOI);
				}

				x = pOri.getX();
				y = pOri.getY();

				var xN = foiData[i + 1] ? foiData[i + 1].geo.coordinates[0] : foiData[i].geo.coordinates[0];
				var yN = foiData[i + 1] ? foiData[i + 1].geo.coordinates[1] : foiData[i].geo.coordinates[1];
				var pointN3857 = new OM.geometry.Point(xN, yN, 3857);

				var pOriN = pointN3857.transform(8307);
				xN = pOriN.getX();
				yN = pOriN.getY();

				if (x != xN || y != yN) {
					coors.push(x);
					coors.push(y);
					coors.push(xN);
					coors.push(yN);
				}

				if (coors.length >= 4) {
					this.tripPointLayerIndexes.push(i);
					var ln = new OM.geometry.LineString(coors, 8307);
					var foiId = this.themeLineName + "_" + i;
					var lf = mainMapObject.getLayerByName(foiId);

					mainMapObject.foiIdArray.push(foiId);

					var feature = new OM.Feature(foiId, ln, {
						renderingStyle : tripStyle1
					});

					lf = new OM.layer.VectorLayer(foiId, {
						def : {
							type : OM.layer.VectorLayer.TYPE_LOCAL
						}
					});

					lf.addFeature(feature);
					lineArray.push(lf);
				}
			}
			// for(i)

			for (var i = 0; i < lineArray.length; i++) {
				mainMapObject.addLayer(lineArray[i]);
			}
			
			for (var i = 0; i < stLineArray.length; i++) {
				mainMapObject.addLayer(stLineArray[i]);
			}


		}


		if(selectedTripKm < gotoStartPointOrZoomToThemeSiniri) {
			mainMapObject.setMapCenterAndZoomLevel(startPoint,15,false);
		}else{
			tripTheme.zoomToTheme();
		}
	}
}

Main.prototype.setCurrentDate = function() {
	var dev = document.getElementById('userDate');
	var today = new Date();
	var date = today.toLocaleString();
	dev.innerHTML = date;
	dev.innerHTML = "<i class='far fa-sync'></i>" + date + "</span>"
}

Main.prototype.loadMobiles = function() {
	$.get('index/getUserMobiles',
	{
		TheAlias : null,
		TheGroupname : "Hepsi",
		TheQueryMode : "0"
	},
	function(data) {

		var dropList = $("#mobileTable");

		var mobiles = data;
		var listSize = mobiles.length;
		for (var i = 0; i < listSize; i++) {
			var sdata = mobiles[i];

			dropList
					.append('<li class="list_item list_item_vehicle_event" data-status='
							+ sdata[1]
							+ '>'
							+ '<div class="thumbnail_container">'
							+ '<i class="icon icon_vehicle_car"></i>'
							+ '</div>'
							+ '<div class="description_container vehicle_container">'
							+ '<strong class="title">'
							+ sdata[2]
							+ '</strong>'
							+ '<span class="average_speed">'
							+ sdata[9]
							+ ' km/s</span>'
							+ '<span class="event_location"><i class="fas fa-map-marker-alt"></i>'
							+ sdata[12]
							+ '</span>'
							+ '<span class="event_time"><i class="fas fa-clock"></i>'
							+ sdata[8]
							+ '</span>'
							+ '</div>'
							+ '<a class="link" href="javascript:;" onClick="select_vehicle(1)"></a>'
							+ '</li>');

		}

	});

}

Main.prototype.showHtml = function(dataMap) {
	setTimeout(function() {
		var pt = new OM.geometry.Point(dataMap[4], dataMap[5], 8307);
		var html = '<div id="info" class="car_detail_content">';
		html += '<div class="car_name">' + "" + '</div>';
		html += '<span class="date">' + "<b><spring:message code='distance' />: </b>" + dataMap[1]
				+ '</span></br>';
		html += '<span class="location">' + "<b><spring:message code='timeBig' />: </b>" + dataMap[2]
				+ '</span></br>';
		html += '<span class="location">' + "<b><spring:message code='timeCoupledTraffic' />: </b>"
				+ dataMap[3] + '</span></br>';
		html += '<a href="javascript:mainObject.custRouteClick('+dataMap[0]+');" class="linkInPopup"><spring:message code="saveRoute" /></a>';
		html += '</div>';
		mainObject.showInfo(html, 280, 80, pt);
	}, 500);

}

Main.prototype.showInfo = function(html, width, height, pt) {
	var mouseLocOri = mainMapObject.getCursorLocation();
	var mouseLoc = mouseLocOri.transform(8307);
	var content = html;
	var options = {
		width : width,
		height : height
	};
	mainMapObject.displayInfoWindow(pt, content, options);
}

Main.prototype.showTripOnMap = function(km,mobile, startPosTimeStr, stopPosTimeStr) {
	tripTheme.setQueryParameters(mobile, startPosTimeStr, stopPosTimeStr);
	tripTheme.setVisible(true);
	tripTheme.refresh();
	tripTheme.setVisible(false);
	selectedTripKm = km;
	setTimeout(function() {
			mainObject.connectFoi();
	}, 1000);
}

Main.prototype.hideTripOnMap = function() {
	mainObject.removeConnectedObjects(); 
}

Main.prototype.removeConnectedObjects = function() {

		var foiId1 = this.themeLineStartName;
		var foiId2 = this.themeLineEndName;
		
	    var layer1 = null;
	    var layer2 = null;

	    layer1= mainMapObject.getLayerByName(foiId1);
	    layer2 = mainMapObject.getLayerByName(foiId2);
	    
	    if(layer1){
	    	mainMapObject.removeLayer(layer1);
	    }
	    
	    if(layer2){
	    	mainMapObject.removeLayer(layer2);
	    }
	    
	    if(!this.tripPointLayerIndexes || this.tripPointLayerIndexes.length < 1){
	    	for(var i=0;i<1000;i++) {
	    		var foiId = this.themeLineName + '_' + i;
	    		
	    	    var layer = mainMapObject.getLayerByName(foiId);
	    	    
	    	    if(layer){
	    	    	layer.setVisible(false);
	    	    	mainMapObject.removeLayer(layer);
	    	    }
	    	}
	    }
	
	for(var i=0;i<this.tripPointLayerIndexes.length;i++) {
		var foiId = this.themeLineName + '_' + this.tripPointLayerIndexes[i];
		
	    var layer = mainMapObject.getLayerByName(foiId);
	    
	    if(layer){
	    	layer.setVisible(false);
	    	mainMapObject.removeLayer(layer);
	    }
	}
	

	
	
	this.tripPointLayerIndexes = [];
}


//-----------------------------------------------------------------------------------------------
Main.prototype.setLyrTheme=function(mapview,index, name, datasource, theme, params, visible, mouseclick, mouserclick) {
	
	this.lyrTheme[index]=new OM.layer.VectorLayer(name,{def :  {
                type : OM.layer.VectorLayer.TYPE_PREDEFINED, 
                dataSource : datasource, 
                theme : theme,
				url : __oracleMapsUrlbase
	}});
	
	this.lyrTheme[index].setVisible(visible);
	
 if( params ) {
    switch( params.length ) {
    case 1 :
      this.lyrTheme[index].setQueryParameters(params[0]);
      break;
    case 2 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1]);
      break;
    case 3 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2]);
      break;
    case 4 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3]);
      break;
    case 5 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3], params[4]);
      break;
    case 6 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3], params[4], params[5]);
      break;
    case 7 :
     this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3], params[4], params[5], params[6]);
      break;
    case 8 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7]);
      break;
    case 9 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8]);
      break;
	case 10 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9]);
      break;
    case 11 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9], params[10]);
      break;
	case 12 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9], params[10], params[11]);
      break;
	case 13 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9], params[10], params[11], params[12]);
      break;
	case 14 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9], params[10], params[11], params[12], params[13]);
      break;
    case 15 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9], params[10], params[11], params[12], params[13], params[14]);
      break;
    case 16 :
       this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9], params[10], params[11], params[12], params[13], params[14], params[15]);
       break;
	case 20 :
      this.lyrTheme[index].setQueryParameters(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9], params[10], params[11], params[12], params[13], params[14], params[15], params[16], params[17], params[18], params[19]);
      break;
    } // switch()
   }
if( mouseclick )
  this.lyrTheme[index].enableInfoWindow(false);
else 
  this.lyrTheme[index].enableInfoWindow(true);

  if( mouseclick ) this.lyrTheme[index].addListener(OM.event.MouseEvent.MOUSE_CLICK, mouseclick);  
  if( mouserclick ) this.lyrTheme[index].addListener(OM.event.MouseEvent.MOUSE_RIGHT_CLICK, mouserclick);
  var spinner=document.getElementById("spinner");
  if(spinner){
      spinner.style.display="";      
  }
  this.lyrTheme[index].on(OM.event.LayerEvent.FEATURES_DISPLAYED ,Main.loadedMessage);

  mapview.addLayer(this.lyrTheme[index]);

  return;
}



</script>