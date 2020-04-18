<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*" %>
<%@page import="com.datacollect.ProjectDao"%>
<%@page import="com.productsystem.model.Project"%>


<%
    String systemcode=request.getParameter("systemcode");
    String workstyle=request.getParameter("workstyle");
    
    
    ProjectDao projectdao = new ProjectDao();
    Project project  = projectdao.loadprojectinfo(systemcode,workstyle);
    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");

    out.println("<systemcode>" + project.getSystemcode()+ "</systemcode>");
    out.println("<newwords>" + project.getNewwords() + "</newwords>");
    out.println("<hourlywork>" + project.getHourlywork() + "</hourlywork>");
    out.println("<rate1>" + project.getRate1() + "</rate1>");
    out.println("<rate2>" + project.getRate2() + "</rate2>");      
    out.println("<rate3>" + project.getRate3() + "</rate3>");
    out.println("<rate4>" + project.getRate4() + "</rate4>");
    out.println("<postediting>" + project.getPostediting()+ "</postediting>"); 
    out.println("<yxbz>" + project.getYxbz()+ "</yxbz>");      
    out.println("<dropdate>" + project.getDropdate()+ "</dropdate>");      
    out.println("<deadline>" + project.getDeadline()+ "</deadline>");      
         
    out.println("</response>");
%>
