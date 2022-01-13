var settingsMapObject;
var settingsTheme;
var themeLineName = "dash_themeLineName";
var themeLineStartName;
var themeLineEndName;
var connectFlag = 0;
var themeStyle;

var distanceTool;
var redline;
var isWatcher = false;
var regionCoords= [];
var isRegionGeoChanged = false;

var globalMap = null;


Settings = function() {
	this.infBasemapEvent = null;
	this.hereBasemapEvent = null;
	this.infTransparentBaseMapEvent = null;
	this.custRegionThemeObj = null;
}

// -----------------------------------------------------------------------------
var commonMapObject = new Settings();

// -----------------------------------------------------------------------------
Settings.prototype.startUp = function(isWatcher) {

	var tmp = document.getElementById('mapSettings');
	isWatcher = isWatcher;

	this.settingsMapObject = new OM.Map(tmp, {
		mapviewerURL : __oracleMapsUrlbase,
		autoLoadCss : false
	});
	
	globalMap = this.settingsMapObject;

	
	
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

	if(!isWatcher){
		
	}
	
	commonMapObject.custRegionThemeObj = new OM.layer.VectorLayer(
			"custRegionTheme2", {
				infoWindow : false,
				def : {
					type : OM.layer.VectorLayer.TYPE_PREDEFINED,
					dataSource : __mapDataSource,
					theme : "N_F_REGION_OBJ",
					url : __oracleMapsUrlbase
				}
			});
	commonMapObject.custRegionThemeObj.setVisible(false);
	this.settingsMapObject.addLayer(commonMapObject.custRegionThemeObj);
	
	this.settingsMapObject.addListener("click",commonMapObject.custRegionThemeObjClicked)
	
	
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


//**************** Coğrafi işleri **********************************************************//


Settings.prototype.custRegionThemeObjClicked = function(a) {
	if(isWatcher)
		return;
	
	var coords = [];
	if(!commonMapObject.custRegionThemeObj.isVisible())
		return false;
		
	commonMapObject.custRegionThemeObj.setVisible(false);
	var f = commonMapObject.custRegionThemeObj.featureArray;
	if(f && f.length > 0 && f[0].geo && f[0].geo.coordinates && f[0].geo.coordinates[0]){
		coords = commonMapObject.custRegionThemeObj.featureArray[0].geo.coordinates[0];	
		
	}
	
	if(!redline){
		redline = new OM.tool.RedlineTool(globalMap,OM.tool.RedlineTool.TYPE_POLYGON);
		redline.on(OM.event.ToolEvent.REDLINE_EDITED, commonMapObject.addCustomerRegionFinish);
	}else{
		redline.clear();
	}
	redline.start();
		
	//setTimeout(function() {}, 500);
		for (var i = 0;i < coords.length;i++) {
			redline.addVertex(i,new OM.geometry.Point(coords[i],coords[i+1],3857),true);
			i++;
		}
		redline.finish();
	
	
	
	return false;
}

Settings.prototype.addRegionOnMapTheme = function(regionId) {	
	if(regionId){
		setTimeout(function() {
			commonMapObject.custRegionThemeObj.setQueryParameters(regionId);
			commonMapObject.custRegionThemeObj.refresh();
			commonMapObject.custRegionThemeObj.zoomToTheme();
			commonMapObject.custRegionThemeObj.setVisible(true);
			setTimeout(function() {
				var f = commonMapObject.custRegionThemeObj.featureArray;
				if(f && f.length > 0 && f[0].geo && f[0].geo.coordinates && f[0].geo.coordinates[0])
					regionCoords = commonMapObject.custRegionThemeObj.featureArray[0].geo.coordinates[0];
					commonMapObject.custRegionThemeObj.zoomToTheme();
					
					commonMapObject.custRegionThemeObjClicked();
			}, 700);
		}, 500);
	}

	return;
}



Settings.prototype.addTemporaryRegionToMap = function(coords) {
	for (var i = 0;i < coords.length;i++) {
		//commonMapObject.addLayer(lineArray[i]);
		redline.addVertex(i,new OM.geometry.Point(coords[i],coords[i+1]),true);
		i++;
	}
	redline.finish();
	commonMapObject.zoomToCoordinate(coords[0],coords[1],9);
}

Settings.prototype.addCustomerRegion = function(actionEvent) {
	if(isWatcher)
		return;
	
	this.settingsMapObject.closeInfoWindows();
	if(!redline){
		redline = new OM.tool.RedlineTool(this.settingsMapObject,OM.tool.RedlineTool.TYPE_POLYGON);
		redline.on(OM.event.ToolEvent.REDLINE_EDITED, commonMapObject.addCustomerRegionFinish);
		redline.on(OM.event.ToolEvent.TOOL_END, commonMapObject.addCustomerRegionFinish);
	}
	redline.start();
}
Settings.prototype.addCustomerRegionFinish = function(data) {
	// Aslında buna da gerek yok. // bir ihtimal lazım olabilir.
	var transOr = redline.getGeometry();
	
	if(!transOr || !transOr.coordinates || transOr.coordinates.length < 1){
		return false;
	}
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
	
	regionCoords = poly.coordinates[0];
	isRegionGeoChanged = true;
	
}

Settings.prototype.setRegionGeoChangeStatus  = function(val) {
	isRegionGeoChanged = val;
}

Settings.prototype.getRegionGeoChangeStatus  = function() {
	return isRegionGeoChanged;
}

Settings.prototype.getRegionLastStatus = function() {
	return regionCoords;
}

Settings.prototype.clearMap = function() {
	if(isWatcher)
		return;
		
	if (redline) {
		redline.finish();
		redline.clear();
	}
	
	commonMapObject.custRegionThemeObj.setVisible(false);
	
	//isRegionGeoChanged = true;
	regionCoords = [];
}


Settings.prototype.zoomToCoordinate = function(x, y,tolerance) {
	var startPoint = new OM.geometry.Point(x,y, 8307);
	if(tolerance && tolerance < 500)
		this.settingsMapObject.setMapCenterAndZoomLevel(startPoint,tolerance,false);	
	else
		this.settingsMapObject.setMapCenterAndZoomLevel(startPoint,tolerance-3,false);	
}
