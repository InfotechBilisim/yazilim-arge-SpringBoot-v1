var settingsMapObject;
var settingsTheme;
var themeLineName = "dash_themeLineName";
var themeLineStartName;
var themeLineEndName;
var connectFlag = 0;
var themeStyle;
var rectangleTool;
var clickedPoint;


var rotaData;


var routePointFOIStyleName_Start = __mapStylesDataSourceName
+ ".M.N_ROUTE_START";
var routePointFOIStyleName_End = __mapStylesDataSourceName + ".M.N_ROUTE_END";
var routePointFOIStyleName_Middle = __mapStylesDataSourceName
+ ".M.N_ROUTE_MIDDLE";
var themeAnimateIconUrlMain = ___applicationName
+ "/images/mycompany/imagesmenu/" + "pinTracker2.png";
var routePointFOIs = new Array();
var middlePointList = new Array();
var middlePoints = new Array();
var startRoutePoint;
var endRoutePoint;


Settings = function() {
	this.infBasemapEvent = null;
	this.hereBasemapEvent = null;
	this.infTransparentBaseMapEvent = null;
	this.routeTheme = null;
	this.routePath = null;
}

// -----------------------------------------------------------------------------
var commonMapObject = new Settings();

// -----------------------------------------------------------------------------
Settings.prototype.startUp = function(isWatcher) {

	var tmp = document.getElementById('mapSettings');
	var rectangleTool = null;
	var rotaData = null;

	this.settingsMapObject = new OM.Map(tmp, {
		mapviewerURL : __oracleMapsUrlbase,
		autoLoadCss : false
	});

	
	this.infBasemapEvent = new OM.layer.TileLayer("baseMap", {
		dataSource : "INFOMAP",
		tileLayer : "INFOTECH_TILELAYER",
		tileServerURL : __oracleMapsUrlbase + "/mcserver"
	});

	this.infTransparentBaseMapEvent = new OM.layer.TileLayer(
			"infTransparentBaseMap", {
				dataSource : "INFOMAP",
				tileLayer : "INFOTECH_TILELAYER_TURKEY_H",
				tileServerURL : __oracleMapsUrlbase + "/mcserver"
			});

	this.hereBasemapEvent = new OM.layer.GoogleTileLayer("hereBaseMap", {
		key : __googleKey,
		mapType : OM.layer.GoogleTileLayer.TYPE_SATELLITE,
		tilt : 0
	});
	this.hereBasemapEvent.setVisible(false);
	
	
	var settingsMapObject = this.settingsMapObject;
	setTimeout(function() {

		// route_path
		commonMapObject.routePath = new OM.layer.VectorLayer("routePath", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_ROUTE_PATH",
				url : __oracleMapsUrlbase
			}
		});
		commonMapObject.routePath.setQueryParameters(0);
		commonMapObject.routePath.setVisible(true);
		settingsMapObject.addLayer(commonMapObject.routePath);
		
		
		
		commonMapObject.routeTheme = new OM.layer.VectorLayer("custRouteTheme", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_F_ROUTE_OBJ",
				url : __oracleMapsUrlbase
			}
		});
		commonMapObject.routeTheme.setQueryParameters(0);
		commonMapObject.routeTheme.setVisible(true);
		settingsMapObject.addLayer(commonMapObject.routeTheme);
	}, 700);
	
	this.settingsMapObject.addLayer(this.infBasemapEvent);
	this.infBasemapEvent.setVisible(true);
	this.infTransparentBaseMapEvent.setVisible(false);
	// scale bar
	var mapScaleBar = new OM.control.ScaleBar();
	this.settingsMapObject.addMapDecoration(mapScaleBar);
	// copyright note
	var copyright = new OM.control.CopyRight({
		anchorPosition : 6,
		textValue : __copyRightNote,
		fontSize : 12,
		fontFamily : "Arial",
		fontColor : "black"
	});
	this.settingsMapObject.addMapDecoration(copyright);

	this.settingsMapObject.setMapCenter(new OM.geometry.Point(35.24, 38.95,
			8307));
	this.settingsMapObject.setMapZoomLevel(5);
	this.settingsMapObject.init();
}

