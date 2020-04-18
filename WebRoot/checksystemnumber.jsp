<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.ProjectDao"%>

<%

    ProjectDao projectdao = new ProjectDao();
	String systemnumber = projectdao.getSystemNumber();


    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    String str_rtn="";   
    out.println("<res>" +systemnumber+ "</res>");
    out.println("</response>");
%>
