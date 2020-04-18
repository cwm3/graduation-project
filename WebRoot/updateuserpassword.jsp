<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";    
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Update Password</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script language="javascript">

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

<body style="background:url('images/back100.jpg');text-align:center;margin-left:50px;margin-top: 30px;" >
	</br>
	<h4>
		<font color="black"><center>Update Password</center> </font>
	</h4>
    <div class="updateinfo">
		<form method="post" action="updateschedule.action" id="myform" name="myform" >
		<table width="95%" align="center" border="1" cellspacing="0" cellpadding="0"  bordercolor=#000000 style="border-collapse:collapse;font-size:12px;" >
		
		<tr  >
		<td width="25%" align="center" height="30px"  >Vendor ID</td>
		<td> <input id="username" name="username"  type="text"  style="width:70%;height:27px"  /><span class='redtext'>*</span></td>
		</tr>	

		<tr>
		<td align="center" height="30px" >Vendor Name</td>
		<td> <input id="password" name="password"  style="width:70%;height:27px" /><span class='redtext'>*</span></td></tr>
		
	<tr>
		<td align="center" height="30px" >New Password</td>
		<td> <input id="newpassword" name="newpassword"  style="width:70%;height:27px"  /><span class='redtext'>*</span></td></tr>
		
	
		
	     <tr> <td colspan="2">  <center><input type="submit" value="Update" onclick="return updateinfo();" style="width:60px;height:25px;" />
		 </center> </td>  </tr>
						
 
	</table>			
				
    </form>
		<br>
</div> 
  </body>
</html>
