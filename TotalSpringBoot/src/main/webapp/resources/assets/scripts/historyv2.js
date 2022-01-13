var tripsMapObject;
var tripTheme;
var tripsTheme = new Array(99);
var dateArray = new Array(20);
var themeName;
var themeLineNameSpeed;
var themeLineStartName;
var themeLineEndName;
var themeLineStyleName;
var themeLineStartPointStyle;
var themeLineEndPointStyle;
var themeAnimateName;
var themeAnimateIconUrl = "./resources/assets/styles/images/pinTracker.png";
//var themeAnimateIconUrl = "http://localhost:8080/Infomobil_Spring/resources/images/pinTracker.png";
var themeAnimateSpeed = 250;
var playSpeed = 2;
var tripMyEvent;
var distanceTool;
var temizleFlag = 1;
var connectFlag = 0;
var defaultStyle;
var defaultStyleX;
var defaultNumberStyle;
var connectSpeed;
var connectSpeed2;
var connectSpeed3;
var connectSpeed4;
var connectSpeed5;
var connectSpeed6;
var tripStyle1;
var tripStyle2;
var tripStyle3;
var tripStyle4;
var tripStyle5;
var numberStyle1;
var numberStyle2;
var numberStyle3;
var numberStyle4;
var numberStyle5;
var numberStyle6;
var numberStyle7;
var numberStyle8;
var numberStyle9;
var numberStyle10;
var mobile;
var startPosTimeStr;
var stopPosTimeStr;
var mapInfoEvent;
var themeStyle;
var dateKonum;
var themeType;
var labelModeRegionTrip = false;//default bolge,nokta etiketi kapalidir.
var company;
var username;
var selectedTripKm;
var gotoStartPointOrZoomToThemeSiniri = 2;

var layerAddedCount = 0;

var movePointLayer;

var mapConfig = {
    "mapTileLayer" : "OSM_MERCATOR", "format" : "PNG", "coordSys" :  {
        "srid" : 3857, "type" : "PROJECTED", "distConvFactor" : 1.0, "minX" :  - 2.0037508E7, "minY" :  - 2.0037508E7, "maxX" : 2.0037508E7, "maxY" : 2.0037508E7
    },
"zoomLevels" : [{"zoomLevel" : 0, "name" : "", "tileWidth" : 2.0037508E7, "tileHeight" : 2.0037508E7, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 1, "name" : "", "tileWidth" : 1.0018754E7, "tileHeight" : 1.0018754E7, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 2, "name" : "", "tileWidth" : 5009377.0, "tileHeight" : 5009377.0, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 3, "name" : "", "tileWidth" : 2504688.5, "tileHeight" : 2504688.5, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 4, "name" : "", "tileWidth" : 1252344.25, "tileHeight" : 1252344.25, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 5, "name" : "", "tileWidth" : 626172.125, "tileHeight" : 626172.125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 6, "name" : "", "tileWidth" : 313086.0625, "tileHeight" : 313086.0625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 7, "name" : "", "tileWidth" : 156543.03125, "tileHeight" : 156543.03125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 8, "name" : "", "tileWidth" : 78271.515625, "tileHeight" : 78271.515625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 9, "name" : "", "tileWidth" : 39135.7578125, "tileHeight" : 39135.7578125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 10, "name" : "", "tileWidth" : 19567.87890625, "tileHeight" : 19567.87890625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 11, "name" : "", "tileWidth" : 9783.939453125, "tileHeight" : 9783.939453125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 12, "name" : "", "tileWidth" : 4891.9697265625, "tileHeight" : 4891.9697265625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 13, "name" : "", "tileWidth" : 2445.98486328125, "tileHeight" : 2445.98486328125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 14, "name" : "", "tileWidth" : 1222.992431640625, "tileHeight" : 1222.992431640625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 15, "name" : "", "tileWidth" : 611.4962158203125, "tileHeight" : 611.4962158203125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 16, "name" : "", "tileWidth" : 305.74810791015625, "tileHeight" : 305.74810791015625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 17, "name" : "", "tileWidth" : 152.87405395507812, "tileHeight" : 152.87405395507812, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 18, "name" : "", "tileWidth" : 76.43702697753906, "tileHeight" : 76.43702697753906, "tileImageWidth" : 256, "tileImageHeight" : 256}]
};

Trips = function () {
    this.infBasemapTrip = null;
    this.hereBasemapTrip = null;
    this.infTransparentBaseMapTrip = null;
    this.custTheme = null;
    this.custRegionTheme = null;
    this.custRouteTheme = null;
    this.weatherTheme = null;
    this.marqueeZoomTool = null;
    this.eventTheme = null;
    tripTheme = null;
    this.themeType= null;
    this.themeType= null;
    this.defaultStyle=null;
    this.mobile = null;
    this.startPosTimeStr = null;
    this.stopPosTimeStr = null;
    this.tripsTheme = new Array(99);
}

