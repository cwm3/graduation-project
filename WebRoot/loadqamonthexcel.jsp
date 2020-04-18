<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int startmonth = Integer.parseInt(request.getParameter("startmonth").toString());
int startyear = Integer.parseInt(request.getParameter("startyear").toString());
int endmonth =  Integer.parseInt(request.getParameter("endmonth").toString());
int endyear =  Integer.parseInt(request.getParameter("endyear").toString()); 

String costcode = request.getParameter("costcode");
String field = request.getParameter("field");

String vendorname = request.getParameter("vendorname");
String clientname = request.getParameter("clientname");
String translationtype = request.getParameter("translationtype");
String targetlanguage = request.getParameter("targetlanguage");
String sourcelanguage = request.getParameter("sourcelanguage");
String lead = request.getParameter("lead");
String evaluator = request.getParameter("evaluator");
String lmorgl = request.getParameter("lmorgl");


%>

<%@page import="java.io.OutputStream"%>
<%@page import="com.datacollect.DataCapacityExp"%>
<%
 OutputStream os = response.getOutputStream(); // 取得输出流
 response.reset();// 清空输出流

 //不能用用中文设置 filename，会出错
 response.setHeader("Content-disposition", "attachment; filename=QaMonth.xls");// 设定输出文件头
 response.setContentType("application/msexcel");// 定义输出类型
 DataCapacityExp datacapacityexp = new DataCapacityExp();
 datacapacityexp.createQaMonthXls(os,vendorname,clientname,evaluator,lead,costcode,translationtype,targetlanguage, sourcelanguage,startyear,startmonth,endyear,endmonth,lmorgl,field);
 
%>
