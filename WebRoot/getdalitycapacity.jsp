<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.VendorDao"%>
<%
	String vendorid=request.getParameter("vendorid");
  
    VendorDao vendordao = new VendorDao();
	String dalitycapacity = vendordao.FindDalityCapacityByVendorName(vendorid);
	System.out.println(dalitycapacity+"dalitycapacity");
	
	response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<res>"+dalitycapacity+"</res>");
    out.println("</response>");
%>
