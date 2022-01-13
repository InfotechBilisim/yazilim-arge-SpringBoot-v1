<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<script type="text/javascript">
var eventsMapObject;
var eventTheme;
var themeName;
var themeLineName;
var themeLineStartName;
var themeLineEndName;
var themeLineStyleName;
var themeLineStartPointStyle;
var themeLineEndPointStyle;
var themeAnimateName;
var themeAnimateIconUrl = "./images/pinTracker.png";
var themeAnimateSpeed = 250;
var playSpeed = 2;
var myNewEvent;
var distanceTool;
var temizleFlag = 1;
var connectFlag = 0;
var rowNo;
var posTimeStr;
var mapInfoEvent;
var labelModeRegionEvent = false;//default bolge,nokta etiketi kapalidir.
var themeStyle;
var cpTheMobile = null;
var cpTheQueryMode = null;
var cpTheEventGroupName = null;
var cpTheUsername = null;

var mapConfig = {
    "mapTileLayer" : "OSM_MERCATOR", "format" : "PNG", "coordSys" :  {
        "srid" : 3857, "type" : "PROJECTED", "distConvFactor" : 1.0, "minX" :  - 2.0037508E7, "minY" :  - 2.0037508E7, "maxX" : 2.0037508E7, "maxY" : 2.0037508E7
    },
"zoomLevels" : [{"zoomLevel" : 0, "name" : "", "tileWidth" : 2.0037508E7, "tileHeight" : 2.0037508E7, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 1, "name" : "", "tileWidth" : 1.0018754E7, "tileHeight" : 1.0018754E7, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 2, "name" : "", "tileWidth" : 5009377.0, "tileHeight" : 5009377.0, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 3, "name" : "", "tileWidth" : 2504688.5, "tileHeight" : 2504688.5, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 4, "name" : "", "tileWidth" : 1252344.25, "tileHeight" : 1252344.25, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 5, "name" : "", "tileWidth" : 626172.125, "tileHeight" : 626172.125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 6, "name" : "", "tileWidth" : 313086.0625, "tileHeight" : 313086.0625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 7, "name" : "", "tileWidth" : 156543.03125, "tileHeight" : 156543.03125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 8, "name" : "", "tileWidth" : 78271.515625, "tileHeight" : 78271.515625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 9, "name" : "", "tileWidth" : 39135.7578125, "tileHeight" : 39135.7578125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 10, "name" : "", "tileWidth" : 19567.87890625, "tileHeight" : 19567.87890625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 11, "name" : "", "tileWidth" : 9783.939453125, "tileHeight" : 9783.939453125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 12, "name" : "", "tileWidth" : 4891.9697265625, "tileHeight" : 4891.9697265625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 13, "name" : "", "tileWidth" : 2445.98486328125, "tileHeight" : 2445.98486328125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 14, "name" : "", "tileWidth" : 1222.992431640625, "tileHeight" : 1222.992431640625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 15, "name" : "", "tileWidth" : 611.4962158203125, "tileHeight" : 611.4962158203125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 16, "name" : "", "tileWidth" : 305.74810791015625, "tileHeight" : 305.74810791015625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 17, "name" : "", "tileWidth" : 152.87405395507812, "tileHeight" : 152.87405395507812, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 18, "name" : "", "tileWidth" : 76.43702697753906, "tileHeight" : 76.43702697753906, "tileImageWidth" : 256, "tileImageHeight" : 256}]
};

Events = function () {
    this.infBasemapEvent = null;
    this.hereBasemapEvent = null;
    this.infTransparentBaseMapEvent = null;
    this.custTheme = null;
    this.custThemeMobile = null;
    this.custRegionTheme = null;
    this.custRegionThemeMobile = null;
    this.custRouteTheme = null;
    this.custRouteThemeMobile = null;
    this.weatherTheme = null;
}

//-----------------------------------------------------------------------------
var eventsObject = new Events();

