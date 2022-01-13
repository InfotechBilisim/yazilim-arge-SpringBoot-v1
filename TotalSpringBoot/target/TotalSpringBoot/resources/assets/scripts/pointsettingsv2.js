var settingsMapObject;
var settingsTheme;
var themeLineName = "dash_themeLineName";
var themeLineStartName;
var themeLineEndName;
var connectFlag = 0;
var themeStyle;
var rectangleTool;
var clickedPoint;


var numberStyle1;
var tripStyle1;
var mapMarkerUrl;

Settings = function() {
	this.infBasemapEvent = null;
	this.hereBasemapEvent = null;
	this.infTransparentBaseMapEvent = null;
}

// -----------------------------------------------------------------------------
var commonMapObject = new Settings();

// -----------------------------------------------------------------------------
Settings.prototype.startUp = function(isWatcher, mobile) {

	var tmp = document.getElementById('mapSettings');
	var rectangleTool = null;

	this.settingsMapObject = new OM.Map(tmp, {
		mapviewerURL : __oracleMapsUrlbase,
		autoLoadCss : false
	});

	
	OM.style.StyleStore.getServerSideStyle(__mapDataSource,
			"L.N_CIRCLE", {
				url : __oracleMapsUrlbase,
				callback : function(rangeBuckets) {
					numberStyle1 = rangeBuckets;
				}
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

	if(!isWatcher){
		this.settingsMapObject.addListener(OM.event.MouseEvent.MOUSE_CLICK,
				commonMapObject.mapClicked);
	}
	
	this.settingsMapObject.addLayer(this.infBasemapEvent);
	this.infBasemapEvent.setVisible(true);
	this.infTransparentBaseMapEvent.setVisible(false);


	// History page specifig layers

	//pointMobile
	this.custThemeMobile = new OM.layer.VectorLayer("custThemeMobile", {
		def: {
			type: OM.layer.VectorLayer.TYPE_PREDEFINED,
			dataSource: __mapDataSource,
			theme: "F_CPOINT_MOBILE",
			url: __oracleMapsUrlbase
		}
	});

	this.custThemeMobile.setQueryParameters(mobile);
	this.custThemeMobile.setLabelsVisible(true);
	this.custThemeMobile.setVisible(false);
	this.settingsMapObject.addLayer(this.custThemeMobile);

	//regionMobile
	this.custRegionThemeMobile = new OM.layer.VectorLayer("custRegionThemeMobile", {
		def: {
			type: OM.layer.VectorLayer.TYPE_PREDEFINED,
			dataSource: __mapDataSource,
			theme: "F_REGION_MBL",
			url: __oracleMapsUrlbase
		}
	});

	this.custRegionThemeMobile.setQueryParameters(mobile);
	this.custRegionThemeMobile.setLabelsVisible(true);
	this.custRegionThemeMobile.setVisible(false);
	this.settingsMapObject.addLayer(this.custRegionThemeMobile);

	//routemobile
	this.custRouteThemeMobile = new OM.layer.VectorLayer("routeThemeMobile", {
		def: {
			type: OM.layer.VectorLayer.TYPE_PREDEFINED,
			dataSource: __mapDataSource,
			theme: "F_ROUTE_MOBILE",
			url: __oracleMapsUrlbase
		}
	});

	this.custRouteThemeMobile.setQueryParameters(mobile);
	this.custRouteThemeMobile.setLabelsVisible(true);
	this.custRouteThemeMobile.setVisible(false);
	this.settingsMapObject.addLayer(this.custRouteThemeMobile);
	// End Of History page specifig layers


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


//**************** Circle işleri **********************************************************//

Settings.prototype.setClickedPoint = function(p) {
	clickedPoint = p;
}

Settings.prototype.getClickedPointCoords = function() {
	return clickedPoint != null ? clickedPoint.coordinates : null;
}

Settings.prototype.setMapMarkerIcon = function(i) {
	mapMarkerUrl = i;
}

Settings.prototype.mapClicked = function(e) {
	var mouseLocOri = e.target.getCursorLocation();
	clickedPoint = mouseLocOri.transform(8307);
	var tolerance = $(".radius_meters").text();
	commonMapObject.geoLocation(clickedPoint);
	
	commonMapObject.zoomToCoordinate(clickedPoint.coordinates[0], clickedPoint.coordinates[1]);
	commonMapObject.addCircle(clickedPoint.coordinates[0], clickedPoint.coordinates[1], tolerance, 'Tolerance');
	commonMapObject.addMarker(clickedPoint.coordinates[0], clickedPoint.coordinates[1]);
}

Settings.prototype.deleteMapClickEvent = function() {
	this.settingsMapObject.deleteListener(OM.event.MouseEvent.MOUSE_CLICK,
			commonMapObject.mapClicked)
}



Settings.prototype.zoomToCoordinate = function(x, y,tolerance) {
	var startPoint = new OM.geometry.Point(x,y, 8307);
	if(tolerance && tolerance < 500)
		this.settingsMapObject.setMapCenterAndZoomLevel(startPoint,14,false);	
	else
		this.settingsMapObject.setMapCenterAndZoomLevel(startPoint,11,false);	
}

Settings.prototype.clearMap = function() {
	
	var layerName = "daire_layer";
    var n = this.settingsMapObject.getLayerByName(layerName);
    if (n != null) {
        var l = n.getFeature(layerName)
    }
    if (n != null) {
        n.removeFeature(l);
        this.settingsMapObject.removeLayer(n)
    }
    
    
    var foiId = "point_layer";
    var layer=this.settingsMapObject.getLayerByName(foiId);
    this.settingsMapObject.removeLayer(layer);
}



Settings.prototype.addCircle = function(x, y, tolerance, label) {
	if(!x || !y){
		x = clickedPoint.coordinates[0];
		y = clickedPoint.coordinates[1];
	}
	tolerance = parseInt(tolerance);
	var layerName = "daire_layer";
    var n = this.settingsMapObject.getLayerByName(layerName);
    if (n != null) {
        var l = n.getFeature(layerName)
    }
    if (l != null) {
        n.removeFeature(l);
        this.settingsMapObject.removeLayer(n)
    }
    var m = new OM.geometry.Polygon.createGeodeticCirclePolygon(x,y,tolerance,8307);
    
    var k = new OM.Feature(layerName,m,{
        renderingStyle: null
    });
    var f = new OM.layer.VectorLayer(layerName,{
        def: {
            type: OM.layer.VectorLayer.TYPE_LOCAL
        }
    });
    
    k.setRenderingStyle(numberStyle1); // L_ROTA

    if (label) {
        k.setLabel(label)
    }
    
    f.setBringToTopOnMouseOver(true);
    f.addFeature(k);
    this.settingsMapObject.addLayer(f);
    return;
}


Settings.prototype.addMarker = function(x, y) {
	var foiId = "point_layer";
	
    var layer=this.settingsMapObject.getLayerByName(foiId);
    this.settingsMapObject.removeLayer(layer);
    var mpoint = new OM.geometry.Point(x, y, 8307);
    
    mapMarkerUrl = mapMarkerUrl ? mapMarkerUrl : "./resources/assets/styles/images/CP_0.png";
    var nStyle = new OM.style.Marker({src: mapMarkerUrl});
    var feature = new OM.Feature(foiId, mpoint, 
    {
        renderingStyle : nStyle
    });
    var vLayer  = new OM.layer.VectorLayer(foiId,
    {def:{type:OM.layer.VectorLayer.TYPE_LOCAL}});

    vLayer.addFeature(feature);
    this.settingsMapObject.addLayer(vLayer);
}

Settings.prototype.showCustPoints = function() {
    if(this.custThemeMobile.visible) {
     this.custThemeMobile.setVisible(false);
    } else {
     this.custThemeMobile.setVisible(true);
    }
}

Settings.prototype.showRegions = function() {
    if(this.custRegionThemeMobile.visible) {
     this.custRegionThemeMobile.setVisible(false);
    } else {
     this.custRegionThemeMobile.setVisible(true);
    }
}

Settings.prototype.showRoutes = function() {
    if(this.custRouteThemeMobile.visible) {
     this.custRouteThemeMobile.setVisible(false);
    } else {
     this.custRouteThemeMobile.setVisible(true);
    }
}
