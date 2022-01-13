
var HeatMapMapObject;
var HeatMapTheme;
var rowNo;
var posTimeStr;
var locMyEvent;
var mapConfig = {
    "mapTileLayer" : "OSM_MERCATOR", "format" : "PNG", "coordSys" :  {
        "srid" : 3857, "type" : "PROJECTED", "distConvFactor" : 1.0, "minX" :  - 2.0037508E7, "minY" :  - 2.0037508E7, "maxX" : 2.0037508E7, "maxY" : 2.0037508E7
    },
"zoomLevels" : [{"zoomLevel" : 0, "name" : "", "tileWidth" : 2.0037508E7, "tileHeight" : 2.0037508E7, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 1, "name" : "", "tileWidth" : 1.0018754E7, "tileHeight" : 1.0018754E7, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 2, "name" : "", "tileWidth" : 5009377.0, "tileHeight" : 5009377.0, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 3, "name" : "", "tileWidth" : 2504688.5, "tileHeight" : 2504688.5, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 4, "name" : "", "tileWidth" : 1252344.25, "tileHeight" : 1252344.25, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 5, "name" : "", "tileWidth" : 626172.125, "tileHeight" : 626172.125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 6, "name" : "", "tileWidth" : 313086.0625, "tileHeight" : 313086.0625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 7, "name" : "", "tileWidth" : 156543.03125, "tileHeight" : 156543.03125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 8, "name" : "", "tileWidth" : 78271.515625, "tileHeight" : 78271.515625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 9, "name" : "", "tileWidth" : 39135.7578125, "tileHeight" : 39135.7578125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 10, "name" : "", "tileWidth" : 19567.87890625, "tileHeight" : 19567.87890625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 11, "name" : "", "tileWidth" : 9783.939453125, "tileHeight" : 9783.939453125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 12, "name" : "", "tileWidth" : 4891.9697265625, "tileHeight" : 4891.9697265625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 13, "name" : "", "tileWidth" : 2445.98486328125, "tileHeight" : 2445.98486328125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 14, "name" : "", "tileWidth" : 1222.992431640625, "tileHeight" : 1222.992431640625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 15, "name" : "", "tileWidth" : 611.4962158203125, "tileHeight" : 611.4962158203125, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 16, "name" : "", "tileWidth" : 305.74810791015625, "tileHeight" : 305.74810791015625, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 17, "name" : "", "tileWidth" : 152.87405395507812, "tileHeight" : 152.87405395507812, "tileImageWidth" : 256, "tileImageHeight" : 256},{"zoomLevel" : 18, "name" : "", "tileWidth" : 76.43702697753906, "tileHeight" : 76.43702697753906, "tileImageWidth" : 256, "tileImageHeight" : 256}]
};

HeatMap = function() {
 this.infBasemapSense = null;
 this.hereBasemapSense = null;
 this.infTransparentBaseMapSense = null;
}

HeatMap.prototype.startUp = function() {
  var  tmp= document.getElementById('mapHeatMap');
  this.HeatMapMapObject =new OM.Map(tmp, 
    {
        mapviewerURL : __oracleMapsUrlbase
    });
    
  this.infBasemapSense = new OM.layer.TileLayer("baseMap", 
    {
        dataSource : "INFOMAP", tileLayer : "INFOTECH_TILELAYER", tileServerURL : __oracleMapsUrlbase + "/mcserver"
    });
    
      this.HeatMapMapObject.addLayer(this.infBasemapSense);

    
  this.infTransparentBaseMapSense =new OM.layer.TileLayer("infTransparentBaseMap", 
    {
        dataSource : "INFOMAP", tileLayer : "INFOTECH_TILELAYER_TURKEY_H",
        tileServerURL : __oracleMapsUrlbase + "/mcserver"
    });
    
    this.infTransparentBaseMapSense.setZoomLevelRange(0,50);
    this.infTransparentBaseMapSense.setVisible(false);
    
   this.hereBasemapSense = new OM.layer.GoogleTileLayer("hereBaseMap",  {
         key : __googleKey, mapType : OM.layer.GoogleTileLayer.TYPE_SATELLITE,tilt:0 
    });
    
    this.hereBasemapSense.setVisible(false);
    
    //scale bar
  var mapScaleBar = new OM.control.ScaleBar();
  this.HeatMapMapObject.addMapDecoration(mapScaleBar);

    //copyright note
   var copyright = new OM.control.CopyRight( {
     anchorPosition : 6, textValue : __copyRightNote, fontSize : 12, fontFamily : "Arial", fontColor : "black"
    });
  this.HeatMapMapObject.addMapDecoration(copyright);  
  
   this.HeatMapMapObject.setMapCenter(new OM.geometry.Point(35.24, 38.95, 8307));
   this.HeatMapMapObject.setMapZoomLevel(5);
   
  
  this.HeatMapMapObject.init();

}


HeatMap.prototype.showTheme = function(id,datasource,themeName,prms){
        var theme=  this.HeatMapMapObject.getLayerByName(id);
        if(theme){
           var layer =  this.HeatMapMapObject.getLayerByName(id);
           this.HeatMapMapObject.removeLayer(layer);
        }
        theme = new OM.server.ServerPredefinedTheme(themeName); 
    
        var req = new OM.server.ServerMapRequest(__oracleMapsUrlbase); 

        req.setProperties({
                dataSource:datasource,
                transparent:true,
                antialiase:"false"
        });
        theme.setBindingParameters([{value:prms, type:'Integer'}]);
        req.addTheme(theme);

        var myuniv= new OM.universe.WorldMercatorUniverse();
        var myconfig=new OM.layer.TileLayerConfig({
                        tileImageWidth: 256,  
                        tileImageHeight: 256  
                    });
        
        var dtl_props = {  // dtl specific properties
                universe: myuniv,    
                tileLayerConfig: myconfig,
                tileServerURL: __oracleMapsUrlbase + "/omserver", //default is ServerMapRequest's baseURL + '/omserver'
                enableUTFGrid: true,
                enableUTFGridInfoWindow: true,
                utfGridResolution: 4
            };
        this.HeatMapTheme = new OM.layer.DynamicTileLayer(id, dtl_props, req);
        this.HeatMapMapObject.addLayer( this.HeatMapTheme) ;        
}
/*
 HeatMap.prototype.showTheme = function(datasource, themeName,cpSessionId) {
	    this.HeatMapMapObject.removeLayer(this.HeatMapTheme);
	  
	
		    this.HeatMapTheme =new OM.layer.VectorLayer("senseTheme", 
		    {
		        def :  {
		            type : OM.layer.VectorLayer.TYPE_PREDEFINED,
		            dataSource : datasource, theme : themeName, url : __oracleMapsUrlbase
		        }
		    }); 
		    
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
		    
		    this.HeatMapTheme.setQueryParameters(cpSessionId);
		    this.HeatMapMapObject.addLayer(this.HeatMapTheme);
		    this.HeatMapTheme.zoomToTheme();
		    //actionEvent.cancel();  
		  
		  
	 
  }*/
 
 HeatMap.prototype.removeTheme = function(id) {
	// this.HeatMapMapObject.removeLayer(this.HeatMapTheme);
	 var theme=  this.HeatMapMapObject.getLayerByName(id);
     if(theme){
        var layer =  this.HeatMapMapObject.getLayerByName(id);
        this.HeatMapMapObject.removeLayer(layer);
     }
 }


var HeatMapObject = new HeatMap();
