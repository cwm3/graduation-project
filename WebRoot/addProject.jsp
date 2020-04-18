<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>AddProject</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script type="text/javascript"  src="vendormanger/addvendor.js"></script>
    <script type="text/javascript" src="jquery/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="js3/calendar.js"></script>
    <script type="text/javascript"  src="vendormanger/addvendor.js"></script>
    <script type="text/javascript"  src="vendormanger/common.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/client.js"></script>
	<link href="css/commoncss.css" rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript" src="js/costcode.js"></script>
	
	
    <style type="text/css">
        
  body{
     margin:0px;
   }
   
  table,table td,table th{border:1px solid black;
                             border-collapse:collapse;}
   
   
.title{
  font-size: 10px;
  font-family:Arial,Tahoma,Verdana;
  color: #033d61;
}
.redtext{
   color:red;
}
.language{
   margin-top:5px;
}
.biaoti{
    margin-top:50px;
 	font-size: 14px;
	font-family : Arial,Tahoma,Verdana;
	color: #033d61; 
} 
.addform{
      margin-top:20px;  
}

</style>


<script language="javascript">     
          
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
	
          
    function checkpost() { 
			 
         if(add_project.lead.value=="" || add_project.lead.value== null || add_project.lead.value=="null" )
	   {
		     alert("Logon failure,Please log in again ! ");
		     window.document.location.href="userlogin.html";
		     return false; 
	    } 
	    
	    
	   if(add_project.client.value=="" || add_project.client.value== null )
	   {
		     alert("Please Input Client"); 
		     add_project.client.focus(); 
		     return false; 
	    } 
	    
	    	   var potype = document.getElementById("potype").value;
	    if(potype=="" || potype== null )
	   {
		     alert("Please Input PO Type"); 
		     add_project.potype.focus(); 
		     return false; 
	    } 
	   
	   var dropname = document.getElementById("dropname").value;
	    if(dropname=="" || dropname== null )
	   {
		     alert("Please Input Drop Name"); 
		     add_project.dropname.focus(); 
		     return false; 
	    } 
	   
	   
      if(add_project.imtchampion.value=="" || add_project.imtchampion.value== null )
	   {
		     alert("Please Choose  Imtchampion"); 
		     return false; 
	    }
	   
	       if(add_project.dropdate.value=="" || add_project.dropdate.value== null )
	   {
		     alert("Please Input Drop Date"); 
		     add_project.dropdate.focus(); 
		     return false; 
	    } 
	    
	    
	   var startdate = document.getElementById("dropdate").value;
       var enddate = document.getElementById("deadline").value;
       
	    if(enddate=="" || enddate== null )
	   {
		     alert("Please Input Deadline ! "); 
		     add_project.deadline.focus(); 
		     return false; 
	    } 
	   
	   
	   
       
	  var myDate = new Date();
	  var year = myDate.getFullYear();
	  var month = myDate.getMonth()+1;

	  if(month.toString().length==1) {
		  month=0+month.toString();
	  }
	  
	  var date  = myDate.getDate();
	  if(date.toString().length==1) {
		  date=0+date.toString();
	  }
	  
	  var systemdate = year.toString()+"-"+month.toString()+"-"+date.toString();
	  
	  
	  if(systemdate > startdate){
       alert("Dropdate  must  be greater than Todate ");
       document.getElementById("dropdate").value="";
	   return false;
	   }
	   
	   	 	  
       var time1 = new Date(startdate.replace(/-/g,"/"));
       var time2 = new Date(enddate.replace(/-/g,"/"));
	   if(time1 > time2){
       alert(" Enddate must be greater than Startdate ");
	   return false;
	   }
	   

	
	   
       document.getElementById("addproject").disabled = true;	   	    
	 }
	 
   function autocalculateSystemCode(maxnumber) {
	  var code = document.getElementById("costcode").value;
	  code = code.substr(0, 3);
	  
	  var myDate = new Date();
	  var year = myDate.getFullYear();
	  var month = myDate.getMonth()+1;

	  if(month.toString().length==1) {
		  month=0+month.toString();
	  }
	  
	  var date  = myDate.getDate();
	  if(date.toString().length==1) {
		  date=0+date.toString();
	  }
	  
	  var systemcode = year.toString()+ month.toString()+ date.toString();
	  var systemnumber = Number(maxnumber)+1;
	  document.getElementById("systemnumber").value=systemnumber;
	 
	  if(systemnumber.toString().length < 8) {
	     for(i=0;i<7-systemnumber.toString().length;i++)
	     systemnumber = "0" + systemnumber ;
	  }
	  systemcode = code + systemcode + systemnumber ;
	  document.getElementById("systemcode").value=systemcode;	  
}



 var XMLHttpReq;
 var currentSort;
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
              if(www=="11") {                  
                       checkcostcode();
              }else if(www=="22"){
                     calculateNumber();
              }
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
    }
    //更新菜单函数
    function calculateNumber() {    
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        autocalculateSystemCode(res);
    }
    
      //更新菜单函数
    function checkcostcode() {
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        clientname=res;
    }
    var dyff="";
    var clientname="";
    // 创建级联菜单函数
    function autoSystemCode() {
    	var costcode = document.getElementById("costcode").value;
    	//costcode 没填的时候不弹出框
        if(costcode!=""){
            www="11";
           sendRequest("checkcostcode.jsp?costcode="+costcode);
        if(clientname=="bucunzai2017") {
          alert("This is a new Cost code, Pls contact your Department Manager to add it into VMS");
          document.getElementById("costcode").value="";
          document.getElementById("word").value="";
          document.getElementById("systemcode").value="";
          
          return false;
        }else{
          document.getElementById("word").value=clientname;
          www="22";
          sendRequest("checksystemnumber.jsp");      
        }
        }
       
    }
    
       var changeFlag=false;  
        //标识文本框值是否改变，为true，标识已变   
        $(document).ready(function(){  
             //文本框值改变即触发       
            $("input[type='text']").change(function(){  
changeFlag=true;       
            });   
            //文本域改变即触发  
            $("textarea").change(function(){  
changeFlag=true;       
            });   
        });  
         //离开页面时保存文档     