//-----------------------------------------------------------------------------
Events.prototype.startUp = function (company,rowNo,posTimeStr,mobile,queryMode,grName,eventGr,eventCode,username,stDate,endDate,dateRange) {
	cpTheMobile = mobile;
	cpTheQueryMode = queryMode;
	cpTheGroupname = grName;
	cpTheEventGroupName = eventGr;
	cpTheEventCode = eventCode;
	cpTheUsername = username;
	//yyyyMMddHHmmss
	
/*
	 
 	cpTheMobile = 214224;
	cpTheQueryMode = 0;
	cpTheGroupname = "Hepsi";
	cpTheEventGroupName = 10;
	cpTheEventCode = "MOBILE_ACTIVE";
	cpTheUsername = "eer";
  
*/
	
	
	/*	if(rowNo ==null) {
	if(dateRange=="Bugün") {
		stDate = eventsObject.convertDate(true);
		endDate = eventsObject.convertDate(false);
	} else {
		stDate = eventsObject.formatDate(true,stDate);
		endDate = eventsObject.formatDate(false,endDate);
	}}
	*/
	
	stDate = makeDateForThemeParam(true,stDate);
	endDate = makeDateForThemeParam(false,endDate);
	//stDate = eventsObject.dateReplace(stDate);
	//endDate = eventsObject.dateReplace(endDate);


	
    var tmp = document.getElementById('mapEvent');
    /*var mapScale = component.getProperty('scale');
    var longitude = component.getProperty('longitude');
    var latitude = component.getProperty('latitude');*/
    eventsMapObject = new OM.Map(tmp, 
    {
        mapviewerURL : __oracleMapsUrlbase,autoLoadCss :false
    });
    this.infBasemapEvent = new OM.layer.TileLayer("baseMap", 
    {
        dataSource : "INFOMAP", tileLayer : "INFOTECH_TILELAYER", tileServerURL : __oracleMapsUrlbase + "/mcserver"
    });
    this.infTransparentBaseMapEvent = new OM.layer.TileLayer("infTransparentBaseMap", 
    {
        dataSource : "INFOMAP", tileLayer : "INFOTECH_TILELAYER_TURKEY_H", tileServerURL : __oracleMapsUrlbase + "/mcserver"
    });
        this.hereBasemapEvent = new OM.layer.GoogleTileLayer("hereBaseMap",  {
         key : __googleKey, mapType : OM.layer.GoogleTileLayer.TYPE_SATELLITE,tilt:0 
    });
    this.hereBasemapEvent.setVisible(false);

    eventsMapObject.addLayer(this.infBasemapEvent);
    this.infBasemapEvent.setVisible(true);
    this.infTransparentBaseMapEvent.setVisible(false);
    //scale bar
    var mapScaleBar = new OM.control.ScaleBar();
    eventsMapObject.addMapDecoration(mapScaleBar);
    //copyright note
    var copyright = new OM.control.CopyRight( {
        anchorPosition : 6, textValue : __copyRightNote, fontSize : 12, fontFamily : "Arial", fontColor : "black"
    });
    eventsMapObject.addMapDecoration(copyright);
    /*
     if(latitude==0 && longitude == 0) {
      this.eventsMapObject.setMapCenter(new OM.geometry.Point(35.24, 38.95, 8307));
      this.eventsMapObject.setMapZoomLevel(5);
    } else {
              this.eventsMapObject.setMapCenter(new OM.geometry.Point(longitude, latitude, 8307));
              this.eventsMapObject.setMapZoomLevel(mapScale);
    }*/
    eventsMapObject.setMapCenter(new OM.geometry.Point(35.24, 38.95, 8307));
    eventsMapObject.setMapZoomLevel(5);
    eventsMapObject.init();
    
    if(rowNo !=null) {
    this.eventTheme = new OM.layer.VectorLayer("eventTheme", 
            {
                infoWindow : false, def :  {
                    type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, theme : "N_MAP_THEME_EVENT_S", url : __oracleMapsUrlbase
                }
            });
            this.eventTheme.setQueryParameters(rowNo, posTimeStr);
            this.eventTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK, eventsObject.mobilesClick);
            eventsMapObject.addLayer(this.eventTheme);
            this.eventTheme.zoomToTheme();
            var a=eventsMapObject;
            setTimeout(function(){ a.setMapZoomLevel(15); }, 500);
    } else {
    	 this.eventTheme = new OM.layer.VectorLayer("eventTheme", 
    		        {
    		            infoWindow : false, def :  {
    		                type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, theme : "N_MAP_THEME_EVENT", url : __oracleMapsUrlbase
    		            }
    		        });
    	 	
    		        this.eventTheme.setQueryParameters(cpTheQueryMode, cpTheMobile, cpTheQueryMode, cpTheMobile, cpTheEventGroupName, cpTheQueryMode, cpTheGroupname, cpTheQueryMode, cpTheGroupname, cpTheEventGroupName, cpTheQueryMode, cpTheEventCode, cpTheQueryMode, cpTheMobile, cpTheEventCode, cpTheQueryMode, cpTheGroupname, cpTheEventCode, stDate, endDate, cpTheUsername);
    		        this.eventTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK, eventsObject.mobilesClick);
    		        eventsMapObject.addLayer(this.eventTheme);
    		        this.eventTheme.zoomToTheme();
    	
    }
            
            
          //point mobile
         this.custThemeMobile = new OM.layer.VectorLayer("custThemeMobile", 
            {
                def :  {
                    type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, 
                    theme : "F_CPOINT_MOBILE", url : __oracleMapsUrlbase
                }
            });
            this.custThemeMobile.setQueryParameters(cpTheMobile);
            this.custThemeMobile.setVisible(false);
            //this.custThemeMobile.setLabelsVisible(labelModeRegionEvent);
            eventsMapObject.addLayer(this.custThemeMobile);     
            
            
            //region-mobile
            this.custRegionThemeMobile = new OM.layer.VectorLayer("custRegionThemeMobile", 
            {
                def :  {
                    type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource,
                    theme : "F_REGION_MBL", url : __oracleMapsUrlbase
                }
            });
            this.custRegionThemeMobile.setQueryParameters(cpTheMobile);
            this.custRegionThemeMobile.setVisible(false);
            //this.custRegionThemeMobile.setLabelsVisible(labelModeRegionEvent);
            eventsMapObject.addLayer(this.custRegionThemeMobile);
            
            //route-mobile
            this.custRouteThemeMobile = new OM.layer.VectorLayer("routeThemeMobile", 
            {
                def :  {
                    type : OM.layer.VectorLayer.TYPE_PREDEFINED,
                    dataSource : __mapDataSource, theme : "F_ROUTE_MOBILE", url : __oracleMapsUrlbase
                }
            });
            this.custRouteThemeMobile.setQueryParameters(cpTheMobile);
            //this.custRouteThemeMobile.labelsVisible(labelModeRegionEvent);
            this.custRouteThemeMobile.setVisible(false);
            eventsMapObject.addLayer(this.custRouteThemeMobile);

   /* this.themeName = 'eventTheme';
    this.themeLineName = themeName + '_line';
    this.themeLineStartName = themeName + '_linestart';
    this.themeLineEndName = themeName + '_lineend';
    this.themeLineStyleName = __mapStylesDataSourceName + ".L.M_.HISTORY";
    this.themeLineStartPointStyle = __mapStylesDataSourceName + ".M.HISTORY_START";
    this.themeLineEndPointStyle = __mapStylesDataSourceName + ".M.HISTORY_END";
    this.themeAnimateName = themeName + '_animate';
    
       //Styles
    if (!themeStyle) {
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HISTORY", 
        {
            url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                themeStyle = rangeBuckets;
            }
        });
    };
    //point
    this.custTheme = new OM.layer.VectorLayer("custTheme", 
    {
        def :  {
            type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, theme : "F_CPOINT_COMP", url : __oracleMapsUrlbase
        }
    });
    this.custTheme.setQueryParameters(company);
    this.custTheme.setVisible(false);
    this.custTheme.setLabelsVisible(labelModeRegionEvent);
    this.eventsMapObject.addLayer(this.custTheme);
    //point mobile
    this.custThemeMobile = new OM.layer.VectorLayer("custThemeMobile", 
    {
        def :  {
            type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, 
            theme : "F_CPOINT_MOBILE", url : __oracleMapsUrlbase
        }
    });
    this.custThemeMobile.setQueryParameters(cpTheMobile);
    this.custThemeMobile.setVisible(false);
    this.custThemeMobile.setLabelsVisible(labelModeRegionEvent);
    this.eventsMapObject.addLayer(this.custThemeMobile);
    //region
    this.custRegionTheme = new OM.layer.VectorLayer("custRegionTheme", 
    {
        def :  {
            type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource,
            theme : "F_REGION_COMP", url : __oracleMapsUrlbase
        }
    });
    this.custRegionTheme.setQueryParameters(company);
    this.custRegionTheme.setVisible(false);
    this.custRegionTheme.setLabelsVisible(labelModeRegionEvent);
    this.eventsMapObject.addLayer(this.custRegionTheme);
    //region-mobile
    this.custRegionThemeMobile = new OM.layer.VectorLayer("custRegionThemeMobile", 
    {
        def :  {
            type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource,
            theme : "F_REGION_MBL", url : __oracleMapsUrlbase
        }
    });
    this.custRegionThemeMobile.setQueryParameters(cpTheMobile);
    this.custRegionThemeMobile.setVisible(false);
    this.custRegionThemeMobile.setLabelsVisible(labelModeRegionEvent);
    this.eventsMapObject.addLayer(this.custRegionThemeMobile);
    //weather
    eventsObject.weatherTheme = new OM.layer.VectorLayer("weatherTheme", 
    {
        def :  {
            type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, theme : "WEATHER_REPORT", url : __oracleMapsUrlbase
        }
    });
    eventsObject.weatherTheme.setVisible(false);
    this.eventsMapObject.addLayer(eventsObject.weatherTheme);
    //route
    this.custRouteTheme = new OM.layer.VectorLayer("routeTheme", 
    {
        def :  {
            type : OM.layer.VectorLayer.TYPE_PREDEFINED, 
            dataSource : __mapDataSource, theme : "F_ROUTE_COMP", url : __oracleMapsUrlbase
        }
    });
    this.custRouteTheme.setQueryParameters(company);
    this.custRouteTheme.labelsVisible(labelModeRegionEvent);
    this.custRouteTheme.setVisible(false);
    this.eventsMapObject.addLayer(this.custRouteTheme);
    //route-mobile
    this.custRouteThemeMobile = new OM.layer.VectorLayer("routeThemeMobile", 
    {
        def :  {
            type : OM.layer.VectorLayer.TYPE_PREDEFINED,
            dataSource : __mapDataSource, theme : "F_ROUTE_MOBILE", url : __oracleMapsUrlbase
        }
    });
    this.custRouteThemeMobile.setQueryParameters(cpTheMobile);
    this.custRouteThemeMobile.labelsVisible(labelModeRegionEvent);
    this.custRouteThemeMobile.setVisible(false);
    this.eventsMapObject.addLayer(this.custRouteThemeMobile);
        this.eventTheme = new OM.layer.VectorLayer("eventTheme", 
        {
            infoWindow : false, def :  {
                type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, theme : "MAP_THEME_EVENT", url : __oracleMapsUrlbase
            }
        });
        this.eventTheme.setQueryParameters(cpTheQueryMode, cpTheMobile, cpTheQueryMode, cpTheMobile, cpTheEventGroupName, cpTheQueryMode, cpTheGroupname, cpTheQueryMode, cpTheGroupname, cpTheEventGroupName, cpTheQueryMode, cpTheEventCode, cpTheQueryMode, cpTheMobile, cpTheEventCode, cpTheQueryMode, cpTheGroupname, cpTheEventCode, stDate, endDate, cpTheUsername);
        this.eventTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK, eventsObject.mobilesClick);
        this.eventsMapObject.addLayer(eventTheme);
        this.eventTheme.zoomToTheme();*/
        return;
    /*else {
        this.eventTheme = new OM.layer.VectorLayer("eventTheme", 
        {
            infoWindow : false, def :  {
                type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, theme : "MAP_THEME_EVENT_S", url : __oracleMapsUrlbase
            }
        });
        this.eventTheme.setQueryParameters(rowNo, posTimeStr);
        this.eventTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK, eventsObject.mobilesClick);
        this.eventsMapObject.addLayer(eventTheme);
        this.eventTheme.zoomToTheme();
        return;
    }*/
}

