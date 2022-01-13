<%@ page contentType="text/html;charset=windows-1254"%>
<%@ page import="java.util.*, java.lang.*, java.io.*, java.net.*"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1254"/>
  </head>
  <body onLoad="setTimeout('self.close()',500)">
  <%
    OutputStream o = null;
    InputStream i = null;

    String download =null;
    String reportFormat = "";
    /*
    if (app.createValueBinding("#{sessionScope.reportFormat}").getValue(ctx) != null) {    
      reportFormat = (String)app.createValueBinding("#{sessionScope.reportFormat}").getValue(ctx);
    }
    if (reportFormat == null) {
      reportFormat = request.getParameter("desformat");
    }
    
     if (app.createValueBinding("#{sessionScope.download}").getValue(ctx) != null) {    
      download = (String)app.createValueBinding("#{sessionScope.download}").getValue(ctx);
    }
    if (download == null) {
      download = request.getParameter("download");
    }
    
    if (reportFormat != null && reportFormat.length() > 0) {
        String reportUrl="";
        
        if (app.createValueBinding("#{sessionScope.reportUrl}").getValue(ctx) != null) {
          reportUrl = (String)app.createValueBinding("#{sessionScope.reportUrl}").getValue(ctx);
          reportUrl = reportUrl.replace(" ", "%20");
        }
    
        if (reportUrl != null && reportUrl.length() == 0) {
          reportUrl = request.getQueryString();
        }

        String typeStr = "";
        typeStr = "text/plain";
    
        o = response.getOutputStream();
      //  response.setContentType(typeStr);
        if(download !=null && download.equals("true")) {
        response.setContentType("");
          }
        
        try {
          System.out.println("iFrame.ReportUrl : " + reportUrl);
          URL url = new URL(reportUrl);
          System.out.println("iFrame.url : " + url.toString());
          HttpURLConnection http = (HttpURLConnection)url.openConnection();
          http.setRequestMethod("GET");
         // http.setRequestProperty("Content-type", typeStr);
          http.setDoOutput(false);
          http.setDoInput(true);
          http.connect();
          
          o = response.getOutputStream();
          i = http.getInputStream();
          int code = http.getResponseCode();
          http.disconnect();
        }
        catch (Exception ex) {
          System.out.println("iframe.jsp session invalid !....................................");
          ex.printStackTrace();
          try { i.close(); o.close(); } catch (Exception e) {}
        }
    }
    */
 %>
  </body>
</html>
