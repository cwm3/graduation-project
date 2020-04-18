<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.VendorScheduleDao"%>
<%
    String updatedate=request.getParameter("updatedate");
    String vendorid=request.getParameter("vendorid");
    String capacity=request.getParameter("capacity");
    
    VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
    vendorscheduledao.updateMuchSchedule(vendorid,updatedate,capacity);

%>
