<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'vendorloginfail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href='style/skin/skin.css' rel='stylesheet' type='text/css' />
    <script src="style/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="style/Cxc-Dialog.js" type="text/javascript"></script>

  </head>
  
  <body>
       <script type="text/javascript" language="javascript">
                       CxcDialog('提示框','我是错误提示框，我再浏览器中间弹出','Error')
      </script>   
  </body>
</html>