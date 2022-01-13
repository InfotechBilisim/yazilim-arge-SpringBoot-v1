<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="com.infotech.config.Utils"%>
<%@ page import="java.util.*, java.lang.*, java.io.*, java.net.*"%>
<%@ page contentType="text/html;charset=windows-1254"%>
<%
	OutputStream o = null;
	InputStream i = null;

	String download = null;
	String reportFormat = "";
	String reportUrl = "";
	String downloadName = "";
	URL url;

	download = "true";

	o = response.getOutputStream();

	if (reportFormat != null && reportFormat.length() > 0) {

		reportUrl = reportUrl.replace(" ", "%20");

		String typeStr = "";
		if (reportFormat.equals("Pdf")) {
			typeStr = "application/pdf";
			response.setHeader("Content-disposition", "attachment; filename=\"" + downloadName + "\"" + ".pdf");
		} else if (reportFormat.equals("Excel") || reportFormat.equals("SPREADSHEET")) {
			typeStr = "application/vnd.ms-excel";
			response.setHeader("Content-disposition", "attachment; filename=\"" + downloadName + "\"" + ".xls");
		} else
			typeStr = "text/plain";
		

		typeStr = typeStr + "; charset=UTF-8";
		response.setContentType(typeStr);

		try {
			System.out.println("iFrame.ReportUrl : " + reportUrl);
			url = new URL(reportUrl);
			HttpURLConnection http = (HttpURLConnection) url.openConnection();
			http.setRequestMethod("GET");
			http.setRequestProperty("Content-Type", typeStr);
			http.setDoOutput(false);
			http.setDoInput(true);
			http.connect();

			i = http.getInputStream();

			byte b[] = new byte[1024];
			while (true) {
				int length = i.read(b, 0, b.length);
				if (length < 0)
					break;
				o.write(b, 0, length);
			}

			http.disconnect();
			o.flush();
			o.close();
			i.close();
		} catch (Exception ex) {
			System.out.println("iframe.jsp session invalid !.................111...................");
			ex.printStackTrace();
			try {
				i.close();
				o.close();
			} catch (Exception e) {
			}
		}
	}
%>