Trips.prototype.startUp = function (company,mobile,startPosTimeStr,stopPosTimeStr,username,themeType) {
	layerAddedCount = 0;
	company = company;
	this.mobile = mobile;
	this.startPosTimeStr = startPosTimeStr;
	this.stopPosTimeStr = stopPosTimeStr;
	this.username = username;
	connectFlag = 0;
	tripsObject.isSeyahatRotasiHizaGoreOpened=true;
	this.themeType = themeType;
    var tmp = document.getElementById('map');
    tripsMapObject = new OM.Map(tmp, 
    {
        mapviewerURL : __oracleMapsUrlbase,autoLoadCss :false
    });

    this.infBasemapTrip = new OM.layer.TileLayer("baseMap", 
    {
        dataSource : "INFOMAP", tileLayer : "INFOTECH_TILELAYER", tileServerURL : __oracleMapsUrlbase + "/mcserver"
    });
    tripsMapObject.addLayer(this.infBasemapTrip);

    this.infTransparentBaseMapTrip = new OM.layer.TileLayer("infTransparentBaseMap", 
    {
        dataSource : "INFOMAP", tileLayer : "INFOTECH_TILELAYER_TURKEY_H", tileServerURL : __oracleMapsUrlbase + "/mcserver"
    });
     this.infTransparentBaseMapTrip.setZoomLevelRange(0,50);
     this.infTransparentBaseMapTrip.setVisible(false);
    
    
    this.hereBasemap = new OM.layer.GoogleTileLayer("hereBaseMap",  {
         key : __googleKey, mapType : OM.layer.GoogleTileLayer.TYPE_SATELLITE,tilt:0 
    });
    
    this.hereBasemap.setVisible(false);
    
    //scale bar
    var mapScaleBar = new OM.control.ScaleBar();
    tripsMapObject.addMapDecoration(mapScaleBar);

    //copyright note
    var copyright = new OM.control.CopyRight( {
        anchorPosition : 6, textValue : __copyRightNote, fontSize : 12, fontFamily : "Arial", fontColor : "black"
    });
    tripsMapObject.addMapDecoration(copyright);
    tripsMapObject.setMapCenter(new OM.geometry.Point(35.24, 38.95, 8307));
    tripsMapObject.setMapZoomLevel(5);
    tripsMapObject.init();
    
    //legend
    var html = '<table height="100%" width="100%" class="white">';

    html += '  <tr><td>&nbsp;</td><td style="width:60px; background: #DB0000; border-color: #00FF00; margin: 5px;"></td><td style="width: 50px;">0-20</td></tr><tr><td colspan="2"></td></tr><tr><td colspan="3"></td></tr>';
    html += '  <tr><td>&nbsp;</td><td style="width:60px; background: #FD6868; border-color: #92AD2F; margin: 5px;"></td><td style="width: 50px;">20-50</td></tr><tr><td colspan="2"></td></tr><tr><td colspan="3"></td></tr>';
    html += '  <tr><td>&nbsp;</td><td style="width:60px; background: #E6ABAB; border-color: #3C6800; margin: 5px;"></td><td style="width: 50px;">50-70</td></tr><tr><td colspan="2"></td></tr><tr><td colspan="3"></td></tr>';
    html += '  <tr><td>&nbsp;</td><td style="width:60px; background: #3C6800; border-color: #E6ABAB; margin: 5px;"></td><td style="width: 50px;">70-90</td></tr><tr><td colspan="2"></td></tr><tr><td colspan="3"></td></tr>';
    html += '  <tr><td>&nbsp;</td><td style="width:60px; background: #92AD2F; border-color: #FD6868; margin: 5px;"></td><td style="width: 50px;">90-110</td></tr><tr><td colspan="2"></td></tr><tr><td colspan="3"></td></tr>';
    html += '  <tr><td>&nbsp;</td><td style="width:60px; background: #00FF00; border-color: #DB0000; margin: 5px;"></td><td style="width: 50px;">110 +</td></tr><tr><td colspan="2"></td></tr><tr><td colspan="3"></td></tr>';

    legend = new OM.control.MapDecoration(html, 
    {
        draggable : true, title : "Lejant (H&#305;z km/sa) ", titleStyle :  {
            "border-style" : "solid", "border-color" : "#101418", "border-width" : "1px", "background-color" : "rgb(0, 0, 0)", "font-size" : "12px", "font-weight" : "bold", "color" : "#FDFDFD", "font-family" : "Tahoma"
        },
        contentStyle :  {
            "border-style" : "solid", "border-color" : "#101418", "border-width" : "1px", "font-size" : "10px", "font-weight" : "bold", "color" : "rgba(0,0,0)", "background-color" : "rgba(137, 137, 137, 0.19"
        }
    });
    legend.setVisible(false);
    tripsMapObject.addMapDecoration(legend);
    
    this.themeName = 'tripTheme';
    this.themeLineName = this.themeName + '_line';
    this.themeLineNameSpeed= this.themeName + '_line_speed';
    this.themeLineStartName = this.themeName + '_linestart';
    this.themeLineEndName = this.themeName + '_lineend';
    this.themeLineStyleName = __mapStylesDataSourceName + ".L.N_HISTORY";
    this.themeLineStartPointStyle = __mapStylesDataSourceName + ".M.N_HISTORY_START";
    this.themeLineEndPointStyle = __mapStylesDataSourceName + ".M.N_HISTORY_END";
    this.themeAnimateName = this.themeName + '_animate';
    
    //Styles
    if (!themeStyle) {
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HISTORY_01", 
        {
            url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                themeStyle = rangeBuckets;
            }
        });
    };
    
    if(themeType=='all') {
    	tripTheme = new OM.layer.VectorLayer(themeName, 
    	        {
    	            infoWindow : false, def :  {
    	                type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, theme : "N_MAP_THEME_LOC_HIST", url : __oracleMapsUrlbase
    	            }
    	        });

    	        tripTheme.setQueryParameters(mobile, startPosTimeStr, stopPosTimeStr);
		        tripTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK, tripsObject.mobilesClick);
    } 

    else {
    
    tripTheme = new OM.layer.VectorLayer(themeName, 
    {
        infoWindow : false, def :  {
            type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, theme : "N_MAP_THEME_TRIP", url : __oracleMapsUrlbase
        }
    });
    tripTheme.setQueryParameters(mobile, startPosTimeStr, stopPosTimeStr);
    tripTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK, tripsObject.mobilesClick);
   }
    
    tripTheme.addListener("layerFinishLoad", tripsObject.layerAdded);
    
    tripsMapObject.addLayer(tripTheme);
    tripTheme.zoomToTheme();
    tripTheme.setVisible(false);
    //actionEvent.cancel();  
    
    if(!connectSpeed) {
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HIZASIM_0-20", 
                   {
                       url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                           connectSpeed=rangeBuckets;
                       }
                   });
   }               
   
   if(!connectSpeed2) {
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HIZASIM_20-50", 
                   {
                       url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                           connectSpeed2=rangeBuckets;
                       }
                   });
   }   
   
   if(!connectSpeed3) {
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HIZASIM_50-70", 
                   {
                       url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                           connectSpeed3=rangeBuckets;
                       }
                   });
   }  
   
       if(!connectSpeed4) {
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HIZASIM_70-90", 
                   {
                       url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                           connectSpeed4=rangeBuckets;
                       }
                   });
   } 
   
       if(!connectSpeed5) {
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HIZASIM_90-110", 
                   {
                       url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                           connectSpeed5=rangeBuckets;
                       }
                   });
   } 
   
        if(!connectSpeed6) {
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HIZASIM_110-130", 
                   {
                       url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                           connectSpeed6=rangeBuckets;
                       }
                   });
   } 
        
        if(!tripStyle1) {
            OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HISTORY_01", 
                       {
                           url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        	   tripStyle1=rangeBuckets;
                           }
                       });
       }
        
        this.defaultStyle = tripStyle1;
        
        if(!tripStyle2) {
            OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HISTORY_02", 
                       {
                           url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        	   tripStyle2=rangeBuckets;
                           }
                       });
       }               
        
        if(!tripStyle3) {
            OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HISTORY_03", 
                       {
                           url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        	   tripStyle3=rangeBuckets;
                           }
                       });
       }               
        
        if(!tripStyle4) {
            OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HISTORY_04", 
                       {
                           url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        	   tripStyle4=rangeBuckets;
                           }
                       });
       }               
        
        if(!tripStyle5) {
            OM.style.StyleStore.getServerSideStyle(__mapDataSource, "L.N_HISTORY_05", 
                       {
                           url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        	   tripStyle5=rangeBuckets;
                           }
                       });
       }               
        
        
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_HISTORY_END", 
                {
                    url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        numberStyleEnd=rangeBuckets;
                    }
                });
        
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_HISTORY_START", 
                {
                    url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        numberStyle1=rangeBuckets;
                    }
                });
        
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_NUMBER_02", 
                {
                    url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        numberStyle2=rangeBuckets;
                    }
                });
        
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_NUMBER_03", 
                {
                    url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        numberStyle3=rangeBuckets;
                    }
                });
        
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_NUMBER_04", 
                {
                    url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        numberStyle4=rangeBuckets;
                    }
                });
        
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_NUMBER_05", 
                {
                    url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        numberStyle5=rangeBuckets;
                    }
                });
        
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_NUMBER_06", 
                {
                    url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        numberStyle6=rangeBuckets;
                    }
                });
        
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_NUMBER_07", 
                {
                    url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        numberStyle7=rangeBuckets;
                    }
                });
        
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_NUMBER_08", 
                {
                    url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        numberStyle8=rangeBuckets;
                    }
                });
        
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_NUMBER_09", 
                {
                    url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        numberStyle9=rangeBuckets;
                    }
                });
        
        OM.style.StyleStore.getServerSideStyle(__mapDataSource, "M.N_NUMBER_10", 
                {
                    url : __oracleMapsUrlbase, callback : function (rangeBuckets) {
                        numberStyle10=rangeBuckets;
                    }
                });
        
        var cpTheQueryMode = 11;
        var cpTheEventGroupName = null;
        var cpTheEventCode = null;  
        var cpTheGroupname = "Hepsi";
        
        //eventTheme
        this.eventTheme = new OM.layer.VectorLayer("eventTheme", 
         {
              infoWindow : false,
              def :  {
                  type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, theme : "N_MAP_THEME_EVENT", url : __oracleMapsUrlbase
              }
          });

        this.eventTheme.setQueryParameters(cpTheQueryMode, mobile, cpTheQueryMode, mobile, cpTheEventGroupName, cpTheQueryMode, cpTheGroupname, cpTheQueryMode, cpTheGroupname, cpTheEventGroupName, cpTheQueryMode, cpTheEventCode, cpTheQueryMode, mobile, cpTheEventCode, cpTheQueryMode, cpTheGroupname, cpTheEventCode, startPosTimeStr, stopPosTimeStr, username);
        this.eventTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK, tripsObject.eventsClick);
        this.eventTheme.setVisible(false);
        tripsMapObject.addLayer(this.eventTheme);
  
        //pointMobile
        this.custThemeMobile = new OM.layer.VectorLayer("custThemeMobile", 
          {
              def :  {
                  type : OM.layer.VectorLayer.TYPE_PREDEFINED, 
                  dataSource : __mapDataSource, 
                  theme : "F_CPOINT_MOBILE", url : __oracleMapsUrlbase
              }
          });

        this.custThemeMobile.setQueryParameters(mobile);
        this.custThemeMobile.setLabelsVisible(true);
        this.custThemeMobile.setVisible(false);
        tripsMapObject.addLayer(this.custThemeMobile);
        
      //regionMobile
        this.custRegionThemeMobile = new OM.layer.VectorLayer("custRegionThemeMobile", 
        {
            def :  {
                type : OM.layer.VectorLayer.TYPE_PREDEFINED, 
                dataSource : __mapDataSource, 
                theme : "F_REGION_MBL", url : __oracleMapsUrlbase
            }
        });

      this.custRegionThemeMobile.setQueryParameters(mobile);
      this.custRegionThemeMobile.setLabelsVisible(true);
      this.custRegionThemeMobile.setVisible(false);
      tripsMapObject.addLayer(this.custRegionThemeMobile);
      
    //routemobile
      this.custRouteThemeMobile = new OM.layer.VectorLayer("routeThemeMobile", 
       {
           def :  {
               type : OM.layer.VectorLayer.TYPE_PREDEFINED, 
               dataSource : __mapDataSource, 
               theme : "F_ROUTE_MOBILE", url : __oracleMapsUrlbase
           }
       });

     this.custRouteThemeMobile.setQueryParameters(mobile);
     this.custRouteThemeMobile.setLabelsVisible(true);
     this.custRouteThemeMobile.setVisible(false);
     tripsMapObject.addLayer(this.custRouteThemeMobile);
      


    
    return;

}

