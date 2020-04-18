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
<script type="text/javascript"  src="vendormanger/updatevendor.js"></script>
<script type="text/javascript"  src="vendormanger/addvendor.js"></script>
<script type="text/javascript" src="jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js3/calendar.js"></script>

<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px
}

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}

.table {
	margin-left: 100px;
}

.allpage {
	margin-left: 200px;
}

.updateinfo {
	font-size: 12px
}

.redtext {
	color: red;
}
</style>

<script language="javascript">  

	function updateinfo() {
				if (confirm("be sure to update this message ?")) {
					return true;
				}
				return false;
			}
	
	
</script>  

</head>

<body  >  
	</br>
	<h4>
		<font color="black"><center>Update Vendor</center> </font>
	</h4>
    <div class="updateinfo">
		<form method="post" action="updatevendor.action" id="add_form" name="add_form" onsubmit="return checkpost();">
		<table width="98%" align="center" border="1" cellspacing="0" cellpadding="0"   bordercolor="#000000" bordercolordark="#FFFFFF"  style="font-size:12px;" >
		
		<tr style="display: none" >
		<td width="15%" align="center">Id</td>
		<td> <input id="id" name="id"  type="text" value="<%=id %>" style="width:70%;height:27px"  /></td>
		</tr>					
		<tr>
		<td align="center" ><span class='title'>Vendor ID</span></td>
		<td> <input id="vendorid" name="vendorid" value="<%=vendorid %>" style="font-size:12px;background:#E0E0E0" size="30" readonly="true" /><span class='redtext'>*</span></span></td></tr>
		<tr>
		<td align="center" ><span class='title'>Vendor Name</span></td>
		<td> <input id="vendorname" name="vendor_name"  value="<%=vendor_name %>" readonly="true" style="font-size:12px;;background:#E0E0E0"  size="30" /><span class='redtext'>*</span></td></tr>
		<tr>
		<td align="center" ><span class='title'>Chinese Name</td>
		<td> <input id="chinesename" name="chinese_name" value="<%=chinese_name %>"  style="font-size:12px;" size="30" /><span class='redtext'>*</span></td></tr>
		<tr>
		<td align="center" ><span class='title'>Tel</span></td>
		<td> <input id="tel" name="vendor_tel"  value="<%=vendor_tel %>"  style="font-size:12px;" size="30" /><span class='redtext'>*</span></td></tr>
		<tr><td align="center" ><span class='title'>Email</td>
		<td> <input id="email" name="vendor_email" value="<%=vendor_email %>"  style="font-size:12px;" size="30" /><span class='redtext'>*</span><td></tr>
		
		<tr><td align="center" ><span class='title'>QQ</span></td>
		<td><input id="vendor_qq" name="vendor_qq"  value="<%=vendor_qq %>" style="font-size:12px;" size="30"/><td></tr>
		<tr><td align="center" ><span class='title'>Qualified Date</td>
		<td> <input id="qualified_date" name="qualified_date" value="<%=qualified_date %>"    onclick="new Calendar_new(null, null, 1).show(this);"  maxlength="10" readonly="readonly"  style="font-size:12px;" size="30"/><span class='redtext'>*</span><td></tr>
		<tr><td align="center" ><span class='title'>Monthly Order Min</td>
		<td><input id="monthly_order_min" name="monthly_order_min" value="<%=monthly_order_min %>" style="font-size:12px;" size="30"/><span class='redtext'>*</span><td></tr>
		<tr><td align="center" ><span class='title'>Monthly Order Max</td>
		<td> <input  id="monthly_order_max" name="monthly_order_max" value="<%=monthly_order_max %>"  style="font-size:12px;" size="30" /><span class='redtext'>*</span><td></tr>
		
		
		        <tr>  
		 <td  colspan="2"><table width="90%" align="center" id ="language"  border="1" cellspacing="0" cellpadding="0" bordercolor="#000000" bordercolordark="#FFFFFF" bgcolor="#FFFFFF"  >  
		 
		   <tr>
	       <td width="5px">&nbsp;</td>
		   <td>&nbsp;</td>
		   <td><input type="button" value="Add" onclick=" addCommRow('language',1);"  style="width:40px;height:25px;font-size: 12px;" />
		    <input type="button" value="delete" onclick=" delCommRow('language',1);"   style="width:40px;height:25px;font-size: 12px;" /></td>
		   </tr>  
    
        <%  for(int i=0;i<languagebeginn.length;i++) {
               String  languagebe = languagebeginn[i].trim();
               String  languageen = languageendd[i].trim();
               
               String jiex1 =  "" ,jiex2 =  "" ,jiex3 =  "" ,jiex4 =  "" ,jiex5 =  "" ,jiex6 =  "";
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
               }
                              
               String jiex1_2 =  "" ,jiex2_2  =  "" ,jiex3_2  =  "" ,jiex4_2  =  "" ,jiex5_2  =  "" ,jiex6_2  =  "";
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
               }
               
               
               StringBuffer  stb =  new StringBuffer();
               stb.append("<tr><td width='5px' ><input id='ck' type='checkbox' /></td> <td><span class='title'>&nbsp;Language Pairs：<select  id ='Languagebegin'  name='Languagebegin'  style='width:30%;font-size: 12px;' > ");
		       stb.append(" <option ").append(jiex1).append(" value='Chinese-Simplified'>Chinese-Simplified</option>");
		       stb.append(" <option ").append(jiex2).append(" value='Chinese-Traditional'>Chinese-Traditional</option>");
		       stb.append(" <option ").append(jiex3).append(" value='English'>English</option>");
		       stb.append(" <option ").append(jiex4).append(" value='Japanese'>Japanese</option>");
		       stb.append(" <option ").append(jiex5).append(" value='German'>German</option>");
		       stb.append(" <option ").append(jiex6).append(" value='Korean'>Korean</option>");
		       stb.append(" </select>  to  <select id ='Languageend' name='Languageend' style='width:30%;font-size: 12px;'> " );
		       
		       stb.append(" <option ").append(jiex1_2 ).append(" value='Chinese-Simplified'>Chinese-Simplified</option>");
		       stb.append(" <option ").append(jiex2_2 ).append(" value='Chinese-Traditional'>Chinese-Traditional</option>");
		       stb.append(" <option ").append(jiex3_2 ).append(" value='English'>English</option>");
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
		<tr><td align="center" ><span class='title'>New Word</td>
		<td><input id="newword" name="newword" value="<%=newword %>" style="font-size:12px;" size="30"/><span class='redtext'>*</span><td></tr>
		<tr><td align="center" ><span class='title'>Review</td>
		<td><input id="review" name="review" value="<%=review %>" style="font-size:12px;" size="30"/><span class='redtext'>*</span><td></tr>
		
		<tr><td align="center" ><span class='title'>75%-84% Fuzzy</td>
		<td><input id="fuzzy_84" name="fuzzy_84" value="<%=fuzzy_84 %>" style="font-size:12px;" size="30"/><span class='redtext'>*</span><td></tr>
		<tr><td align="center" ><span class='title'>85%-99% Fuzzy</td>
		<td><input id="fuzzy_85" name="fuzzy_85" value="<%=fuzzy_85 %>" style="font-size:12px;" size="30"/><span class='redtext'>*</span><td></tr>
		<tr><td align="center" ><span class='title'>75%-99% Fuzzy</td>
		<td><input id="fuzzy_99" name="fuzzy_99" value="<%=fuzzy_99 %>" style="font-size:12px;" size="30"/><span class='redtext'>*</span><td></tr>
		<tr><td align="center" ><span class='title'>100%</td>
		<td><input id="fuzzy_100" name="fuzzy_100" value="<%=fuzzy_100 %>" style="font-size:12px;" size="30"/><span class='redtext'>*</span><td></tr>
		
		<tr><td align="center">Daily Capacity</td>
		<td><input id="dailycapacity" name="dailycapacity" value="<%=dailycapacity %>" style="font-size:12px;" size="30"/><span class='redtext'>*</span><td></tr>
		
		
		<tr><td align="center" ><span class='title'>Grade</td>
		<td><select id ="grade" name="grade" style="width:10%;font-size: 12px;">
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
						</select>
						<span class='redtext'>*</span><td></tr>
						
		<tr><td align="center" ><span class='title'>Hourly Rate</td>
		<td><input id="hourlyrate" name="hourlyrate" value="<%=hourlyrate %>" style="font-size:12px;" size="30"/><span class='redtext'>*</span><td></tr>
		
		<tr><td align="center" ><span class='title'>Post Editing</td>
		<td><input id="postediting" name="postediting" value="<%=postediting %>" style="font-size:12px;" size="30"/><span class='redtext'>*</span><td></tr>

		<tr><td align="center" ><span class='title'>Filed</td>
		
		<td> <label><input name="vendor_field" type="checkbox" value="IT"  <% if(field.indexOf("IT") != -1) { 
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
		       
		                 &nbsp;<label><input name="field" type="checkbox" value="Chemical" <% if(field.indexOf("Chemical") != -1) { 
		out.print("checked='checked'");}%> />Chemical</label>
		  &nbsp;<label><input name="field" type="checkbox" value="Finance" <% if(field.indexOf("Finance") != -1) { 
		out.print("checked='checked'");}%> />Finance</label>
		  &nbsp;<label><input name="field" type="checkbox" value="Mechanical" <% if(field.indexOf("Mechanical") != -1) { 
		out.print("checked='checked'");}%> />Mechanical</label>
		<label> Other <input id="vendor_field_other"  name="vendor_field_other"  value="<%=vendor_field_other %>"  /></label>
		
		</td></tr>
		
		
		
		<tr><td align="center" ><span class='title'>Cat</td>
		<td>
		<label><input name="vendor_cat" type="checkbox" value="Studio 2009"  <% if(field.indexOf("Studio 2009") != -1) { 
		out.print("checked='checked'");}%> />Studio 2009</label>
		                 &nbsp;<label><input name="vendor_cat" type="checkbox" value="Studio 2014"  <% if(cat.indexOf("Studio 2014") != -1) { 
		out.print("checked='checked'");}%> />Studio 2014</label>
		                 &nbsp;<label><input name="vendor_cat" type="checkbox" value="Studio 2015"  <% if(cat.indexOf("Studio 2015") != -1) { 
		out.print("checked='checked'");}%> />Studio 2015</label>
		                 &nbsp;<label><input name="vendor_cat" type="checkbox" value="Wordfast"  <% if(cat.indexOf("Wordfast") != -1) { 
		out.print("checked='checked'");}%> />Wordfast</label>
		                 &nbsp;<label><input name="vendor_cat" type="checkbox" value="Worldserver"  <% if(cat.indexOf("Worldserver") != -1) { 
		out.print("checked='checked'");}%> />Worldserver</label>
		                 &nbsp;<label><input name="vendor_cat" type="checkbox" value="Passolo"   <% if(cat.indexOf("Passolo") != -1) { 
		out.print("checked='checked'");}%> />Passolo</label>
		<label>Other<input  id="vendor_cat_other"  name="vendor_cat_other" value="<%=vendor_cat_other %>"   /></label>
				
		</td></tr>
		
		
		<tr><td align="center" ><span class='title'>Vendor Type</td>
		<td><select id ="vendortype" name="vendortype" style="width:22%;font-size: 12px;">
						<option  <% if(grade.equals("Freelancer")){ 
		out.print(" selected='selected' ");}%> value="Freelancer">Freelancer</option>
						<option  <% if(grade.equals("Group")){ 
		out.print(" selected='selected' ");}%> value="Group">Group</option>
						<option  <% if(grade.equals("Agency")){ 
		out.print(" selected='selected' ");}%> value="Agency">Agency</option>
					  
						</select>
						<span class='redtext'>*</span><td></tr>
						
		<tr><td align="center">Comment</td><td> <input id="vendor_comment" name="vendor_comment"  value="<%=vendor_comment %>" style="width:350px;height:85px;font-size:12px;" /> </td>  </tr>
						   	  <tr> <td colspan="2">  <center><input type="submit" value="Update" onclick="return updateinfo();" style="width:60px;height:25px;" />
						          <!--  <input type="reset" value="Reset" style="width:60px;height:25px;" /> --></center> </td>  </tr>
						
 
	</table>			
				
    </form>
		<br>
</div> 
  </body>
</html>
