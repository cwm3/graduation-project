<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*,java.net.URLDecoder" %>
<%@page import="com.datacollect.DistributionDao"%>
<%  
    String ho=request.getParameter("ho");
    String id = request.getParameter("id");
    DistributionDao distributiondao = new DistributionDao();
	distributiondao.updateDistributionHo(id, ho);
%>
