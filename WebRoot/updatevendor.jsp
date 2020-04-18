<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	String field=request.getAttribute("vendor_field").toString();
    String cat=request.getAttribute("vendor_cat").toString();
    String id=request.getAttribute("id").toString();
    String vendorid=request.getAttribute("vendorid").toString();
    String vendor_email=request.getAttribute("vendor_email").toString();
    
    String vendor_name=request.getAttribute("vendor_name").toString();
    String vendorpassword=request.getAttribute("vendorpassword").toString();
    
    String vendor_qq=request.getAttribute("vendor_qq").toString();
    String vendor_tel=request.getAttribute("vendor_tel").toString();
    String monthly_order_max=request.getAttribute("monthly_order_max").toString();
    String monthly_order_min=request.getAttribute("monthly_order_min").toString();
    String vendor_field_other =request.getAttribute("vendor_field_other").toString(); 
    String vendor_cat_other=request.getAttribute("vendor_cat_other").toString();    
    String chinese_name=request.getAttribute("chinese_name").toString();
    String vendor_comment=request.getAttribute("vendor_comment").toString();
    String qualified_date=request.getAttribute("qualified_date").toString();
    String newword=request.getAttribute("newword").toString();
    String review=request.getAttribute("review").toString();
    
    String fuzzy_84=request.getAttribute("fuzzy_84").toString();
    String fuzzy_85=request.getAttribute("fuzzy_85").toString();
    String fuzzy_99=request.getAttribute("fuzzy_99").toString();
    String fuzzy_100=request.getAttribute("fuzzy_100").toString();
    String grade=request.getAttribute("grade").toString();
    String dailycapacity=request.getAttribute("dalitycapacity").toString();  
    String rate=request.getAttribute("rate").toString();
    String languagebegin=request.getAttribute("languagebegin").toString();
    String languageend=request.getAttribute("languageend").toString();
    String languagebeginn[]  = languagebegin.split(",");
    String languageendd[]  = languageend.split(",");
    
    String hourlyrate=request.getAttribute("hourlyrate").toString();
    String postediting=request.getAttribute("postediting").toString();
    String vendortype=request.getAttribute("vendortype").toString();
    String remark1=request.getAttribute("remark1").toString();
    String remark2=request.getAttribute("remark2").toString();
    String remark3=request.getAttribute("remark3").toString();

    
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>update vendor</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" media="screen" href="updatecss/css-table.css" />
<script type="text/javascript" src="updatecss/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="updatecss/js/style-table.js"></script>
<script type="text/javascript"  src="vendormanger/updatevendor.js"></script>
<script type="text/javascript"  src="vendormanger/addvendor.js"></script>
<script type="text/javascript" src="jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js3/calendar.js"></script>
<script language="JavaScript"> 
	function updateinfo() {
				if (confirm("Be sure to update this message ?")) {
					return true;
				}
				return false;
			}
</script>
</head>

<body style="text-align:center;" >
		
		<form method="post" action="updatevendor.action" id="add_form" name="add_form" >