window.onbeforeunload = function() { 
               if(changeFlag==true && document.getElementById("Hidden1").value ==""){  
                    return "";  
             } 
         } 
         
         
function test() {
       document.getElementById("Hidden1").value = "1"; 
      
} 

function  chooseSelect() {	 
		 var imtchampion = document.getElementById("imtchampion").value;
		 if(imtchampion=="Y") {
	
                   document.getElementById("rate1").value="";
		           document.getElementById("rate2").value="";
		           document.getElementById("rate3").value="";
		           document.getElementById("rate4").value="";
		           document.getElementById("totalwords").value="";
		  
		   		   document.getElementById("rate1").readOnly=true;
		   		   document.getElementById("rate2").readOnly=true;
		   		   document.getElementById("rate3").readOnly=true;
		   		   document.getElementById("rate1").style.background="#E0E0E0";
		   		   document.getElementById("rate2").style.background="#E0E0E0";
		   		   document.getElementById("rate3").style.background="#E0E0E0";
		   		   
		   		   document.getElementById("postediting").value="";
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
		  		   
		   		   document.getElementById("rate1").readOnly=false;
		   		   document.getElementById("rate2").readOnly=false;
		   		   document.getElementById("rate3").readOnly=false;
		   		   document.getElementById("rate1").style.background="#FFFFFF";
		   		   document.getElementById("rate2").style.background="#FFFFFF";
		   		   document.getElementById("rate3").style.background="#FFFFFF";	
		   		   document.getElementById("postediting").style.background="#FFFFFF";
		   		   	   		   
	          }
	               
		 }
		 

    function checkText(){
        var val = document.getElementById('receivedpovalue').value;
        var reg = /([\u4E00-\u9FA5]|[A-Za-z])+/;//只要包含中文或者字母就提示
        if(reg.test(val)){
            alert("Cann't insert Chinese words or letters");
             document.getElementById('receivedpovalue').value="";
             return false;
        }
        
        var xsd=val.toString().split("."); 
	
		 if(xsd.length>1){ 
		 if(xsd[1].length>2){ 
		     alert("Please keep the two small digital");
             document.getElementById('receivedpovalue').value="";
		 } 
		 } 
        
        
    } 
    
    
    function init(){
      var myDate = new Date();
	  var year = myDate.getFullYear();
	  var month = myDate.getMonth()+1;

	  if(month.toString().length==1) {
		  month=0+month.toString();
	  }
	  
	  var date  = myDate.getDate();
	  if(date.toString().length==1) {
		  date=0+date.toString();
	  }
	  
	  var systemdate = year.toString()+"-"+month.toString()+"-"+date.toString();
	  document.getElementById("dropdate").value=systemdate;       
    }
    
       
    
    $(function($) {
           $('body').click( function() {  
                    autoSystemCode();
            });  
  });
  
      
	 		 
