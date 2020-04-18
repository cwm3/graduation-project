<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.VendorScheduleDao"%>
<%
    String startdate=request.getParameter("startdate");
    String enddate=request.getParameter("enddate");
    String vendorid=request.getParameter("vendorid");
    String capacity=request.getParameter("capacity");
    
    VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
    vendorscheduledao.updateSchedule(vendorid,startdate,enddate,capacity);

%>
