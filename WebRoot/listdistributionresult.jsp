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
    
    <title>客户列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="jquery/jquery-1.8.0.min.js"></script>
   <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />

<style>

body{
	margin:0;
	padding:0;
	font:70% Arial, Helvetica, sans-serif; 
	color:#555;
	line-height:150%;
	text-align:left;
}
fieldset
{
  border: 1px solid #61B5CF;
  margin-top: 10px;
  padding: 8px;
  width:98%;
  height:330px;
}
legend
{
  font: bold 12px Arial, Helvetica, sans-serif;
  color: #00008B;
  background-color: #FFFFFF;
}
a{
	text-decoration:none;
	color:#057fac;
}
a:hover{
	text-decoration:none;
	color:#999;
}
h1{
	font-size:140%;
	margin:0 20px;
	line-height:80px;	
}
h2{
	font-size:120%;
}
#container2{
	margin:0 auto;
	width:100%;
	background:#fff;
	padding-bottom:20px;
}
#content{margin:0 20px;}
p.sig{	
	margin:0 auto;
	width:680px;
	padding:1em 0;
}

.allpage{
   margin-top:5px;
   margin-left: 20px;

}
.bottom {
   margin-top:5px;
   margin-left:20%;
   font-size: 12px;

}

.export {
   margin-left:20%;
   font-size: 12px;

}


</style>
</head>
  
  <body>
	<table cellspacing="0" cellpadding="0">
			<tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
		        <th>System Code</th>
		        <th>Resource</th>
				<th>Vendor ID</th>
				<th>Vendor Name/Translator Name</th>
				<th>Drop Name</th>
				<th>Work Type</th>
				<th>Hourly</th>
				<th>New Words</th>
				<th>Post-Editing</th>
			    <th>75%-84% Fuzzy</th>
			    <th>85%-99% Fuzzy</th>
				<th>75%-99% Fuzzy</th>
				<th>100% Repetition</th>
				<th>Total Words</th>
				<th>Cooresponding words</th>
				<th>Value(RMB)</th>
				<th>Outsourced PO Number</th>
				<th>Start date</th>
				<th>End date</th>
				<th>HO</th>
				
			</tr>
				<s:iterator value="#request.list" id="distribution">
			<tr >
        	    <td align="center">&nbsp;<s:property value="#distribution.systemcode" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.resource" />&nbsp;</td>
				<td align="center">&nbsp;<s:property value="#distribution.vendorid" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.vendorname" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.dropname" />&nbsp;</td>
				<td align="center">&nbsp;<s:property value="#distribution.worktype" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.hourlywork" />&nbsp;</td>
				<td align="center">&nbsp;<s:property value="#distribution.newwords" />&nbsp;</td>
				<td align="center">&nbsp;<s:property value="#distribution.postediting"/>&nbsp;</td>
	            <td align="center">&nbsp;<s:property value="#distribution.rate1" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.rate2" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.rate3" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.rate4" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.totalwords" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.coorespondingwords" />&nbsp;</td>			    
			    <td align="center">&nbsp;<s:property value="#distribution.projectvalue" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.outsourcedponumber" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.startdate" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.enddate" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.ho" />&nbsp;</td>				
			    				
			</tr>			
		
		</s:iterator>	
		 
		
		
		
		
		
		
		</table>
	

  </body>
</html>