Events.prototype.mobilesClick = function (pos) {
    var mouseLocOri = eventsMapObject.getCursorLocation();
    var mouseLoc = mouseLocOri.transform(8307);
    var id = 0;
    var rowno = 0;
    var alias = '';
    var mobileId = 0;
    var pos_time_stamp = '';
    for (var i in pos.feature.attributes) {
        if (i == 'MOBILE') {
            mobileId = parseInt(parseFloat(pos.feature.attributes[i]));
            continue;
        }
        if (i == 'ALIAS') {
            alias = pos.feature.attributes[i];
            continue;
        }
        if (i == 'ROWNO') {
            rowno = parseFloat(pos.feature.attributes[i]);
            continue;
        }
        if (i == 'POS_TIME_STAMP') {
            pos_time_stamp = pos.feature.attributes[i];
            continue;
        }
    }
    
	var mapData = {
			x : mouseLoc.coordinates[0],
			y : mouseLoc.coordinates[1],
			xOri : mouseLocOri.coordinates[0],
			yOri : mouseLocOri.coordinates[1],
			id : mobileId,
			row : rowno,
			al : alias,
			posdate : pos_time_stamp
		}
	
	$.ajax({
		type : "POST",
		url : "getEventInfo",
		data : mapData,
		success : function(result) {
			var pt = new OM.geometry.Point(pos.feature.geo.coordinates[0], pos.feature.geo.coordinates[1], 3857);
			eventsObject.showInfo(result.data, 330, 200, pt);
		},
		error : function(result) {
		}
	});
}

