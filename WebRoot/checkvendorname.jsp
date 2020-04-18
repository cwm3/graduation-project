<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.VendorDao"%>


<%
    String vendorid=request.getParameter("vendorid");
    String vendorpassword=request.getParameter("vendorpassword");
    
    
    VendorDao vendordao = new VendorDao();
    String ifcz  = vendordao.checkVendorName(vendorid,vendorpassword);//外发数量
    System.out.println(ifcz+"aaa");
    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<RES>"+ifcz+"</RES>");   
    out.println("</response>");
%>
