<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Vendor Manager System</title> 
</head>

<frameset rows="65px,*" frameborder="no" border="0" framespacing="0">
  <frame src="<%=basePath %>vendortop.jsp" name="vendortopFrame" scrolling="no" noresize="noresize" id="vendortopFrame"  />
  <frame src="<%=basePath %>vendorscheduletest.jsp" name="mainFrame" id="mainFrame" />
 </frameset>
<noframes><body>
</body>
</noframes></html>
