<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>top</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/vendortest.css">

</head> 
 <body>
	<div class="header">
				<div class="logo"><img src="images/image.jpg" width="100%" height="100%" ></div>
				<div  class="pic">
					<img  src="images/shouye/u19.png">
				</div>
			
				<div class="welcome">
					<p>■ Welcome:<%=session.getAttribute("vendorid") %>&nbsp;|&nbsp;<a href='listschedulebypageaction.action?page=1&Schedule.vendorid=<%=session.getAttribute("vendorid") %>'  target="_blank">List Schedule</a>|&nbsp;<a href="vendorlogout.jsp" >Log out</a>
				</div>
			</div>
			<!--end header-->
</body>  
</html>
