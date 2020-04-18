<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.VendorScheduleDao"%>
<%  

    String vendorid=request.getParameter("vendorid");
    String coorespondingwords=request.getParameter("coorespondingwords");
    String startdate=request.getParameter("startdate");
    String enddate=request.getParameter("enddate");
    
    VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
	String ifcg = vendorscheduledao.checksparecapacity(vendorid,startdate,enddate);
    System.out.println(ifcg+"ddd");
    if(ifcg==null) {
       ifcg = "0";
    }
	response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<res>"+ifcg+"</res>");
    out.println("</response>");
    
    
    
%>
