<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username = session.getAttribute("username").toString();


%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>AddVendor</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="css/commoncss.css" rel="stylesheet" type="text/css" media="screen" />
	

<style type="text/css">

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color:rgba(204, 204, 204, 0.168627450980392);
	
}
.STYLE1 {
	font-size: 10px;
	font-family : Arial,Tahoma,Verdana;
	color: #FFFFFF;
}
.STYLE3 {
	font-size: 10px;
	font-family : Arial,Tahoma,Verdana;
	color: #033d61;
}
.title{
 	font-size: 11px;
	font-family : Arial,Tahoma,Verdana;
	color: #033d61; 
}

.redtext{
   color:red;
}
.bottom {
   margin-top:20px;
   margin-left:45%;
   font-size: 12px;

}
.allpage{
   margin-top:25px;
   margin-left: 20px;
   font-size: 12px;
}
.biaoti{
    margin-top:35px;
 	font-size: 14px;
	font-family : Arial,Tahoma,Verdana;
	color: #033d61; 
}
</style>
<script type="text/javascript" src="jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" >
 
 function showbox() {
        var user='<%=username %>';   
        if(user != "admin") {
           selectquanxian();
   }
 }
 


 $(document).ready(function () {
       $("#addUser").click(function () { 
       if(checkpost()) {
                  //必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法
        var params = $("#subUserForm").serialize();
        $.ajax({
            url:'add_user.action',
            type:'post',
            data:params,
            dataType:'json',
            success:function (data) {
            	alert("Increased Sucess");
            	$("input[type=reset]").trigger("click");            	
            },
            error:function(XMLResponse){
                  alert(XMLResponse.responseText);
            }
        });
       
       }

    });
     
});

 function checkpost() { 
   if(subUserForm.username.value=="" || subUserForm.username.value== null )
       {
    	     alert("please input User Name"); 
    	     subUserForm.username.focus(); 
    	     return false; 
        } 
        
        if(subUserForm.password.value=="" || subUserForm.password.value== null )
       {
    	     alert("please input User Password "); 
    	     subUserForm.password.focus(); 
    	     return false; 
        } 
        
        
      if(subUserForm.password2.value=="" || subUserForm.password2.value== null )
       {
    	     alert("please input Confirm Password"); 
    	     subUserForm.password2.focus(); 
    	     return false; 
        } 
       return true;    
}
 
function checkPassword() {
   var password=document.getElementById("password").value;
   var password2=document.getElementById("password2").value;
   if(password!=password2) {
       alert("User Password and Confirm Password are not consistent"); 
       document.getElementById("password2").value= "";
   }

 }

