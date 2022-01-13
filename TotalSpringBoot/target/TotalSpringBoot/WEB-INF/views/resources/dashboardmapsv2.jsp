<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script type="text/javascript">
var dashboardMapObject;
var dashboardTheme;
var themeLineName = "dash_themeLineName";
var themeLineStartName;
var themeLineEndName;
var connectFlag = 0;
var themeStyle;
var cpTheMobile = null;

var numberStyle1;
var tripStyle1;

Dashboard = function() {
	this.infBasemapEvent = null;
	this.hereBasemapEvent = null;
	this.infTransparentBaseMapEvent = null;
}

// -----------------------------------------------------------------------------
var commonMapObject = new Dashboard();

// -----------------------------------------------------------------------------
Dashboard.prototype.startUp = function(mobile, baslangic, bitis) {
	cpTheMobile = mobile;
	this.themeLineEndName = 'end_Point_Theme_name';
	this.themeLineStartName = "start_Point_Theme_name";
	
	var tmp = document.getElementById('mapDashboard');
	this.dashboardMapObject = new OM.Map(tmp, {
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
    
    OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_HISTORY_START", 
    {
        url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
            numberStyle1=rangeBuckets;
        }
    });

	this.dashboardMapObject.addLayer(this.infBasemapEvent);
	this.infBasemapEvent.setVisible(true);
	this.infTransparentBaseMapEvent.setVisible(false);
	// scale bar
	var mapScaleBar = new OM.control.ScaleBar();
	this.dashboardMapObject.addMapDecoration(mapScaleBar);
	// copyright note
	var copyright = new OM.control.CopyRight({
		anchorPosition : 6,
		textValue : __copyRightNote,
		fontSize : 12,
		fontFamily : "Arial",
		fontColor : "black"
	});
	this.dashboardMapObject.addMapDecoration(copyright);

	this.dashboardMapObject.setMapCenter(new OM.geometry.Point(35.24, 38.95,
			8307));
	this.dashboardMapObject.setMapZoomLevel(5);
	this.dashboardMapObject.init();

	if (mobile != null) {
		this.dashboardTheme = new OM.layer.VectorLayer("dashboardTheme", {
			infoWindow : false,
			def : {
				type : OM.layer.VectorLayer.TYPE_PREDEFINED,
				dataSource : __mapDataSource,
				theme : "N_MBL_LOC_HIST",
				url : __oracleMapsUrlbase
			}
		});
		this.dashboardTheme.setQueryParameters(mobile, baslangic, bitis);
		// this.dashboardTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK,
		// dashboardObject.mobilesClick);
		this.dashboardMapObject.addLayer(this.dashboardTheme);
		this.dashboardTheme.zoomToTheme();
		this.dashboardTheme.setVisible(false);

		setTimeout(function() {
			this.commonMapObject.connectFoi();
		}, 1000);
	}
}

Dashboard.prototype.switchSat = function() {
	if (this.hereBasemapEvent.isVisible(10)) {
		this.hereBasemapEvent.setVisible(false);
		this.infTransparentBaseMapEvent.setVisible(false);
		this.dashboardMapObject.addLayer(this.infBasemapEvent);
		this.infBasemapEvent.setVisible(true);

	} else {
		this.infBasemapEvent.setVisible(false);
		this.dashboardMapObject.addLayer(this.hereBasemapEvent);
		this.hereBasemapEvent.setVisible(true);
		this.dashboardMapObject.addLayer(this.infTransparentBaseMapEvent);
		this.infTransparentBaseMapEvent.setVisible(true);
		this.dashboardMapObject.removeLayer(this.infBasemapEvent);
	}
}

Dashboard.prototype.connectFoi = function () { 
	var j=0;
	var nameLine=0;
	var stFoiLine=0;
    if (this.dashboardTheme != null) {
    	commonMapObject.foiIdArray = new Array();
        var foiData = this.dashboardTheme.featureArray;
        if (foiData != null) {
            // var coors = new Array();
            var lineArray = new Array();
            var stLineArray = new Array();
            var coors = new Array();
            for (var i = 0;i < foiData.length - 1;i++) {
                var x = foiData[i].geo.coordinates[0];
                var y = foiData[i].geo.coordinates[1];

                var point3857 = new OM.geometry.Point(x, y, 3857);
                var pOri = point3857.transform(8307);
                var attrs = foiData[i + 1].attributes;

                	  // Start Pin must be put.
                    foiId = this.themeLineStartName ;
                    var startFOI = this.dashboardMapObject.getLayerByName(foiId);
                    startFOI = null;
                    var point = new OM.geometry.Point(foiData[i].geo.coordinates[0], foiData[i].geo.coordinates[1], 3857);
                    
                    var startPoint = point.transform(8307);
                    var feature = new OM.Feature(foiId, startPoint, 
                    {
                        renderingStyle : numberStyle1
                    });
                    startFOI = new OM.layer.VectorLayer(foiId, 
                    {
                        def :  {
                            type : OM.layer.VectorLayer.TYPE_LOCAL
                        }
                    });
                    startFOI.addFeature(feature);
                    stLineArray.push(startFOI);
               
                
                foiId = this.themeLineEndName;
                var endFOI = this.dashboardMapObject.getLayerByName(foiId);
                //tripsMapObject.removeLayer(startFOI);
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
                
                x = pOri.getX();
                y = pOri.getY();

                var xN = foiData[i + 1].geo.coordinates[0];
                var yN = foiData[i + 1].geo.coordinates[1];
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
                
                if (coors.length >= 4 ) {
                	 var ln = new OM.geometry.LineString(coors, 8307);
                     var foiId = this.themeLineName;
                     var lf = this.dashboardMapObject.getLayerByName(foiId);
                     this.dashboardMapObject.removeLayer(lf);
                     
                     commonMapObject.foiIdArray.push(foiId);
                         
                      var feature = new OM.Feature(foiId, ln, 
                     {
                         renderingStyle :tripStyle1
                     });    
                    
                     lf = new OM.layer.VectorLayer(foiId, 
                     {
                         def :  {
                             type : OM.layer.VectorLayer.TYPE_LOCAL
                         }
                     });
                     
                     lf.addFeature(feature);
                     lineArray.push(lf);
                }
            }

                for (var i = 0;i < lineArray.length;i++) {
                	this.dashboardMapObject.addLayer(lineArray[i]);
                }
                
                for (var a = 0;a < stLineArray.length;a++) {
                	this.dashboardMapObject.addLayer(stLineArray[a]);

                }
        }
    }
}


Dashboard.prototype.disconnectFoi = function() {
	connectFlag = 0;
	commonMapObject.removeConnectedObjects();
}

Dashboard.prototype.removeConnectedObjects = function() {
	var foiId = this.themeLineName;

	var layer = this.dashboardMapObject.getLayerByName(foiId);
	if (layer) {
		this.dashboardMapObject.removeLayer(layer);
	}

	foiId = this.themeLineStartName;
	layer = this.dashboardMapObject.getLayerByName(foiId);
	if (layer) {
		this.dashboardMapObject.removeLayer(layer);
	}

	foiId = this.themeLineEndName;
	layer = this.dashboardMapObject.getLayerByName(foiId);
	if (layer) {
		this.dashboardMapObject.removeLayer(layer);
	}
}

Dashboard.prototype.zoomIn = function() {
	this.dashboardMapObject.setMapZoomLevel(this.dashboardMapObject
			.getMapZoomLevel() + 1);
}

Dashboard.prototype.zoomOut = function() {
	this.dashboardMapObject.setMapZoomLevel(this.dashboardMapObject
			.getMapZoomLevel() - 1);
}


</script>