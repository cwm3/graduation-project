<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.ProjectDao"%>
<%@page import="com.productsystem.model.Project"%>


<%
    String systemcode=request.getParameter("systemcode");
    
    ProjectDao projectdao = new ProjectDao();
    String dropname  = projectdao.dropName(systemcode);//外发数量
    dropname=dropname.replace("&", "201720172017");
    System.out.println(dropname+"cccc");
    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<dropname>"+dropname+"</dropname>");   
    out.println("</response>");
%>
