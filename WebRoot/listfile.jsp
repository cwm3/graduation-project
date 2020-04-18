<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%@page import="com.datacollect.VendorScheduleDao"%>
<%@page import="com.productsystem.model.Fileway"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>List Schedule</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

   <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />

<style>

body{
	margin:0;
	padding:0;
	font:70% Arial, Helvetica, sans-serif; 
	color:#555;
	width:500%;
	line-height:150%;
	text-align:center;
}
a{
	text-decoration:none;
	color:#057fac;
}
a:hover{
	text-decoration:none;
	color:#999;
}

#container{
	margin:0 auto;
    text-align:center;
	width:95%;
	background:#fff;
}

</style>

  </head>
  <body style="background:url('images/1.jpg');text-align:center;">
    </br>

    <div id="container">
	
		<table cellspacing="0" cellpadding="0" align="center" >
				<tr>
				<th>Vendor Id</th>
				<th>Vendor Date</th>
				<th>System Code</th>
				
      <%
	

          VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
	      List list  = vendorscheduledao.Listfilename();
	 	  for(int i=0; i<list.size(); i++ ) {
	      Fileway fileway =  new Fileway();
	      fileway=(Fileway)list.get(i);
	      String filename= fileway.getFilename();
	      String vendordate1= fileway.getFilename_new();
	      String ftpway= fileway.getFtpway();
	
	      out.print("<tr align='center'><td>"+filename+"</td>");
	      out.print("<td>"+vendordate1+"</td>");
	      out.print("<td><a href='servlet/DownloadServlet?fileName="+filename+"&wjlj="+ftpway+"' >"+filename+"</a></td>");
	       out.print("</tr>");
	   }	
    %>	


	</div>
</div>

  </body>
</html>
