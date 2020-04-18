<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int currentpage = Integer.valueOf(request.getAttribute("currentpage").toString());
int i =1 ;
if(currentpage > 1) {
  i=(currentpage-1)*10+1;
}
int projectsize = Integer.valueOf(request.getAttribute("projectsize").toString());

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
    <link href="style/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
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
					if (confirm("Do you want to delete this project?")) {
						return true;
					}
					return false;
				}
				
			function open_win(i) {		
	              var systemcode=document.getElementById("systemcode"+i).value;
	              var userposition=document.getElementById("userposition"+i).value;              
			      var ren  = window.showModalDialog("selectdistributionbysystemcode.action?systemcode="+systemcode+"&remark1="+userposition,"","dialogWidth:1200px;dialogHeight:450px;center:1;status:0");
			      if(ren=="1") {
			         window.showModalDialog("selectdistributionbysystemcode.action?systemcode="+systemcode+"&remark1="+userposition,"","dialogWidth:1200px;dialogHeight:450px;center:1;status:0");
			      }
			      return false;
			}
			
		
		   function open_win_id(i) {		
	              var id= document.getElementById("id"+i).value;
			      window.showModalDialog("loadproject.action?id="+id,"","dialogWidth:1200px;dialogHeight:450px;center:1;status:0");
	              window.location.reload();
	      	}
	      	      	
	        function init() {
				    var vendorsize=<%=projectsize %>;
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
	}
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
		width:150%;
		height:100%;
		align:center;
		background:#fff;
		padding-bottom:5px;
	}

	</style>


  </head>
  
  <body onload="init()">

    <div id="container">
	
		<table cellspacing="0" cellpadding="0">
				<tr style="font-size: 10px;">
			    <th align="left"  colspan="2">Operation</th>				
                <th align="left">Client</th>
				<th align="left">CostCode</th>
				<th align="left">Drop Name</th>
			    <th align="left">System Code</th>
			    <th align="left">&nbsp;&nbsp;&nbsp;&nbsp;DropDate&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th align="left">&nbsp;&nbsp;&nbsp;&nbsp;Deadline&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th align="left">Hourlywork</th>
				<th align="left">New Words </th>
				<th align="left">Post-editing</th>
				<th align="left">75%-84% Fuzzy</th>
				<th align="left">75%-99% Fuzzy</th>
				<th align="left">85%-99% Fuzzy</th>
				<th align="left">100% Fuzzy</th>
				<th align="left">Total Words</th>
				<th align="left">PO Value</th>
				<th align="left">Status</th>
			    <th align="left">PO Type</th>
				<th align="left">Language Pair</th>
			    <th align="left">iMTQuality</th>			
				<th align="left">iMT Champion</th>
				<th align="left">Manager</th>
			    <th align="left">Lead</th>
 			    <th align="left">Comment</th>
		</tr>
                <s:iterator value="#request.list" id="project">
			<tr align="left">
				<td style="display:none;"><%=i++ %></td>
				<s:if test="#project.potype=='General PO'&#project.userposition=='lead'">
				   <td bgcolor='#e5f1f4' >&nbsp;</td>
				   <td bgcolor='#e5f1f4' >&nbsp;</td>
				</s:if>
			     <s:elseif test="#project.userposition=='vendorcoordinator'||#project.yxbz=='Supply Chain Department'">
				   <td bgcolor='#e5f1f4' >&nbsp;</td>
				   <td bgcolor='#e5f1f4' >&nbsp;</td>
				</s:elseif>
				<s:else>
				   <td align="center" bgcolor='#e5f1f4' ><s:a href="deleteproject.action?id=%{#project.id}&remark1=2"  onclick="return del();"> <img src="images/delect.jpg" name="img1" alt="Delete" width=20 height=20 id=img1></s:a></td>
				   <td align="center" bgcolor='#e5f1f4' ><a href="#" onclick="return open_win_id(<%=i%>);"><img src="images/update.png" name="img1" alt="Edit" width=20 height=20 id=img1> </a><input id="id<%=i%>" name="id" value="<s:property value="#project.id" />"  type="hidden" /></td>							     
			   	</s:else>
				<td bgcolor='#e5f1f4' ><s:property value="#project.client"/></td>
				<td bgcolor='#e5f1f4' ><s:property value="#project.costcode"/></td>
				<td bgcolor='#e5f1f4' ><s:property value="#project.dropname"/></td>
				
				<s:if test="#project.status=='close'">
				<td bgcolor='#e5f1f4' >&nbsp;<a href="#" onclick="return open_win(<%=i%>);"><font color="black"><s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
				</s:if>
			     <s:elseif test="#project.status=='headsup'">
				<td bgcolor='#84C1FF' >&nbsp;<a href="#" onclick="return open_win(<%=i%>);"><font color="black"> <s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
				</s:elseif>
				 <s:elseif test="#project.status=='inprocess'&#project.remark6=='wqbwf_red'">
				<td bgcolor='#FF5151' >&nbsp;<a href="#" onclick="return open_win(<%=i%>);"><font color="black"> <s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
				</s:elseif>
				 <s:elseif test="#project.status=='inprocess'&#project.remark6=='qbwf_yellow'">
				<td bgcolor='#FFFFAA' >&nbsp; <a href="#" onclick="return open_win(<%=i%>);"><font color="black"> <s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
				</s:elseif>
				 <s:elseif test="#project.status=='inprocess'&#project.remark6=='qbwf_green'">
				<td bgcolor='#BBFFBB' >&nbsp;<a href="#" onclick="return open_win(<%=i%>);"><font color="black"> <s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
				</s:elseif>
				 <s:elseif test="#project.status=='inprocess'&#project.remark6=='qbwf_nocolor'">
				<td bgcolor='#e5f1f4' >&nbsp;<a href="#" onclick="return open_win(<%=i%>);"><font color="black"> <s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
				</s:elseif>
				<s:else>
				<td bgcolor='#e5f1f4' >&nbsp; <a href="#" onclick="return open_win(<%=i%>);"> <font color="black"><s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
			   	</s:else>
			    <td bgcolor='#e5f1f4' ><s:property value="#project.dropdate"/></td>				
				<td bgcolor='#e5f1f4' ><s:property value="#project.deadline"/></td>
	            <td bgcolor='#e5f1f4' ><s:property value="#project.hourlywork"/></td>
			    <td bgcolor='#e5f1f4' ><s:property value="#project.newwords"/></td>
			    <td bgcolor='#e5f1f4' ><s:property value="#project.postediting"/></td>
			    <td bgcolor='#e5f1f4' ><s:property value="#project.rate1"/></td>
			    <td bgcolor='#e5f1f4' ><s:property value="#project.rate2"/></td>
			    <td bgcolor='#e5f1f4' ><s:property value="#project.rate3"/></td>
			    <td bgcolor='#e5f1f4' ><s:property value="#project.rate4"/></td>
			    <td bgcolor='#e5f1f4' ><s:property value="#project.totalwords"/></td>
			    
			    <td bgcolor='#e5f1f4' ><s:property value="#project.receivedpovalue"/></td>
			    <td bgcolor='#e5f1f4' ><s:property value="#project.status"/></td>
				<td bgcolor='#e5f1f4' ><s:property value="#project.potype"/></td>
			    <td bgcolor='#e5f1f4' ><s:property value="#project.Languagebegin"/></td>
			    <td bgcolor='#e5f1f4' ><s:property value="#project.imtquality"/></td>
			    <td bgcolor='#e5f1f4' ><s:property value="#project.imtchampion"/></td>
			    
				<td bgcolor='#e5f1f4' ><s:property value="#project.lmorgl"/></td>
				<td bgcolor='#e5f1f4' ><s:property value="#project.lead"/></td>
     		    <td bgcolor='#e5f1f4' ><s:property value="#project.comment"/></td>
			    <td style="display:none"><s:property value="#project.id" /></td>			    
			</tr>			
		</s:iterator>	
		
		 <!-- 查无结果 不显示分页信息-->  
           <% if(projectsize != 0) { %>																	        
        	<tr bgcolor="#FFFFFF" height="29" align="right">
			<td align="right" bgcolor='#e5f1f4' colspan="25">Total&nbsp;&nbsp;<s:property
					value="#request.pageBean.totalSize" />&nbsp;&nbsp;items &nbsp;&nbsp; Page&nbsp;&nbsp;<s:property
					value="#request.pageBean.currentPage" /><s:if
					test="%{#request.pageBean.currentPage==1}">
			   		Page One
			   	</s:if> <s:else>
					<a href="listprojectbypageaction.action?page=1&remark1=2">Page One</a>
					<a
						href="listprojectbypageaction.action?page=<s:property value="%{#request.pageBean.currentPage-1}"/>&remark1=2">Back Page</a>
				</s:else> <s:if
					test="%{#request.pageBean.currentPage!=#request.pageBean.totalPage}">
					<a href="listprojectbypageaction.action?page=<s:property value="%{#request.pageBean.currentPage+1}"/>&remark1=2">Next Page</a>
					<a href="listprojectbypageaction.action?page=<s:property value="#request.pageBean.totalPage"/>&remark1=2">Last Page</a>
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
