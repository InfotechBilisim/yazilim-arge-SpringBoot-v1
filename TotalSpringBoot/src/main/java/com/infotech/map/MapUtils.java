package com.infotech.map;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.Format;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class MapUtils {

	  public static String calcHeading(double x1, double y1, double x2, double y2) {
		    // Change origin to x1,y1
		    x2 -= x1;
		    y2 -= y1;
		    double angle = (360.0 * (Math.atan(y2 / x2)) / (2 * Math.PI)) - 90.0;
		    if (angle > 360)
		      angle -= 360.0;
		    if (angle < 0)
		      angle += 360.0;
		    String heading = "";
		    if ((angle >= 0 && angle < 23))
		      heading = MessageUtility.getMessage("global_NORTH");
		    if ((angle >= 23 && angle < 68))
		      heading = MessageUtility.getMessage("global_NORTHEAST");
		    if ((angle >= 68 && angle < 113))
		      heading = MessageUtility.getMessage("global_EAST");
		    if ((angle >= 113 && angle < 158))
		      heading = MessageUtility.getMessage("global_SOUTHEAST");
		    if ((angle >= 158 && angle < 203))
		      heading = MessageUtility.getMessage("global_SOUTH");
		    if ((angle >= 203 && angle < 248))
		      heading = MessageUtility.getMessage("global_SOUTHWEST");
		    if ((angle >= 248 && angle < 293))
		      heading = MessageUtility.getMessage("global_WEST");
		    if ((angle >= 293 && angle < 338))
		      heading = MessageUtility.getMessage("global_NORTHWEST");
		    if ((angle >= 338 && angle < 360))
		      heading = MessageUtility.getMessage("global_NORTH");
		    	heading ="21";
		    
		    return heading;
		    	
		  } // calcHeading()  
	
	  
	  public static String getFormattedDistanceValue(String distance) {
		    NumberFormat nf = NumberFormat.getInstance(Locale.US);
		    java.lang.Number myNumber;	
		    String result = null;
		    
		      try {
				myNumber = nf.parse(distance);
				  nf.setGroupingUsed(true);
				  nf.setMaximumFractionDigits(2);
				  if (myNumber.doubleValue() > 1000) {
				    nf.setMaximumFractionDigits(2);
				    String distanceSuffix = MessageUtility.getMessage("global_distant_suffix_km");
				    myNumber = new Double(myNumber.doubleValue() / 1000);
				    result = nf.format(myNumber) + " " + distanceSuffix;
				  } else {
				    nf.setMaximumFractionDigits(1);
				    String distanceSuffix = MessageUtility.getMessage("global_distant_suffix_m");
				    result = nf.format(myNumber) + " " + distanceSuffix;
				  }
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
		    
		    
		    
		    return result;
		  }
	  
	  
	  public static StringBuilder getInfoWindowScript(DataMapInfo dmi) {
	      
		    StringBuilder popupHTML = new StringBuilder();
		    
		    popupHTML = popupHTML.append("");
		    popupHTML = popupHTML.append("<div style='width:250px; height:230px; overflow: auto'>");            
		    popupHTML = popupHTML.append("<table cellspacing='1' cellpadding='0' style='width: 225px'>");
		    popupHTML = popupHTML.append("<tr>");
		    popupHTML = popupHTML.append("<td align='left' style='width:85px; font-family:Tahoma; font-size: 11px;'>" + MessageUtility.getMessage("map_country") + "</td>");
		    popupHTML = popupHTML.append("<td align='left' style='font-family:Tahoma; font-size: 11px;'> : " + dmi.getCountry() + "</td>");
		    popupHTML = popupHTML.append("</tr>");
		    popupHTML = popupHTML.append("");
		    popupHTML = popupHTML.append("<tr>");
		    popupHTML = popupHTML.append("<td align='left' style='width:85px; font-family:Tahoma; font-size: 11px;'>" + MessageUtility.getMessage("map_distirct") + "</td>");
		    popupHTML = popupHTML.append("<td align='left' style='font-family:Tahoma; font-size: 11px;'> : " + dmi.getDistrict() + "</td>");
		    popupHTML = popupHTML.append("</tr>");
		    popupHTML = popupHTML.append("");
		    popupHTML = popupHTML.append("<tr>");
		    popupHTML = popupHTML.append("<td align='left' style='width:85px; font-family:Tahoma; font-size: 11px;'>" + MessageUtility.getMessage("map_quarter") + "</td>");
		    popupHTML = popupHTML.append("<td align='left' style='font-family:Tahoma; font-size: 11px;'> : " + dmi.getQuarter() + "</td>");
		    popupHTML = popupHTML.append("</tr>");
		    popupHTML = popupHTML.append("");
		    popupHTML = popupHTML.append("<tr>");
		    popupHTML = popupHTML.append("<td align='left' style='width:85px; font-family:Tahoma; font-size: 11px;'>" + MessageUtility.getMessage("map_town") + "</td>");
		    popupHTML = popupHTML.append("<td align='left' style='font-family:Tahoma; font-size: 11px;'> : " + dmi.getTown() + "</td>");
		    popupHTML = popupHTML.append("</tr>");
		    popupHTML = popupHTML.append("");
		    popupHTML = popupHTML.append("<tr>");
		    popupHTML = popupHTML.append("<td align='left' style='width:85px; font-family:Tahoma; font-size: 11px;'>" + MessageUtility.getMessage("map_street") + "</td>");
		    popupHTML = popupHTML.append("<td align='left' style='font-family:Tahoma; font-size: 11px;'> : " + dmi.getRoad() + "</td>");
		    popupHTML = popupHTML.append("</tr>");
		    popupHTML = popupHTML.append("");
		    popupHTML = popupHTML.append("<tr>");
		    popupHTML = popupHTML.append("<td align='left' style='width:85px; font-family:Tahoma; font-size: 11px;'>" + MessageUtility.getMessage("map_poi") + "</td>");
		    popupHTML = popupHTML.append("<td align='left' style='font-family:Tahoma; font-size: 11px;'> : " + dmi.getPoi() + "</td>");
		    popupHTML = popupHTML.append("</tr>");
		    popupHTML = popupHTML.append("");
		    popupHTML = popupHTML.append("<tr>");
		    popupHTML = popupHTML.append("<td align='left' style='width:85px; font-family:Tahoma; font-size: 11px;'>" + MessageUtility.getMessage("map_poi_dist") + "</td>");
		    popupHTML = popupHTML.append("<td align='left' style='font-family:Tahoma; font-size: 11px;'> : " + dmi.getPoiDist() + "</td>");
		    popupHTML = popupHTML.append("</tr>");
		    popupHTML = popupHTML.append("");
		    popupHTML = popupHTML.append("<tr>");
		    popupHTML = popupHTML.append("<td align='left' style='width:85px; font-family:Tahoma; font-size: 11px;'>" + MessageUtility.getMessage("map_cust") + "</td>");
		    popupHTML = popupHTML.append("<td align='left' style='font-family:Tahoma; font-size: 11px;'> : " + dmi.getCust() + "</td>");
		    popupHTML = popupHTML.append("</tr>");
		    popupHTML = popupHTML.append("");
		    popupHTML = popupHTML.append("<tr>");
		    popupHTML = popupHTML.append("<td align='left' style='width:85px; font-family:Tahoma; font-size: 11px;'>" + MessageUtility.getMessage("map_cust_dist") + "</td>");
		    popupHTML = popupHTML.append("<td align='left' style='font-family:Tahoma; font-size: 11px;'> : " + dmi.getCustDist() + "</td>");
		    popupHTML = popupHTML.append("</tr>");
		    popupHTML = popupHTML.append("");
		    popupHTML = popupHTML.append("<tr>");
		    popupHTML = popupHTML.append("<td align='left' style='width:85px; font-family:Tahoma; font-size: 11px;'>" + MessageUtility.getMessage("map_latitude") + "</td>");
		    popupHTML = popupHTML.append("<td align='left' style='font-family:Tahoma; font-size: 11px;'> : " + dmi.getLatitude().substring(0,7) + "</td>");
		    popupHTML = popupHTML.append("</tr>");
		    popupHTML = popupHTML.append("");
		    popupHTML = popupHTML.append("<tr>");
		    popupHTML = popupHTML.append("<td align='left' style='width:85px; font-family:Tahoma; font-size: 11px;'>" + MessageUtility.getMessage("map_longitude") + "</td>");
		    popupHTML = popupHTML.append("<td align='left' style='font-family:Tahoma; font-size: 11px;'> : " + dmi.getLongitude().substring(0,7) + "</td>");
		    popupHTML = popupHTML.append("</tr>");
		    popupHTML = popupHTML.append("</table>");
		    popupHTML = popupHTML.append("</div>");
		    
		    return popupHTML;
		  
		  }
	  
	  public static String makeDateForThemeParam(Date timestamp) {
		    String res = null;
		    Format formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		    res = formatter.format(timestamp);    
		    return res;
		  }
	  
	  public static String makePostRequest(String targetUrl, String data) throws Exception {
	        URL url = new URL(targetUrl);
	        HttpURLConnection http = (HttpURLConnection)url.openConnection();
	        http.setRequestProperty("Connection", "close");
	        http.setRequestMethod("POST");
	        http.setDoOutput(true);
	        http.setDoInput(true);
	        if (data != null) {
	            http.setRequestProperty("Content-Length", Integer.toString(data.length()));
	            http.getOutputStream().write(data.getBytes());
	        }
	        http.connect();
	        InputStream i = http.getInputStream();
	        String response = streamToString(i);
	        return response;
	    } 
	  
	  public static String streamToString(InputStream in) throws IOException {
		    BufferedReader bis = new BufferedReader(new InputStreamReader(in));
		    StringBuffer out = new StringBuffer();
		    char[] inputLine = new char[2048];
		    int count = bis.read(inputLine);
		    while (count > 0) {
		      out.append(inputLine, 0, count);
		      count = bis.read(inputLine);
		    }
		    return out.toString();
		  }
	
	
}
