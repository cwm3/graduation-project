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
<script language="JavaScript"> 

		function del() {
				if (confirm("be sure to delete this message ?")) {
					return true;
				}
				return false;
			}
			
 function checkpost() { 
		 
		 if(name_form.distributionid.value=="" || name_form.distributionid.value== null )
    	        {
    	        alert("请输入distributionid"); 
    	        name_form.distributionid.focus(); 
    	        return false; 
    	     } 
		}
		
		function open_win(i) {		
              var systemcode=document.getElementById("systemcode"+i).value;
/*               var userposition=document.getElementById("userposition"+i).value;              
 */		      var ren  = window.showModalDialog("selectdistributionbysystemcode.action?systemcode="+systemcode,"","dialogWidth:1500px;dialogHeight:450px;center:1;status:0");
		      if(ren=="1") {
		         window.showModalDialog("selectdistributionbysystemcode.action?systemcode="+systemcode,"","dialogWidth:1500px;dialogHeight:450px;center:1;status:0");
		      }
		      return false;
		}
		
</script>
  </head>
  
  <body>
	<table cellspacing="0" cellpadding="0">
			<tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
			    <th>Client Code</th>
			    <th>System Code</th>
				<th>Vendor Name/Translator Name</th>
				<th>Drop Name</th>
			    <th>Work type</th>
				<th>Hourly</th>
				<th>New Words</th>
				<th>Post-Editing</th>
			    <th>75%-84% Fuzzy</th>
			    <th>85%-99% Fuzzy</th>
				<th>75%-99% Fuzzy</th>
				<th>100% Repetition</th>
				<th>Total words</th>
				<th>Value(RMB)</th>
				<th>PO Number</th>				
				<th>Start Date</th>
				<th>End date</th>
				<th>Lead</th>
			    <th>Resource</th>
			    <th>HO</th>
			    
				
				
	</tr>
				<s:iterator value="#request.list" id="distribution">
			<tr>
			    <td style="display:none" ><%=i++ %></td>
				<td align="center">&nbsp;<s:property value="#distribution.systemcodeall" />&nbsp;</td>
				<td>&nbsp;<a href="#" onclick="return open_win(<%=i%>);" > <s:property value="#distribution.systemcode"/><input id="userposition<%=i%>" name="userposition" value="<s:property value='#distribution.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#distribution.systemcode' />"  type="hidden" /></td>
				
<%-- 			    <td align="center">&nbsp;<s:property value="#distribution.systemcode" />&nbsp;</td>
 --%>			    <td align="center">&nbsp;<s:property value="#distribution.vendorname" />&nbsp;</td>
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
<%-- 			    <td align="center">&nbsp;<s:property value="#distribution.coorespondingwords" />&nbsp;</td>
 --%>			   <td align="center">&nbsp;<s:property value="#distribution.projectvalue" />&nbsp;</td>			    
			    <td align="center">&nbsp;<s:property value="#distribution.outsourcedponumber" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.startdate" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.enddate" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.lead" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.resource" />&nbsp;</td>
			    <td align="center">&nbsp;<s:property value="#distribution.ho" />&nbsp;</td>
			    			
<%-- 			    <td align="center">&nbsp;<s:property value="#distribution.comments" />&nbsp;</td>				
 --%>			    		
			</tr>			
		
		</s:iterator>	
		
		  	<tr bgcolor="#FFFFFF" height="29" align="right" >
			<td align="right"  colspan="25">Total&nbsp;&nbsp;<s:property
					value="#request.pageBean.totalSize" />&nbsp;&nbsp;items &nbsp;&nbsp; Page&nbsp;&nbsp;<s:property
					value="#request.pageBean.currentPage" /><s:if
					test="%{#request.pageBean.currentPage==1}">Page 1
			   	</s:if> <s:else>
					<a href="selectdistribution.action?page=1&remark1=2">Page One</a>
					<a href="selectdistribution.action?page=<s:property value="%{#request.pageBean.currentPage-1}"/>&remark1=2">Back Page</a>
				</s:else> <s:if
					test="%{#request.pageBean.currentPage!=#request.pageBean.totalPage}">
					<a
						href="selectdistribution.action?page=<s:property value="%{#request.pageBean.currentPage+1}"/>&remark1=2">Next Page</a>
					<a
						href="selectdistribution.action?page=<s:property value="#request.pageBean.totalPage"/>&remark1=2">Last Page</a>
				</s:if> <s:else>
			   		Last Page
			   	</s:else></td>
		</tr>

		</table>
	

  </body>
</html>
