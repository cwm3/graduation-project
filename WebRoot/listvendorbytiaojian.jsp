<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int currentpage = Integer.valueOf(request.getAttribute("currentpage").toString());
int i =1 ;
int vendorsize = Integer.valueOf(request.getAttribute("vendorsize").toString());
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>vendor list</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />

<style>

body{
	margin:0;
	padding:0;
	font:70% Arial, Helvetica, sans-serif; 
	color:#555;
	line-height:150%;
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
#container{
	margin:0 10px 20px 10px;
	width:100%;
	background:#fff;
	padding-bottom:10px;
}
#content{margin:0 20px;}
p.sig{	
	margin:0 auto;
	width:680px;
	padding:1em 0;
}
form{
	margin:1em 0;
	padding:.2em 20px;
	background:#eee;
}
</style>

<script type="text/javascript">
			function del() {
				if (confirm("be sure to delete this message?")) {
					return true;
				}
				return false;
			}
			
			function init() {
			    var vendorsize=<%=vendorsize %>;
			    if(vendorsize==0) {
			         alert("No result Match");
			    }
			}
			
			
			
			</script>
			

  </head>
  
  <body onload="init()">

    <div id="container">
	
		<table cellspacing="0" cellpadding="0" >
		 <tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
<!-- 	    <tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
				<th>Number</th>
				<th>Vendor ID</th>
				<th>Vendor Name</th>
				<th>Chinese Name</th>
				<th>Field</th>
				<th>Tel</th>
				<th>Email</th>
				<th>QQ</th>
				<th>Qualified Date</th>
				<th>Cat</th>
				<th>Vendor Type</th>
				<th>Average Scores</th>
				<th>Comment</th> -->
					<th style="text-align:left;">Number</th>
				<th style="text-align:left;">Vendor ID</th>
				<th style="text-align:left;">Vendor Name</th>
				<th style="text-align:left;">Chinese Name</th>
				<th style="text-align:left;">Field</th>
		<!-- 		<th>TEL</th>
				<th>Email</th> -->
			  
			</tr>
			
				<s:iterator value="#request.list" id="vendor">
				
			<tr align="left" >
				<td><%=i++ %></td>
				<td>&nbsp;<s:property value="#vendor.vendorid"/>&nbsp;</td>
				<td>&nbsp;<s:property value="#vendor.vendor_name"/>&nbsp;</td>
				<td>&nbsp;<s:property value="#vendor.chinese_name"/>&nbsp;</td>
				<td>&nbsp;<s:property value="#vendor.vendor_field"/>&nbsp;</td>
			
				
				</tr>
		
		</s:iterator>																		
        
           <!-- 查无结果 不显示分页信息-->  
           <% if(vendorsize != 0) { %>
            <tr bgcolor="#FFFFFF" height="29" align="right" >
			<td align="right"  colspan="16">Total&nbsp;&nbsp;<s:property
					value="#request.pageBean.totalSize" />&nbsp;&nbsp;items &nbsp;&nbsp; Page&nbsp;&nbsp;<s:property
					value="#request.pageBean.currentPage" /><s:if
					test="%{#request.pageBean.currentPage==1}">
			   		Page 1
			   	</s:if> <s:else>
					<a href="selectvendorbytiaojian.action?page=1&vendorid=<s:property value="#vendor.remark1"/>&vendor_name=<s:property value="#vendor.remark2"/>&chinese_name=<s:property value="#vendor.remark3"/>">Page One</a>
					<a
						href="selectvendorbytiaojian.action?page=<s:property value="%{#request.pageBean.currentPage-1}"/>&vendorid=<s:property value="#vendor.remark1"/>&vendor_name=<s:property value="#vendor.remark2"/>&chinese_name=<s:property value="#vendor.remark3"/>">Back Page</a>
				</s:else> <s:if
					test="%{#request.pageBean.currentPage!=#request.pageBean.totalPage}">
					<a
						href="selectvendorbytiaojian.action?page=<s:property value="%{#request.pageBean.currentPage+1}"/>&vendorid=<s:property value="#vendor.remark1"/>&vendor_name=<s:property value="#vendor.remark2"/>&chinese_name=<s:property value="#vendor.remark3"/>">Next Page</a>
					<a
						href="selectvendorbytiaojian.action?page=<s:property value="#request.pageBean.totalPage"/>&vendorid=<s:property value="#vendor.remark1"/>&vendor_name=<s:property value="#vendor.remark2"/>&chinese_name=<s:property value="#vendor.remark3"/>">Last Page</a>		
							</s:if> <s:else>
			   		Last Page
			   	</s:else></td>
		</tr> 
	
        
        <%  } %>
        	
		</table>
	</form>
		
	</div>
</div>

  </body>
</html>
