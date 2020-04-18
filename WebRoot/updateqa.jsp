<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.productsystem.model.Qa"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Qa qa= (Qa)request.getAttribute("qa");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Update QA</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript"  src="vendormanger/addvendor.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js3/calendar.js"></script>
    <script type="text/javascript" src="js/costcode.js"></script>
    
	<style type="text/css">
	.title{
	   font-size: 12px;
	}
	.redtext{
	   color:red;
	}
	</style>
	<script type="text/javascript">
	    
    		function closewindow() {
			        if (confirm("be sure to update this message ?")) {
			          alert("Upate Sucess");
                      window.close();
 				}
		        return false;
			}
		
		
			  
	 function checkpost() {
	 if(add_form.datedate.value=="" || add_form.datedate.value== null )
        {
    	     alert("please input Date"); 
    	     add_form.datedate.focus(); 
    	     return false; 
        } 
        return true;
   	 }
	  
    var XMLHttpReq;
    var currentSort;
    var fwbz;//计算标志
    
     //创建XMLHttpRequest对象      
    function createXMLHttpRequest() {
        if(window.XMLHttpRequest) { //Mozilla 浏览器
            XMLHttpReq = new XMLHttpRequest();
        }
        else if (window.ActiveXObject) { // IE浏览器
            try {
                XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {}
            }
        }
    }
    
    //发送请求函数
    function sendRequest(url) {
        createXMLHttpRequest();
        XMLHttpReq.open("GET", url, true);
        XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
        XMLHttpReq.send(null);  // 发送请求
    }


    
    // 处理返回信息函数
    function processResponse() {
        if (XMLHttpReq.readyState == 4) { // 判断对象状态
            if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
                if(fwbz=="vendorid") {
                 getVendorId();
                }
                if(fwbz=="calute") {
                 caluteClientNameandSDLBusinessUnit();
                }
               
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
    }
    
        //更新菜单函数
     function getVendorId() {        
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        document.getElementById("vendorid").value=res;
     }
     
          //更新菜单函数
     function caluteClientNameandSDLBusinessUnit() {   
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        var a = res.split("||||");
        document.getElementById("clientname").value=a[0];
        document.getElementById("sdlbusinessunit").value=a[1];
        
     }
     
        // 创建级联菜单函数
     function autocalute() {
         fwbz = "calute";
         var costcode = document.getElementById("costcode").value; 
         var sdlbusinessunit = costcode.substr(5, 2);
         sendRequest("calute.jsp?costcode="+costcode+"&code_sdlbusinessunit="+sdlbusinessunit);       
    }
    
    $(function($) {
           $('body').click(function() {  
                    autocalute();
                    //autocalute();
            });  
  });
    
    
    	
       // 创建级联菜单函数
    function showVendorId() {
    
        fwbz = "vendorid";   
        var vendorname = document.getElementById("vendorname").value;
       if(vendorname== "" || vendorname== null )
       {
    	     alert("please input vendorname"); 
    	     return false; 
        }else {
        
                sendRequest("getVendorId.jsp?vendorname=" + vendorname);       
        } 
    }
    
    	  function calutesdlqualityindicator() {
	  	  var code = document.getElementById("sdlqualityindicator").value;
	      if(code >=4 ) {
	      document.getElementById("sdlqualityindicator_show").value = "Pass";
	      }else if(code<4) {
	          document.getElementById("sdlqualityindicator_show").value = "No Pass";
	      }else {
	        alert("The format is not correct");
	      }
	  }
    
  $(document).ready(function () {
       $("#updateqa").click(function () { 
       //必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法
         var params = $("#subqaForm").serialize();
        $.ajax({
            url:'updateqa.action',
            type:'post',
            data:params,
            dataType:'json',
            beforeSend:function()
              {  
                if (confirm("be sure to update this message ?")) {
                
 				}else {
		             return false;
               }
               },
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
<body>  
</br>

          <div align="center" ><h4><font color="black">UPDATE QA</center></font></h4></div>
             
          <form  id="subqaForm"   name="subqaForm" >    
           <table width="94%" align="center" border="1" cellspacing="0" cellpadding="0" bordercolor=#000000 style="border-collapse:collapse" >  
                
        
            </tr> 
                 <tr style="display:none">  
                 <td align="center" ><input type="text" id="id"     name="id"    value="<%=qa.getId() %>"   style="width:90%;height:20px;background:#E0E0E0"  ></td>
                 <td align="center" ><input type="text" id="filecontenttype"     name="filecontenttype"    value="<%=qa.getFilecontenttype()%>"  readonly="readonly"   style="width:90%;height:20px;background:#E0E0E0"  ></td>
                 <td align="center" ><input type="text" id="filefilename"     name="filefilename"    value="<%=qa.getFilefilename() %>"  readonly="readonly"   style="width:90%;height:20px;background:#E0E0E0"  ></td>
                 <td align="center" ><input type="text" id="ftpfilename"     name="ftpfilename"    value="<%=qa.getFtpfilename() %>"  readonly="readonly"   style="width:90%;height:20px;background:#E0E0E0"  ></td>
         </tr> 
            
       
                  <tr>  
                 <td align="center" style="height:25px;background:#66a9bd;" ><span class='title'>Vendor Name</span></td>
                 <td>
               <input type="text" id="vendorname"     name="vendorname"  value="<%=qa.getVendorname() %>" readonly="readonly"   style="width:90%;height:20px;background:#E0E0E0"  ><span class='redtext'>*</span> </div>
                 </td>
               <td align="center" style="height:25px;background:#66a9bd;"><span class='title'>Vendor ID</span></td>
                 <td><input type="text" id="vendorid"     name="vendorid"  onclick="showVendorId()"  value="<%=qa.getVendorid() %>"  readonly="readonly"   style="width:90%;height:20px;background:#E0E0E0;font-size:10px"  ><span class='redtext'>*</span></td>
               
                 </tr>
                 <tr>  
                 <td align="center" style="height:25px;background:#66a9bd;" ><span class='title'>Lead</span></td>
                 <td><input type="text" id="lead"     name="lead"   value="<%=qa.getLead() %>"  readonly="readonly"  style="width:90%;height:20px;background:#E0E0E0;font-size:10px;"  ><span class='redtext'>*</span></td>
                 <td align="center" style="height:25px;background:#66a9bd;"><span class='title'>Manager</span></td>
                 <td><input type="text" id="lmorgl"     name="lmorgl"  value="<%=qa.getLmorgl() %>"  readonly="readonly"   style="width:90%;height:20px;background:#E0E0E0;font-size:10px;"  ><span class='redtext'>*</span></td>
                 </tr> 
                 <tr>  
                 <td align="center" style="height:25px;background:#66a9bd;" ><span class='title'>100% Matches</span></td>
                 <td>
                 <select id ="matches" name="matches" style="width:90%;height:20px;font-size:10px;">
				     <option value="You Must Review"  <% if(qa.getMatches().equals("You Must Review")){  out.print(" selected='selected' ");}%> >You Must Review</option>
				     <option value="Do NOT Review"  <% if(qa.getMatches().equals("Do NOT Review")){  out.print(" selected='selected' ");}%>>Do NOT Review</option>
				     </select>
                </td>
                     <td align="center" ><span class='title'>&nbsp;</span></td>
                 <td> &nbsp;</td> 
                 </tr> 
                 
                 <tr>  
                 <td align="center" colspan="4" bgcolor="#C8C8C8" ><span class='title'>&nbsp;</span></td>
               
                 </tr> 
                 
                    <tr>  
                    <td width="20%" align="center" style="height:25px;background:#66a9bd;"><span class='title'>Client Name</span></td>
                    <td width="30%"><input id="clientname" name="clientname" type="text" value="<%=qa.getClientname() %>"   readonly="readonly"  style="width:90%;height:20px;font-size:10px;background:#E0E0E0;"   /><span class='redtext'>*</span></td>
                    <td width="20%" align="center" style="height:25px;background:#66a9bd;"><span class='title'>SDL Business Unit</span></td>
                     <td  width="30%"><input  type="text" id="sdlbusinessunit"   name="sdlbusinessunit" value="<%=qa.getSdlbusinessunit() %>" readonly="readonly"  style="width:90%;height:20px;font-size:10px;background:#E0E0E0;" /><span class='redtext'>*</span></td>
                </tr> 
                
                 
                   <tr>  
                 <td align="center"  style="height:25px;background:#66a9bd;"><span class='title'>1SDL cost code</span></td>
                 <td><input type="text" id="costcode"     name="sdlcostcode"  value="<%=qa.getSdlcostcode() %>"    style="width:90%;height:20px;font-size:10px"  ><div id ="costcodeauto"></div><span class='redtext'>*</span></td>
                 <td align="center" style="height:25px;background:#66a9bd;"><span class='title'>SDL Lanaguage  Office</span></td>
                   <td>
                     <select id ="sdlnetworkoffice" name="sdlnetworkoffice" style="width:90%;height:20px;font-size:10px;">
				     <option value="China"  <% if(qa.getSdlnetworkoffice().equals("China")){  out.print(" selected='selected' ");}%> >China</option>
				     <option value="Taiwan"  <% if(qa.getSdlnetworkoffice().equals("Taiwan")){  out.print(" selected='selected' ");}%>>Taiwan</option>
				     </select>
                     <span class='redtext'>*</span></td>
                 </tr> 
                 
              
                             
               
            <tr>  
                 <td align="center" style="height:25px;background:#66a9bd;"><span class='title'>Sector</span></td>
                 <td>
                   <select id ="sector" name="sector" style="width:90%;height:20px;font-size:10px">
						<option value="Aerospace" <% if(qa.getSector().equals("Aerospace")){  out.print(" selected='selected' ");} %>  >Aerospace</option>
						<option value="Automotive" <% if(qa.getSector().equals("Automotive")){ out.print(" selected='selected' ");}%> >Automotive</option>
						<option value="Commercial" <% if(qa.getSector().equals("Commercial")){ out.print(" selected='selected' ");}%> >Commercial</option>
					    <option value="Consumer" <% if(qa.getSector().equals("Consumer")){  out.print(" selected='selected' ");}%> >Consumer</option>
						<option value="Defence" <% if(qa.getSector().equals("Defence")){  out.print(" selected='selected' ");}%> >Defence</option>
						<option value="EnergyUtilities" <% if(qa.getSector().equals("EnergyUtilities")){  out.print(" selected='selected' ");}%> >Energy & Utilities</option>
						<option value="Finance" <% if(qa.getSector().equals("Finance")){  out.print(" selected='selected' ");}%> >Finance</option>
						<option value="Games" <% if(qa.getSector().equals("Games")){  out.print(" selected='selected' ");}%> >Games</option>
						<option value="General" <% if(qa.getSector().equals("General")){  out.print(" selected='selected' ");}%> >General</option>
						<option value="IT" <% if(qa.getSector().equals("IT")){  out.print(" selected='selected' ");}%> >IT</option>
						<option value="Legal" <% if(qa.getSector().equals("Legal")){  out.print(" selected='selected' ");}%> >Legal</option>
						<option value="Life Sciences" <% if(qa.getSector().equals("Life Sciences")){ out.print(" selected='selected' ");}%> >Life Sciences</option>
						<option value="Manufacturing" <% if(qa.getSector().equals("Manufacturing")){  out.print(" selected='selected' ");}%> >Manufacturing</option>
						<option value="MechanicalEngineering" <% if(qa.getSector().equals("MechanicalEngineering")){ out.print(" selected='selected' ");}%> >Mechanical Engineering</option>
						<option value="Patents" <% if(qa.getSector().equals("Patents")){  out.print(" selected='selected' ");}%> >Patents</option>
						<option value="Telecommunications" <% if(qa.getSector().equals("Telecommunications")){  out.print(" selected='selected' ");}%> >Telecommunications</option>
						<option value="TravelTourism" <% if(qa.getSector().equals("TravelTourism")){ out.print(" selected='selected' ");}%> >Travel&Tourism</option>
						</select>
                 <span class='redtext'>*</span></td>
                 
                 <td align="center" style="height:25px;background:#66a9bd;" ><span class='title'>Translator name</span></td>
                 <td><input type="text" id="translatorname"    name="translatorname" value="<%=qa.getTranslatorname() %>"  style="width:90%;height:20px;font-size:10px;"  ><span class='redtext'>*</span></td>
                 </tr>
                  <tr>  
                    <td align="center" style="height:25px;background:#66a9bd;"><span class='title'>Translation Type</span></td>
                    <td>
                    <select id="translationtype" name="translationtype" style="width:90%;height:20px;font-size:10px;">
						<option value="Conventional" <% if(qa.getTranslationtype().equals("Conventional")){ out.print(" selected='selected' ");}%> >Conventional</option>
						<option value="i-MTpost-edit" <% if(qa.getTranslationtype().equals("i-MTpost-edit")){ out.print(" selected='selected' ");}%> >i-MT post-edit</option>
						</select>
                    <span class='redtext'>*</span></td>
                   
                    <td align="center" style="height:25px;background:#66a9bd;"><span class='title'>Reviewer Name</span></td>
                    <td><input type="text" id="reviewername"  name="reviewername" value="<%=qa.getReviewername() %>"  style="width:90%;height:20px;font-size:10px;"  ><span class='redtext'>*</span></td>
                 </tr>
                 
                              
             
                     <tr>  
                    <td align="center" style="height:25px;background:#66a9bd;"><span class='title'>Section evaluated</span></td>
                    <td><input type="text" id="sectionevaluated"     name="sectionevaluated" value="<%=qa.getSectionevaluated()%>"   style="width:90%;height:20px;font-size:10px;"  ><span class='redtext'>*</span></td>
                    <td align="center" style="height:25px;background:#66a9bd;" ><span class='title'>Evaluator name</span></td>
                    <td><input type="text" id="evaluatorname"  name="evaluatorname" value="<%=qa.getEvaluatorname() %>"  style="width:90%;height:20px;font-size:10px;"  ><span class='redtext'>*</span></td>
                 </tr>
                 <tr>  
                    <td align="center" style="height:25px;background:#66a9bd;"><span class='title'>Evaluation Type</span></td>
                      <td><select id="evaluatedtype" name="evaluatedtype" style="width:90%;height:20px;font-size:11px;">
						<option value="3rd Party Evaluation (QE team)">3rd Party Evaluation (QE team)</option>
						<option value="3rd Party Evaluation (LO)">3rd Party Evaluation (LO)</option>
						<option value="Follow up evaluation (QE team)">Follow up evaluation (QE team)</option>
						<option value="Follow up evaluation (LO)">Follow up evaluation (LO)</option>
						<option value="Follow up evaluation (QE team)">Follow up evaluation (QE team)</option>
						<option value="Different type (none of above applicable)">Different type (none of above applicable)</option>
						</select></td>
                    <td align="center" style="height:25px;background:#66a9bd;" ><span class='title'>Evaluation Method</span></td>
                     <td><select id="evaluationmethod" name="evaluationmethod" style="width:90%;height:20px;font-size:11px;">
						<option value="TQA">TQA</option>
						<option value="Standard">Standard</option>
						</select>
                    <span class='redtext'>*</span></td>                    
                 </tr>
         <tr>  
                    <td align="center" style="height:25px;background:#66a9bd;"><span class='title'>Date</span></td>
                    <td><input type="text" id="qadate"     name="qadate" value="<%=qa.getQadate() %>"  onclick="new Calendar_new(null, null, 1).show(this);" readonly="readonly" style="width:90%;height:20px;font-size:10px;"  ><span class='redtext'>*</span></td>
                    <td align="center" style="height:25px;background:#66a9bd;"><span class='title'>Component type</span></td>   
                    <td>
                    <select id="componenttype" name="componenttype" style="width:90%;height:20px">
                    <option value="Software" <% if(qa.getSector().equals("Software")){  out.print(" selected='selected' ");}%> >Software</option>
		            <option value="Help" <% if(qa.getSector().equals("Help")){  out.print(" selected='selected' ");}%> >Help</option>
		            <option value="Doc" <% if(qa.getSector().equals("Doc")){  out.print(" selected='selected' ");}%> >Doc</option>
		            <option value="Script" <% if(qa.getSector().equals("Script")){  out.print(" selected='selected' ");}%> >Script</option>
       
				    </select>
                    <span class='redtext'>*</span></td>
                
                
                 </tr>
                <tr>  
                    <td align="center" style="height:25px;background:#66a9bd;"><span class='title'>Source language</span></td>
                                   <td>
                    <select id="sourcelanguage" name="sourcelanguage" style="width:90%;height:20px;font-size:10px">
                    
                       <option value="English" <% if(qa.getSourcelanguage().equals("English")){  out.print(" selected='selected' ");}%> >English</option>
                    
                    
				    <option value="Acholi" <% if(qa.getSourcelanguage().equals("Acholi")){  out.print(" selected='selected' ");}%> >Acholi</option>
                    <option value="Akan" <% if(qa.getSourcelanguage().equals("Akan")){  out.print(" selected='selected' ");}%> >Afrikaans</option>
                    <option value="Acholi" <% if(qa.getSourcelanguage().equals("Acholi")){  out.print(" selected='selected' ");}%> >Akan</option>
                    <option value="Afrikaans" <% if(qa.getSourcelanguage().equals("Afrikaans")){  out.print(" selected='selected' ");}%> >Afrikaans</option>
                    <option value="Amharic" <% if(qa.getSourcelanguage().equals("Amharic")){  out.print(" selected='selected' ");}%> >Amharic</option>
                    <option value="Arabic" <% if(qa.getSourcelanguage().equals("Arabic")){  out.print(" selected='selected' ");}%> >Arabic</option>
                    <option value="Armenian" <% if(qa.getSourcelanguage().equals("Armenian")){  out.print(" selected='selected' ");}%> >Armenian</option>
                    <option value="Assamese" <% if(qa.getSourcelanguage().equals("Assamese")){  out.print(" selected='selected' ");}%> >Assamese</option>
                    <option value="Aymara" <% if(qa.getSourcelanguage().equals("Aymara")){  out.print(" selected='selected' ");}%> >Aymara</option>
                    <option value="Azerbaijani" <% if(qa.getSourcelanguage().equals("Azerbaijani")){  out.print(" selected='selected' ");}%> >Azerbaijani</option>
                    <option value="Azeri-Cyrillic" <% if(qa.getSourcelanguage().equals("Azeri-Cyrillic")){  out.print(" selected='selected' ");}%> >Azeri-Cyrillic</option>
                    <option value="Basque" <% if(qa.getSourcelanguage().equals("Basque")){  out.print(" selected='selected' ");}%> >Basque</option>
                    <option value="Belarusian" <% if(qa.getSourcelanguage().equals("Belarusian")){  out.print(" selected='selected' ");}%> >Belarusian</option>
                    <option value="Bemba" <% if(qa.getSourcelanguage().equals("Bemba")){  out.print(" selected='selected' ");}%> >Bemba</option>
                    <option value="Bengali" <% if(qa.getSourcelanguage().equals("Bengali")){  out.print(" selected='selected' ");}%> >Bengali</option>
                   <option value="Bengali-Bangladesh" <% if(qa.getSourcelanguage().equals("Bengali-Bangladesh")){  out.print(" selected='selected' ");}%> >Bengali-Bangladesh</option>
                   <option value="Bosnian" <% if(qa.getSourcelanguage().equals("Bosnian")){  out.print(" selected='selected' ");}%> >Bosnian</option>
                   <option value="Bulgarian" <% if(qa.getSourcelanguage().equals("Bulgarian")){  out.print(" selected='selected' ");}%> >Bulgarian</option>
                   <option value="Burmese" <% if(qa.getSourcelanguage().equals("Burmese")){  out.print(" selected='selected' ");}%> >Burmese</option>
                   <option value="Catalan" <% if(qa.getSourcelanguage().equals("Catalan")){  out.print(" selected='selected' ");}%> >Catalan</option>
                   <option value="Cebuano" <% if(qa.getSourcelanguage().equals("Cebuano")){  out.print(" selected='selected' ");}%> >Cebuano</option>
                   <option value="Chechen" <% if(qa.getSourcelanguage().equals("Chechen")){  out.print(" selected='selected' ");}%> >Chechen</option>
                   <option value="Chewa" <% if(qa.getSourcelanguage().equals("Chewa")){  out.print(" selected='selected' ");}%> >Chewa</option>
                   <option value="Chinese-Simplified" <% if(qa.getSourcelanguage().equals("Chinese-Simplified")){  out.print(" selected='selected' ");}%> >Chinese-Simplified</option>
                   <option value="Chinese-HongKong" <% if(qa.getSourcelanguage().equals("Chinese-HongKong")){  out.print(" selected='selected' ");}%> >Chinese-HongKong</option>
                   <option value="Chinese-Traditional" <% if(qa.getSourcelanguage().equals("Chinese-Traditional")){  out.print(" selected='selected' ");}%> >Chinese-Traditional</option>
                   <option value="Cree Plains" <% if(qa.getSourcelanguage().equals("Cree Plains")){  out.print(" selected='selected' ");}%> >Cree Plains</option>
                   <option value="Creole-Haitian" <% if(qa.getSourcelanguage().equals("Creole-Haitian")){  out.print(" selected='selected' ");}%> >Creole-Haitian</option>
                   <option value="Croatian" <% if(qa.getSourcelanguage().equals("Croatian")){  out.print(" selected='selected' ");}%> >Croatian</option>
                   <option value="Czech" <% if(qa.getSourcelanguage().equals("Czech")){  out.print(" selected='selected' ");}%> >Czech</option>
                   <option value="Danish" <% if(qa.getSourcelanguage().equals("Danish")){  out.print(" selected='selected' ");}%> >Danish</option>
                   <option value="Dari" <% if(qa.getSourcelanguage().equals("Dari")){  out.print(" selected='selected' ");}%> >Dari</option>
                   <option value="Dinka" <% if(qa.getSourcelanguage().equals("Dinka")){  out.print(" selected='selected' ");}%> >Dinka</option>
                   <option value="Dutch-Netherlands" <% if(qa.getSourcelanguage().equals("Dutch-Netherlands")){  out.print(" selected='selected' ");}%> >Dutch-Netherlands</option>
                   <option value="Dzongkha" <% if(qa.getSourcelanguage().equals("Dzongkha")){   out.print(" selected='selected' ");}%> >Dzongkha</option>
                   <option value="Ebira" <% if(qa.getSourcelanguage().equals("Ebira")){  out.print(" selected='selected' ");}%> >Ebira</option>
                   <option value="English-Australian" <% if(qa.getSourcelanguage().equals("English-Australian")){  out.print(" selected='selected' ");}%> >English-Australian</option>
                   <option value="English-International" <% if(qa.getSourcelanguage().equals("English-International")){  out.print(" selected='selected' ");}%> >English-International</option>
	               <option value="English-UK" <% if(qa.getSourcelanguage().equals("English-UK")){  out.print(" selected='selected' ");}%> >English-UK</option>
	               <option value="English-Canada" <% if(qa.getSourcelanguage().equals("English-Canada")){  out.print(" selected='selected' ");}%> >English-Canada</option>
	               <option value="English-New Zealand" <% if(qa.getSourcelanguage().equals("English-New Zealand")){  out.print(" selected='selected' ");}%> >English-New Zealand</option>
	               <option value="English-South Africa" <% if(qa.getSourcelanguage().equals("English-South Africa")){  out.print(" selected='selected' ");}%> >English-South Africa</option>
	               <option value="Estonian" <% if(qa.getSourcelanguage().equals("Estonian")){  out.print(" selected='selected' ");}%> >Estonian</option>
	               <option value="Faroese" <% if(qa.getSourcelanguage().equals("Faroese")){  out.print(" selected='selected' ");}%> >Faroese</option>
	               <option value="Farsi" <% if(qa.getSourcelanguage().equals("Farsi")){  out.print(" selected='selected' ");}%> >Farsi</option>
	               <option value="Fijian" <% if(qa.getSourcelanguage().equals("Fijian")){  out.print(" selected='selected' ");}%> >Fijian</option>
	               <option value="Filipino" <% if(qa.getSourcelanguage().equals("Filipino")){  out.print(" selected='selected' ");}%> >Filipino</option>
	               <option value="Finnish" <% if(qa.getSourcelanguage().equals("Finnish")){  out.print(" selected='selected' ");}%> >Finnish</option>
	               <option value="French-France" <% if(qa.getSourcelanguage().equals("French-France")){  out.print(" selected='selected' ");}%> >French-France</option>
	               <option value="French-Canada" <% if(qa.getSourcelanguage().equals("French-Canada")){  out.print(" selected='selected' ");}%> >French-Canada</option>
	               <option value="French-Swiss" <% if(qa.getSourcelanguage().equals("French-Swiss")){  out.print(" selected='selected' ");}%> >French-Swiss</option>
	               <option value="French-Belgium" <% if(qa.getSourcelanguage().equals("French-Belgium")){  out.print(" selected='selected' ");}%> >French-Belgium</option>
	               <option value="French-Luxembourg" <% if(qa.getSourcelanguage().equals("French-Luxembourg")){  out.print(" selected='selected' ");}%> >French-Luxembourg</option>
	               <option value="Frisian" <% if(qa.getSourcelanguage().equals("Frisian")){  out.print(" selected='selected' ");}%> >Frisian</option>
	               <option value="Fulani" <% if(qa.getSourcelanguage().equals("Fulani")){  out.print(" selected='selected' ");}%> >Fulani</option>
	               <option value="Ga" <% if(qa.getSourcelanguage().equals("Ga")){  out.print(" selected='selected' ");}%> >Ga</option>
	               <option value="Gaelic Irish" <% if(qa.getSourcelanguage().equals("Gaelic Irish")){  out.print(" selected='selected' ");}%> >Gaelic Irish</option>
	               <option value="Gaelic Scots" <% if(qa.getSourcelanguage().equals("Gaelic Scots")){  out.print(" selected='selected' ");}%> >Gaelic Scots</option>
	               <option value="Galician" <% if(qa.getSourcelanguage().equals("Galician")){  out.print(" selected='selected' ");}%> >Galician</option>
	               <option value="Ganda" <% if(qa.getSourcelanguage().equals("Ganda")){  out.print(" selected='selected' ");}%> >Ganda</option>
	               <option value="Georgian" <% if(qa.getSourcelanguage().equals("Georgian")){  out.print(" selected='selected' ");}%> >Georgian</option>
	               <option value="German-Germany" <% if(qa.getSourcelanguage().equals("German-Germany")){  out.print(" selected='selected' ");}%> >German-Germany</option>
	               <option value="German-Austrian" <% if(qa.getSourcelanguage().equals("German-Austrian")){  out.print(" selected='selected' ");}%> >German-Austrian</option>
	               <option value="German-Swiss" <% if(qa.getTargetlanguage().equals("German-Swiss")){  out.print(" selected='selected' ");}%> >German-Swiss</option>
	             	<option value="Gikuyu" <% if(qa.getTargetlanguage().equals("Gikuyu")){  out.print(" selected='selected' ");}%> >Gikuyu</option>
	             	<option value="Greek" <% if(qa.getTargetlanguage().equals("Greek")){  out.print(" selected='selected' ");}%> >Greek</option>
	             	<option value="Greenlandic" <% if(qa.getTargetlanguage().equals("Greenlandic")){  out.print(" selected='selected' ");}%> >Greenlandic</option>
	             	<option value="Guarani" <% if(qa.getTargetlanguage().equals("Guarani")){  out.print(" selected='selected' ");}%> >Guarani</option>
	             	<option value="Gujarati" <% if(qa.getTargetlanguage().equals("Gujarati")){  out.print(" selected='selected' ");}%> >Gujarati</option>
	             	<option value="Gun" <% if(qa.getTargetlanguage().equals("Gun")){  out.print(" selected='selected' ");}%> >Gun</option>
	             	<option value="Hausa" <% if(qa.getTargetlanguage().equals("Hausa")){  out.print(" selected='selected' ");}%> >Hausa</option>
	                <option value="Haya" <% if(qa.getTargetlanguage().equals("Haya")){  out.print(" selected='selected' ");}%> >Haya</option>
	                <option value="Hebrew" <% if(qa.getTargetlanguage().equals("Hebrew")){  out.print(" selected='selected' ");}%> >Hebrew</option>
	                <option value="Hiligaynon" <% if(qa.getTargetlanguage().equals("Hiligaynon")){  out.print(" selected='selected' ");}%> >Hiligaynon</option>
	                <option value="Hindi" <% if(qa.getTargetlanguage().equals("Hindi")){  out.print(" selected='selected' ");}%> >Hindi</option>
	                <option value="Hindi-Fiji" <% if(qa.getTargetlanguage().equals("Hindi-Fiji")){  out.print(" selected='selected' ");}%> >Hindi-Fiji</option>
	                <option value="Hmong" <% if(qa.getTargetlanguage().equals("Hmong")){  out.print(" selected='selected' ");}%> >Hmong</option>
	                <option value="Hungarian" <% if(qa.getTargetlanguage().equals("Hungarian")){  out.print(" selected='selected' ");}%> >Hungarian</option>
	                <option value="Ibanag" <% if(qa.getTargetlanguage().equals("Ibanag")){  out.print(" selected='selected' ");}%> >Ibanag</option>
	                <option value="Icelandic" <% if(qa.getTargetlanguage().equals("Icelandic")){  out.print(" selected='selected' ");}%> >Icelandic</option>
	                <option value="Igbo" <% if(qa.getTargetlanguage().equals("Igbo")){  out.print(" selected='selected' ");}%> >Igbo</option>
	                <option value="Ilocano" <% if(qa.getTargetlanguage().equals("Ilocano")){  out.print(" selected='selected' ");}%> >Ilocano</option>
	                <option value="Indonesian" <% if(qa.getTargetlanguage().equals("Indonesian")){  out.print(" selected='selected' ");}%> >Indonesian</option>
	                <option value="Inuktitut" <% if(qa.getTargetlanguage().equals("Inuktitut")){  out.print(" selected='selected' ");}%> >Inuktitut</option>
	                <option value="Isekiri" <% if(qa.getTargetlanguage().equals("Isekiri")){  out.print(" selected='selected' ");}%> >Isekiri</option>
	                <option value="Italian" <% if(qa.getTargetlanguage().equals("Italian")){  out.print(" selected='selected' ");}%> >Italian</option>
	                <option value="Italian-Switzerland" <% if(qa.getTargetlanguage().equals("Italian-Switzerland")){  out.print(" selected='selected' ");}%> >Italian-Switzerland</option>
	                <option value="Japanese" <% if(qa.getTargetlanguage().equals("Japanese")){  out.print(" selected='selected' ");}%> >Japanese</option>
	                <option value="Javanese" <% if(qa.getTargetlanguage().equals("Javanese")){  out.print(" selected='selected' ");}%> >Javanese</option>
	                <option value="K’iche’" <% if(qa.getTargetlanguage().equals("K’iche’")){  out.print(" selected='selected' ");}%> >K’iche’</option>
	                <option value="Kannada" <% if(qa.getTargetlanguage().equals("Kannada")){  out.print(" selected='selected' ");}%> >Kannada</option>
	                <option value="Kapampangan" <% if(qa.getTargetlanguage().equals("Kapampangan")){  out.print(" selected='selected' ");}%> >Kapampangan</option>
	                <option value="Kashmiri" <% if(qa.getTargetlanguage().equals("Kashmiri")){  out.print(" selected='selected' ");}%> >Kashmiri</option>
	                <option value="Kazakh" <% if(qa.getTargetlanguage().equals("Kazakh")){  out.print(" selected='selected' ");}%> >Kazakh</option>
	                <option value="Khmer" <% if(qa.getTargetlanguage().equals("Khmer")){  out.print(" selected='selected' ");}%> >Khmer</option>
	                <option value="Kirghiz" <% if(qa.getTargetlanguage().equals("Kirghiz")){  out.print(" selected='selected' ");}%> >Kirghiz</option>
	                <option value="Kituba" <% if(qa.getTargetlanguage().equals("Kituba")){  out.print(" selected='selected' ");}%> >Kituba</option>
	                <option value="Konkani" <% if(qa.getTargetlanguage().equals("Konkani")){  out.print(" selected='selected' ");}%> >Konkani</option>
	                <option value="Korean" <% if(qa.getTargetlanguage().equals("Korean")){  out.print(" selected='selected' ");}%> >Korean</option>
	                <option value="Krio" <% if(qa.getTargetlanguage().equals("Krio")){  out.print(" selected='selected' ");}%> >Krio</option>
	                <option value="Kurdish-Kurmanji" <% if(qa.getTargetlanguage().equals("Kurdish-Kurmanji")){  out.print(" selected='selected' ");}%> >Kurdish-Kurmanji</option>
	                <option value="Kurdish-Sorani" <% if(qa.getTargetlanguage().equals("Kurdish-Sorani")){  out.print(" selected='selected' ");}%> >Kurdish-Sorani</option>
	                <option value="Lao" <% if(qa.getTargetlanguage().equals("Lao")){  out.print(" selected='selected' ");}%> >Lao</option>
	                <option value="Latin" <% if(qa.getTargetlanguage().equals("Latin")){  out.print(" selected='selected' ");}%> >Latin</option>
	                <option value="Latvian" <% if(qa.getTargetlanguage().equals("Latvian")){  out.print(" selected='selected' ");}%> >Latvian</option>
	                <option value="Lingala" <% if(qa.getTargetlanguage().equals("Lingala")){  out.print(" selected='selected' ");}%> >Lingala</option>
	                <option value="Lithuanian" <% if(qa.getTargetlanguage().equals("Lithuanian")){  out.print(" selected='selected' ");}%> >Lithuanian</option>
	                <option value="Luo" <% if(qa.getTargetlanguage().equals("Luo")){  out.print(" selected='selected' ");}%> >Luo</option>
	                <option value="Luxembourgish" <% if(qa.getTargetlanguage().equals("Luxembourgish")){  out.print(" selected='selected' ");}%> >Luxembourgish</option>
	                <option value="Macedonian" <% if(qa.getTargetlanguage().equals("Macedonian")){  out.print(" selected='selected' ");}%> >Macedonian</option>
	                <option value="Makassar" <% if(qa.getTargetlanguage().equals("Makassar")){  out.print(" selected='selected' ");}%> >Makassar</option>
	                <option value="Malagasy" <% if(qa.getTargetlanguage().equals("Malagasy")){  out.print(" selected='selected' ");}%> >Malagasy</option>
	                <option value="Malay" <% if(qa.getTargetlanguage().equals("Malay")){  out.print(" selected='selected' ");}%> >Malay</option>
	                <option value="Malayalam" <% if(qa.getTargetlanguage().equals("Malayalam")){  out.print(" selected='selected' ");}%> >Malayalam</option>
	                	                 
					<option value="Maldivian (Dhivehi)">Maldivian (Dhivehi)</option>
					<option value="Maltese">Maltese</option>
					<option value="Maori">Maori</option>
					<option value="Marathi">Marathi</option>
					<option value="Mauritian Creole">Mauritian Creole</option>
					<option value="Moldovian">Moldovian</option>
					<option value="Mongolian">Mongolian</option>
					<option value="Montenegrin">Montenegrin</option>
					<option value="Moroccan Darija">Moroccan Darija</option>
					<option value="Nama">Nama</option>
					<option value="Ndebele">Ndebele</option>
					<option value="Nepali">Nepali</option>
					<option value="Nicaraguan">Nicaraguan</option>
					<option value="Nigerian Pidgin">Nigerian Pidgin</option>
					<option value="Norwegian">Norwegian</option>
					<option value="Norwegian-Nynorsk">Norwegian-Nynorsk</option>
					<option value="Nuer">Nuer</option>
					<option value="Ojibway">Ojibway</option>
					<option value="Oriya">Oriya</option>
					<option value="Oromo">Oromo</option>
					<option value="Papiamentu">Papiamentu</option>
					<option value="Pashto">Pashto</option>
					<option value="Polish">Polish</option>
					<option value="Portuguese-Brazil">Portuguese-Brazil</option>
					<option value="Portuguese-Portugal">Portuguese-Portugal</option>
					<option value="Punjabi-Indian">Punjabi-Indian</option>
					<option value="Punjabi-Pakistani">Punjabi-Pakistani</option>
					<option value="Quechua">Quechua</option>
					<option value="Romanian">Romanian</option>
					<option value="Romansch">Romansch</option>
					<option value="Rundi">Rundi</option>
					<option value="Russian">Russian</option>
					<option value="Rwanda">Rwanda</option>
					<option value="Sami">Sami</option>
					<option value="Samoan">Samoan</option>
					<option value="Sepedi">Sepedi</option>
					<option value="Serbian-Cyrillic">Serbian-Cyrillic</option>
					<option value="Serbian-Latin">Serbian-Latin</option>
					<option value="Sesotho">Sesotho</option>
					<option value="Shona">Shona</option>
					<option value="Sindhi">Sindhi</option>
					<option value="Sinhala">Sinhala</option>
					<option value="Lakota">Lakota</option>
					<option value="Dakota">Dakota</option>
					<option value="Sioux">Sioux</option>
					<option value="Slovak">Slovak</option>
					<option value="Slovenian">Slovenian</option>
					<option value="Somali">Somali</option>
					<option value="Spanish-Argentinean">Spanish-Argentinean</option>
					<option value="Spanish-Chilean">Spanish-Chilean</option>
					<option value="Spanish-Colombian">Spanish-Colombian</option>
					<option value="Spanish-Spain">Spanish-Spain</option>
					<option value="Spanish-Guatemalan">Spanish-Guatemalan</option>
					<option value="Spanish-International">Spanish-International</option>
					<option value="Spanish-Latin American">Spanish-Latin American</option>
					<option value="Spanish-Mexican">Spanish-Mexican</option>
					<option value="Spanish-Peruvian">Spanish-Peruvian</option>
					<option value="Spanish-Uruguayan">Spanish-Uruguayan</option>
					<option value="Spanish-Venezulean">Spanish-Venezulean</option>
					<option value="Spanish-Bolivia">Spanish-Bolivia</option>
					<option value="Spanish-Costa Rica">Spanish-Costa Rica</option>
					<option value="Spanish-Ecuador">Spanish-Ecuador</option>
					<option value="Spanish-El Salvador">Spanish-El Salvador</option>
					<option value="Spanish-Nicaragua">Spanish-Nicaragua</option>
					<option value="Spanish-Panama">Spanish-Panama</option>
					<option value="Spanish-Paraguay">Spanish-Paraguay</option>
					<option value="Spanish-Puerto Rico">Spanish-Puerto Rico</option>
					<option value="Spanish-Cuban">Spanish-Cuban</option>
					<option value="Sudanese">Sudanese</option>
					<option value="Sundanese">Sundanese</option>
					<option value="Swahili">Swahili</option>
					<option value="Swati">Swati</option>
					<option value="Swedish">Swedish</option>
					<option value="Tagalog">Tagalog</option>
					<option value="Tajik">Tajik</option>
					<option value="Tamil">Tamil</option>
					<option value="Tatar">Tatar</option>
					<option value="Telugu">Telugu</option>
					<option value="Thai">Thai</option>
					<option value="Tibetan">Tibetan</option>
					<option value="Tigrinya">Tigrinya</option>
					<option value="Tok Pisin">Tok Pisin</option>
					<option value="Tooro">Tooro</option>
					<option value="Tsonga">Tsonga</option>
					<option value="Tswana">Tswana</option>
					<option value="Turkish">Turkish</option>
					<option value="Turkmen">Turkmen</option>
					<option value="Uighur">Uighur</option>
					<option value="Ukrainian">Ukrainian</option>
					<option value="Urdu">Urdu</option>
					<option value="Uzbek">Uzbek</option>
					<option value="Uzbek (Latin)">Uzbek (Latin)</option>
					<option value="Valencian">Valencian</option>
					<option value="Venda">Venda</option>
					<option value="Vietnamese">Vietnamese</option>
					<option value="Welsh">Welsh</option>
					<option value="Xhosa">Xhosa</option>
					<option value="Yiddish">Yiddish</option>
					<option value="Yoruba">Yoruba</option>
					<option value="Zhuang">Zhuang</option>
					<option value="Zulu">Zulu</option>
				    </select>
                    <span class='redtext'>*</span></td>

                    <td align="center" style="height:25px;background:#66a9bd;"><span class='title'>Word count</span></td>
                    <td><input type="text" id="wordcount"  name="wordcount" value="<%=qa.getWordcount() %>"   style="width:90%;height:20px;font-size:10px"  ><span class='redtext'>*</span></td>
                 </tr>
                           <tr>  
                    <td align="center" style="height:25px;background:#66a9bd;"><span class='title'>Target Language</span></td>
                    <td>
                    <select id="targetlanguage" name="targetlanguage" value="<%=qa.getLead() %>"   style="width:90%;height:20px;font-size:10px">
                    
                                        <option value="English" <% if(qa.getTargetlanguage().equals("English")){  out.print(" selected='selected' ");}%> >English</option>
                    
                    <option value="Acholi" <% if(qa.getTargetlanguage().equals("Acholi")){  out.print(" selected='selected' ");}%> >Acholi</option>
                    <option value="Akan" <% if(qa.getTargetlanguage().equals("Akan")){  out.print(" selected='selected' ");}%> >Afrikaans</option>
                    <option value="Acholi" <% if(qa.getTargetlanguage().equals("Acholi")){  out.print(" selected='selected' ");}%> >Akan</option>
                    <option value="Afrikaans" <% if(qa.getTargetlanguage().equals("Afrikaans")){  out.print(" selected='selected' ");}%> >Afrikaans</option>
                    <option value="Amharic" <% if(qa.getTargetlanguage().equals("Amharic")){  out.print(" selected='selected' ");}%> >Amharic</option>
                    <option value="Arabic" <% if(qa.getTargetlanguage().equals("Arabic")){  out.print(" selected='selected' ");}%> >Arabic</option>
                    <option value="Armenian" <% if(qa.getTargetlanguage().equals("Armenian")){  out.print(" selected='selected' ");}%> >Armenian</option>
                    <option value="Assamese" <% if(qa.getTargetlanguage().equals("Assamese")){  out.print(" selected='selected' ");}%> >Assamese</option>
                    <option value="Aymara" <% if(qa.getTargetlanguage().equals("Aymara")){  out.print(" selected='selected' ");}%> >Aymara</option>
                    <option value="Azerbaijani" <% if(qa.getTargetlanguage().equals("Azerbaijani")){  out.print(" selected='selected' ");}%> >Azerbaijani</option>
                    <option value="Azeri-Cyrillic" <% if(qa.getTargetlanguage().equals("Azeri-Cyrillic")){  out.print(" selected='selected' ");}%> >Azeri-Cyrillic</option>
                    <option value="Basque" <% if(qa.getTargetlanguage().equals("Basque")){  out.print(" selected='selected' ");}%> >Basque</option>
                    <option value="Belarusian" <% if(qa.getTargetlanguage().equals("Belarusian")){  out.print(" selected='selected' ");}%> >Belarusian</option>
                    <option value="Bemba" <% if(qa.getTargetlanguage().equals("Bemba")){  out.print(" selected='selected' ");}%> >Bemba</option>
                    <option value="Bengali" <% if(qa.getTargetlanguage().equals("Bengali")){  out.print(" selected='selected' ");}%> >Bengali</option>
                   <option value="Bengali-Bangladesh" <% if(qa.getTargetlanguage().equals("Bengali-Bangladesh")){  out.print(" selected='selected' ");}%> >Bengali-Bangladesh</option>
                   <option value="Bosnian" <% if(qa.getTargetlanguage().equals("Bosnian")){  out.print(" selected='selected' ");}%> >Bosnian</option>
                   <option value="Bulgarian" <% if(qa.getTargetlanguage().equals("Bulgarian")){  out.print(" selected='selected' ");}%> >Bulgarian</option>
                   <option value="Burmese" <% if(qa.getTargetlanguage().equals("Burmese")){  out.print(" selected='selected' ");}%> >Burmese</option>
                   <option value="Catalan" <% if(qa.getTargetlanguage().equals("Catalan")){  out.print(" selected='selected' ");}%> >Catalan</option>
                   <option value="Cebuano" <% if(qa.getTargetlanguage().equals("Cebuano")){  out.print(" selected='selected' ");}%> >Cebuano</option>
                   <option value="Chechen" <% if(qa.getTargetlanguage().equals("Chechen")){  out.print(" selected='selected' ");}%> >Chechen</option>
                   <option value="Chewa" <% if(qa.getTargetlanguage().equals("Chewa")){  out.print(" selected='selected' ");}%> >Chewa</option>
                   <option value="Chinese-Simplified" <% if(qa.getTargetlanguage().equals("Chinese-Simplified")){  out.print(" selected='selected' ");}%> >Chinese-Simplified</option>
                   <option value="Chinese-HongKong" <% if(qa.getTargetlanguage().equals("Chinese-HongKong")){  out.print(" selected='selected' ");}%> >Chinese-HongKong</option>
                   <option value="Chinese-Traditional" <% if(qa.getTargetlanguage().equals("Chinese-Traditional")){  out.print(" selected='selected' ");}%> >Chinese-Traditional</option>
                   <option value="Cree Plains" <% if(qa.getTargetlanguage().equals("Cree Plains")){  out.print(" selected='selected' ");}%> >Cree Plains</option>
                   <option value="Creole-Haitian" <% if(qa.getTargetlanguage().equals("Creole-Haitian")){  out.print(" selected='selected' ");}%> >Creole-Haitian</option>
                   <option value="Croatian" <% if(qa.getTargetlanguage().equals("Croatian")){  out.print(" selected='selected' ");}%> >Croatian</option>
                   <option value="Czech" <% if(qa.getTargetlanguage().equals("Czech")){  out.print(" selected='selected' ");}%> >Czech</option>
                   <option value="Danish" <% if(qa.getTargetlanguage().equals("Danish")){  out.print(" selected='selected' ");}%> >Danish</option>
                   <option value="Dari" <% if(qa.getTargetlanguage().equals("Dari")){  out.print(" selected='selected' ");}%> >Dari</option>
                   <option value="Dinka" <% if(qa.getTargetlanguage().equals("Dinka")){  out.print(" selected='selected' ");}%> >Dinka</option>
                   <option value="Dutch-Netherlands" <% if(qa.getTargetlanguage().equals("Dutch-Netherlands")){  out.print(" selected='selected' ");}%> >Dutch-Netherlands</option>
                   <option value="Dzongkha" <% if(qa.getTargetlanguage().equals("Dzongkha")){   out.print(" selected='selected' ");}%> >Dzongkha</option>
                   <option value="Ebira" <% if(qa.getTargetlanguage().equals("Ebira")){  out.print(" selected='selected' ");}%> >Ebira</option>
                   <option value="English-Australian" <% if(qa.getTargetlanguage().equals("English-Australian")){  out.print(" selected='selected' ");}%> >English-Australian</option>
                   <option value="English-International" <% if(qa.getTargetlanguage().equals("English-International")){  out.print(" selected='selected' ");}%> >English-International</option>
	               <option value="English-UK" <% if(qa.getTargetlanguage().equals("English-UK")){  out.print(" selected='selected' ");}%> >English-UK</option>
	               <option value="English-Canada" <% if(qa.getTargetlanguage().equals("English-Canada")){  out.print(" selected='selected' ");}%> >English-Canada</option>
	               <option value="English-New Zealand" <% if(qa.getTargetlanguage().equals("English-New Zealand")){  out.print(" selected='selected' ");}%> >English-New Zealand</option>
	               <option value="English-South Africa" <% if(qa.getTargetlanguage().equals("English-South Africa")){  out.print(" selected='selected' ");}%> >English-South Africa</option>
	               <option value="Estonian" <% if(qa.getTargetlanguage().equals("Estonian")){  out.print(" selected='selected' ");}%> >Estonian</option>
	               <option value="Faroese" <% if(qa.getTargetlanguage().equals("Faroese")){  out.print(" selected='selected' ");}%> >Faroese</option>
	               <option value="Farsi" <% if(qa.getTargetlanguage().equals("Farsi")){  out.print(" selected='selected' ");}%> >Farsi</option>
	               <option value="Fijian" <% if(qa.getTargetlanguage().equals("Fijian")){  out.print(" selected='selected' ");}%> >Fijian</option>
	               <option value="Filipino" <% if(qa.getTargetlanguage().equals("Filipino")){  out.print(" selected='selected' ");}%> >Filipino</option>
	               <option value="Finnish" <% if(qa.getTargetlanguage().equals("Finnish")){  out.print(" selected='selected' ");}%> >Finnish</option>
	               <option value="French-France" <% if(qa.getTargetlanguage().equals("French-France")){  out.print(" selected='selected' ");}%> >French-France</option>
	               <option value="French-Canada" <% if(qa.getTargetlanguage().equals("French-Canada")){  out.print(" selected='selected' ");}%> >French-Canada</option>
	               <option value="French-Swiss" <% if(qa.getTargetlanguage().equals("French-Swiss")){  out.print(" selected='selected' ");}%> >French-Swiss</option>
	               <option value="French-Belgium" <% if(qa.getTargetlanguage().equals("French-Belgium")){  out.print(" selected='selected' ");}%> >French-Belgium</option>
	               <option value="French-Luxembourg" <% if(qa.getTargetlanguage().equals("French-Luxembourg")){  out.print(" selected='selected' ");}%> >French-Luxembourg</option>
	               <option value="Frisian" <% if(qa.getTargetlanguage().equals("Frisian")){  out.print(" selected='selected' ");}%> >Frisian</option>
	               <option value="Fulani" <% if(qa.getTargetlanguage().equals("Fulani")){  out.print(" selected='selected' ");}%> >Fulani</option>
	               <option value="Ga" <% if(qa.getTargetlanguage().equals("Ga")){  out.print(" selected='selected' ");}%> >Ga</option>
	               <option value="Gaelic Irish" <% if(qa.getTargetlanguage().equals("Gaelic Irish")){  out.print(" selected='selected' ");}%> >Gaelic Irish</option>
	               <option value="Gaelic Scots" <% if(qa.getTargetlanguage().equals("Gaelic Scots")){  out.print(" selected='selected' ");}%> >Gaelic Scots</option>
	               <option value="Galician" <% if(qa.getTargetlanguage().equals("Galician")){  out.print(" selected='selected' ");}%> >Galician</option>
	               <option value="Ganda" <% if(qa.getTargetlanguage().equals("Ganda")){  out.print(" selected='selected' ");}%> >Ganda</option>
	               <option value="Georgian" <% if(qa.getTargetlanguage().equals("Georgian")){  out.print(" selected='selected' ");}%> >Georgian</option>
	               <option value="German-Germany" <% if(qa.getTargetlanguage().equals("German-Germany")){  out.print(" selected='selected' ");}%> >German-Germany</option>
	               <option value="German-Austrian" <% if(qa.getTargetlanguage().equals("German-Austrian")){  out.print(" selected='selected' ");}%> >German-Austrian</option>
	               <option value="German-Swiss" <% if(qa.getTargetlanguage().equals("German-Swiss")){  out.print(" selected='selected' ");}%> >German-Swiss</option>
	             	<option value="Gikuyu" <% if(qa.getTargetlanguage().equals("Gikuyu")){  out.print(" selected='selected' ");}%> >Gikuyu</option>
	             	<option value="Greek" <% if(qa.getTargetlanguage().equals("Greek")){  out.print(" selected='selected' ");}%> >Greek</option>
	             	<option value="Greenlandic" <% if(qa.getTargetlanguage().equals("Greenlandic")){  out.print(" selected='selected' ");}%> >Greenlandic</option>
	             	<option value="Guarani" <% if(qa.getTargetlanguage().equals("Guarani")){  out.print(" selected='selected' ");}%> >Guarani</option>
	             	<option value="Gujarati" <% if(qa.getTargetlanguage().equals("Gujarati")){  out.print(" selected='selected' ");}%> >Gujarati</option>
	             	<option value="Gun" <% if(qa.getTargetlanguage().equals("Gun")){  out.print(" selected='selected' ");}%> >Gun</option>
	             	<option value="Hausa" <% if(qa.getTargetlanguage().equals("Hausa")){  out.print(" selected='selected' ");}%> >Hausa</option>
	                <option value="Haya" <% if(qa.getTargetlanguage().equals("Haya")){  out.print(" selected='selected' ");}%> >Haya</option>
	                <option value="Hebrew" <% if(qa.getTargetlanguage().equals("Hebrew")){  out.print(" selected='selected' ");}%> >Hebrew</option>
	                <option value="Hiligaynon" <% if(qa.getTargetlanguage().equals("Hiligaynon")){  out.print(" selected='selected' ");}%> >Hiligaynon</option>
	                <option value="Hindi" <% if(qa.getTargetlanguage().equals("Hindi")){  out.print(" selected='selected' ");}%> >Hindi</option>
	                <option value="Hindi-Fiji" <% if(qa.getTargetlanguage().equals("Hindi-Fiji")){  out.print(" selected='selected' ");}%> >Hindi-Fiji</option>
	                <option value="Hmong" <% if(qa.getTargetlanguage().equals("Hmong")){  out.print(" selected='selected' ");}%> >Hmong</option>
	                <option value="Hungarian" <% if(qa.getTargetlanguage().equals("Hungarian")){  out.print(" selected='selected' ");}%> >Hungarian</option>
	                <option value="Ibanag" <% if(qa.getTargetlanguage().equals("Ibanag")){  out.print(" selected='selected' ");}%> >Ibanag</option>
	                <option value="Icelandic" <% if(qa.getTargetlanguage().equals("Icelandic")){  out.print(" selected='selected' ");}%> >Icelandic</option>
	                <option value="Igbo" <% if(qa.getTargetlanguage().equals("Igbo")){  out.print(" selected='selected' ");}%> >Igbo</option>
	                <option value="Ilocano" <% if(qa.getTargetlanguage().equals("Ilocano")){  out.print(" selected='selected' ");}%> >Ilocano</option>
	                <option value="Indonesian" <% if(qa.getTargetlanguage().equals("Indonesian")){  out.print(" selected='selected' ");}%> >Indonesian</option>
	                <option value="Inuktitut" <% if(qa.getTargetlanguage().equals("Inuktitut")){  out.print(" selected='selected' ");}%> >Inuktitut</option>
	                <option value="Isekiri" <% if(qa.getTargetlanguage().equals("Isekiri")){  out.print(" selected='selected' ");}%> >Isekiri</option>
	                <option value="Italian" <% if(qa.getTargetlanguage().equals("Italian")){  out.print(" selected='selected' ");}%> >Italian</option>
	                <option value="Italian-Switzerland" <% if(qa.getTargetlanguage().equals("Italian-Switzerland")){  out.print(" selected='selected' ");}%> >Italian-Switzerland</option>
	                <option value="Japanese" <% if(qa.getTargetlanguage().equals("Japanese")){  out.print(" selected='selected' ");}%> >Japanese</option>
	                <option value="Javanese" <% if(qa.getTargetlanguage().equals("Javanese")){  out.print(" selected='selected' ");}%> >Javanese</option>
	                <option value="K’iche’" <% if(qa.getTargetlanguage().equals("K’iche’")){  out.print(" selected='selected' ");}%> >K’iche’</option>
	                <option value="Kannada" <% if(qa.getTargetlanguage().equals("Kannada")){  out.print(" selected='selected' ");}%> >Kannada</option>
	                <option value="Kapampangan" <% if(qa.getTargetlanguage().equals("Kapampangan")){  out.print(" selected='selected' ");}%> >Kapampangan</option>
	                <option value="Kashmiri" <% if(qa.getTargetlanguage().equals("Kashmiri")){  out.print(" selected='selected' ");}%> >Kashmiri</option>
	                <option value="Kazakh" <% if(qa.getTargetlanguage().equals("Kazakh")){  out.print(" selected='selected' ");}%> >Kazakh</option>
	                <option value="Khmer" <% if(qa.getTargetlanguage().equals("Khmer")){  out.print(" selected='selected' ");}%> >Khmer</option>
	                <option value="Kirghiz" <% if(qa.getTargetlanguage().equals("Kirghiz")){  out.print(" selected='selected' ");}%> >Kirghiz</option>
	                <option value="Kituba" <% if(qa.getTargetlanguage().equals("Kituba")){  out.print(" selected='selected' ");}%> >Kituba</option>
	                <option value="Konkani" <% if(qa.getTargetlanguage().equals("Konkani")){  out.print(" selected='selected' ");}%> >Konkani</option>
	                <option value="Korean" <% if(qa.getTargetlanguage().equals("Korean")){  out.print(" selected='selected' ");}%> >Korean</option>
	                <option value="Krio" <% if(qa.getTargetlanguage().equals("Krio")){  out.print(" selected='selected' ");}%> >Krio</option>
	                <option value="Kurdish-Kurmanji" <% if(qa.getTargetlanguage().equals("Kurdish-Kurmanji")){  out.print(" selected='selected' ");}%> >Kurdish-Kurmanji</option>
	                <option value="Kurdish-Sorani" <% if(qa.getTargetlanguage().equals("Kurdish-Sorani")){  out.print(" selected='selected' ");}%> >Kurdish-Sorani</option>
	                <option value="Lao" <% if(qa.getTargetlanguage().equals("Lao")){  out.print(" selected='selected' ");}%> >Lao</option>
	                <option value="Latin" <% if(qa.getTargetlanguage().equals("Latin")){  out.print(" selected='selected' ");}%> >Latin</option>
	                <option value="Latvian" <% if(qa.getTargetlanguage().equals("Latvian")){  out.print(" selected='selected' ");}%> >Latvian</option>
	                <option value="Lingala" <% if(qa.getTargetlanguage().equals("Lingala")){  out.print(" selected='selected' ");}%> >Lingala</option>
	                <option value="Lithuanian" <% if(qa.getTargetlanguage().equals("Lithuanian")){  out.print(" selected='selected' ");}%> >Lithuanian</option>
	                <option value="Luo" <% if(qa.getTargetlanguage().equals("Luo")){  out.print(" selected='selected' ");}%> >Luo</option>
	                <option value="Luxembourgish" <% if(qa.getTargetlanguage().equals("Luxembourgish")){  out.print(" selected='selected' ");}%> >Luxembourgish</option>
	                <option value="Macedonian" <% if(qa.getTargetlanguage().equals("Macedonian")){  out.print(" selected='selected' ");}%> >Macedonian</option>
	                <option value="Makassar" <% if(qa.getTargetlanguage().equals("Makassar")){  out.print(" selected='selected' ");}%> >Makassar</option>
	                <option value="Malagasy" <% if(qa.getTargetlanguage().equals("Malagasy")){  out.print(" selected='selected' ");}%> >Malagasy</option>
	                <option value="Malay" <% if(qa.getTargetlanguage().equals("Malay")){  out.print(" selected='selected' ");}%> >Malay</option>
	                <option value="Malayalam" <% if(qa.getTargetlanguage().equals("Malayalam")){  out.print(" selected='selected' ");}%> >Malayalam</option>
	                	                 
					<option value="Maldivian (Dhivehi)">Maldivian (Dhivehi)</option>
					<option value="Maltese">Maltese</option>
					<option value="Maori">Maori</option>
					<option value="Marathi">Marathi</option>
					<option value="Mauritian Creole">Mauritian Creole</option>
					<option value="Moldovian">Moldovian</option>
					<option value="Mongolian">Mongolian</option>
					<option value="Montenegrin">Montenegrin</option>
					<option value="Moroccan Darija">Moroccan Darija</option>
					<option value="Nama">Nama</option>
					<option value="Ndebele">Ndebele</option>
					<option value="Nepali">Nepali</option>
					<option value="Nicaraguan">Nicaraguan</option>
					<option value="Nigerian Pidgin">Nigerian Pidgin</option>
					<option value="Norwegian">Norwegian</option>
					<option value="Norwegian-Nynorsk">Norwegian-Nynorsk</option>
					<option value="Nuer">Nuer</option>
					<option value="Ojibway">Ojibway</option>
					<option value="Oriya">Oriya</option>
					<option value="Oromo">Oromo</option>
					<option value="Papiamentu">Papiamentu</option>
					<option value="Pashto">Pashto</option>
					<option value="Polish">Polish</option>
					<option value="Portuguese-Brazil">Portuguese-Brazil</option>
					<option value="Portuguese-Portugal">Portuguese-Portugal</option>
					<option value="Punjabi-Indian">Punjabi-Indian</option>
					<option value="Punjabi-Pakistani">Punjabi-Pakistani</option>
					<option value="Quechua">Quechua</option>
					<option value="Romanian">Romanian</option>
					<option value="Romansch">Romansch</option>
					<option value="Rundi">Rundi</option>
					<option value="Russian">Russian</option>
					<option value="Rwanda">Rwanda</option>
					<option value="Sami">Sami</option>
					<option value="Samoan">Samoan</option>
					<option value="Sepedi">Sepedi</option>
					<option value="Serbian-Cyrillic">Serbian-Cyrillic</option>
					<option value="Serbian-Latin">Serbian-Latin</option>
					<option value="Sesotho">Sesotho</option>
					<option value="Shona">Shona</option>
					<option value="Sindhi">Sindhi</option>
					<option value="Sinhala">Sinhala</option>
					<option value="Lakota">Lakota</option>
					<option value="Dakota">Dakota</option>
					<option value="Sioux">Sioux</option>
					<option value="Slovak">Slovak</option>
					<option value="Slovenian">Slovenian</option>
					<option value="Somali">Somali</option>
					<option value="Spanish-Argentinean">Spanish-Argentinean</option>
					<option value="Spanish-Chilean">Spanish-Chilean</option>
					<option value="Spanish-Colombian">Spanish-Colombian</option>
					<option value="Spanish-Spain">Spanish-Spain</option>
					<option value="Spanish-Guatemalan">Spanish-Guatemalan</option>
					<option value="Spanish-International">Spanish-International</option>
					<option value="Spanish-Latin American">Spanish-Latin American</option>
					<option value="Spanish-Mexican">Spanish-Mexican</option>
					<option value="Spanish-Peruvian">Spanish-Peruvian</option>
					<option value="Spanish-Uruguayan">Spanish-Uruguayan</option>
					<option value="Spanish-Venezulean">Spanish-Venezulean</option>
					<option value="Spanish-Bolivia">Spanish-Bolivia</option>
					<option value="Spanish-Costa Rica">Spanish-Costa Rica</option>
					<option value="Spanish-Ecuador">Spanish-Ecuador</option>
					<option value="Spanish-El Salvador">Spanish-El Salvador</option>
					<option value="Spanish-Nicaragua">Spanish-Nicaragua</option>
					<option value="Spanish-Panama">Spanish-Panama</option>
					<option value="Spanish-Paraguay">Spanish-Paraguay</option>
					<option value="Spanish-Puerto Rico">Spanish-Puerto Rico</option>
					<option value="Spanish-Cuban">Spanish-Cuban</option>
					<option value="Sudanese">Sudanese</option>
					<option value="Sundanese">Sundanese</option>
					<option value="Swahili">Swahili</option>
					<option value="Swati">Swati</option>
					<option value="Swedish">Swedish</option>
					<option value="Tagalog">Tagalog</option>
					<option value="Tajik">Tajik</option>
					<option value="Tamil">Tamil</option>
					<option value="Tatar">Tatar</option>
					<option value="Telugu">Telugu</option>
					<option value="Thai">Thai</option>
					<option value="Tibetan">Tibetan</option>
					<option value="Tigrinya">Tigrinya</option>
					<option value="Tok Pisin">Tok Pisin</option>
					<option value="Tooro">Tooro</option>
					<option value="Tsonga">Tsonga</option>
					<option value="Tswana">Tswana</option>
					<option value="Turkish">Turkish</option>
					<option value="Turkmen">Turkmen</option>
					<option value="Uighur">Uighur</option>
					<option value="Ukrainian">Ukrainian</option>
					<option value="Urdu">Urdu</option>
					<option value="Uzbek">Uzbek</option>
					<option value="Uzbek (Latin)">Uzbek (Latin)</option>
					<option value="Valencian">Valencian</option>
					<option value="Venda">Venda</option>
					<option value="Vietnamese">Vietnamese</option>
					<option value="Welsh">Welsh</option>
					<option value="Xhosa">Xhosa</option>
					<option value="Yiddish">Yiddish</option>
					<option value="Yoruba">Yoruba</option>
					<option value="Zhuang">Zhuang</option>
					<option value="Zulu">Zulu</option>
				    </select>
                    <span class='redtext'>*</span></td>
                    
                    <td align="center" style="height:25px;background:#66a9bd;" ><span class='title'>Adequacy Level</span></td>
                    <td><select id="adequacylevel" name="adequacylevel"    style="width:90%;height:20px;font-size:10px">
						<option value="Publishable"  <% if(qa.getAdequacylevel().equals("Publishable")){  out.print(" selected='selected' ");} %> >Publishable</option>
						<option value="Understandable"  <% if(qa.getAdequacylevel().equals("Understandable")){  out.print(" selected='selected' ");} %>>Understandable</option>
				    </select></td>
                 </tr>
                  
                      <tr>  
                 <td align="center" colspan="4" bgcolor="#C8C8C8" ><span class='title'>&nbsp;</span></td>
               
                 </tr> 
        
            </table>  
           
               <table width="94%" align="center" border="1" cellspacing="0" cellpadding="0" bordercolor=#000000 style="border-collapse:collapse">  
            
                 <tr>  
                    <td  align="center" style="height:25px;background:#66a9bd;"><span class='title'>Error Category</span></td>
                    <td  align="center" ><span class='title'>Abbrev.</span></td>
                    <td  align="center" ><span class='title'>Minor Error</span></td>
                    <td  align="center" ><span class='title'>Weighted Error Points</span></td>
                    <td  align="center" ><span class='title'>Serious Error</span></td>
                    <td  align="center" ><span class='title'>Weighted Error Points</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>Critical  Error</span></td>
                    <td  align="center" ><span class='title'>Category Error Points</span></td>
                </tr> 
                
                <tr>  
                    <td  align="center" style="height:25px;background:#66a9bd;"><span class='title'>Wrong Term</span></td>
                    <td  align="center" ><span class='title'>WT</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="wrongminor"   name="wrongminor" value="<%=qa.getWrongminor() %>" style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="wrongweighted"     name="wrongweighted" value="<%=qa.getWrongweighted()%>" style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="wrongserious"     name="wrongserious" value="<%=qa.getWrongserious() %>" style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="wrongpoints"     name="wrongpoints" value="<%=qa.getWrongpoints()%>" style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="wrongcritical"     name="wrongcritical" value="<%=qa.getWrongcritical()%>" style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="wrongcategory"     name="wrongcategory" value="<%=qa.getWrongcategory() %>" style="width:90%;height:20px;font-size:10px"  ></span></td>
                </tr> 
                              
               <tr>  
                    <td  align="center" style="height:25px;background:#66a9bd;"><span class='title'>Wrong Meaning</span></td>
                    <td  align="center" ><span class='title'>WM</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningminor"     name="meaningminor" value="<%=qa.getMeaningminor()  %>"  style="width:90%;height:20px;font-size:10px"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningweighted"     name="meaningweighted" value="<%=qa.getMeaningweighted()  %>"  style="width:90%;height:20px;font-size:10px"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningserious"     name="meaningserious" value="<%=qa.getMeaningserious() %>"  style="width:90%;height:20px;font-size:10px"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningpoints"     name="meaningpoints" value="<%=qa.getMeaningpoints() %>"  style="width:90%;height:20px;font-size:10px"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningcritical"     name="meaningcritical" value="<%=qa.getMeaningcritical() %>"  style="width:90%;height:20px;font-size:10px"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningcategory"     name="meaningcategory" value="<%=qa.getMeaningcategory() %>"  style="width:90%;height:20px;font-size:10px"></span></td>
                </tr> 
               
                <tr>  
                    <td  align="center" style="height:25px;background:#66a9bd;"><span class='title'>Omission</span></td>
                    <td  align="center" ><span class='title'>OM</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissionminor"     name="omissionminor" value="<%=qa.getOmissionminor() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissionweighted"     name="omissionweighted" value="<%=qa.getOmissionweighted() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissionserious"     name="omissionserious" value="<%=qa.getOmissionserious() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissionpoints"     name="omissionpoints" value="<%=qa.getOmissionpoints() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissioncritical"     name="omissioncritical" value="<%=qa.getOmissioncritical() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissioncategory"     name="omissioncategory" value="<%=qa.getOmissioncategory()%>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                </tr> 
               
                         <tr>  
                    <td  align="center" style="height:25px;background:#66a9bd;"><span class='title'>Structural Error</span></td>
                    <td  align="center" ><span class='title'>SE</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="structuralnminor"     name="structuralnminor" value="<%=qa.getStructuralnminor() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="structuralweighted"     name="structuralweighted" value="<%=qa.getStructuralweighted() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="structuralserious"     name="structuralserious" value="<%=qa.getStructuralserious() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="structuralcritical"     name="structuralcritical" value="<%=qa.getStructuralcritical() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="structuralpoints"     name="structuralpoints" value="<%=qa.getStructuralpoints() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    
                    <td  align="center" ><span class='title'><input type="text" id="structuralcategory"     name="structuralcategory" value="<%=qa.getStructuralcategory() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                </tr> 
                                          
                        <tr>  
                    <td  align="center" style="height:25px;background:#66a9bd;"><span class='title'>Misspelling</span></td>
                    <td  align="center" ><span class='title'>SP</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="misspellingminor"     name="misspellingminor" value="<%=qa.getMisspellingminor() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="misspellingweighted"     name="misspellingweighted" value="<%=qa.getMisspellingweighted() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="misspellingserious"     name="misspellingserious" value="<%=qa.getMisspellingserious()%>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="misspellingpoints"     name="misspellingpoints" value="<%=qa.getMisspellingpoints() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="misspellingcritical"     name="misspellingcritical" value="<%=qa.getMisspellingcritical() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="misspellingcategory"     name="misspellingcategory" value="<%=qa.getMisspellingcategory() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                </tr> 
              
                        <tr>  
                    <td  align="center" style="height:25px;background:#66a9bd;"><span class='title'>Punctuation</span></td>
                    <td  align="center" ><span class='title'>PE</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="punctuationminor"     name="punctuationminor" value="<%=qa.getPunctuationminor()%>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="punctuationweighted"     name="punctuationweighted" value="<%=qa.getPunctuationweighted()%>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="punctuationserious"     name="punctuationserious" value="<%=qa.getPunctuationserious()%>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="punctuationpoints"     name="punctuationpoints" value="<%=qa.getPunctuationpoints() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="punctuationcritical"     name="punctuationcritical" value="<%=qa.getPunctuationcritical() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="punctuationcategory"     name="punctuationcategory" value="<%=qa.getPunctuationcategory() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                </tr> 


             <tr>  
                    <td  align="center" style="height:25px;background:#66a9bd;" ><span class='title'>Style</span></td>
                    <td  align="center" ><span class='title'>ST</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="styleminor"     name="styleminor" value="<%=qa.getStyleminor() %>"  style="width:90%;height:20px;font-size:10px"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="styleweighted"     name="styleweighted" value="<%=qa.getStyleweighted() %>"  style="width:90%;height:20px;font-size:10px"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="styleserious"     name="styleserious" value="<%=qa.getStyleserious()%>" style="width:90%;height:20px;font-size:10px"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="stylepoints"     name="stylepoints" value="<%=qa.getStylepoints() %>"  style="width:90%;height:20px;font-size:10px"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="stylecritical"     name="stylecritical" value="<%=qa.getStylecritical() %>"  style="width:90%;height:20px;font-size:10px"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="stylecategory"     name="stylecategory" value="<%=qa.getStylecategory() %>"  style="width:90%;height:20px;font-size:10px"></span></td>
                </tr> 
                
                             <tr>  
                    <td  align="center" style="height:25px;background:#66a9bd;"><span class='title'>Miscellaneous</span></td>
                    <td  align="center" ><span class='title'>ME</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="miscellaneousminor"     name="miscellaneousminor" value="<%=qa.getMiscellaneousminor() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="miscellaneousweighted"     name="miscellaneousweighted" value="<%=qa.getMiscellaneousweighted()%>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="miscellaneousserious"     name="miscellaneousserious" value="<%=qa.getMiscellaneousserious()%>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="miscellaneouspoints"     name="miscellaneouspoints" value="<%=qa.getMiscellaneouspoints() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="miscellaneouscritical"     name="miscellaneouscritical" value="<%=qa.getMiscellaneouscritical() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="miscellaneouscategory"     name="miscellaneouscategory" value="<%=qa.getMiscellaneouscategory() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                </tr> 
                   
               
                <tr>  
                    <td  align="center" colspan="3" style="height:25px;background:#66a9bd;"><span class='title'>Legacy Data Errors</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="legacydataerrors"     name="legacydataerrors" value="<%=qa.getLegacydataerrors() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" colspan="3"  style="height:25px;background:#66a9bd;" ><span class='title'>Source Text Errors</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="sourcetexterrors"     name="sourcetexterrors" value="<%=qa.getSourcetexterrors() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                </tr> 
                
            </table>    
            
            
                 <table width="94%" align="center" border="1" cellspacing="0" cellpadding="0" bordercolor=#000000 style="border-collapse:collapse"  >  
            
                 <tr>  
                    <td  align="center" colspan="5" bgcolor="#C8C8C8" style="height:25px;"><span class='title'>Quality Scoring Matrix</span></td>
                </tr> 
                <tr>  
                    <td  align="center" style="height:25px;background:#66a9bd;"><span class='title'>Error Points Allowed</span></td>
                    <td  align="center" style="height:25px;background:#66a9bd;"><span class='title'>Total Category Error Points</span></td>
                    <td  align="center" style="height:25px;background:#66a9bd;"><span class='title'>% Quality Indicator (100% max)</span></td>
                </tr> 
                <tr>  
                    <td  align="center" style="height:25px;"><span class='title'><input type="text" id="errorpointsallowed"     name="errorpointsallowed" value="<%=qa.getErrorpointsallowed() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="totalcategoryerrorpoints"  name="totalcategoryerrorpoints" value="<%=qa.getTotalcategoryerrorpoints() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="qualityindicator"     name="qualityindicator" value="<%=qa.getQualityindicator() %>"  style="width:90%;height:20px;font-size:10px"  ></span></td>
                </tr> 
                  <tr>  
                    <td  align="center" colspan="5" bgcolor="#C8C8C8" style="height:25px;" ><span class='title'><input type="text" id="sdlqualityindicator_show"     name="sdlqualityindicator_show"  value="<%=qa.getSdlqualityindicator_show() %>" readonly="readonly" style="width:10%;height:20px;background:#E0E0E0;font-size:10px" readonly="readonly"  >
                    <input type="text" id="sdlqualityindicator"     name="sdlqualityindicator" value="<%=qa.getSdlqualityindicator() %>"  onBlur="calutesdlqualityindicator()" style="height:20px;font-size:10px" >SDL Quality Indicator						
                    </span></td>
                </tr> 
                
                 <tr>  
                    <td align="center" colspan="5"><input type="text" id="sdlqualityinfor"     name="sdlqualityinfor"   value="<%=qa.getSdlqualityinfor() %>"   style="width:90%;height:30px"></td>
                </tr> 
                
                
                        
                         <tr>  
                    <td  align="center" colspan="5" style="height:25px;background:#66a9bd;"  ><span class='title'>Instructions:	Enter error details in the 'Evaluation details_input' sheet (yellow tab).									
	See 'Errors & Weighting Definition' sheet for explanation of error categories.									
                    </span></td>
                </tr> 
                
                
                         <tr>  
                    <td  align="center" colspan="2"  bgcolor="#C8C8C8" ><span class='title'>OVERALL READABILITY & COMMENTS   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Select grade for overall Readability >>></span></td>
                    <td  align="center"  colspan="3"  ><span class='title'><select id="qastatus" name="qastatus"    style="width:90%;height:20px;font-size:10px">
                       						<option value="Good"  <% if(qa.getQastatus().equals("Good")){  out.print(" selected='selected' ");} %> >Good</option>
                       						<option value="Excellent"  <% if(qa.getQastatus().equals("Excellent")){  out.print(" selected='selected' ");} %> >Excellent</option>
                       						<option value="Satisfactory"  <% if(qa.getQastatus().equals("Satisfactory")){  out.print(" selected='selected' ");} %> >Satisfactory</option>
                       						<option value="Below Standard"  <% if(qa.getQastatus().equals("Below Standard")){  out.print(" selected='selected' ");} %> >Below Standard</option>
                       						<option value="Poor"  <% if(qa.getQastatus().equals("Poor")){  out.print(" selected='selected' ");} %> >Poor</option>
                       						
                       </select></span></td>
                
                </tr> 
                
                
                 <tr> 
     <td colspan="4" ><span class='title'></span><input type="text" id="comment" name="comment" value="<%=qa.getComment() %>"  style="width:100%;height:100px;;font-size:10px"  ></td>
	  </tr>      
            </table>    
             

      <br>
      
      <center><input type="button" id="updateqa"  value="Upate"  style="width:60px;height:25px;" />
<!--       <input type="file" id="upfile" name="file"  /><input type="button" onclick="ReadExcel();" value="import"> <input type="hidden" name="fileFileName" value="tttt" />
 -->      </center>
  
        </form> 
        
       

     
    </body>  
</html>  