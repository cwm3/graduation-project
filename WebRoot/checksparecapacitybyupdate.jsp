<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.VendorScheduleDao"%>
<%  

    String vendorid=request.getParameter("vendorid");
    String coorespondingwords=request.getParameter("coorespondingwords");
    String startdate=request.getParameter("startdate");
    String enddate=request.getParameter("enddate");
    String pzxh=request.getParameter("pzxh");
    
    VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
	String totalcapacity = vendorscheduledao.checksparecapacitybyupdate(vendorid,startdate,enddate,pzxh);
    System.out.println(totalcapacity+"ddd");
    if(totalcapacity==null) {
       totalcapacity = "0";
    }
	response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<res>"+totalcapacity+"</res>");
    out.println("</response>");
    
    
    
%>
