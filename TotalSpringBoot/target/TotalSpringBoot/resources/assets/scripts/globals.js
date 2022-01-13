
var ___host = document.location.host;
//var __oracleMapsUrlbase = ___host + "/mapviewer";
var __oracleMapsUrlbase = "http://192.168.68.38:7006/mapviewer";
//var __oracleMapsUrlbase = "http://infotest.infotech.com.tr/mapviewer";
//var __oracleMapsUrlbase = "http://yeni.izci.com.tr/mapviewerats";
//var __oracleMapsUrlbase = "http://login.infomobil.com.tr/mapvieweravea";
//var __oracleMapsUrlbase = "http://harita.infomobil.com.tr/mapviewer";
//var __oracleMapsUrlbase = "http://192.168.68.98:7004/mapviewerats";
//var __oracleMapsBasemap = "INFOMAP.INFOTECH_BASEMAP";
var __oracleMapsBasemap = "INFOMAP.INFOTECH_TILELAYER";
var __oracleMapsBasemapTransparent = "INFOMAP.INFOTECH_TILELAYER_TURKEY_H";

//var __mapDataSource = "INFOAPP_DEVDB.";
//var __mapDataSource = "INFOAPP_TEST";
var __mapDataSource = "INFOAPP";
//var __mapDataSource = "IZCI";

//var __mapSytleThemeSource = "INFOAPP_DEVDB.";
var __mapSytleThemeSource = "INFOAPP.";
//var __mapSytleThemeSource = "INFOAPP_TEST";

//var __mapStylesDataSourceName = "INFOAPP_DEVDB";
var __mapStylesDataSourceName = "INFOAPP";
//var __mapStylesDataSourceName = "INFOAPP_TEST";

var __mapRouteSource = "INFOAPP.";
var __mapTrafficSource = "INFOAPP.";
var __mapSenseDataSource = "INFOAPP.";


if(false){ // Test haritalarıyla çalışılacaksa buranın true yapılması yeterli olacaktır.
	__oracleMapsUrlbase = "http://infotest.infotech.com.tr/mapviewer";
	__mapDataSource = "INFOAPP_TEST";
	__mapSytleThemeSource = "INFOAPP_TEST";
	__mapStylesDataSourceName = "INFOAPP_TEST";
	__mapRouteSource = "INFOAPP_TEST.";
	__mapTrafficSource = "INFOAPP_TEST.";
	__mapSenseDataSource = "INFOAPP_TEST.";
}

var date = new Date();
var __copyRightNote = "&#169;"+ date.getFullYear() +" INFOTECH";
var ___href = window.location.href;
var ___hostIndex = ___href.indexOf(___host);
var ___facesIndex = ___href.indexOf("/Total_Spring");

var ___applicationName = ___href.substring(___hostIndex + ___host.length, ___facesIndex) + "/Total_Spring";
var ___applicationHome = ___href.substring(0, ___facesIndex);
var __applicationImageDirectory = ___applicationHome + "/images/mycompany/imagesmenu/";

var __googleKey = "AIzaSyCNb9HfIXMPvoHxG0cfVUga8-8fvNOmLbo";



