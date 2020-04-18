<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Add Qa</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/auto.js"></script>
    <link href="css/commoncss.css" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="js3/calendar.js"></script>
    <script type="text/javascript" src="js/costcode.js"></script>


    
	<style type="text/css">
		body{
     margin:0px;
     background-color:rgba(204, 204, 204, 0.168627450980392);
     background-image:none;
}
	            table
        {
            border-collapse: collapse;
            border: none;
        }  
        td 
			{ 
			border: solid #000 1px; 
			} 
			  
	
	
	
.title{
  font-size: 11px;
  font-family:Arial,Tahoma,Verdana;
  color: back;
}
	.redtext{
	   color:red;
	}
	#auto {

background:#ff0000;
color:#ffffff;
}
.biaoti{
    margin-top:20px;
 	font-size: 14px;
	font-family : Arial,Tahoma,Verdana;
	color: #033d61; 
}
.addform{
      margin-top:20px;  
} 
	</style>
	<script type="text/javascript">


	  function calutesdlqualityindicator() {
	  	  var code = document.getElementById("sdlqualityindicator").value;
	      if(code >=4 ) {
	      document.getElementById("sdlqualityindicator_show").value = "Pass";
	      }else if(code<4) {
	          document.getElementById("sdlqualityindicator_show").value = "No Pass";
	      }
              
	  }
	  
	  
	 function checkpost() {
       
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
        XMLHttpReq.open("GET", url, false);
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
                if(fwbz=="readexcel") {
                    fuqazhi();
                }
                  if(fwbz=="upfile") {
                    checkfile();
                }
                
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
    }
    
        //更新菜单函数
     function getVendorId() { 
        var vendorid=XMLHttpReq.responseXML.getElementsByTagName("vendorid")[0].firstChild.data;
        if(vendorid=="notfound"){
           alert("Vendor Name has not existed！");
           document.getElementById("word").value="";
           document.getElementById("vendorid").value="";          
        }else if(vendorid!="111") {
           document.getElementById("vendorid").value=vendorid;
        }
       
       var clientname=XMLHttpReq.responseXML.getElementsByTagName("clientname")[0].firstChild.data;
       var sdlbusinessunit=XMLHttpReq.responseXML.getElementsByTagName("sdlbusinessunit")[0].firstChild.data;
       
       
       document.getElementById("clientname").value=clientname;
       document.getElementById("sdlbusinessunit").value=sdlbusinessunit;        
     }
     
     var checkexistfile="false";
     //校验文件
     function checkfile() { 
        checkexistfile=XMLHttpReq.responseXML.getElementsByTagName("checkexistfile")[0].firstChild.data;
        return  checkexistfile;
     }
     
          
          //更新菜单函数
     function caluteClientNameandSDLBusinessUnit() {   
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        var a = res.split("||||");
        document.getElementById("clientname").value=a[0];
        document.getElementById("sdlbusinessunit").value=a[1];        
     }
     
 
        // 创建级联菜单函数
     function autocalute(){
         fwbz = "calute";
         var sdlcostcode = document.getElementById("costcode").value;
         if(sdlcostcode.length>0){
            var sdlbusinessunit = sdlcostcode.substr(5, 2);
            sendRequest("calute.jsp?sdlcostcode="+sdlcostcode+"&code_sdlbusinessunit="+sdlbusinessunit);  
         }
    }
    
    // 创建级联菜单函数
    function showVendorId() {
       fwbz = "vendorid"; 
       var sdlbusinessunit=""; 
	   var word = encodeURI(document.getElementById("word").value);
	   var sdlcostcode = document.getElementById("costcode").value;
	    if(sdlcostcode.length>0){
            sdlbusinessunit = sdlcostcode.substr(5, 2);
            //sendRequest("calute.jsp?sdlcostcode="+sdlcostcode+"&code_sdlbusinessunit="+sdlbusinessunit);  
         }
      
         word=word.replace("&","20170101cheng");
         word = encodeURI(word);  //需要通过两次编码
         var url = "getVendorId.jsp?vendorname="+word+"&sdlcostcode="+sdlcostcode+"&code_sdlbusinessunit="+sdlbusinessunit;
         sendRequest(url);               
        //自动带出Client Name 和  SDL Business Unit
        //autocalute();
    }
    
    
     // 读EXCE
    function ReadExcel() {
             fwbz = "readexcel";
             var file_upl = document.getElementById('upfile');
             file_upl.select();
             var realpath = document.selection.createRange().text;
             sendRequest("readexcel.jsp?filename="+ realpath);        
      }
    

