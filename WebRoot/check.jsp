<%@ page language="java" import="java.util.*,com.datacollect.VendorDao" pageEncoding="utf-8"%>
<%


    String vendorid=request.getParameter("vendorid");
    VendorDao  vendordao = new VendorDao();        
    Boolean iscz = vendordao.FindVendorByName(vendorid);
	response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<res>"+iscz+"</res>");
    out.println("</response>");

%>
