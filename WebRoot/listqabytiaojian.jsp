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
int qasize = Integer.valueOf(request.getAttribute("qasize").toString());
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>qa list</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
   	<script type="text/javascript"  src="qamanger/listqa.js"></script>
   

<style>

body{
	margin:0;
	padding:0;
	font:70% Arial, Helvetica, sans-serif; 
	color:#555;
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
h1{
	font-size:140%;
	margin:0 20px;
	line-height:80px;	
}
h2{
	font-size:120%;
}
#container{
	margin:0 5px 5px 10px;
	width:100%;
	align:center;
	background:#fff;
	padding-bottom:5px;
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
				if (confirm("be sure to delete this message ?")) {
					return true;
				}
				return false;
			}
			
			     			
			function init() {
			    var qasize=<%=qasize %>;
			    if(qasize==0) {
			         alert("No result Match");
			    }
			}
			}			
			</script>
  </head>
  
  <body  onload="init()">


    <div id="container">
	
		<table cellspacing="0" cellpadding="0" >
			   <tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;align:left;">
			    <th align="left">Number</th>
				<th align="left">SDL Network Office</th>
				<th align="left" >Vendor Name</th>
			    <th align="left">Lead</th>
			    <th align="left" >Manager</th>
				<th align="left" >Date</th>
				<th align="left" >Client Name</th>
     			<th align="left" >SDL Cost Code</th>
				<th align="left" >Sector</th>
				<th align="left" >Translation Type</th>
				<th align="left" >Translator Name</th>
				<th align="left" >Reviewer Name</th>
				<th align="left" >Evaluator Name</th>
				<th align="left" >Word Count</th>
				<th align="left">NWO Passes/Fails</th>
				<th align="left">QA Score</th>
			    <th align="left">Source Language</th>
				<th align="left" >Target Language</th>
	           	<th align="left" >FileName</th>							

			</tr>
			
				<s:iterator value="#request.list" id="qa">
			<tr align="left" >
				<td><%=i++ %></td>
				<td>&nbsp;<s:property value="#qa.sdlnetworkoffice"/>&nbsp;</td>
			    <td>&nbsp;<s:property value="#qa.vendorname"/>&nbsp;</td>
			    <td>&nbsp;<s:property value="#qa.lead"/>&nbsp;</td>
			    <td>&nbsp;<s:property value="#qa.lmorgl"/>&nbsp;</td>
			    
				<td>&nbsp;<s:property value="#qa.qadate"/>&nbsp;</td>
				<td>&nbsp;<s:property value="#qa.clientname"/>&nbsp;</td>
					
					
				<td>&nbsp;<s:property value="#qa.sdlcostcode"/>&nbsp;</td>
				<td>&nbsp;<s:property value="#qa.sector"/>&nbsp;</td>
				<td>&nbsp;<s:property value="#qa.translationtype"/>&nbsp;</td>
			    <td>&nbsp;<s:property value="#qa.translatorname"/>&nbsp;</td>
			    <td>&nbsp;<s:property value="#qa.reviewername"/>&nbsp;</td>
			    <td>&nbsp;<s:property value="#qa.evaluatorname"/>&nbsp;</td>
			    
			    
			  
			    <td>&nbsp;<s:property value="#qa.wordcount"/>&nbsp;</td>
			    <td>&nbsp;<s:property value="#qa.sdlqualityindicator_show"/>&nbsp;</td>
			    <td>&nbsp;<s:property value="#qa.sdlqualityindicator"/>&nbsp;</td>
			    <td>&nbsp;<s:property value="#qa.sourcelanguage"/>&nbsp;</td>
				<td>&nbsp;<s:property value="#qa.targetlanguage"/>&nbsp;</td>
                <td>&nbsp; <a href="FileDownload.action?fileName=<s:property value="#qa.filefilename"/>&ftpfileName=<s:property value="#qa.ftpfilename"/>" ><s:property value="#qa.filefilename"/></a> &nbsp;</td>
			    <td style="display:none" ><s:property value="#qa.id" /></td>
			    
			</tr>			
		
		</s:iterator>	
		
			<tr bgcolor="#FFFFFF" height="29" align="right" >
			<td align="right"  colspan="19">Total&nbsp;&nbsp;<s:property value="#request.pageBean.totalSize" />&nbsp;&nbsp;items &nbsp;&nbsp;
			        <s:if test="%{#request.pageBean.currentPage==1}">Page 1</s:if> <s:else>
					<a href="loadqaByTiaojian.action?page=1&remark1=2">Page 1</a>
					<a href="loadqaByTiaojian.action?page=<s:property value="%{#request.pageBean.currentPage-1}"/>&remark1=2">Back Page</a>
				</s:else> <s:if
					test="%{#request.pageBean.currentPage!=#request.pageBean.totalPage}">
					<a href="loadqaByTiaojian.action?page=<s:property value="%{#request.pageBean.currentPage+1}"/>&remark1=2">Next Page</a>
					<a href="loadqaByTiaojian.action?page=<s:property value="#request.pageBean.totalPage"/>&remark1=2">Last Page</a>
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
