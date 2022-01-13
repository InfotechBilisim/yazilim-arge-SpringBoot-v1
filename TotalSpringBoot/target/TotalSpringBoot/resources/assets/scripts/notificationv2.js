var settingsMapObject;
var numberStyle1;
var mapMarkerUrl =  "./resources/assets/styles/images/omserver.png";


Settings = function() {
	this.infBasemapEvent = null;
	this.hereBasemapEvent = null;
	this.infTransparentBaseMapEvent = null;
}

// -----------------------------------------------------------------------------
var commonMapObject = new Settings();

// -----------------------------------------------------------------------------
Settings.prototype.startUp = function() {

	var tmp = document.getElementById('mapSettings');

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


//**************** harita işleri **********************************************************//
Settings.prototype.zoomToCoordinate = function(x, y) {
	var startPoint = new OM.geometry.Point(x,y, 8307);
	this.settingsMapObject.setMapCenterAndZoomLevel(startPoint,14,false);	
}

Settings.prototype.clearMap = function() {
    var foiId = "point_layer";
    var layer=this.settingsMapObject.getLayerByName(foiId);
    this.settingsMapObject.removeLayer(layer);
}



Settings.prototype.addMarker = function(x, y) {
	var foiId = "point_layer";
	
    var layer=this.settingsMapObject.getLayerByName(foiId);
    this.settingsMapObject.removeLayer(layer);
    var mpoint = new OM.geometry.Point(x, y, 8307);
    
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
