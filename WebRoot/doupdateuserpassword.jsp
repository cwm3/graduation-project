<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.VendorDao"%>


<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String newpassword=request.getParameter("newpassword");
    
    
    VendorDao vendordao = new VendorDao();
    String res = vendordao.updateUserPassword(username,password,newpassword);//外发数量
    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<RES>"+res+"</RES>");   
    out.println("</response>");
%>
