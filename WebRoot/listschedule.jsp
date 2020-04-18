<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int currentpage = Integer.valueOf(request.getAttribute("currentpage").toString());
int i = 12*(currentpage-1)+1 ;
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
	width:100%;
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
	width:80%;
	background:#fff;
}

</style>

<script type="text/javascript">

			
		function open_win(i) {		
              var vendorid= document.getElementById("vendorid"+i).value;
              var vendordate= document.getElementById("vendordate"+i).value;
              var bookedcapacity= document.getElementById("bookedcapacity"+i).value;
              if(bookedcapacity=="0") {
                 return false;
              }              
		      var rq = window.showModalDialog("listvendorbookedcapacity.jsp?vendorid="+vendorid+"&vendordate="+vendordate,"","dialogWidth:700px;dialogHeight:350px;center:1;status:0");
		      return false;
		}
		
		function open_update(i) { 
		     var vendorid= document.getElementById("vendorid"+i).value;
             var vendordate= document.getElementById("vendordate"+i).value;
             var available= document.getElementById("available"+i).value;
             var capacity= document.getElementById("capacity"+i).value;
             var bookedcapacity= document.getElementById("bookedcapacity"+i).value;
                            
		     var rq = window.showModalDialog("updatevendorcapacity.jsp?vendorid="+vendorid+"&vendordate="+vendordate+"&available="+available+"&capacity="+capacity+"&bookedcapacity="+bookedcapacity,"","dialogWidth:700px;dialogHeight:300px;center:1;status:0");
		     window.location.reload();
		     return false;
		}	

			</script>

  </head>
  <body style="background:url('images/1.jpg');text-align:center;">
   <h3>
		<font color="red"><center>List Schedule</center> </font>
   </h3>
    <div id="container">
	
		<table cellspacing="0" cellpadding="0" align="center" >
		        <tr style="font-size: 11px;font-family:Arial,Tahoma,Verdana;color: #033d61;align:left;" >
				<th>Number</th>
				<th>Vendor Id</th>
				<th width="15%">Vendor Date</th>
				<th width="15%">Available</th>
				<th width="15%">Capacity</th>
				<th width="15%">Booked Capacity</th>
				<th width="15%">Spare Capacity</th>
			    <th >Operation</th>
			    </tr>
			
				<s:iterator value="#request.list" id="schedule">
				
			<tr align="left" >
				<td ><%=i++ %></td>

				<td>&nbsp;<s:property value="#schedule.vendorid" />&nbsp;<input id="vendorid<%=i%>" name="vendorid" value="<s:property value='#schedule.vendorid' />"  type="hidden" /></td>
				<td>&nbsp;<s:property value="#schedule.vendordate" />&nbsp;<input id="vendordate<%=i%>" name="vendordate" value="<s:property value='#schedule.vendordate' />"  type="hidden" /></td>
				<td>&nbsp;<s:property value="#schedule.available" />&nbsp;<input id="available<%=i%>" name="available" value="<s:property value='#schedule.available' />"  type="hidden" /></td>
				<td>&nbsp;<s:property value="#schedule.capacity" />&nbsp;<input id="capacity<%=i%>" name="capacity" value="<s:property value='#schedule.capacity' />"  type="hidden" /></td>
				<td>&nbsp;<a href="#" onclick="return open_win(<%=i%>);" > <s:property value="#schedule.bookedcapacity" /> </a> &nbsp;<input id="bookedcapacity<%=i%>" name="bookedcapacity" value="<s:property value='#schedule.bookedcapacity' />"  type="hidden" /></td>
				<td>&nbsp;<s:property value="#schedule.sparecapacity" />&nbsp;</td>
				<% if(i==2){ %>
				<td>&nbsp;&nbsp;</td>
				<% } else { %>
                <td align='left' ><a href="#" onclick="return open_update(<%=i%>);" >  <img src='images/update.png' name='img1' alt='Edit' width=20 height=20 id=img1></a></td>
			<% } %>
			</tr>			
		
		</s:iterator>																		
        
        	<tr bgcolor="#FFFFFF" height="29" align="right" >
			<td align="right"  colspan="11">Total&nbsp;&nbsp;<s:property value="#request.pageBean.totalSize" />&nbsp;&nbsp;items &nbsp;&nbsp;
			        <s:if test="%{#request.pageBean.currentPage==1}">Page 1</s:if> <s:else>
					<a href="listschedulebypageaction.action?page=1&vendorid=<s:property value="#schedule.vendorid" />">Page 1</a>
					<a href="listschedulebypageaction.action?page=<s:property value="%{#request.pageBean.currentPage-1}"/>&vendorid=<s:property value="#schedule.vendorid" />">Back Page</a>
				</s:else> <s:if
					test="%{#request.pageBean.currentPage!=#request.pageBean.totalPage}">
					<a href="listschedulebypageaction.action?page=<s:property value="%{#request.pageBean.currentPage+1}"/>&vendorid=<s:property value="#schedule.vendorid" />">Next Page</a>
					<a href="listschedulebypageaction.action?page=<s:property value="#request.pageBean.totalPage"/>&vendorid=<s:property value="#schedule.vendorid" />">Last Page</a>
				</s:if> <s:else>
			      Last Page
			   	</s:else></td>
		</tr>
	
		</table>
	</form>
		
	</div>
</div>

  </body>
</html>