Trips.prototype.layerAdded = function(e){
	layerAddedCount++;
	if(layerAddedCount == 1){
	    setTimeout(function () {
	    	tripsObject.connectFoi();
	    },1000);
	}
}


Trips.prototype.switchSat = function () {
    //var bt = AdfPage.PAGE.findComponent("RgTrip:0:clhUydu");
    if (this.hereBasemap.isVisible(10)) {
        this.hereBasemap.setVisible(false);
        this.infTransparentBaseMapTrip.setVisible(false);
        tripsMapObject.addLayer(this.infBasemapTrip);
        this.infBasemapTrip.setVisible(true);

        //bt.setIcon("images/mycompany/imagesmenu/nav12.png");
        //bt.setHoverIcon("images/mycompany/imagesmenu/nav12_h.png");
        //bt.setDepressedIcon("images/mycompany/imagesmenu/nav12_a.png");
    }
    else {
        //bt.setIcon("images/mycompany/imagesmenu/nav13.png");
        //bt.setHoverIcon("images/mycompany/imagesmenu/nav13_h.png");
        //bt.setDepressedIcon("images/mycompany/imagesmenu/nav13_a.png");
        this.infBasemapTrip.setVisible(false);
        tripsMapObject.addLayer(this.hereBasemap);
        this.hereBasemap.setVisible(true);
        tripsMapObject.addLayer(this.infTransparentBaseMapTrip);
        this.infTransparentBaseMapTrip.setVisible(true);
        tripsMapObject.removeLayer(this.infBasemapTrip);
    }
}



