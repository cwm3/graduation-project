<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.VendorDao"%>

<%
    String status=request.getParameter("sort");
    String username=request.getParameter("username");
    String datedate=request.getParameter("datedate");
    
    VendorDao vendordao = new VendorDao();
    List list  = vendordao.FindProject(status,username,datedate);
    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    for(int i=0;i<list.size();i++)
    {
      out.println("<res>" + list.get(i).toString() + "</res>");
    }
    out.println("</response>");
%>