$(document).ready(function () {
       $("#addqaform").click(function () {        
    
          
         var lead = document.getElementById("lead").value;
         if(lead=="" || lead==null || lead== undefined ) 
          {
             alert("Login failed, please login again");
             return false;
          }
          
         var word = document.getElementById("word").value;
         if(word=="" || word==null || word== undefined ) 
          {
             alert("Vendor Name must be inserted ");
             return false;
          } 
          
         var vendorid = document.getElementById("vendorid").value;
         if(vendorid=="" || vendorid==null || vendorid== undefined ) 
          {
             alert("Vendor Id must be inserted ");
             return false;
          } 
          
          
         var matches = document.getElementById("matches").value;
         if(matches=="" || matches==null || matches== undefined ) 
          {
             alert("100%matches must be inserted ");
             return false;
          } 
          
         var sdlcostcode = document.getElementById("sdlcostcode").value;
         if(sdlcostcode=="" || sdlcostcode==null || sdlcostcode== undefined ) 
          {
             alert("SDL cost code must be inserted ");
             return false;
          } 
          
                    
         var sdlnetworkoffice = document.getElementById("sdlnetworkoffice").value;
         if(sdlnetworkoffice=="" || sdlnetworkoffice==null || sdlnetworkoffice== undefined ) 
          {
             alert("SDL Network Office must be inserted ");
             return false;
          } 
          
         var clientname = document.getElementById("clientname").value;
         if(clientname=="" || clientname==null || clientname== undefined) 
          {
             alert("Client Name must be inserted ");
             return false;
          } 
          
          if(clientname=="notfound") 
          {
             alert("Client Name cannot be  notfound");
             return false;
          } 
          
          
          
         var sdlbusinessunit = document.getElementById("sdlbusinessunit").value;
         if(sdlbusinessunit=="" || sdlbusinessunit==null || sdlbusinessunit== undefined ) 
          {
             alert("SDL Business Unit must be inserted ");
             return false;
          } 
          
          if(sdlbusinessunit=="notfound") 
          {
             alert("SDL Business Unit cannot be  notfound");
             return false;
          } 
          
          
         var sector = document.getElementById("sector").value;
         if(sector=="" || sector==null || sector== undefined ) 
          {
             alert("Sector must be inserted ");
             return false;
          } 
          
          var translatorname = document.getElementById("translatorname").value;
         if(translatorname=="" || translatorname==null || translatorname== undefined ) 
          {
             alert("Translator Name must be inserted ");
             return false;
          } 
          
         var reviewername = document.getElementById("reviewername").value;
         if(reviewername=="" || reviewername==null || reviewername== undefined ) 
          {
             alert("Reviewer Name  must be inserted ");
             return false;
          } 
          
                  
         var sdlqualityindicator = document.getElementById("sdlqualityindicator").value;
         if(sdlqualityindicator < 0 ) 
          {
             alert("Sdl Quality Indicator   must be greater than  0  ");
             return false;
          } 
          
         var evaluatorname = document.getElementById("evaluatorname").value;
         if(evaluatorname=="" || evaluatorname==null || evaluatorname== undefined ) 
          {
             alert("Evaluator name must be inserted ");
             return false;
          } 
               
         var componenttype = document.getElementById("componenttype").value;
         if(componenttype=="" || componenttype==null || componenttype== undefined ) 
          {
             alert("Component type name must be inserted ");
             return false;
          } 
               
         var sourcelanguage = document.getElementById("sourcelanguage").value;
         if(sourcelanguage=="" || sourcelanguage==null || sourcelanguage== undefined ) 
          {
             alert("Source Language name must be inserted ");
             return false;
          } 
                   
         var wordcount = document.getElementById("wordcount").value;
         if(wordcount=="" || wordcount==null || wordcount== undefined ) 
          {
             alert("Word Count name must be inserted ");
             return false;
          } 
                   
         var targetlanguage = document.getElementById("targetlanguage").value;
         if(targetlanguage=="" || targetlanguage==null || targetlanguage== undefined ) 
          {
             alert("Target Language name must be inserted ");
             return false;
          } 
          
         var adequacylevel = document.getElementById("adequacylevel").value;
         if(adequacylevel=="" || adequacylevel==null || adequacylevel== undefined ) 
          {
             alert("Adequacy Level name must be inserted ");
             return false;
          } 
          
         var totalcategoryerrorpoints = document.getElementById("totalcategoryerrorpoints").value;
         if(totalcategoryerrorpoints=="" || totalcategoryerrorpoints==null || totalcategoryerrorpoints== undefined ) 
          {
             alert("Total Category Error Points must be inserted ");
             return false;
          } 
          
          
         var errorpointsallowed = document.getElementById("errorpointsallowed").value;
         if(errorpointsallowed=="" || errorpointsallowed==null || errorpointsallowed== undefined ) 
          {
             alert("Error Points Allowed must be inserted ");
             return false;
          } 
          
         var qualityindicator = document.getElementById("qualityindicator").value;
         if(qualityindicator=="" || qualityindicator==null || qualityindicator== undefined ) 
          {
             alert("Quality Indicator  must be inserted ");
             return false;
          } 
              
         var qadate = document.getElementById("qadate").value;
         if(qadate=="" || qadate==null || qadate== undefined ) 
          {
             alert("Date must be inserted ");
             return false;
          } 
          

   
        //必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法
        var params = $("#qaqaForm").serialize();
        $.ajax({
            url:'addqaqa.action',
            type:'post',
            data:params,
            dataType:'json',
            success:function (data) {
            	alert("Increased Sucess");
            },
            error:function(XMLResponse){
                  alert(XMLResponse.responseText);
            },
             complete: function(){ 
                window.document.location.href="addqa.jsp";
             }
            
            
        });
       
    });
   

});   
             
         
function test() {
        var upfile = document.getElementById('upfile').value;
        if(upfile==""||upfile==null)
         {
            alert("Please Choose File");
            return false;
         }else {
		         var file = $("#upfile").val();
		         var fileName = getFileName(file);
                 fwbz = "upfile"; 
                 sendRequest("checkfile.jsp?filename="+fileName);
                 if(checkexistfile=="false"){
                     return true;
                 }else {
                     alert(fileName+"Have been uploaded ");
                     return false;
                 }
         }
         
            
} 
  
function getFileName(o){
    var pos=o.lastIndexOf("\\");
    return o.substring(pos+1);  
}


$(function($) {
           $('body').click(function() {  
                    showVendorId();
                    //autocalute();
            });  
  });



    // 创建级联菜单函数
    function gettranslatorname(){
              var translatorname=document.getElementById("translatorname").value;
              var ren = window.showModalDialog("getlead.jsp?lead="+translatorname,"","dialogwidth:400px;dialogheight:450px;center:1;status:0");
                 if(ren==undefined){
	             ren="";
	           }
	           document.getElementById("translatorname").value = ren;
                   
    }
    
        // 创建级联菜单函数
    function getreviewername(){
              var reviewername=document.getElementById("reviewername").value;
              var ren = window.showModalDialog("getlead.jsp?lead="+reviewername,"","dialogwidth:400px;dialogheight:450px;center:1;status:0");
                 if(ren==undefined){
	             ren="";
	           }
	           document.getElementById("reviewername").value = ren;
                   
    }

        // 创建级联菜单函数
    function getreviewername(){
              var reviewername=document.getElementById("reviewername").value;
              var ren = window.showModalDialog("getlead.jsp?lead="+reviewername,"","dialogwidth:400px;dialogheight:450px;center:1;status:0");
                 if(ren==undefined){
	             ren="";
	           }
	           document.getElementById("reviewername").value = ren;
                   
    }
    
            // 创建级联菜单函数
    function getevaluatorname(){
              var evaluatorname=document.getElementById("evaluatorname").value;
              var ren = window.showModalDialog("getlead.jsp?lead="+evaluatorname,"","dialogwidth:400px;dialogheight:450px;center:1;status:0");
                 if(ren==undefined){
	             ren="";
	           }
	           document.getElementById("evaluatorname").value = ren;
    }
    
    
    
         
  </script>
    		
