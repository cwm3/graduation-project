<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String vendorid = request.getAttribute("vendorid").toString();
String vendorname = request.getAttribute("vendorname").toString();
String chinesename = request.getAttribute("chinesename").toString();
int currentpage = Integer.valueOf(request.getAttribute("currentpage").toString());
int vendorsize = Integer.valueOf(request.getAttribute("vendorsize").toString());
if(vendorsize==0) {
   out.print("alert('No  result Match')");
}
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
				if (confirm("确定删除信息吗?")) {
					return true;
				}
				return false;
			}
			
 function checkpost() { 
		 
		 if(name_form.vendorid.value=="" || name_form.vendorid.value== null )
    	        {
    	        alert("请输入vendorid"); 
    	        name_form.vendorid.focus(); 
    	        return false; 
    	     } 
		}
</script>
  </head>
  
  <body>
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
			
				<s:iterator value="#request.list" id="vendor">
				
			<tr>
				<td><%=i++ %></td>
				<td><s:a href="loadvendorschedule.action?vendorid=%{#vendor.vendorid}"><s:property value="#vendor.vendorid" /></s:a></td>
				<td><s:property value="#vendor.vendorname" /></td>
				<td><s:property value="#vendor.chinesename" /></td>
				<td><s:property value="#vendor.field" /></td>
				<td><s:property value="#vendor.tel" /></td>
			    <td><s:property value="#vendor.email" /></td>
			    <td><s:property value="#vendor.cat" /></td>
			    <td><s:property value="#vendor.averagescore" /></td>
			    
			    <td style="display:none" ><s:property value="#vendor.id" /></td>
				
				<td><s:a
						href="loadvendor.action?id=%{#vendor.id}">
						<img src="images/update.png" name="img1" alt="编辑" width=20
							height=20 id=img1>
					</s:a></td>
	           <td><s:a
						href="deletevendor.action?id=%{#vendor.id}"
						onclick="return del();"> <img src="images/delect.jpg" name="img1" alt="删除" width=20
							height=20 id=img1></s:a></td>
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
					<a href="listvendorbypageaction.action?page=1"><img src="images/first.gif"/></a>
					<a
						href="selectvendorbytiaojian.action?page=<s:property value="%{#request.pageBean.currentPage-1}"/>&vendorid=<%=vendorid %>&chinesename=<%=chinesename %>&vendorname=<%=vendorname %>"><img src="images/back.gif"/></a>
				</s:else> <s:if
					test="%{#request.pageBean.currentPage!=#request.pageBean.totalPage}">
					<a
						href="listvendorbypageaction.action?page=<s:property value="%{#request.pageBean.currentPage+1}"/>&vendorid=<%=vendorid %>&chinesename=<%=chinesename %>&vendorname=<%=vendorname %>"><img src="images/next.gif"/></a>
					<a
						href="listvendorbypageaction.action?page=<s:property value="#request.pageBean.totalPage"/>"><img src="images/last.gif"/></a>
				</s:if> <s:else>
			   		最后一页
			   	</s:else></td>
		</tr>
	
		</table>
	

  </body>
</html>
