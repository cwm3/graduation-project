<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.QaInfoDao"%>
<%@page import="com.productsystem.model.Project"%>


<%
    String filename=request.getParameter("filename");
    
    QaInfoDao qainfodao = new QaInfoDao();
    String checkexistfile = qainfodao.checkFile(filename);//外发数量
    System.out.println(checkexistfile+"checkexistfile");
    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<checkexistfile>"+checkexistfile+"</checkexistfile>");   
    out.println("</response>");
%>
