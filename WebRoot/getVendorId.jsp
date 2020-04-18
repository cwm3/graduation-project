<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*,java.net.URLDecoder" %>
<%@page import="com.datacollect.VendorDao"%>
<%@page import="com.datacollect.QaInfoDao"%>

<%  

    String vendorname=request.getParameter("vendorname");
    String sdlcostcode=request.getParameter("sdlcostcode");
    String code_sdlbusinessunit=request.getParameter("code_sdlbusinessunit");
    
    String clientname = "";
    String sdlbusinessunit ="";
	String vendorid = "111";
	
    vendorname = URLDecoder.decode(vendorname , "utf-8");
    vendorname=vendorname.replace("20170101cheng", "&");
    VendorDao vendordao = new VendorDao();
    if(vendorname.length()>0){
         vendorid = vendordao.getVendorId(vendorname);
    }
	
	if(sdlcostcode.length()>5) {
	   QaInfoDao qadao  = new QaInfoDao();
	   clientname = qadao.caluteClientName(sdlcostcode);
	   sdlbusinessunit = qadao.caluteSdlbusinessunit(code_sdlbusinessunit);
	}
	
    System.out.print(vendorid+"vendorid"+555+"clientname"+clientname+"sdlbusinessunit"+sdlbusinessunit);
	response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    out.println("<vendorid>"+vendorid+"</vendorid>");
    out.println("<clientname>"+clientname+"</clientname>");
    out.println("<sdlbusinessunit>"+sdlbusinessunit+"</sdlbusinessunit>");
    out.println("</response>");

%>
