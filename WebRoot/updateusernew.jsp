<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	String username=request.getAttribute("username").toString();
    String password=request.getAttribute("password").toString();
    String lmorgl=request.getAttribute("lmorgl").toString();
    String department=request.getAttribute("department").toString();
    String userposition=request.getAttribute("userposition").toString();
    String permissionsmodule=request.getAttribute("permissionsmodule").toString();
    String id=request.getAttribute("id").toString();
    
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

	<style type="text/css">
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	.STYLE1 {
		font-size: 11px;
		font-family : Arial,Tahoma,Verdana;
		color: #FFFFFF;
	}
	.STYLE3 {
		font-size: 10px;
		font-family : Arial,Tahoma,Verdana;
		color: #033d61;
	}
	.title{
	 	font-size: 10px;
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
	   margin-top:5px;
	   margin-left: 20px;
	   font-size: 12px;
	}
	.biaoti{
	 	font-size: 12px;
		font-family : Arial,Tahoma,Verdana;
		color: #033d61; 
	}
	</style>


<script  type="text/javascript">


function showbox() {
        var user='<%=username %>';   
        if(user != "admin") {
           selectquanxian();
   }
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
</script>


</head>
<body> 

   </br>
      <div class="biaoti"><center>Update User</center></div>
  
    <div class="allpage">   
    <form method="post" action="updateuser.action" id="myform"  name="myform"  >
  
      <div class="tijiao">
       <table width="90%"  border="1" cellspacing="0" cellpadding="0" bordercolor=#000000 style="border-collapse:collapse" >
       
       	<tr style="display: none" >
		  <td align="right" width="20%" height="30px"><span class='title'>Id</td>
		<td> <input id="id" name="id"  type="text" value="<%=id %>"  /></td>
		</tr>					
		
       <tr>
       <td align="right" width="20%" height="30px"><span class='title'>User Name:&nbsp;</span></td>	
       <td>&nbsp;<input type="text" id="username"  name="username"  value="<%=username %>"  style="width:180px;font-size: 10px;"></span><span class='redtext'>*</span></td>	
     </tr>
     <tr>
        <td align="right" width="20%" height="30px"><span class='title'>User Password:&nbsp;</td>	
		<td>&nbsp;<input type="password" id="password"  name="password" value="<%=password %>"  style="width:180px;font-size: 10px;"></span><span class='redtext'>*</span>
	  </td>	
     </tr>  
     <tr>
         <td align="right" width="20%" height="30px" ><span class='title'>Confirm Password:&nbsp;</td>	
		 <td>&nbsp;<input type="password" id="password2"  name="password2" onBlur="checkPassword();" style="width:180px;font-size: 10px;" ></span><span class='redtext'>*</span>
	  </td>	
     </tr>  
 
        
      <tr>
         <td align="right" width="20%" height="30px"><span class='title'>LmorGl:&nbsp;</td>	
		<td>&nbsp;<input id="lmorgl" name="lmorgl" value="<%=lmorgl %>"  style="font-size:10px;width:180px;"  /><td></tr>
      
        <tr>
            <td align="right" width="20%" height="30px"><span class='title'>Department:&nbsp;</td>	
		  	<td>&nbsp;<select id ="department" name="department"   style="width:180px;font-size: 10px;">
		<option value="" >----Choose----</option>  	
		<option value="Translation Department"    <% if(department.equals("Translation Department")) {  out.print("selected");}%> >Translation Department</option>
		<option value="Supply Chain Department"  <% if(department.equals("Supply Chain Department")) { out.print("selected");}%> >Supply Chain Department</option>
		<span class='redtext'>*</span>

     </tr>  
      
      
      
      
              <tr>
            <td align="right" width="20%" height="30px"><span class='title'>Position Title:&nbsp;</td>	
		  	<td>&nbsp;<select id ="userposition" name="userposition"  onchange="selectquanxian()" style="width:180px;font-size: 10px;">
		<option value="lead"    <% if(userposition.equals("lead")) {  out.print("selected");}%> >Lead</option>
		<option value="vendorcoordinator"  <% if(userposition.equals("vendorcoordinator")) { out.print("selected");}%>  >Vendor Coordinator</option>
		<option value="lm/gl"  <% if(userposition.equals("lm/gl")) { out.print("selected");}%>  >LM/GL</option>
        <option value="departmentmanager"  <% if(userposition.equals("departmentmanager")) { out.print("selected");}%>  >Departmentmanager</option>
		
		<span class='redtext'>*</span>

     </tr>  
     
     
      <tr>
            <td align="right" width="20%" height="90px" ><span class='title'>Permissions Module:&nbsp;</span></td>	 
     
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
                  <tr><td height="20" ><input id="permissionsmodule15" name="permissionsmodule" type="checkbox"  onclick="showbox()"   value="Add New Vendor"  <% if(permissionsmodule.indexOf("Add New Vendor") != -1) { 
		out.print("checked='checked'");}%> />  <span class="STYLE3">Add New Vendor</span></td></tr>
                  </table></td>
                </tr>

                
                
                 <tr>
                <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                <tr><td height="20" ><input id="permissionsmodule16" name="permissionsmodule" type="checkbox"  onclick="showbox()"    value="Vendor Detail List"  <% if(permissionsmodule.indexOf("Vendor Detail List") != -1) { 
		out.print("checked='checked'");}%>><span class="STYLE3">Vendor Detail List</span></td></tr>
                      
                      
                     </tr>
                  </table></td>
                </tr> 
                

                 <tr>
                 <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                 <tr><td height="20" ><input id="permissionsmodule17" name="permissionsmodule" type="checkbox"  onclick="showbox()"   value="Vendor Detail Selection"  <% if(permissionsmodule.indexOf("Vendor Detail Selection") != -1) { 
		out.print("checked='checked'");}%> /><span class="STYLE3">Vendor Detail Selection</span></td></tr>
                     </tr>
                  </table></td>
                </tr>
            
            
                    <tr>
                <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                <tr><td height="20" ><input id="permissionsmodule18" name="permissionsmodule" type="checkbox"  onclick="showbox()" value="Vendor Capacity Search"  <% if(permissionsmodule.indexOf("Vendor Capacity Search") != -1) { 
		out.print("checked='checked'");}%>   /><span class="STYLE3">Vendor Capacity Search</span></td></tr>
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
                        <tr><td height="20" ><input id="permissionsmodule1" name="permissionsmodule" type="checkbox"  onclick="showbox()" value="Add New Project"  <% if(permissionsmodule.indexOf("Add New Project") != -1) { 
		out.print("checked='checked'");}%> /><span class="STYLE3">Add New Project</span></td></tr>                      
                      </tr>
                  </table></td>
                </tr>
      
                 <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                       <tr><td height="20" ><input id="permissionsmodule2" name="permissionsmodule" type="checkbox" onclick="showbox()"  value="Project Detail Selection"  <% if(permissionsmodule.indexOf("Project Detail Selection") != -1) { 
		out.print("checked='checked'");}%> /><span class="STYLE3">Project Detail Selection</span></td></tr>                      
                      
                      </tr>
                  </table></td>
                </tr>
                 <tr>
    
                <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                    <tr><td height="20" ><input id="permissionsmodule3" name="permissionsmodule" type="checkbox"  onclick="showbox()" value="OutSource  Management"  <% if(permissionsmodule.indexOf("OutSource  Management") != -1) { 
		out.print("checked='checked'");}%> /><span class="STYLE3">OutSource  Management</span></td></tr>                                            
                      </tr>
                  </table></td>
                </tr>
                 <tr>
                 
                 
                           <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                    <tr><td height="20" ><input id="permissionsmodule3" name="permissionsmodule" type="checkbox"  onclick="showbox()"  value="Outsource Detail"  <% if(permissionsmodule.indexOf("Outsource Detail") != -1) { 
		out.print("checked='checked'");}%> /><span class="STYLE3">OutsourceDetailSelection</span></td></tr>                                            
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
<!-- </tr>
<tr> -->

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
                       <tr><td height="20" ><input id="permissionsmodule5" name="permissionsmodule" type="checkbox" onclick="showbox()"    value="Add New QA"  <% if(permissionsmodule.indexOf("Add New QA") != -1) { 
		out.print("checked='checked'");}%> /><span class="STYLE3">Add New QA</span></td></tr>                                            
                      
                             </tr>
                  </table></td>
                </tr>
                
              
                <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                   <tr><td height="20" ><input id="permissionsmodule6" name="permissionsmodule" type="checkbox"  onclick="showbox()"   value="My QA Report"  <% if(permissionsmodule.indexOf("My QA Report") != -1) { 
		out.print("checked='checked'");}%> /><span class="STYLE3">My QA Report</span></td></tr>                                            
                
                      </tr>
                  </table></td>
                </tr>
                 <tr>
    
              <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                <tr><td height="20" ><input id="permissionsmodule7" name="permissionsmodule" type="checkbox" onclick="showbox()"    value="QA Search"  <% if(permissionsmodule.indexOf("QA Search") != -1) { 
		out.print("checked='checked'");}%> /><span class="STYLE3">QA Search</span></td></tr>                                            
                      
                      
                      </tr>
                  </table></td>
                </tr>
                 <tr>
             
                   
                      <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                       <tr><td height="20" ><input id="permissionsmodule8" name="permissionsmodule" type="checkbox"  onclick="showbox()"   value="Qa Summary"  <% if(permissionsmodule.indexOf("Qa Summary") != -1) { 
		out.print("checked='checked'");}%> /><span class="STYLE3">Qa Summary</span></td></tr>                                            
                      
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
                      <tr><td height="20" ><input id="permissionsmodule9" name="permissionsmodule" type="checkbox"  onclick="showbox()"   value="Add New User"  <% if(permissionsmodule.indexOf("Add New User") != -1) { 
		out.print("checked='checked'");}%> /><span class="STYLE3">Add New User</span></td></tr>                                            
                      </tr>
                  </table></td>
                </tr>
                  
              
                 <tr>
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                   <tr><td height="20" ><input id="permissionsmodule10" name="permissionsmodule" type="checkbox" onclick="showbox()"    value="User Detail List"  <% if(permissionsmodule.indexOf("User Detail List") != -1) { 
		out.print("checked='checked'");}%> /><span class="STYLE3">User Detail List</span></td></tr>                                            
                      
                      </tr>
                  </table></td>
                </tr>
                 <tr>
            
                 <tr>
                  <td height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                   <tr><td height="20" ><span class="STYLE3"></span></td></tr>                                            
                      
                      </tr>
                  </table></td>
                </tr>
                 <tr>
            
            
            
             <tr>
                  <td height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
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
                       <tr><td height="20" ><input id="permissionsmodule14" name="permissionsmodule" type="checkbox"    onclick="showbox()"    value="Add Cost Code"   <% if(permissionsmodule.indexOf("Add Cost Code") != -1) { 
		out.print("checked='checked'");}%> /><span class="STYLE3">Add Cost Code</span></td></tr>                                            
                      
                             </tr>
                  </table></td>
                </tr>
                
                
                  <tr>
                  <td width="84%" height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                       <tr><td height="20" ><input id="permissionsmodule15" name="permissionsmodule" type="checkbox"    onclick="showbox()"    value="Add Translator"   <% if(permissionsmodule.indexOf("Add Translator") != -1) { 
		out.print("checked='checked'");}%> /><span class="STYLE3">Add Translator</span></td></tr>                                             
                      
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


  <div class="bottom"><input type="submit" value="Update" style="width:55px;height:25px;" /></div> 
	    </form>

</body>
</html>



