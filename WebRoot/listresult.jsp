<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int i = 0 ;
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
#container{
	margin:0 auto;
	width:100%;
	margin-left:20px;
	background:#fff;
	padding-bottom:20px;
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
				if (confirm("确定删除该信息吗?")) {
					return true;
				}
				return false;
			}
			</script>
			

  </head>
  
  <body>
   
 
 <div id="container">
  <fieldset>
    <legend class="legend">明细列表</legend>   
    
	<table cellspacing="0" cellpadding="0">
			<tr>
				<th>Number</th>
				<th>Vendor ID</th>
				<th>Vendor Name</th>
				<th>Chinese Name</th>
				<th>Field</th>
				<th>TEL</th>
				<th>Email</th>
				<th>CAT</th>
				<th>Average Scores</th>
				<th  colspan="5" >操作</th>
			</tr>
			
				<s:iterator value="#request.list" id="customer">
				
			<tr>
				<td><%=i++ %></td>
				<td><s:property value="#customer.customername" /></td>
				<td><s:property value="#customer.customername" /></td>
				<td><s:property value="#customer.customername" /></td>
				<td><s:property value="#customer.customerpassword" /></td>
				<td><s:property value="#customer.customerpassword" /></td>
			    <td><s:property value="#customer.customerpassword" /></td>
			    <td><s:property value="#customer.customerpassword" /></td>
			    <td><s:property value="#customer.customerpassword" /></td>
			</tr>			
		
		</s:iterator>																		
        
        	<tr bgcolor="#FFFFFF" height="29" align="right" >
			<td align="right"  colspan="14">总计<s:property
					value="#request.pageBean.totalSize" />条&nbsp;&nbsp; 第<s:property
					value="#request.pageBean.currentPage" />页/共<s:property
					value="#request.pageBean.totalPage" />页&nbsp;&nbsp; <s:if
					test="%{#request.pageBean.currentPage==1}">
			   		第一页
			   	</s:if> <s:else>
					<a href="listcustomerbypageaction.action?page=1"><img src="images/first.gif"/></a>
					<a
						href="listcustomerbypageaction.action?page=<s:property value="%{#request.pageBean.currentPage-1}"/>"><img src="images/back.gif"/></a>
				</s:else> <s:if
					test="%{#request.pageBean.currentPage!=#request.pageBean.totalPage}">
					<a
						href="listcustomerbypageaction.action?page=<s:property value="%{#request.pageBean.currentPage+1}"/>"><img src="images/next.gif"/></a>
					<a
						href="listcustomerbypageaction.action?page=<s:property value="#request.pageBean.totalPage"/>"><img src="images/last.gif"/></a>
				</s:if> <s:else>
			   		最后一页
			   	</s:else></td>
		</tr>
	
		</table>
	</form>
		
	</div>
	 </fieldset>
</div>

  </body>
</html>
