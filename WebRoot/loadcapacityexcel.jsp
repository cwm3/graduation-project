<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%
String startdate = request.getParameter("startdate");
String enddate = request.getParameter("enddate");
String Languagebegin = request.getParameter("Languagebegin");
String Languageend = request.getParameter("Languageend");
String vendorid = request.getParameter("vendorid");
String vendorname = request.getParameter("vendorname");
String chinesename = request.getParameter("chinesename");
String averagescore = request.getParameter("averagescore");
String grade = request.getParameter("grade");
String rate = request.getParameter("rate");
String vendor_field = request.getParameter("vendor_field");
String vendor_cat = request.getParameter("vendor_cat");
%>

<%@page import="java.io.OutputStream"%>
<%@page import="com.datacollect.DataCapacityExp"%>
<%
 OutputStream os = response.getOutputStream(); // 取得输出流
 response.reset();// 清空输出流

 //不能用用中文设置 filename，会出错
 response.setHeader("Content-disposition", "attachment; filename=Capacity.xls");// 设定输出文件头
 response.setContentType("application/msexcel");// 定义输出类型
 DataCapacityExp datacapacityexp = new DataCapacityExp();
 datacapacityexp.createXls(os,Languagebegin,Languageend,vendorid,vendorname,chinesename,averagescore,grade,rate,startdate,enddate,vendor_field,vendor_cat);

%>
