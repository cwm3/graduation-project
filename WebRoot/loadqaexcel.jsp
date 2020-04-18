<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%
String vendorname = request.getParameter("vendorname");
String lead = request.getParameter("lead");
String deadline = request.getParameter("deadline");
String sector = request.getParameter("sector");
String evaluatorname = request.getParameter("evaluatorname");
String translationtype = request.getParameter("translationtype");
String sourcelanguage = request.getParameter("sourcelanguage");
String targetlanguage = request.getParameter("targetlanguage");
String clientname = request.getParameter("clientname");
String startdate = request.getParameter("startdate");
String enddate = request.getParameter("enddate");
String lmorgl = request.getParameter("lmorgl");


%>

<%@page import="java.io.OutputStream"%>
<%@page import="com.datacollect.DataCapacityExp"%>
<%
 OutputStream os = response.getOutputStream(); // 取得输出流
 response.reset();// 清空输出流

 //不能用用中文设置 filename，会出错
 response.setHeader("Content-disposition", "attachment; filename=QA.xls");// 设定输出文件头
 response.setContentType("application/msexcel");// 定义输出类型
 DataCapacityExp datacapacityexp = new DataCapacityExp();
 datacapacityexp.createpqaXls(os, vendorname, lead, deadline,sector,evaluatorname,translationtype,sourcelanguage,targetlanguage,clientname,startdate, enddate, lmorgl);
 
%>