<table id="travel" >

    
    <thead>    
    	<tr>
            <th scope="col"  colspan="2"  >Update Vendor</th>
        </tr>
        
       
    </thead>
    
    
    <tbody>
    	<tr style="display: none" >
    		<th colspan="1" scope="row" width="10%" >Id</th>
            <td colspan="1" > <input id="id" name="id"  type="text" value="<%=id %>" style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
        	<tr style="display: none">
    		<th colspan="1" scope="row" width="10%" >aaa</th>
            <td colspan="1" > <input id="remark1" name="remark1"  type="text" value="<%=remark1 %>" style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
         	<tr style="display: none">
    		<th colspan="1" scope="row" width="10%" >aaa</th>
            <td colspan="1" > <input id="remark2" name="remark2"  type="text" value="<%=remark2 %>" style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
        
         	<tr style="display: none">
    		<th colspan="1" scope="row" width="10%" >aaa</th>
            <td colspan="1" > <input id="remark3" name="remark3"  type="text" value="<%=remark3 %>" style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
        
        	<tr style="display: none">
    		<th colspan="1" scope="row" width="10%" >password</th>
            <td colspan="1" > <input id="vendorpassword" name="vendorpassword"  type="text" value="<%=vendorpassword %>" style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
            	<tr>
    		<th colspan="1" scope="row" width="10%" >Vendor ID</th>
            <td colspan="1" > <input id="vendorid" name="vendorid"  type="text" value="<%=vendorid %>" style="width:100%;height:20px;font-size:11px;background:#E0E0E0" readonly="true"  /></td>
        </tr>
            
         <tr>
    		<th colspan="1" scope="row" width="10%" >Vendor Name</th>
            <td colspan="1" >  <input id="vendor_name" name="vendor_name"  type="text" value="<%=vendor_name %>" style="width:100%;height:20px;font-size:11px;;background:#E0E0E0"  /></td>
        </tr> 
        <tr>
    		<th colspan="1" scope="row" width="10%"  >Chinese Name</th>
            <td colspan="1" ><input id="chinese_name" name="chinese_name" value="<%=chinese_name %>" style="width:100%;height:20px;font-size:11px;"  readonly="true" /></td>
        </tr>    
        
        <tr>
    		<th colspan="1" scope="row" width="10%" >Tel</th>
            <td colspan="1" > <input id="vendor_tel" name="vendor_tel"  value="<%=vendor_tel %>" style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
       
       <tr>
    		<th colspan="1" scope="row" width="10%" >Email</th>
            <td colspan="1" > <input id="vendor_email" name="vendor_email"  value="<%=vendor_email %>" style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
        
        <tr>
    		<th colspan="1" scope="row" width="10%" >QQ</th>
            <td colspan="1" >  <input id="vendor_qq" name="vendor_qq" value="<%=vendor_qq %>"  style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
          <tr>
    		<th colspan="1" scope="row" width="10%" >Qualified Date</th>
            <td colspan="1" ><input id="qualified_date" name="qualified_date"  value="<%=qualified_date %>" readonly="readonly"   onclick="new Calendar_new(null, null, 1).show(this);"   style="width:100%;height:20px;font-size:11px;"  /></td></td>
        </tr>
        
                
          <tr>
    		<th colspan="1" scope="row" width="20%">Monthly Order Min</th>
            <td colspan="1" ><input id="monthly_order_min" name="monthly_order_min"  value="<%=monthly_order_min %>"  style="width:100%;height:20px;font-size:11px;backgroun"  /></td></td>
        </tr>
        
                
          <tr>
    		<th colspan="1" scope="row" width="10%" >Monthly Order Max</th>
            <td colspan="1" ><input id="monthly_order_max" name="monthly_order_max"  value="<%=monthly_order_max %>"    style="width:100%;height:20px;font-size:11px;"  /></td></td>
        </tr>
        
     
         <tr>
            <td colspan="2" >
            <table width="100%" align="center" id ="language"  border="1" cellspacing="0" cellpadding="0" bordercolor="#000000" bordercolordark="#FFFFFF" bgcolor="#FFFFFF"  >  
		   <tr>
		      <td width="5px">&nbsp;</td>
		   <td>&nbsp;</td>
		   <td><input type="button" value="Add" onclick=" addCommRow('language',1);"  style="width:60px;height:25px;font-size: 12px;" />
		    <input type="button" value="delete" onclick=" delCommRow('language',1);"   style="width:60px;height:25px;font-size: 12px;" /></td>
		   </tr>  
    
        <%  for(int i=0;i<languagebeginn.length;i++) {
               String  languagebe = languagebeginn[i].trim();
               String  languageen = languageendd[i].trim();
               
               String jiex1 =  "" ,jiex2 =  "" ,jiex3 =  "" ,jiex4 =  "" ,jiex5 =  "" ,jiex6 =  "" ,jiex7 =  "";
               if(languagebe.equals("Chinese-Simplified")) {
                  jiex1 = " selected='selected' ";
               }else if (languagebe.equals("Chinese-Traditional"))  {
                 jiex2 = " selected='selected' ";
               }else if (languagebe.equals("English"))  {
                 jiex3 = " selected='selected' ";
               }else if (languagebe.equals("Japanese")) {
                 jiex4 = " selected='selected' ";
               }else if (languagebe.equals("German"))  {
                 jiex5 = " selected='selected' ";
               }else if(languagebe.equals("Korean"))  {
                 jiex6 = " selected='selected' ";
               }else if(languagebe.equals("Chinese-Hongkong"))  {
                 jiex7 = " selected='selected' ";
               }
                              
               String jiex1_2 =  "" ,jiex2_2  =  "" ,jiex3_2  =  "" ,jiex4_2  =  "" ,jiex5_2  =  "" ,jiex6_2  =  "",jiex7_2  =  "";
               if(languageen.equals("Chinese-Simplified")) {
                  jiex1_2  = " selected='selected' ";
               }else if (languageen.equals("Chinese-Traditional"))   {
                 jiex2_2  = " selected='selected' ";
               }else if (languageen.equals("English"))  {
                 jiex3_2  = " selected='selected' ";
               }else if (languageen.equals("Japanese"))  {
                 jiex4_2  = " selected='selected' ";
               }else if (languageen.equals("German"))   {
                 jiex5_2  = " selected='selected' ";
               }else if(languageen.equals("Korean"))   {
                 jiex6_2  = " selected='selected' ";
               }else if(languageen.equals("Chinese-Hongkong")) {
                 jiex7_2  = " selected='selected' ";
               }
               
               StringBuffer  stb =  new StringBuffer();
               stb.append("<tr><td width='5px' ><input id='ck' type='checkbox' /></td> <td><span class='title'>&nbsp;Language Pairs：<select  id ='Languagebegin'  name='Languagebegin'  style='width:30%;font-size: 12px;' > ");
		       stb.append(" <option ").append(jiex1).append(" value='Chinese-Simplified'>Chinese-Simplified</option>");
		       stb.append(" <option ").append(jiex3).append(" value='English'>English</option>");
		       stb.append(" <option ").append(jiex7).append(" value='Chinese-Hongkong'>Chinese-Hongkong</option>");		       
		       stb.append(" <option ").append(jiex2).append(" value='Chinese-Traditional'>Chinese-Traditional</option>");
		       stb.append(" <option ").append(jiex4).append(" value='Japanese'>Japanese</option>");
		       stb.append(" <option ").append(jiex5).append(" value='German'>German</option>");
		       stb.append(" <option ").append(jiex6).append(" value='Korean'>Korean</option>");
		       
		       stb.append(" </select>  to  <select id ='Languageend' name='Languageend' style='width:30%;font-size: 12px;'> " );
		       
		       stb.append(" <option ").append(jiex1_2 ).append(" value='Chinese-Simplified'>Chinese-Simplified</option>");
		       stb.append(" <option ").append(jiex3_2 ).append(" value='English'>English</option>");
		       stb.append(" <option ").append(jiex7_2).append(" value='Chinese-Hongkong'>Chinese-Hongkong</option>");
		       stb.append(" <option ").append(jiex2_2 ).append(" value='Chinese-Traditional'>Chinese-Traditional</option>");
		       stb.append(" <option ").append(jiex4_2 ).append(" value='Japanese'>Japanese</option>");
		       stb.append(" <option ").append(jiex5_2 ).append(" value='German'>German</option>");
		       stb.append(" <option ").append(jiex6_2 ).append(" value='Korean'>Korean</option>");
		       out.print(stb.toString());
		  }
		  %>
      </tr>     
            </table>  
		</td>
		      </tr>    
		   
		   

        
         <tr>
    		<th colspan="1" scope="row" width="10%" >New Word</th>
            <td colspan="1" ><input id="newword" name="newword"  value="<%=newword %>"   onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"  style="width:100%;height:20px;font-size:11px;" /></td></td>
        </tr>
        
            <tr>
    		<th colspan="1" scope="row" width="10%" >Post-Editing</th>
            <td colspan="1" ><input id="postediting" name="postediting"  value="<%=postediting %>"  onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
        
        <tr>
    		<th colspan="1" scope="row" width="10%" >Review</th>
            <td colspan="1" ><input id="review" name="review"  value="<%=review %>" style="width:100%;height:20px;font-size:11px;" /></td></td>          
        </tr>
        
        <tr>
    		<th colspan="1" scope="row" width="10%" >75%-84% Fuzzy</th>
            <td colspan="1" > <input id="fuzzy_84" name="fuzzy_84"  type="text" value="<%=fuzzy_84 %>"   onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"  style="width:100%;height:20px;font-size:11px;"   /></td>
        </tr>
                <tr>
    		<th colspan="1" scope="row" width="10%" >85%-99% Fuzzy</th>
            <td colspan="1" > <input id="fuzzy_85" name="fuzzy_85"  value="<%=fuzzy_85 %>"  onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"  style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>

        
             <tr>
    		<th colspan="1" scope="row" width="10%" >85%-99% Fuzzy</th>
            <td colspan="1" ><input id="rate2" name="fuzzy_99"  value="<%=fuzzy_99 %>"  onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" style="width:100%;height:20px;font-size:11px;" /></td>
        </tr>
        
         <tr>
    		<th colspan="1" scope="row" width="10%" >100% Repetition</th>
            <td colspan="1" ><input id="fuzzy_100" name="fuzzy_100"  value="<%=fuzzy_100 %>"  onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" style="width:100%;height:20px;font-size:11px;" /></td>
        </tr>
        
                
         <tr>
    		<th colspan="1" scope="row" width="10%" >Hourly Rate</th>
            <td colspan="1" ><input id="hourlyrate" name="hourlyrate"  value="<%=hourlyrate %>"  onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" style="width:100%;height:20px;font-size:11px;" /></td>
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
		<label> Other <input id="vendor_field_other"  name="vendor_field_other"  value="<%=vendor_field_other %>"  /></label>
		</td>
        </tr>
        
          <tr>
    		<th colspan="1" scope="row" width="10%" >Cat</th>
            <td colspan="1" style="font-size: 11px;text-align:left" >	<label><input name="vendor_cat" type="checkbox" value="Studio 2009"  <% if(field.indexOf("Studio 2009") != -1) { 
		out.print("checked='checked'");}%> />Studio 2009</label>
		                 &nbsp;<label><input name="vendor_cat" type="checkbox" value="Studio 2014"  <% if(cat.indexOf("Studio 2014") != -1) { 
		out.print("checked='checked'");}%> />Studio 2014</label>
		                 &nbsp;<label><input name="vendor_cat" type="checkbox" value="Studio 2015"  <% if(cat.indexOf("Studio 2015") != -1) { 
		out.print("checked='checked'");}%> />Studio 2015</label>
		 &nbsp;<label><input name="vendor_cat" type="checkbox" value="Studio 2017"  <% if(cat.indexOf("Studio 2017") != -1) { 
		out.print("checked='checked'");}%> />Studio 2017</label>
		                 &nbsp;<label><input name="vendor_cat" type="checkbox" value="Wordfast"  <% if(cat.indexOf("Wordfast") != -1) { 
		out.print("checked='checked'");}%> />Wordfast</label>
		                 &nbsp;<label><input name="vendor_cat" type="checkbox" value="Worldserver"  <% if(cat.indexOf("Worldserver") != -1) { 
		out.print("checked='checked'");}%> />Worldserver</label>
		                 &nbsp;<label><input name="vendor_cat" type="checkbox" value="Passolo"   <% if(cat.indexOf("Passolo") != -1) { 
		out.print("checked='checked'");}%> />Passolo</label>
		<label>Other<input  id="vendor_cat_other"  name="vendor_cat_other" value="<%=vendor_cat_other %>"   /></label></td>
        </tr>

    <tr>
    		<th colspan="1" scope="row" width="10%" >Grade</th>
            <td colspan="1"  style="text-align:left" ><select id ="grade" name="grade" style="width:10%;font-size: 12px;">
						<option  <% if(grade.equals("1")){ 
							out.print(" selected='selected' ");}%> value="1">1</option>
											<option  <% if(grade.equals("2")){ 
							out.print(" selected='selected' ");}%> value="2">2</option>
											<option  <% if(grade.equals("3")){ 
							out.print(" selected='selected' ");}%> value="3">3</option>
										    <option  <% if(grade.equals("4")){ 
							out.print(" selected='selected' ");}%> value="4">4</option>
											<option  <% if(grade.equals("5")){ 
							out.print(" selected='selected' ");}%> value="5">5</option>
											<option  <% if(grade.equals("6")){ 
							out.print(" selected='selected' ");}%> value="6">6</option>
											<option  <% if(grade.equals("7")){ 
							out.print(" selected='selected' ");}%> value="7">7</option>
							</select><span class='redtext'>*</span></td>
        </tr>


       <tr>
    		<th colspan="1" scope="row" width="10%" >Daily Capacity</th>
            <td colspan="1" > <input id="dailycapacity" name="dailycapacity" value="<%=dailycapacity %>"  style="width:100%;height:20px;font-size:11px;" /></td>
        </tr>



        
           <tr>
    		<th colspan="1" scope="row" width="10%" >Vendor Type</th>
            <td colspan="1" style="text-align:left"  > <select id ="vendortype" name="vendortype" style="width:10%;font-size: 11px;">
						<option  <% if(vendortype.equals("Freelancer")){ 
		out.print(" selected='selected' ");}%> value="Freelancer">Freelancer</option>
						<option  <% if(vendortype.equals("Group")){ 
		out.print(" selected='selected' ");}%> value="Group">Group</option>
						<option  <% if(vendortype.equals("Agency")){ 
		out.print(" selected='selected' ");}%> value="Agency">Agency</option>
					  
						</select>
						<span class='redtext'>*</span></td>
        </tr>

        
                
           <tr>
    		<th colspan="1" scope="row" width="10%" >Comment</th>         
    		<td colspan="1" > <input id="vendor_comment" name="vendor_comment" value="<%=vendor_comment %>"  style="width:100%;height:60px;font-size:11px;"  /></td>    		
        </tr>

        

        
    </tbody>

        <tfoot>
    	<tr>
            <td colspan="2" ><input type="submit"  onclick="return updateinfo();" value="Update"  style="width:60px;height:25px;" /></td>
        </tr>
    </tfoot>


</table>
    </form>




  </body>
</html>
