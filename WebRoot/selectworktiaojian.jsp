<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客户查询</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/auto.js"></script>
     <script type="text/javascript" src="js/calendar.js"></script>

	
	<style type="text/css">

body {
    margin-left: 0px;
    margin-top: 0px;
    margin-right: 0px;
    margin-bottom: 0px;
}

fieldset
{
  border: 1px solid #61B5CF;
  margin-top: 16px;
  padding: 8px;
  width:98%;
}
legend
{
  font: bold 12px Arial, Helvetica, sans-serif;
  color: #00008B;
  background-color: #FFFFFF;
}

.allpage{
   margin-top:5px;
   margin-left: 20px;
   font-size: 12px;

}
.bottom {
   margin-top:40px;
   margin-left:20%;
   font-size: 12px;

}
.redtext{
   color:red;
   
}

</style>

  </head>
  
  <body>
  
    <div class="allpage">  
     <fieldset>
    <legend class="legend">Query Conditions</legend>                       
    <form method="post" action="addpurchase.action" id="myform"  name="myform" onsubmit="return checkpost();" >
      <div class="tijiao">   
     
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
                <td>Start Date：&nbsp;&nbsp;<input type="startdate" id="startdate"  name="partsname5" onfocus="HS_setDate(this)" style="width:200px;" ><span class='redtext'>*</span>  </td>
                <td>End Date：&nbsp;&nbsp;<input type="text" id="end date"  name="enddate" onfocus="HS_setDate(this)" style="width:200px;" ><span class='redtext'>*</span>  </td>
                <td>Field:&nbsp;<select id="field"  name="field" style="width:200px;">
                                          <option value="1">IT</option>
                                          <option value="2">Marketing</option>
                                          <option value="3" selected="selected">Finance</option>
                                          <option value="4">Legal</option>
                                          <option value="5">Mechanical</option>
                                          <option value="6">Medical</option>
                                          <option value="7">Auto</option>
                                          </select><span class='redtext'>*</span>  </td>
              </tr> 

             <tr>
               <td>Average Score：&nbsp;&nbsp;<input type="startdate" id="startdate"  name="partsname5" style="width:200px;" ><span class='redtext'>*</span>  </td>
               <td>CAT:&nbsp;<select id="cat"  name="cat" style="width:200px;">
                                          <option value="1">SDLX</option>
                                          <option value="2">Studio 2009</option>
                                          <option value="3" selected="selected">Studio 2011</option>
                                          <option value="4">Passolo</option>
                                          <option value="5">Worldserver</option>
                                          <option value="6">自定义</option>
                                          </select><span class='redtext'>*</span>  </td>
           </tr> 

       </table>
     
         </div>  
           <div class="bottom">              
    	<input type="submit" value="Query" style="width:70px;height:25px;margin-left: 210px;" />
    	<input type="reset" value="Reset" style="width:70px;height:25px;" />
    	<input type="button" value="导出明细" style="width:70px;height:25px;" />
    	  </div>  
    
     </fieldset>
    
   </div>  
      
  </body>
</html>
