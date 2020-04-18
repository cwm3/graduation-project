<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int i =1 ;
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>project list</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="style/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
   	<script type="text/javascript"  src="projectmanger/listproject.js"></script>
   	<script type="text/javascript" src="js/jquery.js"></script>
   	
<style>

body{
	margin:0;
	padding:0;
	font:70% Arial, Helvetica, sans-serif; 
	color:#555;
	line-height:150%;
	text-align:center;
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
	margin:0 5px 5px 10px;
	width:100%;
	align:center;
	background:#fff;
	padding-bottom:5px;
    font-size:10px;
}
#content{margin:0 20px;}
p.sig{	
	margin:0 auto;
	width:680px;
	padding:1em 0;
}
form{
	margin:1em 0;
	padding:.2em 20px;
	background:#eee;
}
</style>

<script language="javascript">  

  var XMLHttpReq;
  var currentSort;
  var qjym=""; 
  var wfsl="0";
  var dropnamevalue="";
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
                   if(qjym=="loadprojectinfo"){
                      caculate();
                   }else if(qjym=="checkproject") {
                      checkwfsl();
                   }else if (qjym=="getdropname") {
                          dropame();
                   }
            } else { //页面不正常
                  alert("页面不正常.");
            }
        }
    }
    
    function dropame() {
         dropamevalue=XMLHttpReq.responseXML.getElementsByTagName("dropname")[0].firstChild.data; 
         dropamevalue=dropamevalue.replace("201720172017","&")
    }
    
 function caculate() { 
        var hourlywork=XMLHttpReq.responseXML.getElementsByTagName("hourlywork")[0].firstChild.data;
        var postediting=XMLHttpReq.responseXML.getElementsByTagName("postediting")[0].firstChild.data;         
        var newwords=XMLHttpReq.responseXML.getElementsByTagName("newwords")[0].firstChild.data; 
        var rate1=XMLHttpReq.responseXML.getElementsByTagName("rate1")[0].firstChild.data;        
        var rate2=XMLHttpReq.responseXML.getElementsByTagName("rate2")[0].firstChild.data;
        var rate3=XMLHttpReq.responseXML.getElementsByTagName("rate3")[0].firstChild.data;
        var rate4=XMLHttpReq.responseXML.getElementsByTagName("rate4")[0].firstChild.data;
        var systemcode=XMLHttpReq.responseXML.getElementsByTagName("systemcode")[0].firstChild.data;
        
        document.parentWindow.parent.caculatedistribution(hourlywork,newwords,postediting,rate1,rate2,rate3,rate4,systemcode); 
        
    }
   
   
 function checkwfsl() { 
     wfsl=XMLHttpReq.responseXML.getElementsByTagName("wfsl")[0].firstChild.data;   
 }  
   
var projectgs=0;
function showbox(){
    var cb= document.getElementsByName('allcheck');
    var obj="";
    projectgs=0;
    var count=0;
        for(var i = 0; i < cb.length; i++){
        
        if(cb[i].checked == true) { 
        count=i;           
        projectgs++;  
        if(projectgs==1){
            obj="'"+cb[i].value+"'";
        }else {
            obj=obj+",'"+cb[i].value+"'";
        }
              
        }  
       
     }  
    getdropname(cb[count].value);
    window.parent.setbackroundecolor(projectgs,obj,dropamevalue); 
        
  }
 
 function checkdisttibution(systemcode) {
     qjym="checkproject";
     sendRequest("checkproject.jsp?systemcode=" + systemcode);       
 }
 
  function getdropname(systemcode) {
     qjym="getdropname";
     sendRequest("getdropname.jsp?systemcode=" + systemcode);       
 }
   
  
function  checkall(){
     var cb= document.getElementsByName('allcheck');
        for(var i = 0; i < cb.length; i++){
            cb[i].checked = true;
            showbox(cb[i].value);    
        }
  }
  
function  canclechoose(chooseproject){
     var cb= document.getElementsByName('allcheck');
        for(var i = 0; i < cb.length; i++){
            if(cb[i].value==chooseproject){
                   cb[i].checked = false;
            }
        }
        
         document.parentWindow.parent.setbackroundecolor(0,""); 
        
  }
   

function  cancleall(){
     var cb= document.getElementsByName('allcheck');
        for(var i = 0; i < cb.length; i++){
            cb[i].checked = false;
        }
  }
   
  
function clearchoose(){
     var cb= document.getElementsByName('allcheck');
        for(var i = 0; i < cb.length; i++){
            cb[i].checked = false;
        }
  } 
  
  	function open_win(i) {		
              var systemcode=document.getElementById("systemcode"+i).value;
              var userposition=document.getElementById("userposition"+i).value;              
		      var ren  = window.showModalDialog("selectdistributionbysystemcode.action?systemcode="+systemcode+"&remark1="+userposition,"","dialogWidth:1500px;dialogHeight:450px;center:1;status:0");
		      if(ren=="1") {
		         window.showModalDialog("selectdistributionbysystemcode.action?systemcode="+systemcode+"&remark1="+userposition,"","dialogWidth:1500px;dialogHeight:450px;center:1;status:0");
		      }
		      return false;
		}
		 
  