</script>  
</head>  

<body onload="init()">  
                         <div class="biaoti"><center>Add Project</center></div>
            <div class="addform">             
            <form name="add_project" method="post"  action="addproject.action" id="add_project" onsubmit="return checkpost();">  
            <table width="94%" align="center" >  
            
                 <tr>  
                 <td width="20%" align="center" height="30px"  bgcolor='#e5f1f4' ><span class='title'>Lead</span></td>
                 <td  align="left"><input id="lead" name="lead" value='<%=session.getAttribute("username") %>'   type="text"  readonly="true"  style="width:90%;height:20px;font-size: 10px;background:#E0E0E0"  />
                 <td width="20%" align="center" height="30px" bgcolor='#e5f1f4'><span class='title'>Manager</span></td>
                 <td  width="30%"><input  type="text" id="lmorgl"   name="lmorgl" value='<%=session.getAttribute("lmorgl") %>'  readonly="true"  style="width:90%;height:20px;font-size: 10px;background:#E0E0E0"  /></td>
                </td>  
                </tr>  
                 <tr>  
                 <td width="20%" align="center" bgcolor='#e5f1f4'><span class='title'>Cost Code</span></td>
                 <td width="30%"><input  type="text" id="costcode"   name="costcode" style="width:90%;height:20px;font-size:10px;" /><span class='redtext'>*</span><div id ="costcodeauto"></div></td>
                     
                 <td width="20%" align="center" height="30px" bgcolor='#e5f1f4'><span class='title'>Client Name</span></td>
                 <td width="30%" ><input id="word"  name="client" type="text" readonly="true" style="width:90%;height:20px;font-size: 10px;font-size: 10px;background:#E0E0E0" /><div id = "auto"> </div></td>
 
 
                </tr> 
                              
                 
                 
                 <tr>  
                   
                 <td align="center" height="30px" bgcolor='#e5f1f4'><span class='title'>Deadline</span></td>
                 <td><input type="text" id="deadline"     name="deadline"  onclick="new Calendar_new(null, null, 1).show(this);" readonly="readonly"  style="width:90%;height:20px;font-size: 10px;"  ><span class='redtext'>*</span></td>
                  <td align="center" bgcolor='#e5f1f4'><span class='title'>Hourly Work</span></td>
                   <td><input type="text" id="hourlywork"  name="hourlywork"  onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"  style="width:90%;height:20px"  ></td>
                 </tr>
                 
                 
                   
                   <tr>  
                    <td align="center" bgcolor='#e5f1f4'><span class='title'>Language Pairs：</span></td>
                   
		 
					<td colspan="4"><span class='title'><select id ="Languagebegin" name="Languagebegin" style="width:40%;height:20px;font-size: 10px;">
				    <option value="English">English</option>
					<option value="Chinese-Simplified">Chinese-Simplified</option>
					<option value="Chinese-Hongkong">Chinese-Hongkong</option>
					<option value="Chinese-Traditional">Chinese-Traditional</option>
					<option value="Japanese">Japanese</option>
				    <option value="German">German</option>
				    <option value="Korean">Korean</option>
					</select>
					  to <select id ="Languageend" name="Languageend" style="width:40%;height:20px;font-size: 10px;">
					  	 <option value="Chinese-Simplified">Chinese-Simplified</option>
					  	 <option value="English">English</option>
					     <option value="Chinese-Hongkong">Chinese-Hongkong</option>
					     <option value="Chinese-Traditional">Chinese-Traditional</option>
					     <option value="Japanese">Japanese</option>
				         <option value="German">German</option>
				         <option value="Korean">Korean</option>
					</select></span>
				  </td>	
				  
				  
      </tr>     
           
             
            
     
     <tr> 
     <td colspan="4" ><span class='title'>&nbsp;Comment&nbsp;</span><textarea input type="text" id="comment" name="comment" style="width:95%;height:85px;"  > </textarea></td>
	  </tr>  
	  	    	  
            </table>  
 
      <br>

        <center><input type="submit" id="addproject" class="buttonstyle" value="Add"  onclick="test()" style="width:50px;height:25px;font-size: 11px;" /> <input  type="reset" value="Reset"  class="buttonstyle" style="width:50px;height:25px;font-size: 11px;" /><input id="Hidden1" type="hidden" /> </center>
  
        </form>  
        </div>
    </body>  
</html>  