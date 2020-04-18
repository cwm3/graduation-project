<%-- <%@ page language="java" contentType="text/html; charset=utf-8" %>
<%String vendorid=request.getParameter("vendorid"); %>
<%String vendorname=request.getParameter("vendorname"); %>
<%String filed=request.getParameter("filed"); %>   
<%String cat=request.getParameter("cat"); %>
<%String startdate=request.getParameter("startdate"); %>
<%String enddate=request.getParameter("enddate"); %>

<%@page import="java.io.OutputStream"%>
<%@page import="com.datacollect.DataCollectCorrectExp"%>
<%
 OutputStream os = response.getOutputStream(); // 取得输出流
 response.reset();// 清空输出流

 //不能用用中文设置 filename，会出错
 response.setHeader("Content-disposition", "attachment; filename=vendor.xls");// 设定输出文件头
 response.setContentType("application/msexcel");// 定义输出类型
 DataCollectCorrectExp dccExp = new DataCollectCorrectExp();
 dccExp.createXls(os,vendorid,vendorname,filed,cat,startdate,enddate);
%>
 --%>