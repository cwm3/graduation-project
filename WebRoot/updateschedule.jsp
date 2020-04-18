<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.productsystem.model.Schedule"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	Schedule schedule= (Schedule)request.getAttribute("schedule");
	String id=schedule.getId()+"";
    String vendorid=schedule.getVendorid();
    String vendordate=schedule.getVendordate();
    String capacity=schedule.getCapacity();
    String available=schedule.getAvailable();
    String vendorname=schedule.getVendorname();
    String bookedcapacity=schedule.getBookedcapacity();
    
    
    %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>update vendor</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"  src="vendormanger/updatevendor.js"></script>
<script language="javascript">
    // 选择 Avaliable
    function chooseAvaliable() {   
         var available_text=document.getElementById("available").value;
		 if(available_text=="available") {
		      document.getElementById("capacity").readOnly=false;
		 }
         if(available_text=="unavailable") {
		      document.getElementById("capacity").value="0";
		 	  document.getElementById("capacity").readOnly=true;
		 }
    }
    
    
/* function checkpost() { 
		 
    var capacity = document.getElementById("capacity").value;
    var bookedcapacity = document.getElementById("bookedcapacity").value;
     capacity= parseFloat(capacity);
     bookedcapacity= parseFloat(bookedcapacity);
    if(capacity<bookedcapacity) {
       alert("Capacity cannot be Less than bookedcapacity");
       return false;
    }
   
  } */
        
   function updateinfo() {
   
		    var capacity = document.getElementById("capacity").value;
		    var bookedcapacity = document.getElementById("bookedcapacity").value;
		     capacity= parseFloat(capacity);
		     bookedcapacity= parseFloat(bookedcapacity);
		    if(capacity<bookedcapacity) {
		       alert("Capacity cannot be Less than bookedcapacity");
		       return false;
		    }
   
				if (confirm("be sure to update this message ?")) {
					return true;
				}
				return false;
			}
			
   </script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px
}

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}

.table {
	margin-left: 100px;
}

.allpage {
	margin-left: 200px;
}

.updateinfo {
	font-size: 12px
}

.redtext {
	color: red;
}
</style>

</head>

<body>
	</br>
	<h4>
		<font color="black"><center>Update Schedule</center> </font>
	</h4>
    <div class="updateinfo">
		<form method="post" action="updateschedule.action" id="myform" name="myform" onsubmit="return updateinfo();" >
		<table width="95%" align="center" border="1" cellspacing="0" cellpadding="0"  bordercolor=#000000 style="border-collapse:collapse;font-size:12px;" >
		
		<tr style="display: none" >
		<td width="25%" align="center" height="30px"  >Id</td>
		<td> <input id="id" name="id"  type="text" value="<%=id %>" style="width:70%;height:27px"  /></td>
		</tr>	
		
	    <tr style="display: none" >
		<td width="25%" align="center" height="30px"  >Vendor Id</td>
		<td> <input id="vendorid" name="vendorid" type="text" value="<%=vendorid %>" style="width:70%;height:27px"  /></td>
		</tr>	
		
<%--     <tr style="display: none" >
		<td width="25%" align="center" height="30px"  >Vendor Id</td>
		<td> <input id="vendorname" name="vendorname" type="text" value="<%=vendorname %>" style="width:70%;height:27px"  /></td>
		</tr>	 --%>
			
	    <tr style="display: none" >
		<td width="25%" align="center" height="30px"  >Vendor Id</td>
		<td> <input id="bookedcapacity" name="bookedcapacity" type="text" value="<%=bookedcapacity %>" style="width:70%;height:27px"  /></td>
		</tr>	
			
			
<!-- 	   	<tr style="display: none" >
		<td width="25%" align="center" >YXBZ</td>
		<td> <input id="yxbz" name="yxbz" type="text" value="Y" style="width:70%;height:27px" /></td>
		</tr>	 -->
					
		<tr>
		<td align="center" height="30px" >VendorDate</td>
		<td> <input id="vendordate" name="vendordate"  value="<%=vendordate %>"  readOnly="true"  style="font-size:12px;;background:#E0E0E0" size="60" /><span class='redtext'>*</span></td></tr>
		
		<tr>
		<td align="center" height="30px"  >Available</td>
		<td><select id ="available" name="available"  onchange="chooseAvaliable(this)" ><option value="Available"  <% if(available.equals("Available")) {
		out.print("selected");}%> >Available</option><option value="Unavailable"  <% if(available.equals("Unavailable")) {
		out.print("selected");}%>  >Unavailable</option><span class='redtext'>*</span></td></tr>
		
		<tr>
		<td align="center" height="30px"  >Capacity</td>
		<td> <input id="capacity" name="capacity" value="<%=capacity %>"   onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"  style="font-size:12px;" size="60" /><span class='redtext'>*</span></td></tr>
		<tr>
		
	     <tr> <td colspan="2">  <center><input type="submit" value="Update"  style="width:60px;height:25px;" />
		 </center> </td>  </tr>
						
 
	</table>			
				
    </form>
		<br>
</div> 
  </body>
</html>
