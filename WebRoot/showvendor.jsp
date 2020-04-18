<%@ page contentType="text/html; charset=utf-8" import="java.util.*,java.sql.*,java.net.URLDecoder" %>

<%@page import="com.datacollect.VendorDao"%>
<%@page import="com.productsystem.model.Vendor"%>



<%
String vendor_name =  request.getParameter("vendor_name").toString();
vendor_name = URLDecoder.decode(vendor_name , "utf-8");

System.out.println(vendor_name+"222");
VendorDao  vendordao = new VendorDao();
Vendor vendor = null;
vendor=vendordao.selectVendorByName(vendor_name);
String res ="";
String vendor_id = "notfound";
String newword ="notfound";
if(vendor==null) {
}else { 
   vendor_id= vendor.getVendorid();
   newword = vendor.getNewword();
}

 res = vendor_id+"||||"+newword;
response.setContentType("text/xml; charset=UTF-8");
response.setHeader("Cache-Control", "no-cache");
out.println("<response>");
out.println("<res>"+res+"</res>");
out.println("</response>");
%>