Events.prototype.showInfo = function(html, width, height, pt) {
	var content = html;
	var options = {
		width : '%100',
		height :'%100'
	};
	eventsMapObject.displayInfoWindow(pt, content, options);
}

Events.prototype.switchSat = function () {
    if (this.hereBasemapEvent.isVisible(10)) {
        this.hereBasemapEvent.setVisible(false);
        this.infTransparentBaseMapEvent.setVisible(false);
        eventsMapObject.addLayer(this.infBasemapEvent);
        this.infBasemapEvent.setVisible(true);

    }
    else {
        this.infBasemapEvent.setVisible(false);
        eventsMapObject.addLayer(this.hereBasemapEvent);
        this.hereBasemapEvent.setVisible(true);
        eventsMapObject.addLayer(this.infTransparentBaseMapEvent);
        this.infTransparentBaseMapEvent.setVisible(true);
        eventsMapObject.removeLayer(this.infBasemapEvent);
    }
}

Events.prototype.raiseSingleEventMap = function (actionEvent) {
    rowNo = actionEvent.getSource().getProperty("transactionRowno");
    posTimeStr = actionEvent.getSource().getProperty("posTimeStr");
    var popup = AdfPage.PAGE.findComponent("rgEvnt:0:popupDialogMap");
    var hints = {
    };
    popup.show(hints);
}

Events.prototype.maximizeWindow = function () {
    var cW = document.documentElement.clientWidth;
    var cH = document.documentElement.clientHeight;
    var pp = AdfPage.PAGE.findComponent("rgEvnt:0:pwMapEvent");
    pp.setContentWidth(cW - 100);
    pp.setContentHeight(cH - 100);
}

