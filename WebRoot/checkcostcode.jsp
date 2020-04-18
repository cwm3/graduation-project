<%@ page language="java" import="java.util.*,com.datacollect.VendorDao" pageEncoding="utf-8"%>
<%


    String costcode=request.getParameter("costcode");
    VendorDao  vendordao = new VendorDao();        
    String clientname = vendordao.fintdCostCode(costcode);
    System.out.println(clientname);
	response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<res>"+clientname+"</res>");
    out.println("</response>");

%>
