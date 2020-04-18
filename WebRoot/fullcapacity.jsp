<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.VendorScheduleDao"%>


<%
   
    VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
    String res = vendorscheduledao.fullCapacity();
    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<res>" + res + "</res>");
    out.println("</response>");
%>