Events.prototype.minimizeWindow = function () {
    var pp = AdfPage.PAGE.findComponent("rgEvnt:0:pwMapEvent");
    pp.setContentWidth(800);
    pp.setContentHeight(600);
}

Events.prototype.connectFoi = function () {
    //eventsObject.removeConnectedObjects();
	
	if(connectFlag == 1) {
		eventsObject.disconnectFoi();
		return;
	}
	
    if (this.eventTheme != null) {
        var foiData = this.eventTheme.featureArray;
        if (foiData != null) {
            var coors = [];
            var prevX = null;
            var prevY = null;
            for (var i = 0;i < foiData.length;i++) {
                var pointX = foiData[i].geo;
                var point = new OM.geometry.Point(pointX.coordinates[0], pointX.coordinates[1], 3857);
                var pointTrans = point.transform(8307);
                var x = pointTrans.coordinates[0];
                var y = pointTrans.coordinates[1];
                if (((prevX == null) || (prevX != x)) || ((prevY == null) || (prevY != y))) {
                    coors.push(x);
                    coors.push(y);
                }
                prevX = x;
                prevY = y;
            }
            // for(i)
            // Create the line geometry and add mapview as FOI
            if (coors && coors.length >= 4) {
                var ln = new OM.geometry.LineString(coors, 8307);
                var foiId = this.themeLineName;
                var layer = this.eventsMapObject.getLayerByName(foiId);
                this.eventsMapObject.removeLayer(layer);

                 var feature = new OM.Feature(foiId, ln, 
                {
                    renderingStyle : themeStyle
                });
                
                lf = new OM.layer.VectorLayer(foiId, 
                {
                    def :  {
                        type : OM.layer.VectorLayer.TYPE_LOCAL
                    }
                });

                lf.addFeature(feature);
                this.eventsMapObject.addLayer(lf);

                // Start Pin must be put.
                foiId = this.themeLineStartName;
                layer = this.eventsMapObject.getLayerByName(foiId);
                this.eventsMapObject.removeLayer(layer);
                var point = new OM.geometry.Point(foiData[0].geo.coordinates[0], foiData[0].geo.coordinates[1], 3857);
                var startPoint = point.transform(8307);
                var feature = new OM.Feature(foiId, startPoint, 
                {
                    renderingStyle : null
                });
                startFOI = new OM.layer.VectorLayer(foiId, 
                {
                    def :  {
                        type : OM.layer.VectorLayer.TYPE_LOCAL
                    }
                });

                OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_HISTORY_START", 
                {
                    url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        feature.setRenderingStyle(rangeBuckets);
                    }
                });
                startFOI.addFeature(feature);
                this.eventsMapObject.addLayer(startFOI);

                // End Pin must be put.
                foiId = themeLineEndName;
                var endFOI = this.eventsMapObject.getLayerByName(foiId);
                this.eventsMapObject.removeLayer(endFOI);

                var point = new OM.geometry.Point(foiData[foiData.length - 1].geo.coordinates[0], foiData[foiData.length - 1].geo.coordinates[1], 3857);
                var endPoint = point.transform(8307);

                var feature = new OM.Feature(foiId, endPoint, 
                {
                    renderingStyle : null
                });
                endFOI = new OM.layer.VectorLayer(foiId, 
                {
                    def :  {
                        type : OM.layer.VectorLayer.TYPE_LOCAL
                    }
                });

                OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_HISTORY_END", 
                {
                    url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        feature.setRenderingStyle(rangeBuckets);
                    }
                });

                endFOI.addFeature(feature);
                this.eventsMapObject.addLayer(endFOI);

                var obj = AdfPage.PAGE.findComponent("rgEvnt:0:clhConnectFoi");
                obj.setVisible(false);

                obj = AdfPage.PAGE.findComponent("rgEvnt:0:clhDisconnectFoi");
                obj.setVisible(true);
            }
        }
        // if( foiData != null )
    }
    // if (this.eventTheme != null)
    connectFlag = 1;
}

Events.prototype.disconnectFoi = function () {
    /*var obj = AdfPage.PAGE.findComponent("rgEvnt:0:clhConnectFoi");
    obj.setVisible(true);
    obj = AdfPage.PAGE.findComponent("rgEvnt:0:clhDisconnectFoi");
    obj.setVisible(false);*/
    connectFlag = 0;
    eventsObject.removeConnectedObjects();
}

Events.prototype.removeConnectedObjects = function () {
    var foiId = this.themeLineName;

    var layer = this.eventsMapObject.getLayerByName(foiId);
    if (layer) {
        this.eventsMapObject.removeLayer(layer);
    }

    foiId = this.themeLineStartName;
    layer = this.eventsMapObject.getLayerByName(foiId);
    if (layer) {
        this.eventsMapObject.removeLayer(layer);
    }

    foiId = this.themeLineEndName;
    layer = this.eventsMapObject.getLayerByName(foiId);
    if (layer) {
        this.eventsMapObject.removeLayer(layer);
    }
}

