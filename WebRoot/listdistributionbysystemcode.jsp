<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int currentpage = Integer.valueOf(request.getAttribute("currentpage").toString());
String systemcode =request.getAttribute("systemcode").toString();
int i = 12*(currentpage-1)+1 ;
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base target="_self">
    <base href="<%=basePath%>">
    
    <title>List Distribution</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="jquery/jquery-1.8.0.min.js"></script>

<style>
body{
	margin:0;
	padding:0;
	font:70% Arial, Helvetica, sans-serif; 
	color:#555;
}
</style>

<script language="JavaScript"> 

		function del() {
				if (confirm("be sure to delete this message ?")) {
					return true;
				}
				return false;
			}
			 
      function open_win_id(i) {
              var id= document.getElementById("id"+i).value; 
              var systemcode= document.getElementById("systemcode"+i).value; 
		      window.showModalDialog("loaddistribution.action?id="+id,"","dialogWidth:900px;dialogHeight:450px;center:1;status:0");
		      $("#reload").attr("href","selectdistributionbysystemcode.action?systemcode="+systemcode); 
              reload.click();
              return false;
      	}
      	
      function open_distribution(i) {
       	      var id= document.getElementById("deleteid"+i).value;
       	      var systemcode= document.getElementById("systemcode"+i).value;        	      
		      window.showModalDialog("showdistribution.jsp?id="+id,"","dialogWidth:300px;dialogHeight:200px;center:1;status:0");
		      $("#reload").attr("href","selectdistributionbysystemcode.action?systemcode="+systemcode); 
              reload.click();
              return false;
              
      	}
      
     function updatestaus(obj,i) {
            var systemcode= document.getElementById("systemcode"+i).value;
          /*   var ho= document.getElementById("ho"+i).value;
            if(ho=='N'){
               alert("HO is N,Can not change Staus");
               $("#reload").attr("href","selectdistributionbysystemcode.action?systemcode="+systemcode); 
               reload.click();
               return false;
            }  */
		    if(confirm("Do you want to save the changes?")) {
					 var id= document.getElementById("deleteid"+i).value;					 
					 sendRequest("setstatus.jsp?status="+obj+"&id="+id+"&systemcode="+systemcode); 
		}     
     }
     
       function updateho(obj,i) {
            var systemcode= document.getElementById("systemcode"+i).value;
		    if(confirm("Do you want to save the changes?")) {
		             var ho = document.getElementById("ho"+i).value;
		             if(ho=='N'){
		               document.getElementById("status"+i).disabled=true;
		             }else {
		               	document.getElementById("status"+i).disabled=false;
		             }
					 var id= document.getElementById("deleteid"+i).value;					 
					 sendRequest("setho.jsp?ho="+obj+"&id="+id+"&systemcode="+systemcode); 
		}     
     } 
     
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
                showstatus();
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
    }
    //更新菜单函数
    function showstatus() {    
            alert("Change Success！ ");
    }
    

 	 function deletedistribution(i) {
       	    var deleteid= document.getElementById("deleteid"+i).value;
       	    var systemcode= document.getElementById("systemcode"+i).value; 
       	    
            $.ajax({
            url:"deletedistribution.action",
            type:'post' ,
            data: "id="+deleteid+"&systemcode="+systemcode,
            dataType:'json' ,
            async: false,
            success:function (data) {
            	alert("Delete Sucess");
            	window.returnValue="1";
            	window.close();
                
            },
            error:function(XMLResponse){
                  alert(XMLResponse.responseText);
            }
        });
        
        
       
     }            
      	
</script>


  </head>
  
  <body>
  
    <div id="container">
    
	    <table cellspacing="0" cellpadding="0" >
			<tr>
<!-- 				<th>Vendor ID</th>
 -->				<th>Vendor Name</th>
			    <th>Drop Name</th>
				<th>System Code</th>
				<th>Work Type</th>				
				<th>Hourly</th>
				<th>New Words</th>
				<th>Post-Editing</th>
				<th>75%-84% Fuzzy</th>
			    <th>85%-99% Fuzzy</th>
				<th>75%-99% Fuzzy</th>
				<th>100% Repetition</th>
				<th>Total Words</th>
				<th>Value</th>
				<th>PO</th>
				<th>Start Date</th>
				<th>End Date</th>
				
			  
			    
