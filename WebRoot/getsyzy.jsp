<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*,java.net.URLDecoder" %>
<%@page import="com.datacollect.DistributionDao"%>
<%@page import="com.productsystem.model.Distribution"%>

<%  

    String systemcode=request.getParameter("systemcode");
    String worktype=request.getParameter("worktype");
        
    DistributionDao distributiondao = new DistributionDao();
	Distribution distribution = distributiondao.getSyzy(systemcode,worktype);
	String newwords_sy=distribution.getNewwords();
    String postediting_sy=distribution.getPostediting() ;
    String rate1_sy=distribution.getRate1();
    String rate2_sy=distribution.getRate2();
    String rate3_sy=distribution.getRate3();
    String rate4_sy=distribution.getRate4();
	
	
	
	
	response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<res>"+newwords_sy+"</res>");
    out.println("<res>"+postediting_sy+"</res>");
    out.println("<res>"+rate1_sy+"</res>");
    out.println("<res>"+rate2_sy+"</res>");
    out.println("<res>"+rate3_sy+"</res>");
    out.println("<res>"+rate4_sy+"</res>");
    out.println("</response>");

%>