Events.prototype.animateThemePlay = function () {
    var ln;
    if (this.eventTheme != null) {
        var foiData = this.eventTheme.featureArray;
        if (foiData != null) {
            var coors = [];
            var prevX = null;
            var prevY = null;
            var j = 0;
            for (var i = 0;i < foiData.length;i++) {
                var x = foiData[i].geo.coordinates[0];
                var y = foiData[i].geo.coordinates[1];
                var pOri3857 = new OM.geometry.Point(x, y, 3857);
                var pOri = pOri3857;
                x = pOri.getX();
                y = pOri.getY();

                if (((prevX == null) || (prevX != x)) && ((prevY == null) || (prevY != y))) {
                    coors[j * 2] = x;
                    coors[j * 2 + 1] = y;
                    j++;
                }
                prevX = x;
                prevY = y;
            }
            // for(i)
            if (coors && coors.length >= 4) {
                ln = new OM.geometry.LineString(coors, 8307);
            }
        }
    }

    if (ln) {
        /*var objPlay = AdfPage.PAGE.findComponent("rgEvnt:0:clhAnimatePlay");
        objPlay.setVisible(false);
        var objStop = AdfPage.PAGE.findComponent("rgEvnt:0:clhAnimateStop");
        objStop.setVisible(true);*/

        var foiId = this.themeAnimateName;
        var layer = this.eventsMapObject.getLayerByName(foiId);
        this.eventsMapObject.removeLayer(layer);
        var x = ln.coordinates[0];
        var y = ln.coordinates[1];
        var mpoint = new OM.geometry.Point(x, y, 3857);
        var nStyle = new OM.style.Marker( {
            src :themeAnimateIconUrl
        });

        var feature = new OM.Feature(foiId, mpoint, 
        {
            renderingStyle : nStyle
        });
        var elephant = new OM.layer.VectorLayer(foiId, 
        {
            def :  {
                type : OM.layer.VectorLayer.TYPE_LOCAL
            }
        });

        elephant.addFeature(feature);
        this.eventsMapObject.addLayer(elephant);
        feature.animateToNewLocation(ln, 
        {
            loop : true, time : themeAnimateSpeed, bounce : false
        });
    }
}

Events.prototype.fastPlay = function () {
    var ln;
    if (this.eventTheme != null) {
        var foiData = this.eventTheme.featureArray;
        if (foiData != null) {
            var coors = [];
            var prevX = null;
            var prevY = null;
            var j = 0;
            for (var i = 0;i < foiData.length;i++) {
                var x = foiData[i].geo.coordinates[0];
                var y = foiData[i].geo.coordinates[1];
                var pOri = new OM.geometry.Point(x, y, 3857);

                x = pOri.getX();
                y = pOri.getY();

                if (((prevX == null) || (prevX != x)) && ((prevY == null) || (prevY != y))) {
                    coors[j * 2] = x;
                    coors[j * 2 + 1] = y;
                    j++;
                }
                prevX = x;
                prevY = y;
            }
            // for(i)
           if(coors.length>=4){
            ln = new OM.geometry.LineString(coors, 8307);
           }
        }
    }

    if (ln) {
        var objPlay = AdfPage.PAGE.findComponent("rgEvnt:0:clhAnimatePlay");
        objPlay.setVisible(false);

        var objStop = AdfPage.PAGE.findComponent("rgEvnt:0:clhAnimateStop");
        objStop.setVisible(true);

        var objFastPlay = AdfPage.PAGE.findComponent("rgEvnt:0:clhFastPlay");

        var foiId = themeAnimateName;
        var layer = this.eventsMapObject.getLayerByName(foiId);
        this.eventsMapObject.removeLayer(layer);

        var foiData = this.eventTheme.featureArray;
        var x = ln.coordinates[0];
        var y = ln.coordinates[1];
        var mpoint = new OM.geometry.Point(x, y, 3857);
        var nStyle = new OM.style.Marker( {
            src : themeAnimateIconUrl
        });
        var feature = new OM.Feature(foiId, mpoint, 
        {
            renderingStyle : nStyle
        });
        var elephant = new OM.layer.VectorLayer(foiId, 
        {
            def :  {
                type : OM.layer.VectorLayer.TYPE_LOCAL
            }
        });

        elephant.addFeature(feature);
        this.eventsMapObject.addLayer(elephant);

        if (playSpeed == 2) {
            feature.animateToNewLocation(ln, 
            {
                loop : false, time : 150, bounce : false
            });
            playSpeed = 3;
            objFastPlay.setIcon("images/mycompany/imagesmenu/f4x.png");

        }
        else if (playSpeed == 3) {
            feature.animateToNewLocation(ln, 
            {
                loop : false, time : 100, bounce : false
            });
            playSpeed = 4;
            objFastPlay.setIcon("images/mycompany/imagesmenu/f8x.png");

        }
        else {
            feature.animateToNewLocation(ln, 
            {
                loop : false, time : 50, bounce : false
            });
            playSpeed = 2;
            objFastPlay.setIcon("images/mycompany/imagesmenu/f2x.png");
        }
    }
}

