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
    
    <title>user list</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
  	<script type="text/javascript"  src="usermanger/listuser.js"></script>
   
<script type="text/javascript">
			function del() {
				if (confirm("be sure to delete this message ?")) {
					return true;
				}
				return false;
			}
	
			</script>
<style>

body{
	margin:0;
	padding:0;
	font:70% Arial, Helvetica, sans-serif; 
	background-color:rgba(204, 204, 204, 0.168627450980392);
	
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
	font-size: 11px;
	font-family : Arial,Tahoma,Verdana;
	color: #033d61; 
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
.biaoti{
    margin-top:20px;
 	font-size: 14px;
	font-family : Arial,Tahoma,Verdana;
	color: #033d61; 
}
</style>


  </head>
  
  <body>
  	<br>
       <div class="biaoti"><center>User List</center></div>
    
<!--     <div align="center" ><h4><font color="black">User List</center></font></h4></div>
 -->
    <div id="container">
	
		<table cellspacing="0" cellpadding="0" >
				<tr style="font-size: 11px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
				<th  align="left" >Number</th>
				<th  align="left" >User Name</th>
				<th  align="left" >User Password</th>
				<th  align="left" >Manager</th>
				<th  align="left">Department</th>
				<th  align="left">User Position</th>
				<th  align="left" >Permissions Module</th>	
				<th   align="left" colspan="5" >operation</th>
			</tr>
			
				<s:iterator value="#request.list" id="user">
				
			<tr align="left" >
				<td><%=i++ %></td>
				<td><s:property value="#user.username"/></td>
				<td>&nbsp;<s:property value="#user.password"/>&nbsp;</td>
				<td>&nbsp;<s:property value="#user.lmorgl"/>&nbsp;</td>
				<td>&nbsp;<s:property value="#user.department"/>&nbsp;</td>
				<td>&nbsp;<s:property value="#user.userposition"/>&nbsp;</td>
				<td width="500px">&nbsp;<s:property value="#user.permissionsmodule"/>&nbsp;</td>
				
			    <td style="display:none" ><s:property value="#user.id" /></td>
			    
				<td align="center" ><s:a
						href="deleteuser.action?id=%{#user.id}"
						onclick="return del();"> <img src="images/delect.jpg" name="img1" alt="Delete" width=20
							height=20 id=img1></s:a></td>
				<td align="center" ><s:a
						href="loaduser.action?id=%{#user.id}">
						<img src="images/update.png" name="img1" alt="Edit" width=20
							height=20 id=img1>
					</s:a></td>

	
			</tr>			
		
		</s:iterator>																		
        
        	<tr bgcolor="#FFFFFF" height="29" align="right" >
			<td align="right"  colspan="28">Total&nbsp;&nbsp;<s:property
					value="#request.pageBean.totalSize" />&nbsp;&nbsp; Page&nbsp;&nbsp;<s:property
					value="#request.pageBean.currentPage" /><s:if
					test="%{#request.pageBean.currentPage==1}">
			   		Page 1
			   	</s:if> <s:else>
					<a href="listuserbypageaction.action?page=1">Page One</a>
					<a href="listuserbypageaction.action?page=<s:property value="%{#request.pageBean.currentPage-1}"/>">Back Page</a>
				</s:else> <s:if
					test="%{#request.pageBean.currentPage!=#request.pageBean.totalPage}">
					<a
						href="listuserbypageaction.action?page=<s:property value="%{#request.pageBean.currentPage+1}"/>">Next Page</a>
					<a
						href="listuserbypageaction.action?page=<s:property value="#request.pageBean.totalPage"/>">Last Page</a>
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
