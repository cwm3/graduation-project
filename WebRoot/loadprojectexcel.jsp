<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%
String costcode = request.getParameter("costcode");
String dropdate = request.getParameter("dropdate");
String deadline = request.getParameter("deadline");
String lead = request.getParameter("lead");
String client = request.getParameter("client");

String remark2 = request.getParameter("remark2");
String status = request.getParameter("status");
String yxbz = request.getParameter("yxbz");
String potype = request.getParameter("potype");
String userposition = request.getParameter("userposition");

%>

<%@page import="java.io.OutputStream"%>
<%@page import="com.datacollect.DataCapacityExp"%>
<%
 OutputStream os = response.getOutputStream(); // 取得输出流
 response.reset();// 清空输出流

 //不能用用中文设置 filename，会出错
 response.setHeader("Content-disposition", "attachment; filename=Project.xls");// 设定输出文件头
 response.setContentType("application/msexcel");// 定义输出类型
 DataCapacityExp datacapacityexp = new DataCapacityExp();
 datacapacityexp.createprojectXls(os,client,costcode,dropdate,deadline,lead,remark2,status,yxbz,potype,userposition);
 
%>