Events.prototype.animateThemeClear = function () {
    /*var objStop = AdfPage.PAGE.findComponent("rgEvnt:0:clhAnimateStop");
    objStop.setVisible(false);
    var objPlay = AdfPage.PAGE.findComponent("rgEvnt:0:clhAnimatePlay");
    objPlay.setVisible(true);*/

    var foiId = this.themeAnimateName;
    var layer = this.eventsMapObject.getLayerByName(foiId);
    this.eventsMapObject.removeLayer(layer);
}

Events.prototype.popupOpenedProcess = function () {
    eventsObject.disconnectFoi();
    eventsObject.animateThemeClear();
}

Events.prototype.calcDistance = function (actionEvent) {
    var bt = AdfPage.PAGE.findComponent('rgEvnt:0:ctbnav07');
    bt.setIcon("images/mycompany/imagesmenu/nav07_a.png");
    if (temizleFlag == 1) {
        temizleFlag = 2;
        bt.setIcon("images/mycompany/imagesmenu/nav07_a.png");
        distanceTool = new OM.tool.DistanceTool(this.eventsMapObject);
        distanceTool.start();
        distanceTool.init();
        actionEvent.cancel();
    }
    else {
        bt.setIcon("images/mycompany/imagesmenu/nav07.png");
        eventsObject.clearDistanceObjects();
    }
}

Events.prototype.clearDistanceObjects = function (actionEvent) {
    temizleFlag = 1;
    distanceTool.clear();
}

Events.prototype.refreshDistanceObjects = function (actionEvent) {
    if (temizleFlag == 1) {
        distanceTool.attachEventListener(MVEvent.FINISH, eventsObject.clearDistanceObjects);
        distanceTool.attachEventListener(MVEvent.CLEAR, eventsObject.refreshDistanceObjects);
        distanceTool.init();
        actionEvent.cancel();
    }
    temizleFlag = 1;
}

Events.prototype.getMapInfo = function (actionEvent) {
    var bt = AdfPage.PAGE.findComponent('rgEvnt:0:cil2');
    bt.setIcon("images/mycompany/imagesmenu/nav08_a.png");
    this.eventsMapObject.addListener(OM.event.MouseEvent.MOUSE_CLICK, eventsObject.mouseClickInfo);
    this.mapInfoEvent = actionEvent;
    actionEvent.cancel();
}

Events.prototype.mouseClickInfo = function () {
    eventsMapObject.deleteListener(OM.event.MouseEvent.MOUSE_CLICK, eventsObject.mouseClickInfo);
    var mouseLocOri = eventsMapObject.getCursorLocation();
    var mouseLoc = mouseLocOri.transform(8307);
    AdfCustomEvent.queue(mapInfoEvent.getSource(), "getMapInfoAction", 
    {
        x : mouseLoc.coordinates[0], y : mouseLoc.coordinates[1], xOri : mouseLocOri.coordinates[0], yOri : mouseLocOri.coordinates[1]
    },
true);
}

Events.prototype.marqueeZoom = function (actionEvent) {
    var mode = OM.tool.MarqueeZoomTool.ONE_TIME;
    var marqueeZoomTool = new OM.tool.MarqueeZoomTool(this.eventsMapObject, mode);
    marqueeZoomTool.start();

    this.eventsMapObject.addListener(MVEvent.ZOOM_LEVEL_CHANGE, eventsObject.zoomEnd);
    this.mapInfoEvent = actionEvent;
    actionEvent.cancel();
}

Events.prototype.zoomEnd = function () {
    AdfCustomEvent.queue(mapInfoEvent.getSource(), "zoomEnd", 
    {
    },
true);
}

Events.prototype.showCustomerPoints = function () {
    if (this.custTheme && this.custTheme.isVisible()) {
        this.custThemeMobile.setVisible(false);
        this.custTheme.setVisible(false);
        bt.setVisible(false);
        btMob.setVisible(true);
        btClear.setVisible(false);
        return;
    }
    if (this.custThemeMobile && this.custThemeMobile.isVisible()) {
        this.custTheme.setVisible(true);
        this.custThemeMobile.setVisible(false);
        return;
    }
    this.custTheme.setVisible(false);
    this.custThemeMobile.setVisible(true);
    return;
}

