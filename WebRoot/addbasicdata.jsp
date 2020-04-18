<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat;" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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

.allpage{
   margin-top:5px;
   margin-left: 20px;

}


.bottom {
   margin-top:5px;
   margin-left:50%;
   font-size: 12px;

}

.title{
   font-size: 12px;
}
.redtext{
   color:red;
}

</style>
  </head>
  
  <body>
  
   <div align="center" ><h4><font color="black">Add User</center></font></h4></div>

  
     <div class="allpage">   
     
    <form method="post" action="" id="myform"  name="myform" onsubmit="return checkpost();" >
    <fieldset style="height:260px; ">
    <legend class="legend">User Infomation</legend>
      <div class="tijiao">   
       <table width="80%" border="1" cellspacing="0" cellpadding="0" >
           <tr>
           
       <td align="right" width="40%"><span class='title'>User Name:</span></td>	
       <td><input type="text" id="username"  name="username" style="width:180px;" >
		</span><span class='redtext'>*</span>
	  </td>	
     </tr>
     
     <tr>
        <td align="right" width="40%"><span class='title'>User Password:</td>	
                  
		 <td ><input type="password" id="password"  name="password" style="width:180px;" >
		</span><span class='redtext'>*</span>
	  </td>	
     </tr>  
     
     
     <tr>
         <td align="right" width="40%"><span class='title'>Confirm Password:</td>	
		 <td ><input type="password" id="password2"  name="password2" style="width:180px;" ></span><span class='redtext'>*</span>
	  </td>	
     </tr>  
         <tr>
         
                <td align="right" width="40%"><span class='title'>User Position:</td>	
         
		 <td ><select id ="userposition" name="userposition" style="width:180px;font-size: 12px;">
						<option value="Lead" style="font-size: 10px;">Lead</option>
						<option value="vendorcoordinator">Vendor Coordinator</option>
						<option value="departmentmanager">Department Manager</option>
					    <option value="linemanager">Line Manager</option>
						<option value="departmentmanager">Department Manager</option>
						</select></span><span class='redtext'>*</span></td>	
     </tr>  
     
         <tr>
         <td align="right" width="40%" height="40px"><span class='title'>User Lead:</td>
          <td></td>
          </tr>  

        <tr>
            <td align="right" width="40%" rowspan="2" ><span class='title'>Permissions Module:</span></td>	
                 <td>
		
	
	</td>
            
            
            
            
        <!--      <td height="40px"><label><input id="vendor_field" name="vendor_field" type="checkbox" value="IT" />Vendor Manager</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="marketing"/>Vendor Add</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="medical" />Vendor List</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="Legal" />Vendor Select</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="Legal" />Vendor Capacity</label>
                 
                 <label><input id="vendor_field" name="vendor_field" type="checkbox" value="IT" />Project Manager</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="marketing"/>Project Add</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="medical" />Project List</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="Legal" />Manager Project</label>
                 </br>
                 <label><input id="vendor_field" name="vendor_field" type="checkbox" value="IT" />QA Manager</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="marketing"/>QA Add</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="medical" />QA List</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="Legal" />QA Select</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="Legal" />Monthly Qa</label>
                                  </br>
                 
                 <label><input id="vendor_field" name="vendor_field" type="checkbox" value="IT" />Data Maintenance</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="marketing"/>Vendor Add</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="medical" />Vendor List</label>
                 &nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="Legal" />Vendor Select</label>
             </td> -->
             
              	  
     </tr> 

      
       </table>
      
         </div>  
         <div class="bottom"><input type="submit" value="Add" style="width:70px;height:25px;" />
         <input type="reset" value="Reset" style="width:70px;height:25px;" /></div> 
</fieldset>
    </form>
    </div>

 
  
</div>
 
   


  </body>
</html>
