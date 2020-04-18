<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int currentpage = Integer.valueOf(request.getAttribute("currentpage").toString());
System.out.println(currentpage);
int i =1 ;
if(currentpage > 1) {
  i=(currentpage-1)*10+1;
}
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
    <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
  	<script type="text/javascript"  src="vendormanger/listvendor.js"></script>
   

<style>

body{
	margin:0;
	padding:0;
	line-height:150%;
    margin:0px;
    background-color:rgba(204, 204, 204, 0.168627450980392);
    background-image:none;
a{
	text-decoration:none;
	color:#057fac;
}
a:hover{
	text-decoration:none;
	color:#999;
}

#container{
	margin:5px 5px 5px 10px;
	width:100%;
	align:center;
	background:#fff;
	padding-bottom:5px;
}

.biaoti{
    margin-top:15px;
 	font-size: 14px;
	font-family : Arial,Tahoma,Verdana;
	color: #033d61; 
}  

</style>


  </head>
  <script type="text/javascript">
			function del() {
				if (confirm("be sure to delete this message ?")) {
					return true;
				}
				return false;
			}
	
			</script>
  <body>
    
    <div id="container">
	
		<table cellspacing="0" cellpadding="0" >
				<tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;align:left;">
				<th style="text-align:left;">Number</th>
			    <th style="text-align:left;">Vendor Type</th>
				<th style="text-align:left;" >Vendor ID</th>
				<th style="text-align:left;" >Vendor Name</th>
				<th style="text-align:left;" >PassWord</th>
				<th style="text-align:left;" >Chinese Name</th>
				<th style="text-align:left;" >Field</th>
				<th style="text-align:left;" >Contact Details</th>
			    <th style="text-align:left;" >Language Pair</th>
				
			     <th  colspan="4" >operation</th>
			</tr>
			
				<s:iterator value="#request.list" id="vendor">
				
			<tr  style="font-size: 11px;font-family:Arial,Tahoma,Verdana;" >
				<td ><%=i++ %></td>
			    <td>&nbsp;<s:property value="#vendor.vendortype"/>&nbsp;</td>
				<td><s:property value="#vendor.vendorid"/></td>
				<td><s:property value="#vendor.vendor_name"/></td>
				<td><s:property value="#vendor.vendorpassword"/></td>
				<td>&nbsp;<s:property value="#vendor.chinese_name"/>&nbsp;</td>
				<td>&nbsp;<s:property value="#vendor.vendor_field"/>&nbsp;</td>
				<td width="30px">TEL:<s:property value="#vendor.vendor_tel"/>&nbsp;</br>Email:&nbsp;<s:property value="#vendor.vendor_email"/>&nbsp;</br>QQ:&nbsp;<s:property value="#vendor.vendor_qq"/>&nbsp;</td>
    			<td >&nbsp;<s:property value="#vendor.Languagebegin"/>&nbsp;</td>
				
			    <td>&nbsp;<s:property value="#vendor.averagescore"/>&nbsp;</td>
    		    <td style="display:none" ><s:property value="#vendor.id" /></td>
			    
				<td align="center" ><s:a
						href="deletevendor.action?id=%{#vendor.id}&vendorid=%{#vendor.vendorid}&remark1=%{#request.pageBean.currentPage}" onclick="return del();"> <img src="images/delect.jpg" name="img1" alt="Delete" width=20
							height=20 id=img1></s:a></td>
				<td align="center" ><s:a
						href="loadvendor.action?id=%{#vendor.id}&remark3=%{#request.pageBean.currentPage}&remark1=%{#vendor.remark1}&remark2=%{#vendor.remark2}">
						<img src="images/update.png" name="img1" alt="Edit" width=20
							height=20 id=img1>
					</s:a></td>

	
			</tr>			
		
		</s:iterator>																		
        
        	<tr height="29" align="right"  style="font-size: 11px;font-family:Arial,Tahoma,Verdana;"  >
        	
        		<td align="right"  colspan="28">Total&nbsp;&nbsp;<s:property value="#request.pageBean.totalSize" />&nbsp;&nbsp;items &nbsp;&nbsp;
			        <s:if test="%{#request.pageBean.currentPage==1}">Page 1</s:if> <s:else>
					<a href="selectvendor.action?page=1&vendorid=<s:property value="#vendor.remark1"/>&vendor_name=<s:property value="#vendor.remark2"/>&chinese_name=">Page 1</a>
					<a href="selectvendor.action?page=<s:property value="%{#request.pageBean.currentPage-1}"/>&vendorid=<s:property value="#vendor.remark1"/>&vendor_name=<s:property value="#vendor.remark2"/>&chinese_name=">Back Page</a>
				</s:else> <s:if
					test="%{#request.pageBean.currentPage!=#request.pageBean.totalPage}">
					<a href="selectvendor.action?page=<s:property value="%{#request.pageBean.currentPage+1}"/>&vendorid=<s:property value="#vendor.remark1"/>&vendor_name=<s:property value="#vendor.remark2"/>&chinese_name=">Next Page</a>
					<a href="selectvendor.action?page=<s:property value="#request.pageBean.totalPage"/>&vendorid=<s:property value="#vendor.remark1"/>&vendor_name=<s:property value="#vendor.remark2"/>&chinese_name=">Last Page</a>
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
