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
    
    <title>Select Project</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="js3/calendar.js"></script>
   
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

.biaoti{
    margin-top:50px;
 	font-size: 14px;
	font-family : Arial,Tahoma,Verdana;
	color: #033d61; 
} 
.bottom {
   margin-top:5px;
   margin-left:40%;
   font-size: 12px;
}
.title{
  font-size: 10px;
  font-family:Arial,Tahoma,Verdana;
  color: #033d61;
}
.redtext{
   color:red;
   font-size: 10px;
   
}

</style>

<script language="JavaScript"> 
var currentSort;
var XMLHttpReq;
var iscz="";			


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
                    docheckcostcode();
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
    }
    
     function docheckcostcode() {        
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        if(res=="bucunzai2017"){
           iscz=0;
        }else {
           iscz=1;
        }
     }

    function checkpost() { 
                iscz="";
                var costcode= document.getElementById("costcode").value;
                if(costcode==""||costcode==null) {
                   alert("Cost Code  must be inserted");
                   return false;
                }else {
                  
                  sendRequest("checkcostcode.jsp?costcode="+costcode);
                  if(iscz == "1"){
                       alert("Cost Code has been existed！");
                       document.getElementById("costcode").value="";
                       return false;
                  }
                 
                }
                
                
                
                
                var clientname = document.getElementById("clientname").value;
                if(clientname==""||clientname==null) {
                   alert("Client Name must be inserted");
                   return false;                   
                }
                
          
                
                var lead = document.getElementById("lead").value;
                if(lead==""||lead==null) {
                   alert("Lead  must be inserted");
                   return false;                   
                }
                
                
                var datedate = document.getElementById("datedate").value;
                if(datedate==""||datedate==null) {
                   alert("Date  must be inserted");
                   return false;
                }
                
                var vendor_field="";
                
                var str=document.getElementsByName("vendor_field_all");
		        var objarray=str.length;
			    var fg="";
			    var count=0;
			    for (var i=0;i<objarray;i++)
			      {//牛图库JS特效，http://js.niutuku.com/ 				
				  if(str[i].checked == true)
				  {
				   count=count+1;
				   if(count>1) {
					   fg=","; 
					 }
				   vendor_field=vendor_field+fg+str[i].value;
				  }
				}                 
     
                document.getElementById("vendor_field").value=vendor_field;
		}
		
		
	    function querycostcode() {
	             document.getElementById("table1").style.display="none";
	             var costcode= document.getElementById("costcode").value;
                 var clientname = document.getElementById("clientname").value;
                 var lead = document.getElementById("lead").value;
                 var datedate = document.getElementById("datedate").value;
                
                var vendor_field="";
                
                var str=document.getElementsByName("vendor_field");
		        var objarray=str.length;
			    var fg="";
			    var count=0;
			    for (var i=0;i<objarray;i++)
			      {//牛图库JS特效，http://js.niutuku.com/ 				
				  if(str[i].checked == true)
				  {
				   count=count+1;
				   if(count>1) {
					   fg=","; 
					 }
				   vendor_field=vendor_field+fg+str[i].value;
				  }
				}        
	            
	            document.getElementById("ContentFrame1").src="listcostcodebypageaction.action?page=1&costcode="+costcode+"&clientname="+clientname+"&lead="
                +lead+"&datedate="+datedate+"&vendor_field="+vendor_field+"&yxbz=1";
         }
         
         

     function init() {
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
	   document.getElementById("datedate").value=systemdate;    
	 
	  }
         
     
         
		
		
</script>
  </head>
  
  <body onload="init()">
                             <div class="biaoti"><center>Add Cost Code</center></div>
     
     <div class="allpage">   
    <form method="post" action="addcostcode.action" id="myform"  name="myform" onsubmit="return checkpost();" >
 
      <div class="tijiao">   
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
           <td align="right"><span class='title'>Cost Code</span></td>
           <td><input type="text" id="costcode"  name="costcode"  style="width:200px;" ><span class='redtext'>*</span></td>
           
           <td align="right" ><span class='title'>Client Name</span></td>
           <td><input type="text" id="clientname"  name="clientname" style="width:200px;" ><span class='redtext'>*</span></td>
           
           <td align="right"><span class='title'>Lead</span></td>
           <td><input type="text" id="lead"  name="lead"  style="width:200px;" ><span class='redtext'>*</span></td>
         
            </tr> 
            
             <tr>
             <td align="right" ><span class='title'>Date</span></td>
             <td><input type="text" id="datedate"  name="datedate" onclick="new Calendar_new(null, null, 1).show(this);" readonly="readonly"  style="width:200px;" ><span class='redtext'>*</span></td>
             <td align="right" ><span class='title'>Field:</span></td>
            
             <td colspan="3" height="40px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><input id="vendor_field1"name="vendor_field_all" type="checkbox"  value="IT" />IT</label>
                 &nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="vendor_field2" name="vendor_field_all" type="checkbox"    value="Marketing" />Marketing </label>
                 &nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="vendor_field3" name="vendor_field_all" type="checkbox"  value="Medical" />Medical</label>
                 &nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="vendor_field4" name="vendor_field_all" type="checkbox"  value="Legal" />Legal</label>
                 &nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="vendor_field5" name="vendor_field_all" type="checkbox"  value="Auto" />Auto</label>
                 &nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="vendor_field6" name="vendor_field_all" type="checkbox"  value="Electronics" />Electronics</label>
                 &nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="vendor_field7" name="vendor_field_all" type="checkbox" value="Game" />Game </label>
                 &nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="vendor_field8" name="vendor_field_all" type="checkbox" value="Sport" />Sport </label>
                 &nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="vendor_field9"name="vendor_field_all" type="checkbox" value="Chemical" />Chemical</label>
                 &nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="vendor_field11"name="vendor_field_all" type="checkbox"   value="Finance"/>Finance</label>
                 &nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="vendor_field10"name="vendor_field_all" type="checkbox" value="Mechanical" />Mechanical</label>
                 &nbsp;<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="vendor_field12"name="vendor_field_all" type="checkbox" value="Others" />Others</label>
                 
                 
                 </span>
            </td> 
            </tr> 
            
                <tr style="display:none">
             <td><input type="text" id="vendor_field"  name="vendor_field" ></td>
            </tr> 
            
            

       </table>
      
        </div>  
        <div class="bottom">              
    	<input type="submit" value="Add" style="width:60px;height:25px;font-size: 11px;" />
    	<input type="reset" value="Reset" style="width:60px;height:25px;font-size: 11px;" />
    	<input type="button" value="Query" onclick="querycostcode()"  style="width:60px;height:25px;font-size: 11px;" />
    	
    	
    	  </div> 
    </form>
    </div>

 
  
</div>
 

    <div id="container">
	    <fieldset style="height:550px; ">
    <legend class="legend">Detail List</legend>
    <div id="table1">
		<table cellspacing="0" cellpadding="0">
			<table cellspacing="0" cellpadding="0" >
				<tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
				<th align="left"  colspan="2" >Operation</th>
				<th align="left">Cost Code</th>
				<th align="left" >Client Name</th>
				<th align="left" >Lead</th>
				<th align="left">Date</th>
				<th align="left" >Field</th>
			</tr>

		</table>
			</div>	
		<td width="100%" align="center" valign="top"><iframe id="ContentFrame1" name="I2" height="95%" width="100%" border="0" frameborder="0" src=""> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    </fieldset>

	</div>




  </body>
</html>
