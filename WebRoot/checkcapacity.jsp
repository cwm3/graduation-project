<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.VendorScheduleDao"%>


<%
    String updatedate=request.getParameter("updatedate");
    String vendorid=request.getParameter("vendorid");
    
    VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
    String bookedcapacity  = vendorscheduledao.getMaxBookedCapacity(updatedate,vendorid);//外发数量
    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<res>"+bookedcapacity+"</res>");   
    out.println("</response>");
%>
