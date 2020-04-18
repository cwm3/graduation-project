<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.QaInfoDao"%>
<%
	String costcode=request.getParameter("costcode");
    String code_sdlbusinessunit=request.getParameter("code_sdlbusinessunit");

    
    QaInfoDao qadao  = new QaInfoDao();
	String clientname = qadao.caluteClientName(costcode);
    String sdlbusinessunit = qadao.caluteSdlbusinessunit(code_sdlbusinessunit);
	String res = clientname+"||||"+sdlbusinessunit;
    System.out.println(res);
	response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<res>"+res+"</res>");
    out.println("</response>");
%>
