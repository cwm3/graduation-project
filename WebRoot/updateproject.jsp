<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.productsystem.model.Project"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	Project project= (Project)request.getAttribute("project");
	
	String lead=project.getLead();
		
	String lmogl=project.getLmorgl();
	if(lmogl==null){
	   lmogl="";
	}
    String comment=project.getComment();
    String costcode=project.getCostcode();
    String deadline=project.getDeadline();
    String client=project.getClient();
    
    String dropdate=project.getDropdate();
    String dropname=project.getDropname();
    String potype=project.getPotype();
        
    String hourlywork=project.getHourlywork();
    String imtchampion=project.getImtchampion();
    String imtquality=project.getImtquality();
    String newwords=project.getNewwords();
    
    String postediting=project.getPostediting();
    String rate1=project.getRate1();
    String rate2=project.getRate2();
    String rate3=project.getRate3();
    String rate4=project.getRate4();
    String receivedpovalue=project.getReceivedpovalue();
    String status=project.getStatus();
    String systemcode=project.getSystemcode();
    String totalwords=project.getTotalwords();
    
    String lrrq=project.getLrrq();
    String systemnumber=project.getSystemnumber();
    
    
    
    String id=project.getId()+"";
    
    String languagebegin=project.getLanguagebegin();
    String languageend=project.getLanguageend();
   
    

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Update Project</title>
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
       $("#updateproject").click(function () { 
       //必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法
         var params = $("#subprojectForm").serialize();
        $.ajax({
            url:'updateproject.action',
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



function  chooseSelect() {	 
		 var imtchampion = document.getElementById("imtchampion").value;
		 if(imtchampion=="Y") {
	
                   document.getElementById("rate1").value="";
		           document.getElementById("rate2").value="";
		           document.getElementById("rate3").value="";
		           document.getElementById("rate4").value="";
		           document.getElementById("totalwords").value="";
		           document.getElementById("newwords").value="";
		   		   document.getElementById("rate1").readOnly=true;
		   		   document.getElementById("rate2").readOnly=true;
		   		   document.getElementById("rate3").readOnly=true;
		   		   document.getElementById("rate1").style.background="#E0E0E0";
		   		   document.getElementById("rate2").style.background="#E0E0E0";
		   		   document.getElementById("rate3").style.background="#E0E0E0";
		   		   document.getElementById("postediting").style.background="#FFFFFF";
		  		   document.getElementById("postediting").readOnly=false;
		   		   		   		   
	               alert("75%-84%,85%-99%,75%-99% cannot be input");
	               }
	               
	           if(imtchampion=="N") {
	
                   document.getElementById("rate1").value="";
		           document.getElementById("rate2").value="";
		           document.getElementById("rate3").value="";
		  		   document.getElementById("rate4").value="";
		  		   document.getElementById("totalwords").value="";
		  		      document.getElementById("newwords").value="";
		  		   document.getElementById("postediting").value="";
		  		   document.getElementById("postediting").style.background="#E0E0E0";
		  		   document.getElementById("postediting").readOnly=true;
		  		  
		  		   
		   		   document.getElementById("rate1").readOnly=false;
		   		   document.getElementById("rate2").readOnly=false;
		   		   document.getElementById("rate3").readOnly=false;
		   		   document.getElementById("rate1").style.background="#FFFFFF";
		   		   document.getElementById("rate2").style.background="#FFFFFF";
		   		   document.getElementById("rate3").style.background="#FFFFFF";
		   		   
		   		   alert("postediting cannot be input");
		   		   
		   		      		   
	          }
	          
	          if(imtchampion=="") {
	
                   document.getElementById("rate1").value="";
		           document.getElementById("rate2").value="";
		           document.getElementById("rate3").value="";
		  		   document.getElementById("rate4").value="";
		  		   document.getElementById("totalwords").value="";
		  		   document.getElementById("postediting").value="";
		  		   document.getElementById("newwords").value="";
		   		   document.getElementById("rate1").readOnly=false;
		   		   document.getElementById("rate2").readOnly=false;
		   		   document.getElementById("rate3").readOnly=false;
		   		   document.getElementById("rate1").style.background="#FFFFFF";
		   		   document.getElementById("rate2").style.background="#FFFFFF";
		   		   document.getElementById("rate3").style.background="#FFFFFF";	
		   		   document.getElementById("postediting").style.background="#FFFFFF";
		   		   	   		   
	          }
	               
		 }

			</script>
</head>

<body style="background:url('images/back100.jpg');text-align:center;">

		<form id="subprojectForm" name="subprojectForm" >

<table id="travel" >

    
    <thead>    
    	<tr>
            <th scope="col"  colspan="2"><center>Update Project</center> </th>
        </tr>        
    </thead>
    

    
    <tbody>
    	<tr style="display: none" >
    		<th colspan="1" scope="row" width="30%" >Id</th>
            <td colspan="1" > <input id="id" name="id"  type="text" value="<%=id %>"   readonly="readonly"  style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
        <tr style="display: none" >
    		<th colspan="1" scope="row" width="30%" >Id</th>
            <td colspan="1" > <input id="lrrq" name="lrrq"  type="text" value="<%=lrrq %>"   readonly="readonly"  style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
             <tr style="display: none" >
    		<th colspan="1" scope="row" width="30%" >Id</th>
            <td colspan="1" > <input id="systemnumber" name="systemnumber"  type="text" value="<%=systemnumber %>"   readonly="readonly"  style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
    <tr>
    		<th colspan="1" scope="row" width="30%" >Lead</th>
            <td colspan="1" > <input id="lead" name="lead"  type="text" value="<%=lead %>"  readonly="readonly"   style="width:100%;height:20px;font-size:11px;;background:#E0E0E0" readonly="true"  /></td>
    </tr>
            
    <tr>
    		<th colspan="1" scope="row" width="30%" >Manager</th>
            <td colspan="1" >  <input id="lmorgl" name="lmorgl"  type="text" value="<%=lmogl %>"    readonly="readonly"   style="width:100%;height:20px;font-size:11px;;background:#E0E0E0"  /></td>
   </tr> 
        <tr>
    		<th colspan="1" scope="row" width="30%"  >Client</th>
            <td colspan="1" ><input id="client" name="client" value="<%=client %>"    style="width:100%;height:20px;font-size:11px;background:#E0E0E0"  readonly="true" /></td>
        </tr>    
        
        <tr>
    		<th colspan="1" scope="row" width="30%" >Cost Code</th>
            <td colspan="1" > <input id="costcode" name="costcode"  value="<%=costcode %>" style="width:100%;height:20px;font-size:11px;background:#E0E0E0"  /></td>
        </tr>
        
         <tr>
    		<th colspan="1" scope="row" width="30%" >System Code</th>
            <td colspan="1" > <input id="systemcode" name="systemcode" value="<%=systemcode %>"  readonly="readonly"     style="width:100%;height:20px;font-size:11px;background:#E0E0E0"  /></td>
        </tr>
        
                
        <tr>
    		<th colspan="1" scope="row" width="30%" >Dropdate</th>
            <td colspan="1" >  <input id="dropdate" name="dropdate" value="<%=dropdate %>" onclick="new Calendar_new(null, null, 1).show(this);"    style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
       <tr>
    		<th colspan="1" scope="row" width="30%" >Deadline</th>
            <td colspan="1" > <input id="deadline" name="deadline"  value="<%=deadline %>" onclick="new Calendar_new(null, null, 1).show(this);"    style="width:100%;height:20px;font-size:11px"  /></td>
        </tr>
        

          <tr>
    		<th colspan="1" scope="row" width="30%" >DropName</th>
            <td colspan="1" ><input id="dropname" name="dropname"  value="<%=dropname %>"  style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
     
        <tr>
    		<th colspan="1" scope="row" width="30%" >PO Type</th>
            <td colspan="1" style="text-align:left" >
            <select id ="potype" name="potype"  style="font-size:12px;width:20%;"  >
		           <option  <% if(potype.equals("Blanket PO")) {  out.print("selected='selected'");} %>  value="Blanket PO">Blanket PO</option>
		           <option <% if(potype.equals("General PO")) { out.print("selected='selected'");}  %>  value="General PO">General PO</option>
		   </select>
		<span class='redtext'>*</span>            
            </td>
        </tr>
        
         <tr>
            <th colspan="1" scope="row" width="30%">Language Pairs</th>
            <td colspan="1" style="text-align:left" ><select  id ='Languagebegin'  name='Languagebegin'  style='width:30%;font-size: 12px;' > 
               <option <% if(languagebegin.equals("Chinese-Simplified")) {  out.print("selected='selected'");} %>  value='Chinese-Simplified'>Chinese-Simplified</option>
		       <option <% if(languagebegin.equals("Chinese-Traditional")) {  out.print("selected='selected'");} %>  value='Chinese-Traditional'>Chinese-Traditional</option>
		       <option <% if(languagebegin.equals("English")) {  out.print("selected='selected'");} %>  value='English'>English</option>
		       <option <% if(languagebegin.equals("Japanese")) {  out.print("selected='selected'");} %>  value='Japanese'>Japanese</option>
		       <option <% if(languagebegin.equals("German")) {  out.print("selected='selected'");} %>  value='German'>German</option>
		       <option <% if(languagebegin.equals("Korean")) {  out.print("selected='selected'");} %>  value='Korean'>Korean</option>
            </select>
            to
            <select  id ='languageend'  name='languageend'  style='width:30%;font-size: 12px;' > 
               <option <% if(languageend.equals("Chinese-Simplified")) {  out.print("selected='selected'");} %>  value='Chinese-Simplified'>Chinese-Simplified</option>
		       <option <% if(languageend.equals("Chinese-Traditional")) {  out.print("selected='selected'");} %>  value='Chinese-Traditional'>Chinese-Traditional</option>
		       <option <% if(languageend.equals("English")) {  out.print("selected='selected'");} %>  value='English'>English</option>
		       <option <% if(languageend.equals("Japanese")) {  out.print("selected='selected'");} %>  value='Japanese'>Japanese</option>
		       <option <% if(languageend.equals("German")) {  out.print("selected='selected'");} %>  value='German'>German</option>
		       <option <% if(languageend.equals("Korean")) {  out.print("selected='selected'");} %>  value='Korean'>Korean</option>
            </select>
		</td>

        </tr>
        
        <tr>
    		<th colspan="1" scope="row" width="30%" >Hourly Work</th>
            <td colspan="1" ><input id="hourlywork" name="hourlywork"  value="<%=hourlywork %>"  style="width:100%;height:20px;font-size:11px;" /></td>          
        </tr>
        
        <tr>
    		<th colspan="1" scope="row" width="30%" >iMT Quality</th>
            <td colspan="1" > <input id="imtquality" name="imtquality"  type="text" value="<%=imtquality %>"  onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"  style="width:100%;height:20px;font-size:11px;"   /></td>
        </tr>
                <tr>
    		<th colspan="1" scope="row" width="30%" >iMT Champion</th>
    		<td colspan="1" style="text-align:left" > <select id ="imtchampion" name="imtchampion"   style="font-size:12px;width:20%;"  >
		           <option  <% if(imtchampion.equals("Y")) {  out.print("selected='selected'");} %>  value="Y">Y</option>
		           <option <% if(imtchampion.equals("N")) { out.print("selected='selected'");}  %>  value="N">N</option>
		   </select>         
            </td>
        </tr>
        
        
             <tr>
    		<th colspan="1" scope="row" width="30%" >New Words</th>
            <td colspan="1" ><input id="newwords" name="newwords"  value="<%=newwords %>" onBlur="countTotalWords();"   onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
             <tr>
    		<th colspan="1" scope="row" width="30%" >Post-editing</th>
            <td colspan="1" ><input id="postediting" name="postediting"  value="<%=postediting %>" onBlur="countTotalWords();"  onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"  style="width:100%;height:20px;font-size:11px;" /></td>
        </tr>
        
              <tr>
    		<th colspan="1" scope="row" width="30%" >75%-84% Fuzzy</th>
            <td colspan="1" ><input id="rate1" name="rate1"  value="<%=rate1 %>" onBlur="countTotalWords();"  onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"  style="width:100%;height:20px;font-size:11px;" /></td>
        </tr>
        
         <tr>
    		<th colspan="1" scope="row" width="30%" >75%-99% Fuzzy</th>
            <td colspan="1" ><input id="rate2" name="rate2"  value="<%=rate2 %>" onBlur="countTotalWords();"   onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" style="width:100%;height:20px;font-size:11px;" /></td>
        </tr>
        
        
        
             <tr>
    		<th colspan="1" scope="row" width="30%" >85%-99% Fuzzy</th>
            <td colspan="1" ><input id="rate3" name="rate3"  value="<%=rate3 %>" onBlur="countTotalWords();"   onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" style="width:100%;height:20px;font-size:11px;" /></td>
        </tr>
        
                 
         <tr>
    		<th colspan="1" scope="row" width="30%" >100% Repetition</th>
            <td colspan="1" ><input id="rate4" name="rate4"  value="<%=rate4 %>" onBlur="countTotalWords();"   onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" style="width:100%;height:20px;font-size:11px;" /></td>
        </tr>
        
                
         <tr>
    		<th colspan="1" scope="row" width="30%" >Total Words</th>
            <td colspan="1" ><input id="totalwords" name="totalwords"  value="<%=totalwords %>" readonly="readonly"  style="width:100%;height:20px;font-size:11px;background:#E0E0E0" /></td>
        </tr>
        
                
         <tr>
    		<th colspan="1" scope="row" width="30%" >PO Value</th>
            <td colspan="1" ><input id="receivedpovalue" name="receivedpovalue"  value="<%=receivedpovalue %>" style="width:100%;height:20px;font-size:11px;" /></td>
        </tr>
        
          <tr>
    		<th colspan="1" scope="row" width="30%" >Status</th>
            <td colspan="1" style="text-align:left"  >
            <select id ="status" name="status" style="font-size:12px;width:20%;"  >
		<option  <% if(status.equals("close")){ 
		out.print("selected='selected'");}%>  value="close">Close</option>
		<option <% if(status.equals("inprocess")){ 
		out.print("selected='selected'");}%>  value="inprocess">In Process</option>
		<option <% if(status.equals("headsup")){ 
		out.print("selected='selected'");}%>  value="headsup">Headsup</option>
		</select>
		<span class='redtext'>*</span>
            
            </td>
        </tr>
    

        <tr>
    		<th colspan="1" scope="row" width="30%" >Comment</th>
            <td colspan="1" > <input type="text" id="comment" name="comment"  value="<%=comment %>"  style="width:100%;height:55px;font-size:11px;"></td>
        </tr>

    </tbody>

        <tfoot>
    	<tr>
            <td colspan="2" ><input type="button" id="updateproject" value="Update"  style="width:60px;height:25px;" /></td>

        </tr>
    </tfoot>


</table>
    </form>




  </body>
</html>
