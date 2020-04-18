<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String vendorid = request.getParameter("vendorid");
VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
List list  = vendorscheduledao.listLatmonthSchedule(vendorid);
int sizelist = list.size();

%>
<%@page import="com.datacollect.VendorScheduleDao"%>
<%@page import="com.productsystem.model.Schedule"%>

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
	line-height:150%;
	text-align:center;
	width:100%;
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
	background:#fff;
    width:80%;
	
}

</style>
<script type="text/javascript">
			
			function init() {
			    var vendorsize=<%=sizelist %>;
			    if(vendorsize==0) {
			         alert("No result Match");
			    }
			}
			
			function open_win(datedate,bookedcapacity) {
			
			  var vendorid='<%=vendorid %>';
              if(bookedcapacity=="0") {
                 return false;
              }              
		      var rq = window.showModalDialog("listvendorbookedcapacity.jsp?vendorid="+vendorid+"&vendordate="+datedate,"","dialogWidth:800px;dialogHeight:500px;center:1;status:0");
			  return false;
			   
			}		
		
			</script>
  </head>
  <body style="background:url('images/1.jpg');text-align:center;" onload="init()" >
    <h3>
		<font color="red"><center>List Last Schedule</center> </font>
   </h3>
    <div id="container">
	
		<table cellspacing="0" cellpadding="0" align="center"  width="80%" >
			<tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
				<th>Number</th>
		        <th>Vendor Id</th>
				<th width="15%">Vendor Date</th>
				<th width="15%">Available</th>
				<th width="15%">Capacity</th>
				<th width="15%">Booked Capacity</th>
				<th width="15%">Spare Capacity</th>
	<%
	 	  for(int i=0; i<list.size(); i++ ) {	 	  
	      Schedule schedule =  new Schedule();
	      schedule=(Schedule)list.get(i);
          String datedate = schedule.getVendordate();
          int j = i+1;
          out.print("<tr align='left'><td width='60px'>"+j+"</td>");
	      out.print("<td width='60px'>"+schedule.getVendorid()+"</td>");
	      out.print("<td width='90px'>"+schedule.getVendordate()+"</td>");
	      out.print("<td width='110px'>"+schedule.getAvailable()+"</td>");
	      out.print("<td width='110px'>"+schedule.getCapacity()+"</td>");
	      out.print("<td width='110px'><a href='javascript:void(0)' onclick='open_win(\"" +datedate+ "\",\"" +schedule.getBookedcapacity()+"\")'>"+schedule.getBookedcapacity()+"</a></td>");
	      out.print("<td width='110px'>"+schedule.getSparecapacity()+"</td>");	      
	      out.print("</tr>");
	   }	
    %>	


	</div>
</div>

  </body>
</html>