Events.prototype.showCustomerRegions = function () {

    if (this.custRegionTheme && this.custRegionTheme.visible) {
        this.custRegionTheme.setVisible(false);
        this.custRegionThemeMobile.setVisible(false);
        return;
    }
    if (this.custRegionThemeMobile && this.custRegionThemeMobile.visible) {
        this.custRegionTheme.setVisible(true);
        this.custRegionThemeMobile.setVisible(false);
        return;
    }
    this.custRegionTheme.setVisible(false);
    this.custRegionThemeMobile.setVisible(true);
    return;
}

Events.prototype.showCustomerRoutes = function () {
    if (this.custRouteTheme && this.custRouteTheme.visible) {
        this.custRouteTheme.setVisible(false);
        this.custRouteThemeMobile.setVisible(false);
        return;
    }
    if (this.custRouteThemeMobile && this.custRouteThemeMobile.visible) {
        this.custRouteTheme.setVisible(true);
        this.custRouteThemeMobile.setVisible(false);
        return;
    }
    this.custRouteTheme.setVisible(false);
    this.custRouteThemeMobile.setVisible(true);
    return;
}

Events.prototype.weatherChange = function () {
    var bt = AdfPage.PAGE.findComponent('rgEvnt:0:clhWeather');
    if (eventsObject.weatherTheme.visible) {
        eventsObject.weatherTheme.setVisible(false);
        bt.setIcon("images/mycompany/imagesmenu/weather.png");
    }
    else {
        eventsObject.weatherTheme.setVisible(true);
        bt.setIcon("images/mycompany/imagesmenu/weather_a.png");
    }
}

Events.prototype.changeLabelModeForRegion = function () {
    labelModeRegionEvent = !labelModeRegionEvent;

    this.custTheme.setLabelsVisible(labelModeRegionEvent);
    this.custThemeMobile.setLabelsVisible(labelModeRegionEvent);
    this.custRegionTheme.setLabelsVisible(labelModeRegionEvent);
    this.custRegionThemeMobile.setLabelsVisible(labelModeRegionEvent);
    this.custRouteTheme.setLabelsVisible(labelModeRegionEvent);
    this.custRouteThemeMobile.setLabelsVisible(labelModeRegionEvent);
    this.custTheme.refresh();
    this.custThemeMobile.refresh();
    this.custRegionTheme.refresh();
    this.custRegionThemeMobile.refresh();
    this.custRouteTheme.refresh();
    this.custRouteThemeMobile.refresh();

    var bt = AdfPage.PAGE.findComponent('rgEvnt:0:cil7');
    if (labelModeRegionEvent)
        bt.setIcon(mainImageFolder + "/imagesmenu/nav03_a.png");
    else 
        bt.setIcon(mainImageFolder + "/imagesmenu/nav03.png");
}

Events.prototype.zoomIn = function() {
	eventsMapObject.setMapZoomLevel(eventsMapObject.getMapZoomLevel() + 1);
}

Events.prototype.zoomOut = function() {
	eventsMapObject.setMapZoomLevel(eventsMapObject.getMapZoomLevel() - 1);
}

Events.prototype.animateZoom = function() {
    this.eventTheme.zoomToTheme();
}

Events.prototype.showEvents = function() {
    if(this.eventTheme.visible) {
     this.eventTheme.setVisible(false);
    } else {
     this.eventTheme.setVisible(true);
    }
}

Events.prototype.showCustPoints = function() {
    if(this.custThemeMobile.visible) {
     this.custThemeMobile.setVisible(false);
    } else {
     this.custThemeMobile.setVisible(true);
    }
}

Events.prototype.showRegions = function() {
    if(this.custRegionThemeMobile.visible) {
     this.custRegionThemeMobile.setVisible(false);
    } else {
     this.custRegionThemeMobile.setVisible(true);
    }
}

Events.prototype.showRoutes = function() {
    if(this.custRouteThemeMobile.visible) {
     this.custRouteThemeMobile.setVisible(false);
    } else {
     this.custRouteThemeMobile.setVisible(true);
    }
}


Events.prototype.convertDate = function(param) {
	let today = new Date();
	var date = today.toLocaleDateString();
	var dateSplit = date.split(".");
	var formattedDate ;
	
	if(param==true) {
		formattedDate = dateSplit[2] + dateSplit[1] + dateSplit[0] + "000000";
	} else {
		formattedDate = dateSplit[2] + dateSplit[1] + dateSplit[0] + "235959";
	}
	
	return formattedDate;
}

Events.prototype.dateReplace = function(date) {
	var rDate = "";
	if(date != null){
		rDate = date.replaceAll(".", "");
		rDate = rDate.replaceAll(" ","");
		rDate = rDate.replaceAll(":","");
		rDate = rDate + "00"
	}
	return rDate;
}

Events.prototype.formatDate = function(param,date) {
	
	var dateSplit = date.split(".");
	var formattedDate ;
	
	if(param==true) {
		formattedDate = dateSplit[0] + dateSplit[1] + dateSplit[2] + "000000";
	} else {
		formattedDate = dateSplit[0] + dateSplit[1] + dateSplit[2] + "235959";
	}
	
	return formattedDate;
	
}
</script>