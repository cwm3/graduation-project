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
    
    <title>selectoutsourceselection</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
   <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
   <link href="css/commoncss.css" rel="stylesheet" type="text/css" media="screen" />
   
   <script type="text/javascript" src="js3/calendar.js"></script>
   
   
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
                var comments = document.getElementById("clientname").value;
                var resource = document.getElementById("resource").value;
                var outsourcedponumber = document.getElementById("outsourcedponumber").value;
                var ho = document.getElementById("ho").value; 
                
                               
                document.getElementById("ContentFrame").src="selectdistribution.action?systemcode="+costcode+"&vendorname="
                +vendorname+"&comments="+comments+"&remark1=1"
                +"&resource="+resource+"&outsourcedponumber="+outsourcedponumber+"&ho="+ho;
                return false;
		}
</script>
  </head>
  
  <body>
  
     <div class="allpage">   
    <form method="post" action="" id="myform"  name="myform" onsubmit="return checkpost();" >
    <fieldset style="height:140px; ">
    <legend class="legend">Query Conditions</legend>
      <div class="tijiao">   
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
              <td><span class='redtext'>Resource</span></td>
              <td>
             <select id ="resource" name="resource" style="width:150px;font-size: 12px;height:25px;" >
	         <option value="">--please choose--</option>
	         <option value="Internal">Internal</option>
	         <option value="External">External</option>
		     </select>           
             </td>            
             
               <td><span class='redtext'>Outsourced PO Number</span></td>
              <td>
             <select id ="outsourcedponumber" name="outsourcedponumber" style="width:150px;font-size: 12px;height:25px;" >
	         <option value="">--please choose--</option>
	         <option value="N">N</option>
	         <option value="Y">Y</option>
		     </select>           
             </td>        
             
             <td><span class='redtext'>HO</span></td>
              <td>
             <select id ="ho" name="ho" style="width:150px;font-size: 12px;height:25px;" >
	         <option value="">--please Choose--</option>
	         <option value="N">N</option>
	         <option value="Y">Y</option>
		     </select>           
             </td>        
             
            </tr> 
            <tr> 
           <td><span class='redtext'>Client Name</span></td>
           <td><input type="text" id="clientname"  name="clientname"  autocomplete="off"  style="width:150px;height:25px;border:0.2px solid;" ><div id ="clientnameauto"></div></td>
           
           <td><span class='redtext'>Cost Code</span></td>
           <td><input type="text" id="costcode"  name="costcode" autocomplete="off"  style="width:150px;height:25px;border:0.2px solid;" ><div id ="costcodeauto"></div></td>
           
           <td><span class='redtext'>Vendor Name</span></td>
           <td><input type="text" id="vendorname"  name="vendorname" style="width:150px;height:25px;border:0.2px solid;" ><div id ="vendornameauto"></div></td>
           
        
            
            </tr> 
       </table>
      
         </div>  
           <div class="bottom">              
    	<input type="submit" value="Query" class="buttonstyle"  style="width:60px;height:25px;font-size: 10px;" />
    	<input type="reset" value="Reset" class="buttonstyle"   style="width:60px;height:25px;font-size: 10px;" />
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
				<th>Client Code</th>
				<th>System Code</th>
				<th>Vendor/Translator Name</th>
				<th>Drop Name</th>
			    <th>Work type</th>
				<th>Hourly</th>
				<th>New Words</th>
				<th>Post-Editing</th>
			    <th>75%-84% Fuzzy</th>
			    <th>85%-99% Fuzzy</th>
				<th>75%-99% Fuzzy</th>
				<th>100% Repetition</th>
				<th>Total words</th>
				<th>Value(RMB)</th>
				<th>PO Number</th>				
				<th>Start Date</th>
				<th>End date</th>
				<th>Lead</th>
			    <th>Resource</th>
			    <th>HO</th>
			</tr>

		</table>
			</div>	
		<td width="100%" align="center" valign="top"><iframe id="ContentFrame" name="I2" height="95%" width="100%" border="0" frameborder="0" src=""> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    </fieldset>

	</div>




  </body>
</html>
