<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>信息管理系统 - 桌面</title>
<%-- <link href="<%=basePath %>css/desk.css" rel="stylesheet" type="text/css"> --%>
</head>

<body>
<table align=center width="90%" border="0" cellspacing="0" cellpadding="0" height="100%">
      <tr>
        <td valign="top" style="font-size: 12px;font-family : Arial,Tahoma,Verdana;color:red;"><br/><br/>
        
        Welcome to SDL Vendor Management System -<%=session.getAttribute("username") %><br/> <br/><br/> 

			&nbsp;Please note that Vendor Management System runs on Internet Explorer versions 8, 10 and 11. <br/><br/>
			If you experience a problem with Vendor Management System, please Contact SDL China VM team:<br/><br/> 
		     Kevin Li
             Telephone: +(86) 0755 33912649  Email: keli@sdl.com <br/><br/> 
             Rebecca Dong
Telephone: +(86) 0755 33912610  Email: rdong@sdl.com
					</font><font color=blue>Time: 2016 <a href="userindex.html" >Log out</a></font>
				</td>
      </tr>
    </table>
</body>
</html>