Settings.prototype.switchSat = function() {
	if (this.hereBasemapEvent.isVisible(10)) {
		this.hereBasemapEvent.setVisible(false);
		this.infTransparentBaseMapEvent.setVisible(false);
		this.settingsMapObject.addLayer(this.infBasemapEvent);
		this.infBasemapEvent.setVisible(true);

	} else {
		this.infBasemapEvent.setVisible(false);
		this.settingsMapObject.addLayer(this.hereBasemapEvent);
		this.hereBasemapEvent.setVisible(true);
		this.settingsMapObject.addLayer(this.infTransparentBaseMapEvent);
		this.infTransparentBaseMapEvent.setVisible(true);
		this.settingsMapObject.removeLayer(this.infBasemapEvent);
	}
}

Settings.prototype.zoomIn = function() {
	this.settingsMapObject.setMapZoomLevel(this.settingsMapObject
			.getMapZoomLevel() + 1);
}

Settings.prototype.zoomOut = function() {
	this.settingsMapObject.setMapZoomLevel(this.settingsMapObject
			.getMapZoomLevel() - 1);
}

Settings.prototype.getMapZoomLevel = function() {
	return this.settingsMapObject.getMapZoomLevel();
}

Settings.prototype.setMapZoomLevel = function(level) {
	this.settingsMapObject.setMapZoomLevel(level);
}


//**************** Harita işleri **********************************************************//

Settings.prototype.setRouteStartPoint = function() {
	var mouseLoc = this.settingsMapObject.getCursorLocation();
	mouseLoc = mouseLoc.transform(8307);
	var xCoord = mouseLoc.coordinates[0];
	var yCoord = mouseLoc.coordinates[1];
	var startPoint = new OM.geometry.Point(xCoord, yCoord, 8307);
	var foiId = "ROUTE_POINT_START";
	var routePoint = new commonMapObject.NetworkAnalysisRoutePoint(xCoord, yCoord);
	startRoutePoint = routePoint;

	var vectorLayer = this.settingsMapObject.getLayerByName(foiId);
	if (vectorLayer) {
		vectorLayer.removeAllFeatures();
		this.settingsMapObject.removeLayer(vectorLayer);
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
	this.settingsMapObject.addLayer(vectorLayer);
	routePointFOIs.push(foiId);
	// this.settingsMapObject.closeInfoWindows();
}

Settings.prototype.setRouteEndPoint = function() {

	var mouseLoc = this.settingsMapObject.getCursorLocation();
	mouseLoc = mouseLoc.transform(8307);
	var xCoord = mouseLoc.coordinates[0];
	var yCoord = mouseLoc.coordinates[1];
	var endPoint = new OM.geometry.Point(xCoord, yCoord, 8307);
	var foiId = "ROUTE_POINT_END";
	var routePoint = new commonMapObject.NetworkAnalysisRoutePoint(xCoord, yCoord);
	endRoutePoint = routePoint;
	var vectorLayer = this.settingsMapObject.getLayerByName(foiId);
	if (vectorLayer) {
		this.settingsMapObject.removeLayer(vectorLayer);
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
	this.settingsMapObject.closeInfoWindows();
	this.settingsMapObject.addLayer(vectorLayer);
	commonMapObject.calculateRouteDuration();
}

Settings.prototype.addRouteMidPoint = function() {
	var mouseLoc = this.settingsMapObject.getCursorLocation();
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

	var vectorLayer = this.settingsMapObject.getLayerByName(foiId);
	if (vectorLayer) {
		vectorLayer.removeAllFeatures();
		this.settingsMapObject.removeLayer(vectorLayer);
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
			commonMapObject.middlePointClick);

	vectorLayer.addFeature(feature);
	this.settingsMapObject.addLayer(vectorLayer);
	middlePointList.push(foiId);
	middlePoints.push(xCoord);
	middlePoints.push(yCoord);
	routePointFOIs.push(foiId);
	this.settingsMapObject.closeInfoWindows();
}

Settings.prototype.setRouteEndPointMesafe = function(actionEvent) {
	var mouseLoc = this.settingsMapObject.getCursorLocation();
	mouseLoc = mouseLoc.transform(8307);
	var xCoord = mouseLoc.coordinates[0];
	var yCoord = mouseLoc.coordinates[1];
	var endPoint = new OM.geometry.Point(xCoord, yCoord, 8307);
	var foiId = "ROUTE_POINT_END";
	var routePoint = new commonMapObject.NetworkAnalysisRoutePoint(xCoord, yCoord);
	endRoutePoint = routePoint;

	var vectorLayer = this.settingsMapObject.getLayerByName(foiId);
	if (vectorLayer) {
		this.settingsMapObject.removeLayer(vectorLayer);
		var feature = vectorLayer.getFeature(foiId);
		if (feature) {
			this.settingsMapObject.removeLayer(feature);
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
	this.settingsMapObject.closeInfoWindows();
	this.settingsMapObject.addLayer(vectorLayer);
	commonMapObject.calculateRouteDistance();
}

Settings.prototype.calculateRouteDuration = function(actionEvent) {
	var mouseLocOri = this.settingsMapObject.getCursorLocation();
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
			if(result && result[0]){
				commonMapObject.showRoute(result[0]);
			}
		},
		error : function(result) {
			//alert(result);
		}
	});

}

Settings.prototype.showRoute = function(id) {
		rotaData = parseInt(id);
	setTimeout(function() {	
		commonMapObject.routePath.setQueryParameters(rotaData);
		commonMapObject.routePath.zoomToTheme();
		commonMapObject.routePath.refresh();
		commonMapObject.routePath.setVisible(true);
},1200);
		commonMapObject.routeTheme.setVisible(false);
		//commonMapObject.zoomIn();
}

Settings.prototype.showRouteOrj = function(id,path_id) {
	rotaData = path_id;
setTimeout(function() {	
	commonMapObject.routeTheme.setQueryParameters(id);
	commonMapObject.routeTheme.zoomToTheme();
	commonMapObject.routeTheme.refresh();
	commonMapObject.routeTheme.setVisible(true);
	
	commonMapObject.routePath.setVisible(false);
	//commonMapObject.zoomIn();
},1000);


}

Settings.prototype.activateOrjTheme = function(val) {
	setTimeout(function() {
		commonMapObject.routePath.setVisible(!val);
		commonMapObject.routeTheme.setVisible(val);
	},1000);
}

Settings.prototype.calculateRouteDistance = function(actionEvent) {
	var mouseLocOri = this.settingsMapObject.getCursorLocation();
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
			if(result && result[0]){
				commonMapObject.showRoute(result[0]);
			}
		},
		error : function(result) {
			//alert(result);
		}
	});
}

