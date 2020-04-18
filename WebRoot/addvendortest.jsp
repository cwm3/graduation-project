<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addvendortest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript"  src="vendormanger/addvendor.js"></script>
    <script type="text/javascript" src="jquery/jquery-1.8.0.min.js"></script>
   <link title="style1" rel="stylesheet" href="css/addvendor.css" type="text/css" />

<style type="text/css">
.title{
   font-size: 12px;
}
.redtext{
   color:red;
}
</style>

  </head>
  
  <body>
      <div align="center" ><h4><font color="black">Add Vendor</center></font></h4></div>
      
     <div class="form_content">
    <form id="test" action="#" method="post">
    <fieldset>
        <legend>Base INFORMATION</legend>
        <div class="form-row">
            <div class="field-label"><label for="field1">Vendor Id</label>:</div>
            <div class="field-widget"><input name="vendorid" id="vendorid" class="required" title="Enter your name" /></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field2">Vendor Name</label>:</div>
            <div class="field-widget"><input name="vendorid" id="vendorid" class="required" title="Enter your name" /></div>
        </div>
        
          <div class="form-row">
            <div class="field-label"><label for="field2">Chinese Name</label>:</div>
            <div class="field-widget"><input name="chinese_name" id="chinese_name" class="required" title="Enter your name" /></div>
        </div>
        
        
          <div class="form-row">
            <div class="field-label"><label for="field2">Vendor Email</label>:</div>
            <div class="field-widget"><input name="vendor_email" id="vendor_email" class="required" title="Enter your name" /></div>
        </div>
        

    </fieldset>
    <fieldset>
        <legend>ACCOUNT DETAILS</legend>
        
        <div class="form-row">
            <div class="field-label"><label for="field4">Vendor QQ</label>:</div>
            <div class="field-widget"><input name="vendor_qq" id="vendor_qq" class="required" title="Enter your name" /></div>
        </div>
        
        <div class="form-row">
            <div class="field-label"><label for="field5">Qualified Date</label>:</div>
            <div class="field-widget"><input name="qualified_date" id="qualified_date" class="required validate-email" title="Enter your name" /></div>
        </div> 
        <div class="form-row">
            <div class="field-label"><label for="field7">Monthly Order Min</label>:</div>
            <div class="field-widget"><input type="monthly_order_min" name="monthly_order_min" id="field7" class="required validate-password" title="Enter a password greater than 6 characters" /></div>
        </div>
          
        <div class="form-row">
            <div class="field-label"><label for="field9">Monthly Order Max</label>:</div>
            <div class="field-widget"><input type="monthly_order_max" name="monthly_order_max" id="field8" class="required validate-password-confirm" title="Enter the same password for confirmation" /></div>
        </div> 
      
      
    </fieldset>  
    <fieldset>
        <legend class="optional">OPTIONAL INFORMATIONS</legend>
      
            <table width="100%" align="center" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000" bordercolordark="#FFFFFF" bgcolor="#FFFFFF"  >  
            <tr>  
		 <td  colspan="4"><table width="90%" align="center" id ="language"  border="1" cellspacing="0" cellpadding="0" bordercolor="#000000" bordercolordark="#FFFFFF" bgcolor="#FFFFFF"  >  
		   <tr>
	       <td width="5px">&nbsp;</td>
		   <td>&nbsp;</td>
		   <td><input type="button" value="Add" onclick= " addCommRow('language',1);"  style="width:60px;height:25px;font-size: 12px;" />
		    <input type="button" value="delete" onclick= " delCommRow('language',1);"   style="width:60px;height:25px;font-size: 12px;" /></td>
		   </tr>  
      <tr>  
        <td width="5px" ><input id="ck" type="checkbox" /></td>
		<td><span class='title'> &nbsp;Language Pairs&nbsp;<select id ="Languagebegin" name="Languagebegin" style="width:30%;font-size: 12px;">
		<option value="Chinese-Simplified">Chinese-Simplified</option>
		<option value="Chinese-Hongkong">Chinese-Hongkong</option>
		<option value="Chinese-Traditional">Chinese-Traditional</option>
		<option value="English">English</option>
		<option value="Japanese">Japanese</option>
	    <option value="German">German</option>
	    <option value="Korean">Korean</option>
		</select>
		to<select id ="Languageend" name="Languageend" style="width:30%;font-size: 12px;">
	      <option value="Chinese-Simplified">Chinese-Simplified</option>
		  <option value="Chinese-Hongkong">Chinese-Hongkong</option>
		  <option value="Chinese-Traditional">Chinese-Traditional</option>
		  <option value="English">English</option>
		  <option value="Japanese">Japanese</option>
	      <option value="German">German</option>
	      <option value="Korean">Korean</option>
		</select></span>
	  </td>	
      </tr>     
            </table>  
		</td>
		
      </tr>      
            </table>  

     </fieldset> 
     
   <fieldset>
        <legend>ACCOUNT DETAILS</legend>
        
        <div class="form-row">
          <div class="field-label"><label for="field4">Field</label>:</div>
            <div class="field-widget">
                <label><input id="vendor_field" name="vendor_field" type="checkbox" value="IT" />IT</label>
                 &nbsp;&nbsp;&nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="marketing"/>marketing </label>
                 &nbsp;&nbsp;&nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="medical" />medical</label>
                 &nbsp;&nbsp;&nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="Legal" />Legal</label>
                 &nbsp;&nbsp;&nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="Auto" />Auto</label>
                 &nbsp;&nbsp;&nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="Electronics" />Electronics</label>
                 &nbsp;&nbsp;&nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="Game" />Game</label>
               
            </div>
                <div class="field-widget">
                 &nbsp;&nbsp;&nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="Game" />Game </label>
                 &nbsp;&nbsp;&nbsp;<label><input id="vendor_field"  name="vendor_field" type="checkbox" value="Sport" />Sport </label>
                 &nbsp;&nbsp;&nbsp; <label><input id="vendor_field" name="vendor_field" type="checkbox" value="Chemical Engineering" />Chemical Engineering</label>
                 &nbsp;&nbsp;&nbsp;<label>&nbsp;&nbsp;Other<input id="vendor_field_other"  name="vendor_field_other"  /></label>          
            </div>
            </br>
            <div class="field-label"><label for="field4">CAT</label>:</div>
            <div class="field-widget">
                 <label><input name="vendor_cat" type="checkbox" value="Studio 2009" />Studio 2009</label>
                 &nbsp;<label><input id="vendor_cat" name="vendor_cat" type="checkbox" value="Studio 2010" />Studio 2010</label>
                 &nbsp;<label><input id="vendor_cat" name="vendor_cat" type="checkbox" value="Studio 2014" />Studio 2014</label>
                 &nbsp;<label><input id="vendor_cat" name="vendor_cat" type="checkbox" value="Studio 2015" />Studio 2015</label>
                 &nbsp;<label><input id="vendor_cat" name="vendor_cat" type="checkbox" value="Wordfast" />Wordfast</label>
               
            </div>
                <div class="field-widget">
                  &nbsp;<label><input id="vendor_cat" name="vendor_cat" type="checkbox" value="Worldserver" />Worldserver</label>
                 &nbsp;<label><input id="vendor_cat" name="vendor_cat" type="checkbox" value="Passolo" />Passolo </label>
                 &nbsp;&nbsp; <label> Other <input  id="vendor_cat_other"  name="vendor_cat_other"  /></label>
            </div>
            
            </div>
        </fieldset>  
       </div>  
         </div>  
           </div>  
         <input type="submit" class="submit" value="Submit" /> <input class="reset" type="button" value="Reset" onclick="valid.reset(); return false" />
    </form>
    
        
  </body>
</html>
