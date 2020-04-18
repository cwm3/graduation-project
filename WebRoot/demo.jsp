<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'demo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   
    <style>

body{
     margin:0px;
     background-color:rgba(66, 197, 228, 0.168627450980392);
     background-image:none;
}
a{
	text-decoration:none;
	color:#057fac;
}
a:hover{
	text-decoration:none;
	color:#999;
}

.tzgg{margin:30px auto;}
.tzgg h3{margin-left:5%;font-size: 14px; font:70% Arial,negreta cursiva,sans-serif;font-size:17px;font-style:italic;color:#6C6C6C;}
.tzgg p{margin-left:5%;font:70% Arial,negreta cursiva,sans-serif;font-size:13px;font-style:italic;color:#6C6C6C;}

</style>


  </head>
  
  <body>
   <body> 
   <div class="tzgg"><h3><u>Welcome to SDL Translation Project Management System - <%=session.getAttribute("username") %></u></h3>

     <p>Please note that Translation Project Management System runs on Internet Explorer versions 8, 10 and 11. </p>
    
     <p> If you experience a problem with Translation Project Management System, please Contact me:
     </p>
      <p>chengweiming</p>
      
      <p>Telephone: +(86) 18870387079Email: 389317866@qq.com</p> <p><a href="logout.jsp" >Log out</a></p>	</div>
     
</body>
  </body>
</html>