Trips.prototype.animateThemePlay = function () {
var ln = null;
if (tripTheme != null) {
    var foiData = tripTheme.featureArray;
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
       if (coors.length >= 4) {        
         ln =  new OM.geometry.LineString(coors, 3857);
       }
    }
}
if (ln != null) {
    var foiId = this.themeAnimateName;
    var layer=tripsMapObject.getLayerByName(foiId);
    tripsMapObject.removeLayer(layer);
     var x = ln.coordinates[0];
    var y = ln.coordinates[1];
    var mpoint = new OM.geometry.Point(x, y, 3857);
    var nStyle = new OM.style.Marker({src:themeAnimateIconUrl});
    var feature = new OM.Feature(foiId, mpoint, 
    {
        renderingStyle : nStyle
    });
    var elephant  = new OM.layer.VectorLayer(foiId,
    {def:{type:OM.layer.VectorLayer.TYPE_LOCAL}});

    elephant.addFeature(feature);
    tripsMapObject.addLayer(elephant);
    
    feature.animateToNewLocation(ln, 
    {
        loop : false, time : themeAnimateSpeed, bounce : false
    });
}
}

Trips.prototype.animateThemeClear = function () {

    var layer=tripsMapObject.getLayerByName("sia_animate_layer");
    tripsMapObject.removeLayer(layer);
}

Trips.prototype.marqueeZoom = function (actionEvent) {
    var mode = OM.tool.MarqueeZoomTool.ONE_TIME;
    tripsObject.marqueeZoomTool = new OM.tool.MarqueeZoomTool(tripsMapObject, mode);
    tripsObject.marqueeZoomTool.start();
}

Trips.prototype.zoomIn = function() {
	tripsMapObject.setMapZoomLevel(tripsMapObject.getMapZoomLevel() + 1);
}

Trips.prototype.zoomOut = function() {
	tripsMapObject.setMapZoomLevel(tripsMapObject.getMapZoomLevel() - 1);
}

var tempLineArr1, tempLineArr2;

