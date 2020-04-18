<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.VendorScheduleDao"%>


<%
    String vendorid=request.getParameter("vendorid");
    String vendordate=request.getParameter("vendordate");
    String available=request.getParameter("available");
    String capacity=request.getParameter("capacity");
    
    
    VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
    vendorscheduledao.updatecapacity(vendorid,vendordate,available,capacity);//外发数量

%>
