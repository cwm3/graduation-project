<%-- <%@ page language="java" contentType="text/html; charset=utf-8" %>
<%

String startdate = request.getParameter("startdate");
String enddate = request.getParameter("enddate");
String vendorid = request.getParameter("vendorid");
String capatity = request.getParameter("capacity");
String systemcode = request.getParameter("systemcode");
String systemid = request.getParameter("systemid");
String lead = request.getParameter("lead");
String worktype = request.getParameter("worktype");
String totalwords = request.getParameter("totalwords");
String vendorname = request.getParameter("vendorname");

%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.datacollect.VendorScheduleDao"%>
<%
 VendorScheduleDao vendorschedule = new VendorScheduleDao();
 vendorschedule.updateCapacitybydistribution(vendorid,vendorname,capatity,startdate,enddate,systemcode,systemid,lead,worktype,totalwords);
%> --%>
 