<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 
	session.removeAttribute("vendor_name");	//移除保存在session中的username属性
	session.invalidate();
	out.println("<script>top.location='" + basePath +"vendorlogin.html';</script>");
%>