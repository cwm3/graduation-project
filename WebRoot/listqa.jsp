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
			
		      function open_win_id(i) {		
              var id= document.getElementById("id"+i).value;
		      window.showModalDialog("loadqa.action?id="+id,"","dialogWidth:1000px;dialogHeight:450px;center:1;status:0");
              window.location.reload();
      	}	
      	
			
		function init() {
			    var qasize=<%=qasize %>;
			    if(qasize==0) {
			         alert("No result Match");
			    }
			}
		</script>
  </head>
  
  <body  onload="init()">


    <div id="container">
	
		<table cellspacing="0" cellpadding="0" >
			    <tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;align:left;">
				<th>Number</th>
				<th>SDL Network Office</th>
				<th>Vendor Name</th>
			    <th>Lead</th>
				<th>Date</th>
				<th>Client Name</th>
     			<th>SDL Cost Code</th>
				<th>Sector</th>
				<th>Translation Type</th>
				<th>Translator Name</th>
				<th>Reviewer Name</th>
				<th>Evaluator Name</th>
				<th>Word Count</th>
				<th>NWO Passes/Fails</th>
				<th>QA Score</th>
			    <th>Source Language</th>
				<th>Target Language</th>
	           	<th>FileName</th>
							
				<th  colspan="2" >operation</th>
			</tr>
			
				<s:iterator value="#request.list" id="qa">
			<tr align="center" >
				<td><%=i++ %></td>
				<td>&nbsp;<s:property value="#qa.sdlnetworkoffice"/>&nbsp;</td>
			    <td>&nbsp;<s:property value="#qa.vendorname"/>&nbsp;</td>
			    <td>&nbsp;<s:property value="#qa.lead"/>&nbsp;</td>
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
                <td>&nbsp;<a href="FileDownload.action?fileName=<s:property value="#qa.filefilename"/>&ftpfileName=<s:property value="#qa.ftpfilename"/>" ><s:property value="#qa.filefilename"/></a> &nbsp;</td>
			    
			    
			    <td style="display:none" ><s:property value="#qa.id" /></td>
		    
			    
				<td align="center" ><s:a href="deleteqa.action?id=%{#qa.id}&sdlcostcode=%{#qa.remark1}&vendorname=%{#qa.remark2}&qadate=%{#qa.remark3}&clientname=%{#qa.remark4}" onclick="return del();"> <img src="images/delect.jpg" name="img1" alt="Delete" width=20
							height=20 id=img1></s:a></td>
				<td align="center" ><a href="#" onclick="return open_win_id(<%=i%>);" >
						<img src="images/update.png" name="img1" alt="Edit" width=20 height=20 id=img1></a>
					<input id="id<%=i%>" name="id" value="<s:property value="#qa.id" />"  type="hidden" /></td>
	
			</tr>			
		
		</s:iterator>																		
        
        	<tr bgcolor="#FFFFFF" height="29" align="right" >
			<td align="right"  colspan="25">Total&nbsp;&nbsp;<s:property
					value="#request.pageBean.totalSize" />&nbsp;&nbsp;items &nbsp;&nbsp; Page&nbsp;&nbsp;<s:property
					value="#request.pageBean.currentPage" /><s:if
					test="%{#request.pageBean.currentPage==1}">
			   		Page 1
			   	</s:if> <s:else>
					<a href="listqabypageaction.action?page=1&remark1=2">Page One</a>
					<a href="listqabypageaction.action?page=<s:property value="%{#request.pageBean.currentPage-1}"/>&remark1=2">Back Page</a>
				</s:else> <s:if
					test="%{#request.pageBean.currentPage!=#request.pageBean.totalPage}">
					<a href="listqabypageaction.action?page=<s:property value="%{#request.pageBean.currentPage+1}"/>&remark1=2">Next Page</a>
					<a href="listqabypageaction.action?page=<s:property value="#request.pageBean.totalPage"/>&remark1=2">Last Page</a>
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
