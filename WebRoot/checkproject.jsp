<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.ProjectDao"%>
<%@page import="com.productsystem.model.Project"%>


<%
    String systemcode=request.getParameter("systemcode");
    
    ProjectDao projectdao = new ProjectDao();
    String wfsl  = projectdao.checkProject(systemcode);//外发数量
    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<wfsl>"+wfsl+"</wfsl>");   
    out.println("</response>");
%>
