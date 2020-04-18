<%@ page language="java" import="java.util.*,com.datacollect.VendorDao" pageEncoding="utf-8"%>
<%


    String username=request.getParameter("username");
    VendorDao  vendordao = new VendorDao();        
    Boolean iscz = vendordao.FindUserByName(username);
	response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<res>"+iscz+"</res>");
    out.println("</response>");

%>