</script>  

</head>
<body>


    <div id="container">
	
		<table cellspacing="0" cellpadding="0" >
				<tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
				<th  align="left"></th>
				<th align="left" >Client</th>
				<th align="left">CostCode</th>
				<th align="left">Drop Name</th>
			    <th align="left">System Code</th>
			    <th align="left">&nbsp;&nbsp;&nbsp;&nbsp;DropDate&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th align="left">&nbsp;&nbsp;&nbsp;&nbsp;Deadline&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th align="left" >Hourlywork</th>
				<th align="left" >New Words </th>
				<th align="left" >Post-editing</th>
				<th align="left" >75%-84% Fuzzy</th>
				<th align="left" >85%-99% Fuzzy</th>
				<th align="left" >75%-99% Fuzzy</th>
				<th align="left" >100% Fuzzy</th>
				<th align="left" >Total Words</th>
				<th align="left" >PO Value</th>
				<th align="left">Status</th>
			    <th align="left" >PO Type</th>
				<th align="left" >Language Pair</th>
			    <th align="left" >iMTQuality</th>			
				<th align="left" >iMT Champion</th>
				<th align="left" >Manager</th>
			    <th align="left">Lead</th>
				<th align="left" >Comment</th>
			
			</tr>
			
				<s:iterator value="#request.list" id="project">
			    <tr align="left" >
			    <td style="display:none;"><%=i++ %></td>
			    <td bgcolor='#e5f1f4' >&nbsp;<input  type="checkbox" name="allcheck" value="<s:property value='#project.systemcode' />"   onclick="showbox(this.value)" ></td>
				<td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.client"/>&nbsp;</td>
				<td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.costcode"/>&nbsp;</td>
				<td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.dropname"/>&nbsp;</td>
			    <s:if test="#project.status=='close'">
				<td bgcolor='#e5f1f4' >&nbsp;<a href="#" onclick="return open_win(<%=i%>);" ><font color="black" ><s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
				</s:if>
			     <s:elseif test="#project.status=='headsup'">
				<td bgcolor='#84C1FF' >&nbsp;<a href="#" onclick="return open_win(<%=i%>);" ><font color="black" > <s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
				</s:elseif>
				 <s:elseif test="#project.status=='inprocess'&#project.remark6=='wqbwf_red'">
				<td bgcolor='#FF5151' >&nbsp;<a href="#" onclick="return open_win(<%=i%>);" ><font color="black" > <s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
				</s:elseif>
				 <s:elseif test="#project.status=='inprocess'&#project.remark6=='qbwf_yellow'">
				<td bgcolor='#FFFFAA' >&nbsp; <a href="#" onclick="return open_win(<%=i%>);" ><font color="black" > <s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
				</s:elseif>
				 <s:elseif test="#project.status=='inprocess'&#project.remark6=='qbwf_green'">
				<td bgcolor='#BBFFBB' >&nbsp;<a href="#" onclick="return open_win(<%=i%>);" ><font color="black" > <s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
				</s:elseif>
				 <s:elseif test="#project.status=='inprocess'&#project.remark6=='qbwf_nocolor'">
				<td bgcolor='#e5f1f4' >&nbsp;<a href="#" onclick="return open_win(<%=i%>);" ><font color="black" > <s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
				</s:elseif>
				<s:else>
				<td bgcolor='#e5f1f4' >&nbsp; <a href="#" onclick="return open_win(<%=i%>);" > <font color="black" ><s:property value="#project.systemcode"/></font><input id="userposition<%=i%>" name="userposition" value="<s:property value='#project.userposition' />"  type="hidden" /><input id="systemcode<%=i%>" name="systemcode" value="<s:property value='#project.systemcode' />"  type="hidden" /></td>
			   	</s:else>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.dropdate"/>&nbsp;</td>
				<td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.deadline"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.hourlywork"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.newwords"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.postediting"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.rate1"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.rate2"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.rate3"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.rate4"/>&nbsp;</td> 
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.totalwords"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.receivedpovalue"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.status"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.potype"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.Languagebegin"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.imtquality"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.imtchampion"/>&nbsp;</td>			    
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.lmorgl"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.lead"/>&nbsp;</td>
			    <td bgcolor='#e5f1f4' >&nbsp;<s:property value="#project.comment"/>&nbsp;</td>
			    <td style="display:none" ><s:property value="#project.id" /></td>
			</tr>			
		</s:iterator>																		        	
		</table>

		
	</div>
</div>

  </body>
</html>
