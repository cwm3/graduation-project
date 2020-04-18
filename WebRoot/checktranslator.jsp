<%@ page language="java" import="java.util.*,com.datacollect.VendorDao" pageEncoding="utf-8"%>
<%


    String translatorname=request.getParameter("translatorname");
    VendorDao  vendordao = new VendorDao();        
    String translator = vendordao.fintdTranslator(translatorname);
    System.out.println(translator);
	response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<res>"+translator+"</res>");
    out.println("</response>");

%>
