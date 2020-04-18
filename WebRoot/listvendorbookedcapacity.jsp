<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String vendordate = request.getParameter("vendordate");
String vendorid = request.getParameter("vendorid");
%>
<%@page import="com.datacollect.VendorScheduleDao"%>
<%@page import="com.productsystem.model.Vendor_Distribution_Mx"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>List Booked Schedule</title>
    
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
	width:95%;
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
  <body style="background:url('images/backgroud.jpg');text-align:center;">
    </br>

    <div id="container">
	
		<table cellspacing="0" cellpadding="0" align="center" >
				<tr>
				<th>System Code</th>
				<th>Booked Capactiy</th>
				<th>Lead</th>
				<th>Work Type</th>
				<th>HourlyWork</th>
				<th>Total Words</th>
				<th>PO NO</th>
			    <th>PO value</th>
				
      <%
	

          VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
	      List list  = vendorscheduledao.selectbookedcapacitybyvendordate(vendorid, vendordate);
	 	  for(int i=0; i<list.size(); i++ ) {
	      Vendor_Distribution_Mx vendor_distribution_mx =  new Vendor_Distribution_Mx();
	      vendor_distribution_mx=(Vendor_Distribution_Mx)list.get(i);
	      String vendorid1= vendor_distribution_mx.getVendorid();
	      String vendordate1= vendor_distribution_mx.getVendordate();
	      String systemcode= vendor_distribution_mx.getSystemcode();
	      String bookedcapactiy= vendor_distribution_mx.getBookedcapactiy();
	      String lead= vendor_distribution_mx.getLead();
	      String worktype= vendor_distribution_mx.getWorktype();
	      String totalwords= vendor_distribution_mx.getTotalwords();
	      String outsourcedponumber= vendor_distribution_mx.getOutsourcedponumber();
	      String  projectvalue= vendor_distribution_mx.getProjectvalue();
	      String  hourlywork= vendor_distribution_mx.getHourlywork();
	      if(null==hourlywork||hourlywork.equals("")) {
	         hourlywork="0";
	      }
	      
	      
	      out.print("<tr align='left'><td>"+systemcode+"</td>");
	      out.print("<td>"+bookedcapactiy+"</td>");
	      out.print("<td>"+lead+"</td>");
	      out.print("<td>"+worktype+"</td>");
	      out.print("<td>"+hourlywork+"</td>");
	      
	      out.print("<td>"+totalwords+"</td>");
	         out.print("<td>"+outsourcedponumber+"</td>");
	            out.print("<td>"+projectvalue+"</td>");
	      out.print("</tr>");
	   }	
    %>	


	</div>
</div>

  </body>
</html>
