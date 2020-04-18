<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int currentpage = Integer.valueOf(request.getAttribute("currentpage").toString());
int i =1 ;
if(currentpage > 1) {
  i=(currentpage-1)*10+1;
}
int translatorsize = Integer.valueOf(request.getAttribute("translatorsize").toString());
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>project list</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

   <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
   <script type="text/javascript"  src="projectmanger/listproject.js"></script>
   <script type="text/javascript"  src="vendormanger/listvendor.js"></script>
   
<script type="text/javascript">

    var XMLHttpReq;
    var currentSort;
     //创建XMLHttpRequest对象      
    function createXMLHttpRequest() {
        if(window.XMLHttpRequest) { //Mozilla 浏览器
            XMLHttpReq = new XMLHttpRequest();
        }
        else if (window.ActiveXObject) { // IE浏览器
            try {
                XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {}
            }
        }
    }
    //发送请求函数
    function sendRequest(url) {
        createXMLHttpRequest();
        XMLHttpReq.open("GET", url, true);
        XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
        XMLHttpReq.send(null);  // 发送请求
    }
    // 处理返回信息函数
    function processResponse() {
        if (XMLHttpReq.readyState == 4) { // 判断对象状态
            if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
                checkprojectdistribution();
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
    }
    
    var sfwf;
    //更新菜单函数
    function checkprojectdistribution() {    
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        sfwf=res;
    }
    // 检查vendorid
    function checkproject(systemcode) { 
        sendRequest("checkprojectdistribution.jsp?systemcode="+systemcode);     
    }

    function del() {
				if (confirm("Do you want to delete this information ?")) {
					return true;
				}
				return false;
			}
			
	
	
	   function open_win(i) {		
              var id= document.getElementById("translatorid"+i).value;
		      window.showModalDialog("loadtranslator.action?translatorid="+id,"","dialogWidth:900px;dialogHeight:400px;center:1;status:0");
              window.location.reload();
      	}
      	      	
        function init() {
			    var vendorsize=<%=translatorsize %>;
			    if(vendorsize==0) {
			         alert("No result Match");
			    }
			}			
			</script>
			
<style>

body{
	margin:0;
	padding:0;
	font:70% Arial, Helvetica, sans-serif; 
	color:#555;
	line-height:150%;
	text-align:center;
	width:100%;
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
	margin:5px 5px 5px 10px;
	width:100%;
	height:80%;
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


  </head>
  
  <body onload="init()">

    <div id="container">
	
		<table cellspacing="0" cellpadding="0" width="100%" height="80px" >
				<tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
			    <th align="left"  colspan="2" >Operation</th>				
	            <th align="left">Translator Name</th>
				<th align="left" >Office</th>
				<th align="left" >Comment</th>
			</tr>
			
				<s:iterator value="#request.list" id="translator">
				
			<tr align="left" >
			    <td style="display:none" ><%=i++ %></td>
				<td align="center" width="5%" ><s:a href="deletetranslator.action?translatorid=%{#translator.translatorid}" onclick="return del();"> <img src="images/delect.jpg" name="img1" alt="Delete" width=20 height=20 id=img1></s:a></td>
				<td align="center" width="5%"><a href="#" onclick="return open_win(<%=i%>);" ><img src="images/update.png" name="img1" alt="Edit" width=20 height=20 id=img1></a><input id="translatorid<%=i%>" name="id" value="<s:property value="#translator.translatorid" />"  type="hidden" /></td>
			    <td width="25%" ><s:property value="#translator.translatorname"/></td>
			    <td width="25%"><s:property value="#translator.office"/></td>
			    <td width="40%" >&nbsp;<s:property value="#translator.comment"/>&nbsp;</td>
			    <td style="visibility:hidden" ><s:property value="#translator.translatorid" /></td>			    
			</tr>			
		</s:iterator>	
		
		 <!-- 查无结果 不显示分页信息-->  
           <% if(translatorsize != 0) { %>																	        
        	<tr bgcolor="#FFFFFF" height="29" align="right" >
			<td align="right"  colspan="5">Total&nbsp;&nbsp;<s:property
					value="#request.pageBean.totalSize" />&nbsp;&nbsp;items &nbsp;&nbsp; Page&nbsp;&nbsp;<s:property
					value="#request.pageBean.currentPage" /><s:if
					test="%{#request.pageBean.currentPage==1}">
			   		Page One
			   	</s:if> <s:else>
					<a href="listtranslatorbypageaction.action?page=1&yxbz=2">Page One</a>
					<a
						href="listtranslatorbypageaction.action?page=<s:property value="%{#request.pageBean.currentPage-1}"/>&yxbz=2">Back Page</a>
				</s:else> <s:if
					test="%{#request.pageBean.currentPage!=#request.pageBean.totalPage}">
					<a href="listtranslatorbypageaction.action?page=<s:property value="%{#request.pageBean.currentPage+1}"/>&yxbz=2">Next Page</a>
					<a href="listtranslatorbypageaction.action?page=<s:property value="#request.pageBean.totalPage"/>&yxbz=2">Last Page</a>
				</s:if> <s:else>
			   		Last Page
			   	</s:else>
			   	</td>
			   	
			    <td style="visibility:hidden" >&nbsp;</td>			    
			   	
			   	
		</tr>
	  <%  } %>
		</table>
	</form>
		
	</div>
</div>

  </body>
</html>
