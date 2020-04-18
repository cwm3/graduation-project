<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*,java.net.URLDecoder" %>
<%@page import="com.datacollect.DistributionDao"%>
<%  
    System.out.println("rrrr");

    String status=request.getParameter("status");
    String id = request.getParameter("id");
    String systemcode = request.getParameter("systemcode");
    System.out.println("aaa");
    DistributionDao distributiondao = new DistributionDao();
	distributiondao.updateDistributionStatus(id, status,systemcode);
%>