</head>  
<body>   
                                         <div class="biaoti"><center>Add QA</center></div>
                                         
           <div class="addform">                
          <form action="fileUpload.action" method="post"  id="qaqaForm" name="qaqaForm"  enctype="multipart/form-data"  onsubmit="return test();">   
           <table width="94%" align="center" border="1" >  
                
                  <tr>  
                 <td align="center" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>Vendor Name</span></td>
                 <td>
               <input type="text" id="word"     name="word"  autocomplete="off"  style="width:90%;height:20px"  ><span class='redtext'>*</span><div id = "auto"> </div>
                 </td>
                 
                  <td style="display:none">
               <input type="text" id="lrr"     name="lrr"  value="<%=session.getAttribute("username") %>"  style="width:90%;height:20px"  ><span class='redtext'>*</span></div>
                 </td>
                 
                 
               <td align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Vendor ID</span></td>
                 <td><input type="text" id="vendorid"     name="vendorid"  onclick="showVendorId()"    readonly="readonly"   style="width:90%;height:20px;background:#E0E0E0"  ><span class='redtext'>*</span></td>
               
                 </tr>
                 <tr>  
                 <td align="center" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>Lead</span></td>
                 <td><input type="text" id="lead"     name="lead"   value="<%=session.getAttribute("username") %>"   readonly="readonly"  style="width:90%;height:20px;font-size:10px;background:#E0E0E0"   ><span class='redtext'>*</span></td>
                 <td align="center" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>Manager</span></td>
                 <td><input type="text" id="lmorgl"     name="lmorgl"   value="<%=session.getAttribute("lmorgl") %>"   readonly="readonly"    style="width:90%;height:20px;font-size:10px;background:#E0E0E0"   ><span class='redtext'>*</span></td>
                 </tr> 
                 <tr>  
                 <td align="center" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>100% Matches</span></td>
                 
                 <td>
                     <select id ="matches" name="matches" style="width:90%;height:20px;font-size:10px;">
				     <option value="You Must Review">You Must Review</option>
				     <option value="Do NOT Review">Do NOT Review</option>
				     </select>
				     
                     <span class='redtext'>*</span></td>
                               
                     <td align="center" ><span class='title'>&nbsp;</span></td>
                 <td> &nbsp;</td> 
                 </tr> 
                 
                 
                <tr>  
                 <td align="center" colspan="4" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>&nbsp;</span></td>
               </tr> 
                 
                  <tr>  
                    <td width="20%" align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Client Name</span></td>
                    <td width="30%"><input id="clientname" name="clientname" autocomplete="off"  type="text"   readonly="readonly"  style="width:90%;height:20px;background:#E0E0E0"   /><span class='redtext'>*</span></td>
                    <td width="20%" align="center" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>SDL Business Unit</span></td>
                     <td  width="30%"><input  type="text" id="sdlbusinessunit"   name="sdlbusinessunit" readonly="readonly"  style="width:90%;height:20px;background:#E0E0E0" /><span class='redtext'>*</span></td>
                </tr> 
                              
                              
                 
               <tr>  
                 <td align="center"  style="height:25px;" bgcolor='#e5f1f4'><span class='title'>SDL Cost Code</span></td>
                 <td><input type="text" id="costcode"     name="sdlcostcode" autocomplete="off"  onBlur="autocalute();"   style="width:90%;height:20px"  ><div id ="costcodeauto"></div><span class='redtext'>*</span></td>
                 <td align="center" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>SDL Lanaguage Office</span></td>
                 <td>
                     <select id ="sdlnetworkoffice" name="sdlnetworkoffice" style="width:90%;height:20px;font-size:11px;">
				     <option value="Brazil">Brazil</option>
						  <option value="Chile">Chile</option>
						  <option value="China">China</option>
						  <option value="Croatia">Croatia</option>
						  <option value="Czech Republic">Czech Republic</option>
						  <option value="Denmark">Denmark</option>
						  <option value="English Network">English Network</option>
						  <option value="Finland">Finland</option>
						  <option value="France">France</option>
						  <option value="German Network">German Network</option>
						  <option value="Greece">Greece</option>
						  <option value="Hengelo Network">Hengelo Network</option>
						  <option value="Hungary">Hungary</option>
						  <option value="India">India</option>
						  <option value="Italy">Italy</option>
						  <option value="Japan">Japan</option>
						  <option value="Korea">Korea</option>
						  <option value="Lebanon">Lebanon</option>
						  <option value="Montreal Network">Montreal Network</option>
						  <option value="Norway">Norway</option>
						  <option value="Poland">Poland</option>
						  <option value="Portugal">Portugal</option>
						  <option value="Romania">Romania</option>
						  <option value="Russia">Russia</option>
						  <option value="Singapore">Singapore</option>
						  <option value="Slovenia">Slovenia</option>
						  <option value="Spain">Spain</option>
						  <option value="Sweden">Sweden</option>
						  <option value="Taiwan">Taiwan</option>
						  <option value="Thailand">Thailand</option>
						  <option value="Turkey">Turkey</option>
						  <option value="Vietnam">Vietnam</option>
						  <option value="External Vendor">External Vendor</option>
				     </select>
                     <span class='redtext'>*</span></td>
                 </tr>
                 
                 <tr>  
                 <td align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Sector</span></td>
                 <td>
                   <select id ="sector" name="sector" style="width:90%;height:20px;font-size:11px;">
						<option value="Aerospace">Aerospace</option>
						<option value="Automotive">Automotive</option>
						<option value="Commercial">Commercial</option>
					    <option value="Consumer">Consumer</option>
						<option value="Defence">Defence</option>
						<option value="EnergyUtilities">Energy & Utilities</option>
						<option value="Finance">Finance</option>
						<option value="Games">Games</option>
						<option value="General">General</option>
						<option value="IT">IT</option>
						<option value="Legal">Legal</option>
						<option value="Life Sciences">Life Sciences</option>
						<option value="Manufacturing">Manufacturing</option>
						<option value="MechanicalEngineering">Mechanical Engineering</option>
						<option value="Patents">Patents</option>
						<option value="Telecommunications">Telecommunications</option>
						<option value="TravelTourism">Travel&Tourism</option>
						</select>
                 <span class='redtext'>*</span></td>
                 
                 
                 
                 <td align="center" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>Translator Name</span></td>
                 <td><input type="text" id="translatorname"  name="translatorname"  onblur="gettranslatorname()"   style="width:90%;height:20px"  ><span class='redtext'>*</span></td>
                 </tr>
                 <tr>  
                    <td align="center" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>Translation Type</span></td>
                    <td>
                    
                    <select id="translationtype" name="translationtype" style="width:90%;height:20px;font-size:11px;">
						<option value="Conventional">Conventional</option>
						<option value="i-MTpost-edit">i-MT post-edit</option>
				    </select>
                    <span class='redtext'>*</span></td>
                   
                    <td align="center" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>Reviewer Name</span></td>
                    <td><input type="text" id="reviewername"  name="reviewername" onblur="getreviewername()" style="width:90%;height:20px"  ><span class='redtext'>*</span></td>
                 </tr>
                 
                              
               
                     <tr>  
                    <td align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Section Evaluated</span></td>
                    <td><input type="text" id="sectionevaluated"     name="sectionevaluated" style="width:90%;height:20px"  ></td>
                    <td align="center" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>Evaluator Name</span></td>
                    <td><input type="text" id="evaluatorname"  name="evaluatorname"  onblur="getevaluatorname()"    style="width:90%;height:20px"  ></td>
                 </tr>
                 
             
                  <tr>  
                    <td align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Evaluation Type</span></td>
                    <td><select id="evaluatedtype" name="evaluatedtype" style="width:90%;height:20px;font-size:11px;">
						<option value="3rd Party Evaluation (QE team)">3rd Party Evaluation (QE team)</option>
						<option value="3rd Party Evaluation (LO)">3rd Party Evaluation (LO)</option>
						<option value="Follow up evaluation (QE team)">Follow up evaluation (QE team)</option>
						<option value="Follow up evaluation (LO)">Follow up evaluation (LO)</option>
						<option value="Follow up evaluation (QE team)">Follow up evaluation (QE team)</option>
						<option value="Different type (none of above applicable)">Different type (none of above applicable)</option>
						</select>
                    </td>
                    
                    <td align="center" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>Evaluation Method</span></td>
                    <td><select id="evaluationmethod" name="evaluationmethod" style="width:90%;height:20px;font-size:11px;">
						<option value="TQA">TQA</option>
						<option value="Standard">Standard</option>
						</select></td>
                 </tr>
                 
                 
                 <tr>  
                    <td align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Date</span></td>
                    <td><input type="text" id="qadate"     name="qadate" onclick="new Calendar_new(null, null, 1).show(this);" readonly="readonly" style="width:90%;height:20px"  ><span class='redtext'>*</span></td>
                    <td align="center"   style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Component Type</span></td>
                   <td>
                    <select id="componenttype" name="componenttype" style="width:90%;height:20px;font-size:11px;">
                        <option value="">--Please Choose--</option>
						<option value="Software">Software</option>
						<option value="Help">Help</option>
						<option value="doc">doc</option>
						<option value="Doc">Doc</option>
						<option value="Script">Script</option>
				    </select>
                    <span class='redtext'>*</span></td>
                
                 </tr>
                 
                <tr>  
                    <td align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Source Language</span></td>
                                   <td>
                    <select id="sourcelanguage" name="sourcelanguage" style="width:90%;height:20px;font-size:11px;">
                    
                    <option value="English">English</option>
					<option value="Acholi">Acholi</option>
					<option value="Afrikaans">Afrikaans</option>
					<option value="Akan">Akan</option>
					<option value="Albanian">Albanian</option>
					<option value="Amharic">Amharic</option>
					<option value="Arabic">Arabic</option>
					<option value="Armenian">Armenian</option>
					<option value="Assamese">Assamese</option>
					<option value="Aymara">Aymara</option>
					<option value="Azerbaijani">Azerbaijani</option>
					<option value="Azeri-Cyrillic">Azeri-Cyrillic</option>
					<option value="Basque">Basque</option>
					<option value="Belarusian">Belarusian</option>
					<option value="Bemba">Bemba</option>
					<option value="Bengali">Bengali</option>
					<option value="Bengali-Bangladesh">Bengali-Bangladesh</option>
					<option value="Bosnian">Bosnian</option>
					<option value="Bulgarian">Bulgarian</option>
					<option value="Burmese">Burmese</option>
					<option value="Catalan">Catalan</option>
					<option value="Cebuano">Cebuano</option>
					<option value="Chechen">Chechen</option>
					<option value="Chewa">Chewa</option>
					<option value="Chinese-Simplified">Chinese-Simplified</option>
					<option value="Chinese-HongKong">Chinese-HongKong</option>
					<option value="Chinese-Traditional">Chinese-Traditional</option>
					<option value="Cree Plains">Cree Plains</option>
					<option value="Creole-Haitian">Creole-Haitian</option>
					<option value="Croatian">Croatian</option>
					<option value="Czech">Czech</option>
					<option value="Danish">Danish</option>
					<option value="Dari">Dari</option>
					<option value="Dinka">Dinka</option>
					<option value="Dutch-Netherlands">Dutch-Netherlands</option>
					<option value="Dutch-Belgian">Dutch-Belgian</option>
					<option value="Dzongkha">Dzongkha</option>
					<option value="Ebira">Ebira</option>
					<option value="English-Australian">English-Australian</option>
					<option value="English-International">English-International</option>
					<option value="English-UK">English-UK</option>
					<option value="English - US">English - US</option>
					<option value="English-Canada">English-Canada</option>
					<option value="English-New Zealand">English-New Zealand</option>
					<option value="English-South Africa">English-South Africa</option>
					<option value="Estonian">Estonian</option>
					<option value="Faroese">Faroese</option>
					<option value="Farsi">Farsi</option>
					<option value="Fijian">Fijian</option>
					<option value="Filipino">Filipino</option>
					<option value="Finnish">Finnish</option>
					<option value="French-France">French-France</option>
					<option value="French-Canada">French-Canada</option>
					<option value="French-Swiss">French-Swiss</option>
					<option value="French-Belgium">French-Belgium</option>
					<option value="French-Luxembourg">French-Luxembourg</option>
					<option value="Frisian">Frisian</option>
					<option value="Fulani">Fulani</option>
					<option value="Ga">Ga</option>
					<option value="Gaelic Irish">Gaelic Irish</option>
					<option value="Gaelic Scots">Gaelic Scots</option>
					<option value="Galician">Galician</option>
					<option value="Ganda">Ganda</option>
					<option value="Georgian">Georgian</option>
					<option value="German-Germany">German-Germany</option>
					<option value="German-Austrian">German-Austrian</option>
					<option value="German-Swiss">German-Swiss</option>
					<option value="Gikuyu">Gikuyu</option>
					<option value="Greek">Greek</option>
					<option value="Greenlandic">Greenlandic</option>
					<option value="Guarani">Guarani</option>
					<option value="Gujarati">Gujarati</option>
					<option value="Gun">Gun</option>
					<option value="Hausa">Hausa</option>
					<option value="Haya">Haya</option>
					<option value="Hebrew">Hebrew</option>
					<option value="Hiligaynon">Hiligaynon</option>
					<option value="Hindi">Hindi</option>
					<option value="Hindi-Fiji">Hindi-Fiji</option>
					<option value="Hmong">Hmong</option>
					<option value="Hungarian">Hungarian</option>
					<option value="Ibanag">Ibanag</option>
					<option value="Icelandic">Icelandic</option>
					<option value="Igbo">Igbo</option>
					<option value="Ilocano">Ilocano</option>
					<option value="Indonesian">Indonesian</option>
					<option value="Inuktitut">Inuktitut</option>
					<option value="Isekiri">Isekiri</option>
					<option value="Italian">Italian</option>
					<option value="Italian-Switzerland">Italian-Switzerland</option>
					<option value="Japanese">Japanese</option>
					<option value="Javanese">Javanese</option>
					<option value="Jopara">Jopara</option>
					<option value="K’iche’">K’iche’</option>
					<option value="Kannada">Kannada</option>
					<option value="Kapampangan">Kapampangan</option>
					<option value="Kashmiri">Kashmiri</option>
					<option value="Kazakh">Kazakh</option>
					<option value="Khmer">Khmer</option>
					<option value="Kirghiz">Kirghiz</option>
					<option value="Kituba">Kituba</option>
					<option value="Konkani">Konkani</option>
					<option value="Koongo">Koongo</option>
					<option value="Korean">Korean</option>
					<option value="Krio">Krio</option>
					<option value="Kurdish-Kurmanji">Kurdish-Kurmanji</option>
					<option value="Kurdish-Sorani">Kurdish-Sorani</option>
					<option value="Lao">Lao</option>
					<option value="Latin">Latin</option>
					<option value="Latvian">Latvian</option>
					<option value="Lingala">Lingala</option>
					<option value="Lithuanian">Lithuanian</option>
					<option value="Luo">Luo</option>
					<option value="Luxembourgish">Luxembourgish</option>
					<option value="Macedonian">Macedonian</option>
					<option value="Makassar">Makassar</option>
					<option value="Malagasy">Malagasy</option>
					<option value="Malay">Malay</option>
					<option value="Malayalam">Malayalam</option>
					<option value="Maldivian (Dhivehi)">Maldivian(Dhivehi)</option>
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

                    <td align="center"  style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>Word Count</span></td>
                    <td><input type="text" id="wordcount"  name="wordcount" style="width:90%;height:20px"  ><span class='redtext'>*</span></td>
                 </tr>
                           <tr>  
                    <td align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Target Language</span></td>
                    <td>
                    <select id="targetlanguage" name="targetlanguage" style="width:90%;height:20px;font-size:11px;">
                    					<option value="Chinese - Simplified">Chinese - Simplified</option>
                    
				    <option value="Acholi">Acholi</option>
					<option value="Afrikaans">Afrikaans</option>
					<option value="Akan">Akan</option>
					<option value="Albanian">Albanian</option>
					<option value="Amharic">Amharic</option>
					<option value="Arabic">Arabic</option>
					<option value="Armenian">Armenian</option>
					<option value="Assamese">Assamese</option>
					<option value="Aymara">Aymara</option>
					<option value="Azerbaijani">Azerbaijani</option>
					<option value="Azeri-Cyrillic">Azeri-Cyrillic</option>
					<option value="Basque">Basque</option>
					<option value="Belarusian">Belarusian</option>
					<option value="Bemba">Bemba</option>
					<option value="Bengali">Bengali</option>
					<option value="Bengali-Bangladesh">Bengali-Bangladesh</option>
					<option value="Bosnian">Bosnian</option>
					<option value="Bulgarian">Bulgarian</option>
					<option value="Burmese">Burmese</option>
					<option value="Catalan">Catalan</option>
					<option value="Cebuano">Cebuano</option>
					<option value="Chechen">Chechen</option>
					<option value="Chewa">Chewa</option>
					<option value="Chinese-HongKong">Chinese-HongKong</option>
					<option value="Chinese-Traditional">Chinese-Traditional</option>
					<option value="Cree Plains">Cree Plains</option>
					<option value="Creole-Haitian">Creole-Haitian</option>
					<option value="Croatian">Croatian</option>
					<option value="Czech">Czech</option>
					<option value="Danish">Danish</option>
					<option value="Dari">Dari</option>
					<option value="Dinka">Dinka</option>
					<option value="Dutch-Netherlands">Dutch-Netherlands</option>
					<option value="Dutch-Belgian">Dutch-Belgian</option>
					<option value="Dzongkha">Dzongkha</option>
					<option value="Ebira">Ebira</option>
					<option value="English-Australian">English-Australian</option>
					<option value="English-International">English-International</option>
					<option value="English-UK">English-UK</option>
					<option value="English-US">English-US</option>
					<option value="English-Canada">English-Canada</option>
					<option value="English-New Zealand">English-New Zealand</option>
					<option value="English-South Africa">English-South Africa</option>
					<option value="Estonian">Estonian</option>
					<option value="Faroese">Faroese</option>
					<option value="Farsi">Farsi</option>
					<option value="Fijian">Fijian</option>
					<option value="Filipino">Filipino</option>
					<option value="Finnish">Finnish</option>
					<option value="French-France">French-France</option>
					<option value="French-Canada">French-Canada</option>
					<option value="French-Swiss">French-Swiss</option>
					<option value="French-Belgium">French-Belgium</option>
					<option value="French-Luxembourg">French-Luxembourg</option>
					<option value="Frisian">Frisian</option>
					<option value="Fulani">Fulani</option>
					<option value="Ga">Ga</option>
					<option value="Gaelic Irish">Gaelic Irish</option>
					<option value="Gaelic Scots">Gaelic Scots</option>
					<option value="Galician">Galician</option>
					<option value="Ganda">Ganda</option>
					<option value="Georgian">Georgian</option>
					<option value="German-Germany">German-Germany</option>
					<option value="German-Austrian">German-Austrian</option>
					<option value="German-Swiss">German-Swiss</option>
					<option value="Gikuyu">Gikuyu</option>
					<option value="Greek">Greek</option>
					<option value="Greenlandic">Greenlandic</option>
					<option value="Guarani">Guarani</option>
					<option value="Gujarati">Gujarati</option>
					<option value="Gun">Gun</option>
					<option value="Hausa">Hausa</option>
					<option value="Haya">Haya</option>
					<option value="Hebrew">Hebrew</option>
					<option value="Hiligaynon">Hiligaynon</option>
					<option value="Hindi">Hindi</option>
					<option value="Hindi-Fiji">Hindi-Fiji</option>
					<option value="Hmong">Hmong</option>
					<option value="Hungarian">Hungarian</option>
					<option value="Ibanag">Ibanag</option>
					<option value="Icelandic">Icelandic</option>
					<option value="Igbo">Igbo</option>
					<option value="Ilocano">Ilocano</option>
					<option value="Indonesian">Indonesian</option>
					<option value="Inuktitut">Inuktitut</option>
					<option value="Isekiri">Isekiri</option>
					<option value="Italian">Italian</option>
					<option value="Italian-Switzerland">Italian-Switzerland</option>
					<option value="Japanese">Japanese</option>
					<option value="Javanese">Javanese</option>
					<option value="Jopara">Jopara</option>
					<option value="K’iche’">K’iche’</option>
					<option value="Kannada">Kannada</option>
					<option value="Kapampangan">Kapampangan</option>
					<option value="Kashmiri">Kashmiri</option>
					<option value="Kazakh">Kazakh</option>
					<option value="Khmer">Khmer</option>
					<option value="Kirghiz">Kirghiz</option>
					<option value="Kituba">Kituba</option>
					<option value="Konkani">Konkani</option>
					<option value="Koongo">Koongo</option>
					<option value="Korean">Korean</option>
					<option value="Krio">Krio</option>
					<option value="Kurdish-Kurmanji">Kurdish-Kurmanji</option>
					<option value="Kurdish-Sorani">Kurdish-Sorani</option>
					<option value="Lao">Lao</option>
					<option value="Latin">Latin</option>
					<option value="Latvian">Latvian</option>
					<option value="Lingala">Lingala</option>
					<option value="Lithuanian">Lithuanian</option>
					<option value="Luo">Luo</option>
					<option value="Luxembourgish">Luxembourgish</option>
					<option value="Macedonian">Macedonian</option>
					<option value="Makassar">Makassar</option>
					<option value="Malagasy">Malagasy</option>
					<option value="Malay">Malay</option>
					<option value="Malayalam">Malayalam</option>
					<option value="Maldivia(Dhivehi)">Maldivian(Dhivehi)</option>
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
                    
                    <td align="center" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>Adequacy Level</span></td>
                    <td><select id="adequacylevel" name="adequacylevel" style="width:90%;height:20px;font-size:11px;">
						<option value="Publishable">Publishable</option>
						<option value="Understandable">Understandable</option>
						
				    </select></td>
                 </tr>
                  
                      <tr>  
                 <td align="center" colspan="4" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>&nbsp;</span></td>
               
                 </tr> 
        
            </table>  
           
               <table width="94%" align="center" border="1" cellspacing="0" cellpadding="0" bordercolor=#000000 style="border-collapse:collapse;border-top:none;">  
            
                 <tr style="background:#66a9bd;" >  
                    <td  align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Error Category</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>Abbrev.</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>Minor Error</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>Weighted Error Points</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>Serious Error</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>Weighted Error Points</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>Critical  Error</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>Category Error Points</span></td>
                </tr> 
                
               <!--  <tr>  
                    <td  align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Wrong Term</span></td>
                    <td  align="center" bgcolor='#e5f1f4' ><span class='title'>WT</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="wrongminor"   name="wrongminor" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="wrongweighted"     name="wrongweighted" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="wrongserious"     name="wrongserious" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="wrongpoints"     name="wrongpoints" style="width:90%;height:20px"  ></span></td>
                   
                    <td  align="center" ><span class='title'><input type="text" id="wrongcategory"     name="wrongcategory" style="width:90%;height:20px"  ></span></td>
                </tr> 
                              
               <tr>  
                    <td  align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Wrong Meaning</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>WM</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningminor"     name="meaningminor" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningweighted"     name="meaningweighted" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningserious"     name="meaningserious" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningpoints"     name="meaningpoints" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningcategory"     name="meaningcategory" style="width:90%;height:20px"  ></span></td>
                </tr> 
               
                <tr>  
                    <td  align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Omission</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>OM</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissionminor"     name="omissionminor" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissionweighted"     name="omissionweighted" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissionserious"     name="omissionserious" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissionpoints"     name="omissionpoints" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissioncategory"     name="omissioncategory" style="width:90%;height:20px"  ></span></td>
                </tr> 
               
                         <tr>  
                    <td  align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Structural Error</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>SE</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="structuralnminor"     name="structuralnminor" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="structuralweighted"     name="structuralweighted" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="structuralserious"     name="structuralserious" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="structuralpoints"     name="structuralpoints" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="structuralcategory"     name="structuralcategory" style="width:90%;height:20px"  ></span></td>
                </tr> 
                                          
                        <tr>  
                    <td  align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Misspelling</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>SP</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="misspellingminor"     name="misspellingminor" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="misspellingweighted"     name="misspellingweighted" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="misspellingserious"     name="misspellingserious" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="misspellingpoints"     name="misspellingpoints" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="misspellingcategory"     name="misspellingcategory" style="width:90%;height:20px"  ></span></td>
                </tr> 
              
                        <tr>  
                    <td  align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Punctuation</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>PE</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="punctuationminor"     name="punctuationminor" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="punctuationweighted"     name="punctuationweighted" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="punctuationserious"     name="punctuationserious" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="punctuationpoints"     name="punctuationpoints" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="punctuationcategory"     name="punctuationcategory" style="width:90%;height:20px"  ></span></td>
                </tr> 


             <tr>  
                    <td  align="center" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>Style</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>ST</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="styleminor"     name="styleminor" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="styleweighted"     name="styleweighted" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="styleserious"     name="styleserious" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="stylepoints"     name="stylepoints" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="stylecategory"     name="stylecategory" style="width:90%;height:20px"  ></span></td>
                </tr> 
                
                             <tr>  
                    <td  align="center" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Miscellaneous</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>ME</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="miscellaneousminor"     name="miscellaneousminor" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="miscellaneousweighted"     name="miscellaneousweighted" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="miscellaneousserious"     name="miscellaneousserious" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="miscellaneouspoints"     name="miscellaneouspoints" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="miscellaneouscategory"     name="miscellaneouscategory" style="width:90%;height:20px"  ></span></td>
                </tr> 
                   
                -->
                
                 <tr>  
                    <td  align="center" style="height:25px;font-size: 11px;"     bgcolor='#e5f1f4'><span class='title'>Wrong Term</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>WT</span></td>
                    <td  align="center" ><span class='title'><input type="text"   id="wrongminor"        name="wrongminor"       style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text"   id="wrongweighted"     name="wrongweighted"    style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text"   id="wrongserious"      name="wrongserious"     style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text"   id="wrongpoints"       name="wrongpoints"      style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text"   id="wrongcritical"     name="wrongcritical"    style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text"   id="wrongcategory"     name="wrongcategory"    style="width:90%;height:20px;font-size:11px;"></span></td>
                    
                </tr> 
                              
               <tr>  
                    <td  align="center" style="height:25px;font-size: 11px;"     bgcolor='#e5f1f4'><span class='title'>Wrong Meaning</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>WM</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningminor"        name="meaningminor" style="width:90%;height:20px;font-size: 11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningweighted"     name="meaningweighted" style="width:90%;height:20px;font-size: 11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningserious"      name="meaningserious" style="width:90%;height:20px;font-size: 11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningpoints"       name="meaningpoints" style="width:90%;height:20px;font-size: 11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningcritical"     name="meaningcritical" style="width:90%;height:20px;font-size: 11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="meaningcategory"     name="meaningcategory" style="width:90%;height:20px;font-size: 11px;"></span></td>
                    
                </tr> 
               
                <tr>  
                    <td  align="center" style="height:25px;font-size: 11px;"     bgcolor='#e5f1f4'><span class='title'>Omission</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>OM</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissionminor"        name="omissionminor"           style="width:90%;height:20px;font-size: 11px;"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissionweighted"     name="omissionweighted"        style="width:90%;height:20px;font-size: 11px;"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissionserious"      name="omissionserious"         style="width:90%;height:20px;font-size: 11px;"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissionpoints"       name="omissionpoints"          style="width:90%;height:20px;font-size: 11px;"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissioncritical"     name="omissioncritical"        style="width:90%;height:20px;font-size: 11px;"  ></span></td>
                    <td  align="center" ><span class='title'><input type="text" id="omissioncategory"     name="omissioncategory"        style="width:90%;height:20px;font-size: 11px;"  ></span></td>
                </tr> 
               
               <tr>  
                    <td  align="center" style="height:25px;font-size: 11px;"     bgcolor='#e5f1f4'><span class='title'>Structural Error</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>SE</span></td>
                    <td  align="center" ><span class='title'><input type="text"    id="structuralnminor"     name="structuralnminor"     style="width:90%;height:20px;font-size: 11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text"    id="structuralweighted"   name="structuralweighted"   style="width:90%;height:20px;font-size: 11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text"    id="structuralserious"    name="structuralserious"    style="width:90%;height:20px;font-size: 11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text"    id="structuralpoints"     name="structuralpoints"     style="width:90%;height:20px;font-size: 11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text"    id="structuralcritical"   name="structuralcritical"   style="width:90%;height:20px;font-size: 11px;"></span></td>
                    <td  align="center" ><span class='title'><input type="text"    id="structuralcategory"   name="structuralcategory"   style="width:90%;height:20px;font-size: 11px;"></span></td>
                </tr> 
                                          
                <tr>  
                    <td  align="center" style="height:25px;font-size: 11px;"     bgcolor='#e5f1f4'><span class='title'>Misspelling</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>SP</span></td>
                    <td  align="center"><span class='title'><input type="text"    id="misspellingminor"       name="misspellingminor"      style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="misspellingweighted"    name="misspellingweighted"   style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="misspellingserious"     name="misspellingserious"    style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="misspellingpoints"      name="misspellingpoints"     style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="misspellingcritical"    name="misspellingcritical"   style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="misspellingcategory"    name="misspellingcategory"   style="width:90%;height:20px;font-size:11px;"></span></td>
                    
                </tr> 
              
              <tr>  
                    <td  align="center" style="height:25px;font-size: 11px;"     bgcolor='#e5f1f4'><span class='title'>Punctuation</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>PE</span></td>
                    <td  align="center"><span class='title'><input type="text"    id="punctuationminor"        name="punctuationminor"        style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="punctuationweighted"     name="punctuationweighted"     style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="punctuationserious"      name="punctuationserious"      style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="punctuationpoints"       name="punctuationpoints"       style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="punctuationcritical"     name="punctuationcritical"     style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="punctuationcategory"     name="punctuationcategory"     style="width:90%;height:20px;font-size:11px;"></span></td>
                    
                    
                </tr> 


             <tr>  
                    <td  align="center"  style="height:25px;font-size: 11px;"     bgcolor='#e5f1f4' ><span class='title'>Style</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>ST</span></td>
                    <td  align="center"><span class='title'><input type="text"     id="styleminor"         name="styleminor"            style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"     id="styleweighted"      name="styleweighted"         style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"     id="styleserious"       name="styleserious"          style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"     id="stylepoints"        name="stylepoints"           style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"     id="stylecritical"      name="stylecritical"         style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"     id="stylecategory"      name="stylecategory"         style="width:90%;height:20px;font-size:11px;"></span></td>
             </tr> 
                
              <tr>  
                    <td  align="center" style="height:25px;font-size: 11px;"     bgcolor='#e5f1f4'><span class='title'>Miscellaneous</span></td>
                    <td  align="center" bgcolor='#e5f1f4'><span class='title'>ME</span></td>
                    <td  align="center"><span class='title'><input type="text"    id="miscellaneousminor"        name="miscellaneousminor"      style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="miscellaneousweighted"     name="miscellaneousweighted"   style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="miscellaneousserious"      name="miscellaneousserious"    style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="miscellaneouspoints"       name="miscellaneouspoints"     style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="miscellaneouscritical"     name="miscellaneouscritical"   style="width:90%;height:20px;font-size:11px;"></span></td>
                    <td  align="center"><span class='title'><input type="text"    id="miscellaneouscategory"     name="miscellaneouscategory"   style="width:90%;height:20px;font-size:11px;"></span></td>
                </tr> 
                   
                   
                <tr>  
                    <td  align="center" colspan="3" style="height:25px;" bgcolor='#e5f1f4'><span class='title'>Legacy Data Errors</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="legacydataerrors"     name="legacydataerrors" style="width:90%;height:20px"  ></span></td>
                    <td  align="center" colspan="3" style="height:25px;" bgcolor='#e5f1f4' ><span class='title'>Source Text Errors</span></td>
                    <td  align="center" ><span class='title' ><input type="text" id="sourcetexterrors"     name="sourcetexterrors" style="width:90%;height:20px"  ></span></td>
                </tr> 
                
            </table>    
            
            
                 <table width="94%" align="center" border="1" cellspacing="0" cellpadding="0" bordercolor=#000000 style="border-collapse:collapse;border-top:none;"  >  
            
                 <tr style="height:25px;" >  
                    <td  align="center" colspan="5"  bgcolor='#e5f1f4'><span class='title'>Quality Scoring Matrix</span></td>
                </tr> 
                <tr>  
                    <td  align="center" style="height:20px;" bgcolor='#e5f1f4'><span class='title'>Error Points Allowed</span></td>
                    <td  align="center" style="height:20px;" bgcolor='#e5f1f4'><span class='title'>Total Category Error Points</span></td>
                    <td  align="center" style="height:20px;" bgcolor='#e5f1f4'><span class='title'>% Quality Indicator (100% max)</span></td>
                </tr> 
                <tr>  
                    <td  align="center" style="height:20px;"><span class='title'><input type="text" id="errorpointsallowed"     name="errorpointsallowed" style="width:90%;height:20px"  ></span><span class='redtext'>*</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="totalcategoryerrorpoints"  name="totalcategoryerrorpoints" style="width:90%;height:20px"  ></span> <span class='redtext'>*</span></td>
                    <td  align="center" ><span class='title'><input type="text" id="qualityindicator"     name="qualityindicator" style="width:90%;height:20px"  ></span> <span class='redtext'>*</span></td>
                </tr> 
                  <tr>  
                    <td  align="center" colspan="5" bgcolor='#e5f1f4'><span class='title'><input type="text" id="sdlqualityindicator_show"     name="sdlqualityindicator_show" readonly="readonly" style="width:60px;height:20px;font-size: 11px;background:#E0E0E0" readonly="readonly"  >
                    &nbsp;&nbsp;<input type="text" id="sdlqualityindicator"     name="sdlqualityindicator" onBlur="calutesdlqualityindicator()" style="height:20px;font-size: 11px;">&nbsp;&nbsp;SDL Quality Indicator						
                    </span></td>
                </tr> 
                
                 <tr>  
                    <td align="center" colspan="5"><input type="text" id="sdlqualityinfor"     name="sdlqualityinfor" style="width:90%;height:30px"></td>
                </tr> 
                
                        
                         <tr>  
                    <td  align="center" colspan="5"  bgcolor='#e5f1f4' height="25px" ><span class='title'>Instructions:	Enter error details in the 'Evaluation details_input' sheet (yellow tab).									
	See 'Errors & Weighting Definition' sheet for explanation of error categories.									
                    </span></td>
                </tr> 
                
                
                         <tr>  
                    <td  align="center" colspan="2"   bgcolor='#e5f1f4' ><span class='title'>OVERALL READABILITY & COMMENTS   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Select grade for overall Readability >>></span></td>
                    <td  align="center"  colspan="3"  ><span class='title'><select id="qastatus" name="qastatus" style="width:90%;height:20px;font-size:11px;">
                        <option value="Good">Good</option>
						<option value="Excellent">Excellent</option>
						<option value="Satisfactory">Satisfactory</option>
						<option value="BelowStandard">Below Standard</option>
						<option value="Poor">Poor</option></select>
						</span></td>
                
                </tr> 
                
                             <tr style="display:none" > 
     <td colspan="4" ><span class='title'></span><input type="text" id="ifscwj" name="ifscwj" value="N" style="width:100%;height:100px;"  ></td>
	  </tr>  
	  
                 <tr> 
     <td colspan="4" ><span class='title'></span><textarea input type="text" id="comment" name="comment" style="width:100%;height:100px;"  > </textarea></td>
	  </tr>      
            </table>    
             

      <br>
      
      <center><input type="button" value="Save" id="addqaform"  class="buttonstyle" style="width:60px;height:25px;" /> <input  type="reset" value="Reset" class="buttonstyle"  style="width:60px;height:25px;" /><input id="Hidden1" type="hidden" /> 
      <input type="file" id="upfile" name="upload"   style="width:200px;height:25px;" />
      <input type="submit"  value="import" class="buttonstyle"> 
      </center>
  
        </form> 
        
    </div>
     
    </body>  
</html>  