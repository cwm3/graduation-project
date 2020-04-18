<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username=session.getAttribute("username").toString();
String userposition=session.getAttribute("userposition").toString();
System.out.println(username+"username"+userposition+userposition);
String ifzd="";
if(!username.equals("admin")&!userposition.equals("lm/gl")&!userposition.equals("departmentmanager")){
   ifzd="Y";
}
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Select Project</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	

 
     <script type="text/javascript" src="js/jquery.js"></script>
     <script type="text/javascript" src="js/vendorname.js"></script>
     <script type="text/javascript" src="js/clientname.js"></script>
     <script type="text/javascript" src="js/lead.js"></script>
     <script type="text/javascript" src="js/costcode.js"></script>
    
	
	
    <link href="tablecloth/tablecloth2.css" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="js3/calendar.js"></script>
    
<!--    <link rel="stylesheet" type="text/css" href="EasyUI/easyui.css" />
	    <script type="text/javascript" src="EasyUI/jquery.min.js"></script>
	    <script type="text/javascript" src="EasyUI/jquery.easyui.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="EasyUI/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="EasyUI/themes/icon.css"> -->
	
    <link href="css/commoncss.css" rel="stylesheet" type="text/css" media="screen" />
    
 
   
<style>

body{
	margin:0;
	padding:0;
	background-color:rgba(204, 204, 204, 0.168627450980392);
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

#container{
	margin:0 auto;
	width:100%;
	margin-left:20px;
	padding-bottom:20px;
}

.allpage{
   margin-top:5px;
   margin-left: 20px;
}


.bottom {
   margin-top:5px;
   margin-left:40%;
   font-size: 12px;
}

</style>

<script language="JavaScript"> 
			
    function checkpost() {

                document.getElementById("table1").style.display="none";
                var costcode = document.getElementById("costcode").value;
                var dropdate= document.getElementById("dropdate").value;
                var deadline = document.getElementById("deadline").value;
                var lead = document.getElementById("lead").value;
                var client = document.getElementById("clientname").value;
                var userposition = document.getElementById("userposition").value;
                
                var status =  document.getElementById("status").value
                
                var yxbz = document.getElementById("projectvalue").value;
                var potype = document.getElementById("potype").value;
                var remark2= document.getElementById("remark2").value;
                
                if(lead == "" || lead== null) {
                   alert("Please login again ! ");
                   top.location.href="userlogin.html";
                   return false;
                }              
                document.getElementById("ContentFrame1").src="listprojectbypageaction.action?costcode="+costcode+"&dropdate="+dropdate+"&deadline="
                +deadline+"&lead="+lead+"&client="+client+"&userposition="+userposition+"&remark2="+remark2
                +"&remark1=1"+"&status="+status+"&yxbz="+yxbz+"&potype="+potype;
                return false;
		}
		
	 function exportcapacity() {
	 
                document.getElementById("table1").style.display="none";
                var costcode = document.getElementById("costcode").value;
                var dropdate= document.getElementById("dropdate").value;
                var deadline = document.getElementById("deadline").value;
                var lead = document.getElementById("lead").value;
                var client = document.getElementById("clientname").value;
                var userposition = document.getElementById("userposition").value;

                var status = $("#status").combobox("getText");     
                var yxbz = document.getElementById("projectvalue").value;
                var potype = document.getElementById("potype").value;
                var remark2= document.getElementById("remark2").value;

	              if(lead == "" || lead== null) {
	                   alert("Please login again ! ");
	                   return false;
	              }              
	                window.document.location.href="loadprojectexcel.jsp?costcode="+costcode+"&dropdate="+dropdate+"&deadline="+deadline
	                +"&lead="+lead+"&client="+client+"&remark2="+remark2+"&userposition="+userposition
	                +"&status="+status+"&yxbz="+yxbz+"&potype="+potype;
	                return false;
		}
			
	
      
	      function init() {
	      
			  var ifzd = "<%=ifzd %>";
			  if(ifzd=="Y") {
			       document.getElementById("remark2").disabled=true;
			       document.getElementById("remark2").style.background="#E0E0E0";
			  }
			  
		  }
	     
		
</script>
</head>
  
  <body onload="init()">
  
     <div class="allpage">   
    <form method="post" action="" id="myform"  name="myform" onsubmit="return checkpost();" >
    <fieldset style="height:140px; ">
    <legend class="legend">Query Conditions</legend>
      <div class="tijiao">   
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
           
              <td><span class='redtext'>Lead</span></td>
           <td><input type="text" id="remark2"  name="remark2"  autocomplete="off"  class="inputstyle" style="width:180px;height:25px;" ></td>        
           
           <td><span class='redtext'>Cost Code</span></td>
           <td><input type="text" id="costcode"  name="costcode" autocomplete="off"  class="inputstyle"  style="width:180px;height:25px;" ><div id ="costcodeauto"></div></td>
             
           
           </tr>
            
           <tr>
          <td><span class='redtext'>Client Name</span></td>
           <td><input type="text" id="clientname"  name="clientname" autocomplete="off"  class="inputstyle" style="width:180px;height:25px;" ><div id ="clientnameauto"></div></td>
           
           <td><span class='redtext'>Deadline</span></td>
           <td><input type="text" id="deadline"  name="deadline"  class="inputstyle"  onclick="new Calendar_new(null, null, 1).show(this);" readonly="readonly"  style="width:180px;height:25px;" ></td>
             
          
           
            </tr> 
       </table>
      
       </div>  
       <div class="bottom">              
    	<input type="submit" value="Query"  class="buttonstyle"  style="width:60px;height:25px;font-size: 11px;" />
    	<input type="reset" value="Reset" class="buttonstyle"  style="width:60px;height:25px;font-size: 11px;" />
        <input type="button" value="Export" class="buttonstyle" onclick="exportcapacity();" style="width:60px;height:25px;font-size: 11px;" />
    </div> 
    
    </fieldset>
    </form>
    </div>
 
</div>
 
<div id="container">

	<fieldset style="height:600px; ">
    <legend class="legend">Detail List</legend>
    <div id="table1">
		<table cellspacing="0" cellpadding="0" >
		
	    <tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;align:left">
				<th align="left"  colspan="2" >Operation</th>
			    <th align="left">Client</th>
				<th align="left">CostCode</th>
				
				<th align="left">Deadline</th>
				<th align="left">Hourlywork</th>
				<th align="left">New Words </th>
				
				<th align="left">Language Pair</th>
			    		
				
			    <th align="left">Lead</th>
				<th align="left">Comment</th>
			</tr>
			
		</table>
		
	</div>	
	<div id="bottompage">	
		  <iframe id="ContentFrame1" name="I2" height="95%" width="99%" border="0" frameborder="0" src=""> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe>
    </div>	   
    </fieldset>

	</div>




  </body>
</html>