Trips.prototype.connectFoi = function() {
  if (connectFlag == 1) {
    tripsObject.disconnectFoiAll();
    return;
  }
  var j = 0;
  var nameLine = 0;
  var stFoiLine = 0;
  var isFirst = true;
  var stPointTemp;
  if (tripTheme != null) {
    tripsObject.foiIdArray = new Array();
    var foiData = tripTheme.featureArray;
    if (foiData != null) {
      // var coors = new Array();
      var lineArray = new Array();
      var stLineArray = new Array();
      var coors = new Array();
      for (var i = 0; i < foiData.length - 1; i++) {
        var x = foiData[i].geo.coordinates[0];
        var y = foiData[i].geo.coordinates[1];

        var point3857 = new OM.geometry.Point(x, y, 3857);
        var pOri = point3857.transform(8307);
        var attrs = foiData[i + 1].attributes;

        if (this.themeType == 'all') {
          dateKonum = attrs["KONUM TARIHI"];

          for (j = 0; j < dateArray.length; j = j + 2) {
            if (tripsObject.compareDate(dateArray[j], dateArray[j + 1], dateKonum) == true) {
              if (j == 0 || j == 10) {
                defaultStyle = tripStyle1;
              } else if (j == 2 || j == 12) {
                defaultStyle = tripStyle2;
              } else if (j == 4 || j == 14) {
                defaultStyle = tripStyle3;
              } else if (j == 6 || j == 16) {
                defaultStyle = tripStyle4;
              } else if (j == 8 || j == 18) {
                defaultStyle = tripStyle5;
              } else {
                defaultStyle = tripStyle1;
              }
              break;
            } else {
              continue;
            }
          }
        }
        if (this.themeType == "all") {
          if (defaultStyle != defaultStyleX) {
            coors = new Array();
            // Start Pin must be put.
            foiId = this.themeLineStartName + '_' + stFoiLine;
            var startFOI = tripsMapObject.getLayerByName(foiId);
            stFoiLine++;
            //tripsMapObject.removeLayer(startFOI);
            startFOI = null;
            var point = new OM.geometry.Point(foiData[i].geo.coordinates[0], foiData[i].geo.coordinates[1], 3857);

            var startPoint = point.transform(8307);

            if (isFirst) {
              isFirst = false;
              stPointTemp = startPoint;
            }

            var feature = new OM.Feature(foiId, startPoint, {
              renderingStyle: null
            });
            startFOI = new OM.layer.VectorLayer(foiId, {
              def: {
                type: OM.layer.VectorLayer.TYPE_LOCAL
              }
            });


            switch (true) {
              case (j == 0):
                defaultNumberStyle = numberStyle1;
                break;
              case (j == 2):
                defaultNumberStyle = numberStyle2;
                break;
              case (j == 4):
                defaultNumberStyle = numberStyle3;
                break;
              case (j == 6):
                defaultNumberStyle = numberStyle4;
                break;
              case (j == 8):
                defaultNumberStyle = numberStyle5;
                break;
              case (j == 10):
                defaultNumberStyle = numberStyle6;
                break;
              case (j == 12):
                defaultNumberStyle = numberStyle7;
                break;
              case (j == 14):
                defaultNumberStyle = numberStyle8;
                break;
              case (j == 16):
                defaultNumberStyle = numberStyle9;
                break;
              case (j == 18):
                defaultNumberStyle = numberStyle10;
                break;
              default:
                defaultNumberStyle = numberStyle1;
            }


            feature.setRenderingStyle(defaultNumberStyle);
            startFOI.addFeature(feature);
            stLineArray.push(startFOI);
          }
          //tripsMapObject.addLayer(startFOI);
        } else {
          // Start Pin must be put.
          foiId = this.themeLineStartName;
          var startFOI = tripsMapObject.getLayerByName(foiId);
          //tripsMapObject.removeLayer(startFOI);
          startFOI = null;
          var point = new OM.geometry.Point(foiData[i].geo.coordinates[0], foiData[i].geo.coordinates[1], 3857);

          var startPoint = point.transform(8307);
          var feature = new OM.Feature(foiId, startPoint, {
            renderingStyle: numberStyle1
          });
          startFOI = new OM.layer.VectorLayer(foiId, {
            def: {
              type: OM.layer.VectorLayer.TYPE_LOCAL
            }
          });
          startFOI.addFeature(feature);
          stLineArray.push(startFOI);

        }


        foiId = this.themeLineEndName;
        var endFOI = tripsMapObject.getLayerByName(foiId);
        //tripsMapObject.removeLayer(startFOI);
        endFOI = null;
        point = new OM.geometry.Point(foiData[foiData.length - 1].geo.coordinates[0], foiData[foiData.length - 1].geo.coordinates[1], 3857);

        var endPoint = point.transform(8307);
        var feature = new OM.Feature(foiId, endPoint, {
          renderingStyle: numberStyleEnd
        });
        endFOI = new OM.layer.VectorLayer(foiId, {
          def: {
            type: OM.layer.VectorLayer.TYPE_LOCAL
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

        if (coors.length >= 4) {
          if (defaultStyle != defaultStyleX && this.themeType == "all") {
            var ln = new OM.geometry.LineString(coors, 8307);
            var foiId = this.themeLineName + '_' + nameLine;
            nameLine++;
            var lf = tripsMapObject.getLayerByName(foiId);
            tripsMapObject.removeLayer(lf);

            tripsObject.foiIdArray.push(foiId);

            var feature = new OM.Feature(foiId, ln, {
              renderingStyle: defaultStyle
            });

            lf = new OM.layer.VectorLayer(foiId, {
              def: {
                type: OM.layer.VectorLayer.TYPE_LOCAL
              }
            });

            defaultStyleX = defaultStyle;
            lf.addFeature(feature);
            lineArray.push(lf);
          } else {
            var ln = new OM.geometry.LineString(coors, 8307);
            var foiId = this.themeLineName;
            var lf = tripsMapObject.getLayerByName(foiId);
            tripsMapObject.removeLayer(lf);

            tripsObject.foiIdArray.push(foiId);

            var feature = new OM.Feature(foiId, ln, {
              renderingStyle: tripStyle1
            });

            lf = new OM.layer.VectorLayer(foiId, {
              def: {
                type: OM.layer.VectorLayer.TYPE_LOCAL
              }
            });

            defaultStyleX = defaultStyle;
            lf.addFeature(feature);
            lineArray.push(lf);
          }
        }
      }
      // for(i)

      for (var i = 0; i < lineArray.length; i++) {
        tripsMapObject.addLayer(lineArray[i]);
      }

      for (var a = 0; a < stLineArray.length; a++) {
        tripsMapObject.addLayer(stLineArray[a]);

      }

      tempLineArr1 = lineArray;
      tempLineArr2 = stLineArray;


    }
    //  tripsObject.zoomIn();
    //  tripsObject.zoomOut();

    if (this.selectedTripKm < gotoStartPointOrZoomToThemeSiniri) {
      tripsMapObject.setMapCenterAndZoomLevel(stPointTemp, 15, false);
    }
    //else{
    //  tripTheme.zoomToTheme();
    //}

  }
  // if (tripTheme != null)
  connectFlag = 1;
}

Trips.prototype.removeConnectedObjects = function () {
    var foiId = this.themeLineNameSpeed;
    var layer=tripsMapObject.getLayerByName(foiId);
    if(layer){
        tripsMapObject.removeLayer(layer);
    }
    }

Trips.prototype.removeConnectedObjectsAll = function () {
	 var foiId = this.themeLineName;
	 var layer=tripsMapObject.getLayerByName(foiId);
     tripsMapObject.removeLayer(layer);
     foiId = this.themeLineStartName ;
	 layer=tripsMapObject.getLayerByName(foiId);
     tripsMapObject.removeLayer(layer);

	for(var i=0;i<100;i++) {
	var foiId = this.themeLineName + '_' + i;
    var layer=tripsMapObject.getLayerByName(foiId);
    if(layer){
        tripsMapObject.removeLayer(layer);
    } else {
    	break;
    }
	}
	
	
	for(var a=0;a<100;a++) {
		var foiId = this.themeLineStartName + '_' + a;
		var foiIdEnd = this.themeLineEndName;
	    var layer=tripsMapObject.getLayerByName(foiId);
	    var layerEnd=tripsMapObject.getLayerByName(foiIdEnd);
	    if(layer){
	        tripsMapObject.removeLayer(layer);
	    }else if(layerEnd){
	   	 tripsMapObject.removeLayer(layerEnd);
	    } else {
	    	break;
	    }
		}

    }

Trips.prototype.animateZoom = function() {
    tripTheme.zoomToTheme();
}

Trips.prototype.disconnectFoi = function () {
    /*var obj = AdfPage.PAGE.findComponent("RgTrip:0:clhConnectFoi");
    obj.setVisible(true);

    obj = AdfPage.PAGE.findComponent("RgTrip:0:clhDisconnectFoi");
    obj.setVisible(false);*/
    tripsObject.removeConnectedObjects();
}

Trips.prototype.disconnectFoiAll = function () {
    /*var obj = AdfPage.PAGE.findComponent("RgTrip:0:clhConnectFoi");
    obj.setVisible(true);

    obj = AdfPage.PAGE.findComponent("RgTrip:0:clhDisconnectFoi");
    obj.setVisible(false);*/
    connectFlag = 0;
    tripsObject.removeConnectedObjectsAll();
}

Trips.prototype.connectFoiWithSpeed = function () { 
  if(tripsObject.foiIdArray && tripsObject.foiIdArray.length > 0 && !tripsObject.isSeyahatRotasiHizaGoreOpened){
		tripsObject.removeConnectedObjects();
		tripsObject.foiIdArray = new Array();
		tripsObject.isSeyahatRotasiHizaGoreOpened = true;
	    legend.setVisible(false);
	}else{
		tripsObject.isSeyahatRotasiHizaGoreOpened = false;
	    legend.setVisible(true);
	}
    if (tripTheme != null) {
    	tripsObject.foiIdArray = new Array();
        var foiData = tripTheme.featureArray;
        if (foiData != null) {
            // var coors = new Array();
            var lineArray = new Array();
            for (var i = 0;i < foiData.length - 1;i++) {
                var x = foiData[i].geo.coordinates[0];
                var y = foiData[i].geo.coordinates[1];

                var point3857 = new OM.geometry.Point(x, y, 3857);
                var pOri = point3857.transform(8307);
                var attrs = foiData[i + 1].attributes;
                var posSpeed = attrs["POS_SPEED"];

                var coors = new Array();
                var styleName = 'L.N_HIZASIM_0-20';
                switch (true) {
                    case (posSpeed == 0):
                        defaultStyle = connectSpeed;
                        break;
                    case (posSpeed > 0 && posSpeed < 21):
                        defaultStyle = connectSpeed;
                        break;
                    case (posSpeed > 20 && posSpeed < 51):
                        defaultStyle = connectSpeed2;
                        break;
                    case (posSpeed > 50 && posSpeed < 71):
                        defaultStyle = connectSpeed3;
                        break;
                    case (posSpeed > 70 && posSpeed < 91):
                        defaultStyle = connectSpeed4;
                        break;
                    case (posSpeed > 90 && posSpeed < 111):
                         defaultStyle = connectSpeed5;
                        break;
                    case (posSpeed > 110):
                        defaultStyle = connectSpeed6;
                        break;
                    default :
                        defaultStyle = connectSpeed;
                }
                
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
                
                if (coors.length >= 4) {
                    var ln = new OM.geometry.LineString(coors, 8307);
                    var foiId = this.themeLineNameSpeed + '_' + i;
                    var lf = tripsMapObject.getLayerByName(foiId);
                    tripsMapObject.removeLayer(lf);
                    
                    tripsObject.foiIdArray.push(foiId);
                        
                     var feature = new OM.Feature(foiId, ln, 
                    {
                        renderingStyle : defaultStyle
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
            // for(i)
            
            if(!tripsObject.isSeyahatRotasiHizaGoreOpened){
                for (var i = 0;i < lineArray.length;i++) {
                    tripsMapObject.addLayer(lineArray[i]);
                }
            }
            
            

        }
        // if( foiData != null )
        //tripsObject.zoomIn();
       // tripsObject.zoomOut();
    }
    // if (tripTheme != null)
}

Trips.prototype.showTrip = function() {
	if (tripTheme.isVisible()) {
		tripTheme.setVisible(false);
	} else {
		tripsObject.zoomOut();
	    tripsMapObject.removeLayer(tripTheme);
	    if(this.themeType=='all') {
	    	tripTheme = new OM.layer.VectorLayer(themeName, 
	    	        {
	    	            infoWindow : false, def :  {
	    	                type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, theme : "N_MAP_THEME_LOC_HIST", url : __oracleMapsUrlbase
	    	            }
	    	        });

	    	        tripTheme.setQueryParameters(this.mobile, this.startPosTimeStr, this.stopPosTimeStr);
			        tripTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK, tripsObject.mobilesClick);
	    } else {
	    
	    tripTheme = new OM.layer.VectorLayer(themeName, 
	    {
	        infoWindow : false, def :  {
	            type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, theme : "N_MAP_THEME_TRIP", url : __oracleMapsUrlbase
	        }
	    });
	    tripTheme.setQueryParameters(this.mobile, this.startPosTimeStr, this.stopPosTimeStr);
        tripTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK, tripsObject.mobilesClick);
	   }
	    tripsObject.zoomOut();
		tripsObject.zoomIn();
	    tripsMapObject.addLayer(tripTheme);
		tripTheme.setBoundingTheme(true);
		tripTheme.setVisible(true);
		tripsObject.zoomIn();
		
	}
	if(movePointLayer){
	 	movePointLayer.bringToTop();
	}
	
}

Trips.prototype.showEvents = function() {
    if(this.eventTheme.visible) {
     this.eventTheme.setVisible(false);
    } else {
    	  var cpTheQueryMode = 11;
          var cpTheEventGroupName = null;
          var cpTheEventCode = null;  
          var cpTheGroupname = "Hepsi";
    	   //eventTheme
        tripsMapObject.removeLayer(this.eventTheme);
        this.eventTheme = new OM.layer.VectorLayer("eventTheme", 
         {
              infoWindow : false,
              def :  {
                  type : OM.layer.VectorLayer.TYPE_PREDEFINED, dataSource : __mapDataSource, theme : "N_MAP_THEME_EVENT", url : __oracleMapsUrlbase
              }
          });

        this.eventTheme.setQueryParameters(
              cpTheQueryMode,
              this.mobile, 
              cpTheQueryMode, 
              this.mobile, 
              cpTheEventGroupName, 
              cpTheQueryMode, 
              cpTheGroupname, 
              cpTheQueryMode, 
              cpTheGroupname, 
              cpTheEventGroupName, 
              cpTheQueryMode, 
              cpTheEventCode, 
              cpTheQueryMode, 
              this.mobile, 
              cpTheEventCode, 
              cpTheQueryMode, 
              cpTheGroupname, 
              cpTheEventCode, 
              this.startPosTimeStr, 
              this.stopPosTimeStr, 
              this.username);
        


        this.eventTheme.addListener(OM.event.MouseEvent.MOUSE_CLICK, tripsObject.eventsClick);
        this.eventTheme.setVisible(true);
        tripsMapObject.addLayer(this.eventTheme);
    }
}

Trips.prototype.showCustPoints = function() {
    if(this.custThemeMobile.visible) {
     this.custThemeMobile.setVisible(false);
    } else {
     this.custThemeMobile.setVisible(true);
    }
}

Trips.prototype.showRegions = function() {
    if(this.custRegionThemeMobile.visible) {
     this.custRegionThemeMobile.setVisible(false);
    } else {
     this.custRegionThemeMobile.setVisible(true);
    }
}

Trips.prototype.showRoutes = function() {
    if(this.custRouteThemeMobile.visible) {
     this.custRouteThemeMobile.setVisible(false);
    } else {
     this.custRouteThemeMobile.setVisible(true);
    }
}

Trips.prototype.showAllTrips = function(tableData,company,username) {
	
	var stDate;
	var endDate;
	var j =0;
	dateArray = new Array(tableData.count()*2);

		for(var i=0;i<tableData.count();i++) {
			stDate = new Date(tableData.data()[i].startDate);
			endDate = new Date(tableData.data()[i].endDate);
			dateArray[j] = stDate;
			dateArray[j+1] = endDate;
			j = j+2;
		}
		tripsObject.startUp(company,tableData.data()[0].mobile,tableData.data()[0].startPosTimeStr,tableData.data()[tableData.count()-1].stopPosTimeStr,username,'all');
}

Trips.prototype.compareDate = function(from,to,check) {
	    check=dateKonum;
	    var fDate,tDate;
	    fDate = Date.parse(from);
	    fDate = formatDateToDD_MM_YYYY_HH_MM(fDate);
	    tDate = Date.parse(to);
	    tDate = formatDateToDD_MM_YYYY_HH_MM(tDate);


	    if((check <= tDate && check >= fDate)) {
	        return true;
	    }
	    return false;
	
	
}

Trips.prototype.msToTime = function (s) {
	// Pad to 2 or 3 digits, default is 2
	  function pad(n, z) {
	    z = z || 2;
	    return ('00' + n).slice(-z);
	  }

	  var ms = s % 1000;
	  s = (s - ms) / 1000;
	  var secs = s % 60;
	  s = (s - secs) / 60;
	  var mins = s % 60;
	  var hrs = (s - mins) / 60;

	  return pad(hrs) + ':' + pad(mins) + ':' + pad(secs) + '.' + pad(ms, 3);
	}

Trips.prototype.eventsClick =  function(pos) {
	var mouseLocOri = tripsMapObject.getCursorLocation();
	  var mouseLoc = mouseLocOri.transform(8307);
	  var id = 0;
	  var rowno = 0;
	  var alias = '';
	  var mobileId = 0;
	  var pos_time_stamp = '';

	  for (var i in pos.feature.attributes) {
	    if( i== 'MOBILE' ) {
		    mobileId = parseInt(parseFloat(pos.feature.attributes[i]));
	  		continue;
	    }
	    if( i == 'ALIAS' ) {
		    alias = pos.feature.attributes[i];
	  		continue;
	    }
	    if( i == 'ROWNO' ) {
	            rowno = pos.feature.attributes[i];
	  		continue;
	    }
	    if( i == 'POS_TIME_STAMP' ) {
	      pos_time_stamp = pos.feature.attributes[i];
	  		continue;
	    }
	  } // for()
	  
	  var mapData = {
				x : mouseLoc.coordinates[0],
				y : mouseLoc.coordinates[1],
				xOri : mouseLocOri.coordinates[0],
				yOri : mouseLocOri.coordinates[1],
				id : mobileId,
				row : parseFloat(rowno),
				al : alias,
				posdate : pos_time_stamp
			}
		$.ajax({
			type : "POST",
			url : "getEventInfo",
			data : mapData,
			success : function(result) {
				var pt = new OM.geometry.Point(pos.feature.geo.coordinates[0], pos.feature.geo.coordinates[1], 3857);
				tripsObject.showInfo(result.data, 330, 200, pt);
			},
			error : function(result) {
			}
		});
	}


Trips.prototype.mobilesClick =  function(pos) {
	
	  var mouseLocOri = tripsMapObject.getCursorLocation();
	  var mouseLoc = mouseLocOri.transform(8307);
	  var id = 0;
	  var rowno = 0;
	  var alias = '';
	  var mobileId = 0;
	  var pos_time_stamp = '';
	  for (var i in pos.feature.attributes) {
	    if( i== 'MOBILE' ) {
		    mobileId = parseInt(parseFloat(pos.feature.attributes[i]));
	  		continue;
	    }
	    if( i == 'ALIAS' ) {
		    alias = pos.feature.attributes[i];
	  		continue;
	    }
	    if( i == 'ROWNO' ) {
	            rowno = pos.feature.attributes[i];
	  		continue;
	    }
	    if( i == 'POS_TIME_STAMP' ) {
	      pos_time_stamp = pos.feature.attributes[i];
	  		continue;
	    }
	  } // for()
	  
	  var mapData = {
				x : mouseLoc.coordinates[0],
				y : mouseLoc.coordinates[1],
				xOri : mouseLocOri.coordinates[0],
				yOri : mouseLocOri.coordinates[1],
				id : mobileId,
				row : parseFloat(rowno),
				al : alias,
				posdate : pos_time_stamp
			}
		$.ajax({
			type : "POST",
			url : "getTripInfo",
			data : mapData,
			success : function(result) {
				var pt = new OM.geometry.Point(pos.feature.geo.coordinates[0], pos.feature.geo.coordinates[1], 3857);
				tripsObject.showInfo(result.data, 330, 200, pt);
			},
			error : function(result) {
			}
		});

}

Trips.prototype.showInfo = function(html, width, height, pt) {
	var content = html;
	var options = {
		width : '%100',
		height :'%100'
	};
	tripsMapObject.displayInfoWindow(pt, content, options);
}

Trips.prototype.addMarker = function(x, y) {
  var foiId = "sia_animate_layer";

  var layer = tripsMapObject.getLayerByName(foiId);
  tripsMapObject.removeLayer(layer);
  var mpoint = new OM.geometry.Point(x, y, 8307);

  var mapMarkerUrl = "./resources/assets/styles/images/pinTracker2.png";
  var nStyle = new OM.style.Marker({
    src: mapMarkerUrl
  });
  var feature = new OM.Feature(foiId, mpoint, {
    renderingStyle: nStyle
  });
  var vLayer = new OM.layer.VectorLayer(foiId, {
    def: {
      type: OM.layer.VectorLayer.TYPE_LOCAL
    }
  });

  vLayer.setVisible(true);
  vLayer.addFeature(feature);
  tripsMapObject.addLayer(vLayer);
}

Trips.prototype.updateMarkerPosition = function(x, y) {
  var foiId = "sia_animate_layer";
  var layer = tripsMapObject.getLayerByName(foiId);
  var mpoint = new OM.geometry.Point(x, y, 8307);
  var nStyle = new OM.style.Marker({
    src: mapMarkerUrl
  });
  var feature = new OM.Feature(foiId, mpoint, {
    renderingStyle: nStyle
  });
  layer.removeAllFeatures();
  layer.addFeature(feature);
}

Trips.prototype.zoomToCoordinate = function(x, y) {
  var startPoint = new OM.geometry.Point(x,y, 8307);
  tripsMapObject.zoomIn();
}

Trips.prototype.updateMarkerPosition1 = function(x, y) {
  var foiId = "sia_animate_layer";
  var layer = tripsMapObject.getLayerByName(foiId);
  var feature = layer.getFeature(foiId);
  var mpoint = new OM.geometry.Point(x, y, 8307);
  layer.bringToTop();
  feature.setGeometry(mpoint);
}

Trips.prototype.updateMarkerPositionSoftly = function(x, y) {
  var foiId = "sia_animate_layer";
  var layer = tripsMapObject.getLayerByName(foiId);
  var feature = layer.getFeature(foiId);
  var newPoint = new OM.geometry.Point(x, y, 8307);
  var movePoint = newPoint.transform(3857);

  var line = new OM.geometry.LineString([feature.geo.coordinates[0], feature.geo.coordinates[1],
    movePoint.getX(), movePoint.getY()
  ]);
  layer.bringToTop();
  feature.animateToNewLocation(line, {
    loop: false,
    time: 20,
    bounce: false
  });
  if (feature.moveAnimation != null) {
    feature.moveAnimation.addEventListener(feature.graphics.oui.SyncEvents.END, function() {
      console.log('new postion set')
      feature.setGeometry(movePoint);
    })
  }
}

Trips.prototype.addPointListener = function(listener) {
  var foiId = "sia_animate_layer";
  var layer = tripsMapObject.getLayerByName(foiId);
  var feature = layer.getFeature(foiId);
  feature.registerPointListener(listener);
}

Trips.prototype.stopAnimation = function() {
  var foiId = "sia_animate_layer";
  var layer = tripsMapObject.getLayerByName(foiId);
  tripsMapObject.removeLayer(layer);
}

function _sleep(milliseconds) {
  const date = Date.now();
  let currentDate = null;
  do {
    currentDate = Date.now();
  } while (currentDate - date < milliseconds);
}

Trips.prototype.setFeaturePosition = function(x, y) {
  var foiId = "sia_animate_layer";
  var newPoint = new OM.geometry.Point(x, y, 8307);
  var layer = tripsMapObject.getLayerByName(foiId);
  var mapMarkerUrl = "./resources/assets/styles/images/pinTracker2.png";
  var feature = layer.getFeature(foiId);
  feature.setGeometry(newPoint);
}

Trips.prototype.playSiaAnimation = function(points) {
  var foiId = "sia_animate_layer";
  movePointLayer = tripsMapObject.getLayerByName(foiId);
  var feature = movePointLayer.getFeature(foiId);

  var line = new OM.geometry.LineString(points);
  
  movePointLayer.bringToTop();
  
  feature.animateToNewLocation(line, {
    loop: false,
    time: 200,
    bounce: false
  });
}

var tripsObject = new Trips();