<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

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
	
   <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
   <script type="text/javascript" src="js3/calendar.js"></script>
   <link href="css/commoncss.css" rel="stylesheet" type="text/css" media="screen" />
   
    <script type="text/javascript" src="js/jquery.js"></script>
   <script type="text/javascript" src="js/vendorname.js"></script>
   <script type="text/javascript" src="js/clientname.js"></script>
   <script type="text/javascript" src="js/lead.js"></script>
   <script type="text/javascript" src="js/costcode.js"></script>
   
   
<style>

body{
	margin:0;
	padding:0;
	font:70% Arial, Helvetica, sans-serif; 
	background-color:rgba(204, 204, 204, 0.168627450980392);
	
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
	background-color:rgba(204, 204, 204, 0.168627450980392);
	
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
   margin-left:40%;
   font-size: 12px;
}
.redtext {
	font-size: 11px;
	font-family:Arial,Tahoma,Verdana;
	color: #033d61;
	float:right;
}
</style>

<script language="JavaScript"> 
			
 function checkpost() {
                document.getElementById("table1").style.display="none";
                var vendorname = document.getElementById("vendorname").value;
                var costcode= document.getElementById("costcode").value;
                var qadate = document.getElementById("qadate").value;
                var yxbz = document.getElementById("yxbz").value;
                var username = document.getElementById("username").value;
                document.getElementById("ContentFrame1").src="listqabytiaojianaction.action?sdlcostcode="+costcode+"&vendorname="
                +vendorname+"&qadate="+qadate+"&clientname="+username+"&remark1=1&yxbz="+yxbz;
                return false;
		}
</script>
  </head>
  
  <body>
  
     <div class="allpage">   
    <form method="post" action="" id="myform"  name="myform" onsubmit="return checkpost();" >
    <fieldset style="height:100px; ">
    <legend class="legend">Query Conditions</legend>
      <div class="tijiao">   
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
           <td style="width:10%;height:25px;"><span class='redtext'>Vendor Name</span></td>
           <td><input type="text" id="vendorname"  name="vendorname" autocomplete="off"  class="inputstyle" style="width:100%;height:25px;" ><div id ="vendornameauto"></div></td>
           <td style="width:10%;height:25px;"><span class='redtext'>Cost Code</span></td>
           <td><input type="text" id="costcode"  name="costcode" autocomplete="off"  class="inputstyle" style="width:100%;height:25px;" ><div id ="costcodeauto"></div></td>
           <td style="width:10%;height:25px;"><span class='redtext'>Start Date</span></td>
           <td ><input type="text" id="qadate"  name="qadate" onclick="new Calendar_new(null, null, 1).show(this);" readonly="readonly" class="inputstyle"  style="width:100%;height:25px;" ></td>
           <td style="width:10%;height:25px;"><span class='redtext'>End Date</span></td>
           <td ><input type="text" id="yxbz"  name="yxbz" onclick="new Calendar_new(null, null, 1).show(this);" readonly="readonly" class="inputstyle"  style="width:100%;height:25px;" ></td>
           <td style="display:none"><input type="text" id= "username" name="username" value='<%=session.getAttribute("username") %>' ></td>              
           </tr> 
       </table>
      
         </div>  
           <div class="bottom">              
    	<input type="submit" value="Query"  class="buttonstyle" style="width:60px;height:25px;font-size: 10px;" />
    	<input type="reset" value="Reset"  class="buttonstyle" style="width:60px;height:25px;font-size: 10px;" />
    	  </div> 
</fieldset>
    </form>
    </div>

 
  
</div>
 

    <div id="container">
	    <fieldset style="height:600px; ">
    <legend class="legend">Detail List</legend>
    <div id="table1">
		<table cellspacing="0" cellpadding="0">
			<table cellspacing="0" cellpadding="0" >
			    <tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
			    <th  colspan="2" >operation</th>
		        <th>Number</th>
			
				<th>Vendor Name</th>
			    <th>Lead</th>
				<th>Date</th>
				<th>Client Name</th>
     			<th> Cost Code</th>
			
				<th>Translation Type</th>
				<th>Translator Name</th>
				
				
			    <th>Source Language</th>
				
				
			</tr>

		</table>
			</div>	
		<td width="100%" align="center" valign="top"><iframe id="ContentFrame1" name="I2" height="95%" width="100%" border="0" frameborder="0" src=""> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    </fieldset>

	</div>




  </body>
</html>