Settings.prototype.deleteRoute = function(actionEvent) {
	var pointStart = this.settingsMapObject.getLayerByName("ROUTE_POINT_START");
	if (pointStart) {
		this.settingsMapObject.removeLayer(pointStart);
		pointStart.removeAllFeatures();
	}
	var pointEnd = this.settingsMapObject.getLayerByName("ROUTE_POINT_END");
	if (pointEnd) {
		this.settingsMapObject.removeLayer(pointEnd);
		pointEnd.removeAllFeatures();
	}
	if (middlePointList) {
		for (var i = 0; i < middlePointList.length; i++) {
			var middlePoint = this.settingsMapObject.getLayerByName(middlePointList[i]);
			if (middlePoint) {
				this.settingsMapObject.removeLayer(middlePoint);
				middlePoint.removeAllFeatures();
			}
		}
		middlePointList = new Array();
		middlePoints = new Array();
	}
	if (commonMapObject.routeTheme) {
		commonMapObject.routeTheme.setQueryParameters(0);
		commonMapObject.routeTheme.refresh();
		commonMapObject.routeTheme.setVisible(false);
		// this.settingsMapObject.removeLayer(commonMapObject.routeTheme);
	}
	
	if (commonMapObject.routePath) {
		commonMapObject.routePath.setQueryParameters(0);
		commonMapObject.routePath.refresh();
		commonMapObject.routePath.setVisible(false);
	}
	
	this.settingsMapObject.closeInfoWindows();
}

Settings.prototype.NetworkAnalysisRoutePoint = function(longitude, latitude) {
	this.longitude = longitude;
	this.latitude = latitude;
}

Settings.prototype.getRotaData = function() {
	return rotaData ? rotaData : 0;
}