<!-- 			    <th>Comments</th>
 -->			    <th colspan="2" >Operation</th>
		        <th>HO</th>
 		        <th>Status</th>
			    
			    <th>Lead</th>
			</tr>
				<s:iterator value="#request.list" id="distribution">
			<tr >
				<td align="center" style="display:none;"><%=i++ %></td>
<!-- 				<td align="center">&nbsp;<s:property value="#distribution.vendorid" /></td>
 -->				<td align="center">&nbsp;<s:property value="#distribution.vendorname" /></td>
				<td align="center">&nbsp;<s:property value="#distribution.dropname" /></td>
				<td align="center">&nbsp;<s:property value="#distribution.systemcode" /></td>
				<td align="center">&nbsp;<s:property value="#distribution.worktype" /></td>
			    <td align="center">&nbsp;<s:property value="#distribution.hourlywork" /></td>
			    <td align="center">&nbsp;<s:property value="#distribution.newwords" /></td>
				<td align="center">&nbsp;<s:property value="#distribution.postediting"/></td>
			    <td align="center">&nbsp;<s:property value="#distribution.rate1" /></td>
			    <td align="center">&nbsp;<s:property value="#distribution.rate2" /></td>
			    <td align="center">&nbsp;<s:property value="#distribution.rate3" /></td>
			    <td align="center">&nbsp;<s:property value="#distribution.rate4" /></td>
			    <td align="center">&nbsp;<s:property value="#distribution.totalwords" /></td>
			    <td align="center">&nbsp;<s:property value="#distribution.projectvalue" /></td>
			    <td align="center">&nbsp;<s:property value="#distribution.outsourcedponumber" /></td>
			    <td align="center">&nbsp;<s:property value="#distribution.startdate" /></td>
			    <td align="center">&nbsp;<s:property value="#distribution.enddate" /></td>
<!-- 			    <td align="center">&nbsp;<s:property value="#distribution.comments" /></td>	
 -->			    
			    <s:if test="#distribution.remark1=='vendorcoordinator'">
				<td align="center" >&nbsp;</td>						    						    						    
				<td align="center" >&nbsp;</td>		
				</s:if>
			    <s:else>
		         	<td align="center" ><a href="#" onclick="return deletedistribution(<%=i%>);" ><img src="images/delect.jpg" name="img1" alt="Delete" width=20 height=20 id=img1></a><input id="deleteid<%=i%>" name="id" value="<s:property value="#distribution.id" />"  type="hidden" /></td>						    						    						    
				    <td align="center" ><a href="#" onclick="return open_win_id(<%=i%>);" ><img src="images/update.png" name="img1" alt="Edit" width=20 height=20 id=img1> </a><input id="id<%=i%>" name="id" value="<s:property value="#distribution.id" />"  type="hidden" /><input id="systemcode<%=i%>" name="id" value="<s:property value="#distribution.systemcode" />"  type="hidden" /></td>		
				</s:else >
			    <td align="center" ><select name="ho" id="ho<%=i%>"  onchange="updateho(this.options[this.options.selectedIndex].value,<%=i%>)"  style="width:50px;font-size:11px;">
				<s:if test="#distribution.remark3=='111'">
			    	<option value="N">N</option>
				    <option value="Y">Y</option>	
      			</s:if>
				<s:elseif  test="#distribution.remark3=='222'">
					   <option value="Y">Y</option>	
					   <option value="N">N</option>
				</s:elseif>
			    <s:else >
			           <option value="Y">Y</option>	
					   <option value="N">N</option>
				</s:else>
				
				</select>	
			</td>			
	 	        <td align="center" ><select name="status" id="status<%=i%>" onchange="updatestaus(this.options[this.options.selectedIndex].value,<%=i%>)"  style="width:80px;font-size:11px;">
			    <s:if test="#distribution.status=='in process'">
			    	<option value="in process">in process</option>
				    <option value="closed">closed</option>	
      			</s:if>
				<s:elseif  test="#distribution.status=='closed'">
					   <option value="closed">closed</option>	
					   <option value="in process">in process</option>
				</s:elseif>
				
				</select>	
			</td>
			
			<td align="center">&nbsp;<s:property value="#distribution.lead" /></td>
						
			</tr>			
		
		</s:iterator>	
		

		</table>
	</div>
          <a id="reload" href="selectdistributionbysystemcode.action" ></a>
    
  </body>
</html>
