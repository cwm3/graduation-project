<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.productsystem.model.CostCode"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	CostCode costcode= (CostCode)request.getAttribute("costcode");
	String lead=costcode.getLead();
    String clientname=costcode.getClientname();
    String costcode_new=costcode.getCostcode();
    String datedate=costcode.getDatedate();
    String field=costcode.getVendor_field();
    if(null==field) {
       field="";
    }
    String id=costcode.getId()+"";
    
    

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Update Cost Code</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"  src="vendormanger/updatevendor.js"></script>
<script type="text/javascript" src="js3/calendar.js"></script>
<script type="text/javascript" src="jquery/jquery-1.8.0.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="updatecss/css-table.css" />
<script type="text/javascript" src="updatecss/js/style-table.js"></script>
<script type="text/javascript">
   		function closewindow() {
			        if (confirm("be sure to update this message ?")) {
 				}
		        return false;
			}
  
    function countTotalWords() {
  
          var newnew=document.getElementById("newwords").value;
          var postediting=document.getElementById("postediting").value;
          var rate1=document.getElementById("rate1").value;
          var rate2=document.getElementById("rate2").value;
          var rate3=document.getElementById("rate3").value;
          var rate4=document.getElementById("rate4").value;
          var toatlword = Number(newnew)+Number(postediting)+Number(rate1)+Number(rate2)+Number(rate3)+Number(rate4);
          document.getElementById("totalwords").value = toatlword;
    }
	


  $(document).ready(function () {
       $("#updatecostcode").click(function () { 
       //必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法
         var params = $("#subprojectForm").serialize();
        $.ajax({
            url:'updatecostcode.action',
            type:'post',
            data:params,
            dataType:'json',
            success:function (data) {
            	alert("Update Sucess");
            	window.close();
            },
            error:function(XMLResponse){
                  alert(XMLResponse.responseText);
            }
             
            
        });
       
    });
   

});

</script>
</head>

<body style="background:url('images/back100.jpg');margin-top:50px;text-align:center;">

		<form id="subprojectForm" name="subprojectForm" >

<table id="travel" >

    
    <thead>    
    	<tr>
            <th scope="col"  colspan="2"><center>Update CostCode</center> </th>
        </tr>        
    </thead>

    <tbody>
    
       <tr>
    		<th colspan="1" scope="row" width="30%" >CostCode</th>
            <td colspan="1" >  <input id="costcode" name="costcode"  type="text" value="<%=costcode_new %>"   style="width:100%;height:20px;font-size:11px;;background:#E0E0E0" readonly="true"  /></td>
   </tr> 
    
             <tr>
    		<th colspan="1" scope="row" width="30%" >Client Name</th>
            <td colspan="1" > <input id="clientname" name="clientname"  type="text" value="<%=clientname %>"    style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
    
    
    
    	<tr style="display: none" >
    		<th colspan="1" scope="row" width="30%" >Id</th>
            <td colspan="1" > <input id="id" name="id"  type="text" value="<%=id %>"   style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
        <tr >
    		<th colspan="1" scope="row" width="30%" >Lead</th>
            <td colspan="1" > <input id="lead" name="lead"  type="text" value="<%=lead %>"    style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
        
         <tr>
    		<th colspan="1" scope="row" width="30%" >Date</th>
            <td colspan="1" > <input id="datedate" name="datedate" value="<%=datedate %>"  readonly="readonly"   onclick="new Calendar_new(null, null, 1).show(this);"   style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
  
        
            <tr>
    		<th colspan="1" scope="row" width="10%" >Filed</th>
            <td colspan="1" style="font-size: 11px;text-align:left"> <label><input name="vendor_field" type="checkbox" value="IT"  <% if(field.indexOf("IT") != -1) { 
		out.print("checked='checked'");}%> />IT</label>
		                 <input name="vendor_field" type="checkbox" value="Marketing" <% if(field.indexOf("Marketing") != -1) { 
		out.print("checked='checked'");}%> />Marketing</label>
		            
		                 &nbsp;<label><input name="vendor_field" type="checkbox" value="Medical"  <% if(field.indexOf("Medical") != -1) { 
		out.print("checked='checked'");}%>  />Medical</label>
		
		                 &nbsp;<label><input name="vendor_field" type="checkbox" value="Legal"  <% if(field.indexOf("Legal") != -1) { 
		out.print("checked='checked'");}%> />Legal</label>
		                 &nbsp;<label><input name="vendor_field" type="checkbox" value="Auto"  <% if(field.indexOf("Auto") != -1) { 
		out.print("checked='checked'");}%> />Auto</label>
		                 &nbsp;<label><input name="vendor_field" type="checkbox" value="Electronics"  <% if(field.indexOf("Electronics") != -1) { 
		out.print("checked='checked'");}%> />Electronics</label>
		
		                 &nbsp;<label><input name="vendor_field" type="checkbox" value="Game"  <% if(field.indexOf("Game") != -1) { 
		out.print("checked='checked'");}%> />Game</label>
		       
		     &nbsp;<label><input name="vendor_field" type="checkbox" value="Sport"  <% if(field.indexOf("Sport") != -1) { 
		out.print("checked='checked'");}%> />Sport</label>    
		       
		                 &nbsp;<label><input name="vendor_field" type="checkbox" value="Chemical" <% if(field.indexOf("Chemical") != -1) { 
		out.print("checked='checked'");}%> />Chemical</label>
		  &nbsp;<label><input name="vendor_field" type="checkbox" value="Finance" <% if(field.indexOf("Finance") != -1) { 
		out.print("checked='checked'");}%> />Finance</label>
		  &nbsp;<label><input name="vendor_field" type="checkbox" value="Mechanical" <% if(field.indexOf("Mechanical") != -1) { 
		out.print("checked='checked'");}%> />Mechanical</label>
		 &nbsp;<label><input name="vendor_field" type="checkbox" value="Others" <% if(field.indexOf("Others") != -1) { 
		out.print("checked='checked'");}%> />Others</label>
		</td>
        </tr>
        
        
                


    </tbody>

        <tfoot>
    	<tr>
            <td colspan="2" ><input type="button" id="updatecostcode" value="Update"  style="width:60px;height:25px;" /></td>

        </tr>
    </tfoot>


</table>
    </form>




  </body>
</html>
