<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.VendorDao"%>


<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    
    
    VendorDao vendordao = new VendorDao();
    String ifcz  = vendordao.checkUserName(username,password);//外发数量
    System.out.println(ifcz+"aaa");
    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<RES>"+ifcz+"</RES>");   
    out.println("</response>");
%>