function selectquanxian() {
   var userposition=document.getElementById("userposition").value;
   var department=document.getElementById("department").value;
   var boxes = document.getElementsByName("permissionsmodule");
    if(userposition=="") {
       boxes[0].checked = false;
       boxes[1].checked = false;
       boxes[2].checked = false;
       boxes[3].checked = false;
       
       boxes[4].checked = false;
       boxes[5].checked = false;
       boxes[6].checked = false;     
       boxes[7].checked = false;
       
       boxes[8].checked = false;
       boxes[9].checked = false;
       boxes[10].checked = false;
       boxes[11].checked = false;
       
       boxes[12].checked = false;
       boxes[13].checked = false;
       
       boxes[14].checked = false;
       boxes[15].checked = false;
       

       
   
    }
   if(userposition=="lead") {
       boxes[0].checked = false;
       boxes[1].checked = false; 
       boxes[2].checked = true;
       boxes[3].checked = true;
       
       boxes[4].checked = true;
       boxes[5].checked = true;
       boxes[6].checked = true;
       boxes[7].checked = false;
       
       boxes[8].checked = true;
       boxes[9].checked = true;
       boxes[10].checked = true;
       boxes[11].checked = true;
       
       boxes[12].checked = false;
       boxes[13].checked = false;
       
       boxes[14].checked = false;
       boxes[15].checked = false;
       

    }
    
    if(userposition=="lm/gl" & department=="Translation Department" ) {
            
       boxes[0].checked = false;
       boxes[1].checked = false; 
       boxes[2].checked = true;
       boxes[3].checked = true;
       
       boxes[4].checked = true;
       boxes[5].checked = true;
       boxes[6].checked = true;
       boxes[7].checked = false;
       
       boxes[8].checked = true;
       boxes[9].checked = true;
       boxes[10].checked = true;
       boxes[11].checked = true;
       
       boxes[12].checked = true;
       boxes[13].checked = true;       
       boxes[14].checked = true;
       boxes[15].checked = true;
       
    }else if(userposition=="lm/gl" & department != "Translation Department"){
          
       boxes[0].checked = false;
       boxes[1].checked = false; 
       boxes[2].checked = true;
       boxes[3].checked = true;
       
       boxes[4].checked = true;
       boxes[5].checked = true;
       boxes[6].checked = true;
       boxes[7].checked = false;
       
       boxes[8].checked = true;
       boxes[9].checked = true;
       boxes[10].checked = true;
       boxes[11].checked = true;
       
       boxes[12].checked = true;
       boxes[13].checked = true;
       
       boxes[14].checked = false;
       boxes[15].checked = true;
       
    }
    
    
    
    if(userposition=="vendorcoordinator") {
       boxes[0].checked = true;
       boxes[1].checked = true;
       boxes[2].checked = true;
       boxes[3].checked = true;
       
       boxes[4].checked = false;
       boxes[5].checked = true;
       boxes[6].checked = false;
       boxes[7].checked = false;
       
       
       boxes[8].checked = true;
       boxes[9].checked = true;
       boxes[10].checked = true;
       boxes[11].checked = true;
       
       boxes[12].checked = false;
       boxes[13].checked = false;
       
       boxes[14].checked = false;
       boxes[15].checked = false;
       
       
    }
    if(userposition=="vendormanager") {
       boxes[0].checked = true;
       boxes[1].checked = true;
       boxes[2].checked = true;
       boxes[3].checked = true;
       
       boxes[4].checked = false;
       boxes[5].checked = true;
       boxes[6].checked = false;
       boxes[7].checked = true;
       
       boxes[8].checked = true;
       boxes[9].checked = true;
       boxes[10].checked = true;
       boxes[11].checked = true;
       
       boxes[12].checked = false;
       boxes[13].checked = false;
       boxes[14].checked = false;
       boxes[15].checked = false;

       
    }
 
    if(userposition=="departmentmanager" & department=="Translation Department"  ) {
       boxes[0].checked = true;
       boxes[1].checked = true;
       boxes[2].checked = true;
       boxes[3].checked = true;
       
       boxes[4].checked = true;
       boxes[5].checked = true;
       boxes[6].checked = true;
       boxes[7].checked = true;       
       
       boxes[8].checked = true;       
       boxes[9].checked = true;
       boxes[10].checked = true;
       boxes[11].checked = true;
       
       
       boxes[12].checked = true;
       boxes[13].checked = true;
       
       boxes[14].checked = true;
       boxes[15].checked = false;
       

       
    }else if(userposition=="departmentmanager" & department != "Translation Department"){
    
       boxes[0].checked = true;
       boxes[1].checked = true;
       boxes[2].checked = true;
       boxes[3].checked = true;
       
       boxes[4].checked = true;
       boxes[5].checked = true;
       boxes[6].checked = true;
       boxes[7].checked = true;       
       
       boxes[8].checked = true;       
       boxes[9].checked = true;
       boxes[10].checked = true;
       boxes[11].checked = true;
       
       
       boxes[12].checked = true;
       boxes[13].checked = true;

       boxes[14].checked = false;
       boxes[15].checked = false;
    
    
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
                calculateNumber();
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
    }
    
      //更新菜单函数
    function calculateNumber() {    
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        if(res=='true'){
            alert("User Name has existed！ ");
            document.getElementById("username").value=""; 
        }
    }
  // 检查vendorid
    function checkuser() { 
        var username = document.getElementById("username").value; 
        sendRequest("checkusername.jsp?username="+username);     
    }
      
      
 </script>
 </head>
<body> 

   </br>
   <div class="biaoti"><center>Add User</center></div>
    <div class="allpage">   
    <form  id="subUserForm">
      <div class="tijiao">
       <table width="90%" align="center" border="1" cellspacing="0" cellpadding="0" bordercolor=#000000 style="border-collapse:collapse" >
       <tr>
       <td align="right" width="40%" height="30px" bgcolor='#e5f1f4'><span class='title'>User Name:&nbsp;</span></td>	
       <td>&nbsp;<input type="text" id="username"  name="username" onBlur="checkuser();"   style="width:180px;height:20px;font-size: 10px;"></span><span class='redtext'>*</span></td>	
     </tr>
     <tr>
        <td align="right" width="40%" height="30px" bgcolor='#e5f1f4'><span class='title'>User Password:&nbsp;</td>	
		<td>&nbsp;<input type="password" id="password"  name="password" style="width:180px;height:20px;font-size: 10px;"></span><span class='redtext'>*</span>
	  </td>	
     </tr>  
     <tr>
         <td align="right" width="40%" height="30px" bgcolor='#e5f1f4'><span class='title'>Confirm Password:&nbsp;</td>	
		 <td>&nbsp;<input type="password" id="password2"  name="password2" onBlur="checkPassword();"  style="width:180px;height:20px;font-size: 10px;" ></span><span class='redtext'>*</span>
	  </td>	
     </tr>  
     
       <tr>
            <td align="right" width="40%" height="30px" bgcolor='#e5f1f4'><span class='title'>Department:&nbsp;</td>	
		    <td >&nbsp;<select id ="department" name="department" style="width:180px;height:20px;font-size: 10px;">
						<option value="Translation Department" >Translation Department</option>
						<option value="Supply Chain Department">Supply Chain Department</option>
						</select></span><span class='redtext'>*</span></td>	
     </tr>  
     
         <tr>
            <td align="right" width="40%" height="30px" bgcolor='#e5f1f4'><span class='title'>Position Title:&nbsp;</td>	
		    <td >&nbsp;<select id ="userposition" name="userposition"  onchange="selectquanxian()" style="width:180px;height:20px;font-size: 10px;">
					    <option value="" >----Choose----</option>
						<option value="lead" >Lead</option>
						<option value="vendorcoordinator">Vendor Coordinator</option>
						<option value="vendormanager">Vendor Manager</option>
						<option value="lm/gl">LM/GL</option>
						<option value="departmentmanager">Department Manager</option>
						</select></span><span class='redtext'>*</span></td>	
     </tr>  
     
       <tr>
         <td align="right" width="40%" height="30px" bgcolor='#e5f1f4'><span class='title'>Manager:&nbsp;</td>	
		<td>&nbsp;<input id="lmorgl" name="lmorgl"  value='<%=session.getAttribute("username") %>'   style="font-size:12px;height:20px;width:180px;font-size: 10px;"  /><td></tr>
		
		
      <tr>
            <td align="right" width="40%" height="90px" bgcolor='#e5f1f4'><span class='title'>Permissions Module:&nbsp;</span></td>	 
     
      <td>&nbsp;
     
<table  border="0" cellpadding="0" cellspacing="0">
<tr>
<td>
<table width="165"  border="0" cellpadding="0" cellspacing="0">
 
<tr>
  <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
   <td height="23" background="images/main_47.gif" id="imgmenu2" class="menu_title" onMouseOver="this.className='menu_title2';"  onMouseOut="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
              <td width="18%">&nbsp;</td>
              <td width="82%" class="STYLE1">Vendor Management</td>
        </tr>
          </table></td>
        </tr>
        <tr>
          <td background="images/main_51.gif" id="submenu2">
		 <div class="sec_menu" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              
                
                <tr>
                  <td width="84%" height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr><td height="20" ><input id="permissionsmodule15" name="permissionsmodule" type="checkbox"   onclick="showbox()"   value="Add New Vendor" /><span class="STYLE3">Add New Vendor</span></td></tr>
                  </table></td>
                </tr>

                
                
                 <tr>
                <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                <tr><td height="20" ><input id="permissionsmodule16" name="permissionsmodule" type="checkbox"   onclick="showbox()"   value="Vendor Detail List" /><span class="STYLE3">Vendor Detail List</span></td></tr>
                      
                      
                     </tr>
                  </table></td>
                </tr> 
                

                 <tr>
                 <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                 <tr><td height="20" ><input id="permissionsmodule17" name="permissionsmodule" type="checkbox"   onclick="showbox()"   value="Vendor Detail Selection" /><span class="STYLE3">Vendor Detail Selection</span></td></tr>
                     </tr>
                  </table></td>
                </tr>
            
            
                    <tr>
                <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                <tr><td height="20" ><input id="permissionsmodule18" name="permissionsmodule" type="checkbox"   onclick="showbox()"   value="Vendor Capacity Search" /><span class="STYLE3">Vendor Capacity Search</span></td></tr>
                      </tr>
                  </table></td>
                </tr>
            
    
    
              </table></td>
            </tr>
            <tr>
              <td height="5"><img src="images/main_52.gif" width="151" height="5" /></td>
            </tr>
          </table></div></td>
        </tr>
      </table></td>
    </tr>

</table>



</td>
<td>

<table width="165"  border="0" cellpadding="0" cellspacing="0"> 
            
      <tr>
  <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
   <td height="23" background="images/main_47.gif" id="imgmenu6" class="menu_title" onMouseOver="this.className='menu_title5';"  onMouseOut="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
              <td width="18%">&nbsp;</td>
              <td width="82%" class="STYLE1">Project Management</td>
        </tr>
          </table></td>
        </tr>
        <tr>
          <td background="images/main_51.gif" id="submenu6">
		 <div class="sec_menu" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                    
                <tr>
                  <td width="84%" height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <tr><td height="20" ><input id="permissionsmodule1" name="permissionsmodule" type="checkbox"   onclick="showbox()"  value="Add New Project" /><span class="STYLE3">Add New Project</span></td></tr>                      
                      </tr>
                  </table></td>
                </tr>
      
                 <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                       <tr><td height="20" ><input id="permissionsmodule2" name="permissionsmodule" type="checkbox"   onclick="showbox()"   value="Project Detail Selection" /><span class="STYLE3">Project Detail Selection</span></td></tr>                      
                      
                      </tr>
                  </table></td>
                </tr>
                 <tr>
    
                <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                    <tr><td height="20" ><input id="permissionsmodule3" name="permissionsmodule" type="checkbox"   onclick="showbox()"   value="OutSource  Management" /><span class="STYLE3">OutSource  Management</span></td></tr>                                            
                      </tr>
                  </table></td>
                </tr>
                 <tr>
                 
                     <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                    <tr><td height="20" ><input id="permissionsmodule4" name="permissionsmodule" type="checkbox"   onclick="showbox()"   value="Outsource Detail" /><span class="STYLE3">OutsourceDetailSelection</span></td></tr>                                            
                      </tr>
                  </table></td>
                </tr>
                 <tr>
                 
                 
         
                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="5"><img src="images/main_52.gif" width="151" height="5" /></td>
            </tr>
          </table></div></td>
        </tr>
      </table></td>
    </tr>
    
</table>
</td>


<td>
 <table width="165"  border="0" cellpadding="0" cellspacing="0"> 
        <tr>
  <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
   <td height="23" background="images/main_47.gif" id="imgmenu5" class="menu_title" onMouseOver="this.className='menu_title5';"  onMouseOut="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
              <td width="18%">&nbsp;</td>
              <td width="82%" class="STYLE1">QA Management</td>
        </tr>
          </table></td>
        </tr>
        <tr>
          <td background="images/main_51.gif" id="submenu5">
		 <div class="sec_menu" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	
		
		
            <tr>
              <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="84%" height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                       <tr><td height="20" ><input id="permissionsmodule5" name="permissionsmodule" type="checkbox"   onclick="showbox()"   value="Add New QA" /><span class="STYLE3">Add New QA</span></td></tr>                                            
                      
                             </tr>
                  </table></td>
                </tr>
                
              
                <tr>
                  <td height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                   <tr><td height="20" ><input id="permissionsmodule6" name="permissionsmodule" type="checkbox"   onclick="showbox()"   value="My QA Report" /><span class="STYLE3">My QA Report</span></td></tr>                                            
                
                      </tr>
                  </table></td>
                </tr>
                 <tr>
    
              <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                <tr><td height="20" ><input id="permissionsmodule7" name="permissionsmodule" type="checkbox"   onclick="showbox()"   value="QA Search" /><span class="STYLE3">QA Search</span></td></tr>                                            
                      
                      
                      </tr>
                  </table></td>
                </tr>
                 <tr>
             
                   
                      <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                       <tr><td height="20" ><input id="permissionsmodule8" name="permissionsmodule" type="checkbox"  onclick="showbox()"   value="QA Summary" /><span class="STYLE3">QA Summary</span></td></tr>                                            
                      
                      </tr>
                  </table></td>
                </tr>
                 <tr>
            
               
                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="5"><img src="images/main_52.gif" width="151" height="5" /></td>
            </tr>
          </table></div></td>
        </tr>
      </table></td>
    </tr>
    
    </table>

</td>
<td>

 <table width="165"  border="0" cellpadding="0" cellspacing="0"> 
          <tr>
  <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
   <td height="23" background="images/main_47.gif" id="imgmenu7" class="menu_title" onMouseOver="this.className='menu_title7';"  onMouseOut="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
              <td width="18%">&nbsp;</td>
              <td width="82%" class="STYLE1">User Management</td>
        </tr>
          </table></td>
        </tr>
        <tr>
          <td background="images/main_51.gif" id="submenu7">
		 <div class="sec_menu" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                  
                <tr>
                  <td width="84%" height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                      <tr><td height="20" ><input id="permissionsmodule9" name="permissionsmodule" type="checkbox"   onclick="showbox()"   value="Add New User" /><span class="STYLE3">Add New User</span></td></tr>                                            
                      </tr>
                  </table></td>
                </tr>
                  
              
                 <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                   <tr><td height="20" ><input id="permissionsmodule10" name="permissionsmodule" type="checkbox"  onclick="showbox()"    value="User Detail List" /><span class="STYLE3">User Detail List</span></td></tr>                                            
                      
                      </tr>
                  </table></td>
                </tr>
                 <tr>
            
                 <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                   <tr><td height="20" ><span class="STYLE3"></span></td></tr>                                            
                      
                      </tr>
                  </table></td>
                </tr>
                 <tr>
            
            
            
             <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                   <tr><td height="20" ><span class="STYLE3"></span></td></tr>                                            
                      
                      </tr>
                  </table></td>
                </tr>
                 <tr>
            
            
               
                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="5"><img src="images/main_52.gif" width="151" height="5" /></td>
            </tr>
          </table></div></td>
        </tr>
      </table></td>
    </tr>

</table> 
     </td>
     
     
     <td>
 <table width="165"  border="0" cellpadding="0" cellspacing="0"> 
        <tr>
  <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
   <td height="23" background="images/main_47.gif" id="imgmenu5" class="menu_title" onMouseOver="this.className='menu_title5';"  onMouseOut="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
              <td width="18%">&nbsp;</td>
              <td width="82%" class="STYLE1">Information Management</td>
        </tr>
          </table></td>
        </tr>
        <tr>
          <td background="images/main_51.gif" id="submenu5">
		 <div class="sec_menu" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	
		
		
            <tr>
              <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="84%" height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                       <tr><td height="20" ><input id="permissionsmodule14" name="permissionsmodule" type="checkbox" onclick="showbox()"    value="Add Cost Code" /><span class="STYLE3">Add Cost Code</span></td></tr>                                            
                      
                             </tr>
                  </table></td>
                </tr>
                
                
               
                
                  <tr>
                  <td width="84%" height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                       <tr><td height="20" ><input id="permissionsmodule15" name="permissionsmodule" type="checkbox" onclick="showbox()"    value="Add Translator" /><span class="STYLE3">Add Translator</span></td></tr>                                            
                      
                             </tr>
                  </table></td>
                </tr>
                
                   <tr>
                  <td width="84%" height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                       <tr><td height="20"></td></tr>                                            
                      
                             </tr>
                  </table></td>
                </tr>
                
                
                  <tr>
                  <td width="84%" height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                       <tr><td height="20" ></td></tr>                                            
                      
                             </tr>
                  </table></td>
                </tr>
                
               
           
                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="5"><img src="images/main_52.gif" width="151" height="5" /></td>
            </tr>
          </table></div></td>
        </tr>
      </table></td>
    </tr>
    
    </table>

</td>



       </tr> 
       
          </table>
          
          </td>

       </tr> 
       
          </table>     
          
          
          
         </div>  
       

    </div>
</div>
  
</div>


  <div class="bottom">
          <input id="addUser" type="button" value="Add" class="buttonstyle" style="width:60px;height:25px;font-size:12px;" />&nbsp;<input type="reset" value="Reset" class="buttonstyle" style="width:60px;height:25px;font-size:12px;" /></div> 
	    </form>

</body>
</html>



