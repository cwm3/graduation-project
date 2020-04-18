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
    
    
    
    <title>Manager Project</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript"  src="vendormanger/addproject.js"></script>
	<script type="text/javascript" src="jquery/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/auto.js"></script>
    <link href="css/button.css" rel="stylesheet" type="text/css" />
    <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="jquery/calendar.js"></script>
    <link href="css/commoncss.css" rel="stylesheet" type="text/css" media="screen" />
    
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
	font-size:100%;
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
	background-color:rgba(204, 204, 204, 0.168627450980392);
	
	padding-bottom:20px;
}

#container1{
	margin:0 auto;
	width:100%;
	margin-left:15px;
}


#container_distribution{
	margin:0 auto;
	width:100%;
	margin-left:20px;
	background:#fff;
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
.table1{
   font-size: 12px;
}
.bottom {
   margin-top:5px;
   margin-left:40%;
   font-size: 12px;
}
	#auto {

background:#ff0000;
color:#ffffff;
}
.biaoti{
 	font-size: 14px;
	font-family : Arial,Tahoma,Verdana;
	color: #033d61; 
} 
.redtext{
   color:red;
}

</style>

<script language="JavaScript"> 

    var XMLHttpReq;
    var currentSort;
    var ifcg="";
    var dalitycapacity="";
    var fwymbz="";
    
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
                if(fwymbz=="1") {
                    updateMenu();
                }else if(fwymbz=="2") {
                   checkcapacity();
                }else if(fwymbz=="3") {
                   getdality();
                }else if(fwymbz=="4") {
                   getvendorid();
                }else if(fwymbz=="5") {
                   caculate();
                }
                
            } else { //页面不正常
                  alert("页面不正常.");
            }
        }
    }
    
    //更新菜单函数
     function checkcapacity() { 
        ifcg=""; 
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        ifcg=res;
    }
    
        //更新菜单函数
     function getdality() { 
        dalitycapacity=""; 
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        dalitycapacity=res;
     }
    
    
    //更新菜单函数
    function updateMenu() { 
        var res=XMLHttpReq.responseXML.getElementsByTagName("res");   
        var list = document.getElementsByName("list").list;
        list.options.length=0;       
        list.options[list.options.length] = new Option("---please choose---","");
        for(var i=0;i<res.length;i++){
            list.options[list.options.length]=new Option(res[i].firstChild.data,res[i].firstChild.data);
        }
    }
    
     var isWF="";
     function caculate() { 
        var hourlywork=XMLHttpReq.responseXML.getElementsByTagName("hourlywork")[0].firstChild.data;
        var postediting=XMLHttpReq.responseXML.getElementsByTagName("postediting")[0].firstChild.data;         
        var newwords=XMLHttpReq.responseXML.getElementsByTagName("newwords")[0].firstChild.data; 
        var rate1=XMLHttpReq.responseXML.getElementsByTagName("rate1")[0].firstChild.data;        
        var rate2=XMLHttpReq.responseXML.getElementsByTagName("rate2")[0].firstChild.data;
        var rate3=XMLHttpReq.responseXML.getElementsByTagName("rate3")[0].firstChild.data;
        var rate4=XMLHttpReq.responseXML.getElementsByTagName("rate4")[0].firstChild.data;
        var systemcode=XMLHttpReq.responseXML.getElementsByTagName("systemcode")[0].firstChild.data;
        var yxbz=XMLHttpReq.responseXML.getElementsByTagName("yxbz")[0].firstChild.data;
        var dropdate=XMLHttpReq.responseXML.getElementsByTagName("dropdate")[0].firstChild.data;
        var deadline=XMLHttpReq.responseXML.getElementsByTagName("deadline")[0].firstChild.data;
        
        
        
        isWF="";
        if(yxbz=="YWF"&workstyle_qj!="hourlywork") {
            alert(systemcode + " has been distributed fully ");
            isWF="YWF";
            clearall();
            return;
        }else {
            caculatedistribution(hourlywork,newwords,postediting,rate1,rate2,rate3,rate4,systemcode,dropdate,deadline);         
        }
        
    }
    
        //
     function getvendorid() { 
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        var a = res.split("||||");
        var vendorid = a[0];
        if(vendorid=="notfound") {
           alert("Vendor Name has not existed ");
           document.getElementById("word").value="";
           document.getElementById("newword").value="";
           
        } else {
           document.getElementById("vendorid").value=a[0];
           document.getElementById("newword").value=a[1];
        }       
    }
    
    // 创建级联菜单函数
    function showSubMenu(obj) {
        fwymbz = "1";
        var username = document.getElementById("lead").value;
        var datedate = document.getElementById("datedate").value;
        sendRequest("menu2.jsp?sort=" + obj+"&username="+username+"&datedate="+datedate);       
    }
    

    
     // 检测剩余产能
    function checksparecapacity(vendorid,startdate,enddate){
         fwymbz = "2";
        sendRequest("checksparecapacity.jsp?vendorid="+vendorid+"&startdate="+startdate+"&enddate="+enddate);
        return  ifcg;  
    }
    
    function getDalityCapacity(vendorid){
         fwymbz = "3";
        sendRequest("getdalitycapacity.jsp?vendorid="+vendorid);
        return  dalitycapacity;  
    }
    

    
    function SelectVendor() {
         var resource = document.getElementById("resource").value;
          if( resource=="" || resource == null) {
		      alert("Please Choose Resource ");
		      return false;
		 }
		 var word = encodeURI(document.getElementById("word").value);
		 if( word=="" || word == null) {
		 alert("Please insert Vendor Name");
		      return false;
		 } else {
		    fwymbz = "4";
            word = encodeURI(word);  //需要通过两次编码
		    sendRequest("showvendor.jsp?vendor_name="+word);
		 } 
		 
		zdjs();		 
    }
    
    function updatecapacitybydistribution(startdate,enddate,vendorid,vendorname,coorespondingwords,systemcode,systemid,lead,worktype,totalwords){
        sendRequest("updatecapacitybydistribution.jsp?startdate="+startdate+"&enddate="+enddate+"&vendorid="+vendorid+"&capacity="+coorespondingwords+"&systemcode="+systemcode+"&systemid="+systemid
        +"&lead="+lead+"&worktype="+worktype+"&totalwords="+totalwords+"&vendorname="+vendorname);   
    }
    
   
   function checkpost2() {
                document.getElementById("table1").style.display="none";
                var systemcode = document.getElementById("systemcode").value;
                var Status = document.getElementById("status").value;
                var dropdate = document.getElementById("datedate").value;
                var lead = document.getElementById("lead").value;
                document.getElementById("ContentFrame1").src="selectprojectbytiaojian.action?systemcode="+systemcode+"&status="
                +Status+"&dropdate="+dropdate+"&lead="+lead;
                return false;
		 }
		 
		
   function csubmittiom() {
                var systemcodeall = document.getElementById("systemcodeall").value;
                var vendorname = document.getElementById("word").value;
                var vendorid = document.getElementById("vendorid").value;
                var lead = document.getElementById("lead").value;
                
                		 		
                var hourlywork = document.getElementById("hourlywork").value;
                var resource = document.getElementById("resource").value;
                var dropname = document.getElementById("dropname").value;
                
                var projectvalue = document.getElementById("projectvalue").value;
                var worktype = document.getElementById("worktype").value;
               
               
                if(systemcodeall==""||systemcodeall==null) {
                    alert("Project must choose ");
                    return false;
                    
                }
                
               if(vendorname==""||vendorname==null) {
                    alert("Vendor/Translator  Name  must be inserted ");
                    return false;
                    
                }
                
                if(resource=="External"){
                  if(vendorid==null || vendorid=="") {
                      alert("Vendor ID must be inserted ");
                      return false;
                  }
                  }
          
                
                var newwords = document.getElementById("newwords").value;
                var postediting = document.getElementById("postediting").value;
                var rate1 = document.getElementById("rate1").value;
                var rate2 = document.getElementById("rate2").value;
                var rate3 = document.getElementById("rate3").value;
                var rate4 = document.getElementById("rate4").value;
                if(newwords==""||newwords==null) {
                      newwords=0;
                }
                
                if(newwords==""||newwords==null) {
                      newwords=0;
                }
                
                if(postediting==""||postediting==null) {
                      postediting=0;
                }
                
                if(rate1==""||rate1==null) {
                      rate1=0;
                }
                
                if(rate2==""||rate2==null) {
                      rate2=0;
                }
                
                if(rate3==""||rate3==null) {
                      rate3=0;
                }
                
                if(rate4==""||rate4==null) {
                      rate4=0;
                }
                
                            
                if(hourlywork==""||hourlywork==null) {
                      hourlywork=0;
                }
     
                hourlywork= parseFloat(hourlywork);
                hourlywork_jl= parseFloat(hourlywork_jl);
                
                postediting= parseFloat(postediting);
                postediting_jl= parseFloat(postediting_jl);
                
                newwords= parseFloat(newwords);
                newwords_jl= parseFloat(newwords_jl);
                
                rate1= parseFloat(rate1);
                rate1_jl= parseFloat(rate1_jl);
                
                rate2= parseFloat(rate2);
                rate2_jl= parseFloat(rate2_jl);
                
                rate3= parseFloat(rate3);
                rate3_jl= parseFloat(rate3_jl);
                
                rate4= parseFloat(rate4);
                rate4_jl= parseFloat(rate4_jl);

 
 
                var totalwords = document.getElementById("totalwords").value;
                var coorespondingwords = document.getElementById("coorespondingwords").value;
                var outsourcedponumber = document.getElementById("outsourcedponumber").value;
                var startdate = document.getElementById("startdate").value;
                var enddate = document.getElementById("enddate").value;
                var comments = document.getElementById("comments").value;
                var ho = document.getElementById("ho").value;
                
                
                var systemcode = systemcodeall.split(",");
                var actionurl = "";
              
			    if(enddate=="" || enddate == null) {
				   alert("Please insert enddate");
				   return false;
			     } 
   
			      var vendorid = document.getElementById("vendorid").value;
			      var dropname = document.getElementById("dropname").value;
			      
                if(systemcode.length== 1 & resource=="External" ) {
				        var ifoucg = checksparecapacity(vendorid,startdate,enddate);
				        if(ifoucg==0) {
				              alert("Vendor capactity has fully booked ");
				              return false;
				          }
				         ifoucg= parseFloat(ifoucg);
                         coorespondingwords= parseFloat(coorespondingwords);
				         if(ifoucg < coorespondingwords){
				               if(pdsffs(ifoucg,coorespondingwords)) {
				              }else {
				                  return false;
				              }
				            }           
                     actionurl = "addOneExternalDistribution.action?vendorid="+
                     vendorid+"&hourlywork="+hourlywork+"&newwords="+newwords+"&postediting="+postediting+"&lead="+lead+"&vendorname="+vendorname+"&comments=&resource="+resource+"&dropname="+dropname+
                     "&rate1="+rate1+"&rate2="+rate2+"&rate3="+rate3+"&rate4="+rate4+"&totalwords="+totalwords+"&coorespondingwords="+coorespondingwords+"&outsourcedponumber="
                     +outsourcedponumber+"&startdate="+startdate+"&projectvalue="+projectvalue+"&enddate="+enddate+"&worktype="+worktype+"&systemcode="+systemcode+"&systemcodeall="+systemcodeall+"&ho="+ho;
                     document.getElementById("ContentFrame3").src= actionurl;
                }
                
                if(systemcode.length== 1 & resource=="Internal" ) {
                     actionurl = "addOneInternalDistribution.action?vendorid="+
                     vendorid+"&hourlywork="+hourlywork+"&newwords="+newwords+"&postediting="+postediting+"&lead="+lead+"&vendorname="+vendorname+"&comments=&resource="+resource+"&dropname="+dropname+
                     "&rate1="+rate1+"&rate2="+rate2+"&rate3="+rate3+"&rate4="+rate4+"&totalwords="+totalwords+"&coorespondingwords="+coorespondingwords+"&outsourcedponumber="
                     +outsourcedponumber+"&startdate="+startdate+"&projectvalue="+projectvalue+"&enddate="+enddate+"&worktype="+worktype+"&systemcode="+systemcode+"&systemcodeall="+systemcodeall+"&ho="+ho;
                     document.getElementById("ContentFrame3").src= actionurl;
                }
                
                
                if(systemcode.length>1 & resource=="Internal" ) {
                     actionurl = "addMuchInternalDistribution.action?vendorid="+
                     vendorid+"&hourlywork="+hourlywork+"&newwords="+newwords+"&postediting="+postediting+"&lead="+lead+"&vendorname="+vendorname+"&comments=&resource="+resource+"&dropname="+dropname+
                     "&rate1="+rate1+"&rate2="+rate2+"&rate3="+rate3+"&rate4="+rate4+"&totalwords="+totalwords+"&coorespondingwords="+coorespondingwords+"&outsourcedponumber="
                     +outsourcedponumber+"&startdate="+startdate+"&projectvalue="+projectvalue+"&enddate="+enddate+"&worktype="+worktype+"&systemcode="+systemcode+"&systemcodeall="+systemcodeall+"&ho="+ho;
                     document.getElementById("ContentFrame3").src= actionurl;
                }
                
                              
                if(systemcode.length>1 & resource=="External" ) {
                    var ifoucg = checksparecapacity(vendorid,startdate,enddate);
				    if(ifoucg==0) {
				         alert("Vendor capactity has fully booked ");
				              return false;
				     }
				    ifoucg= parseFloat(ifoucg);
                    coorespondingwords= parseFloat(coorespondingwords);
				    if(ifoucg < coorespondingwords){
				         if(pdsffs(ifoucg,coorespondingwords)) {
				          }else {
				                  return false;
				              }
				            } 
                
                     actionurl = "addMuchExternalDistribution.action?vendorid="+
                     vendorid+"&hourlywork="+hourlywork+"&newwords="+newwords+"&postediting="+postediting+"&lead="+lead+"&vendorname="+vendorname+"&comments=&resource="+resource+"&dropname="+dropname+
                     "&rate1="+rate1+"&rate2="+rate2+"&rate3="+rate3+"&rate4="+rate4+"&totalwords="+totalwords+"&coorespondingwords="+coorespondingwords+"&outsourcedponumber="
                     +outsourcedponumber+"&startdate="+startdate+"&projectvalue="+projectvalue+"&enddate="+enddate+"&worktype="+worktype+"&systemcode="+systemcode+"&systemcodeall="+systemcodeall+"&ho="+ho;
                     document.getElementById("ContentFrame3").src= actionurl;
                }
                alert(" Outsource Success ");                
                clearall();//清空所有的输入
                //myFrame.window.clearchoose();
                return false;
		} 
		 
		 
		function listDistributionfromiframe(lead,systemcode) {
                document.getElementById("ContentFrame3").src="selectdistribution.action?lead="+lead+"&systemcode="+systemcode;
        
        } 
         		
         		
		 
		function listDistribution() {
		
          var systemcode = document.getElementById("systemcode").value;
          if(systemcode==""||systemcode== null||systemcode== "-1") {
		 		alert(" Please select systemcode");
		 		return false;
		  }
          var lead = document.getElementById("lead").value;
          document.getElementById("ContentFrame3").src="listdistribution.action?lead="+lead+"&systemcode="+systemcode;
          } 

		 function addNumber(_idx){
			var str = '';
			for(var i = 0; i < _idx; i += 1){
			str += Math.floor(Math.random() * 10);
			}
			return str;
		}     
     
    function  chooseResourceType() {	 
		 var resource = document.getElementById("resource").value;
		 
		 
		 if(resource=="Internal") {
		 	
		 	 //document.getElementById("word").value="";
		 	 document.getElementById("vendorid").value="";
		 	 document.getElementById("newword").value="";
		 	// document.getElementById("word").readOnly=true;
		     //document.getElementById("word").style.background="#E0E0E0";
		     document.getElementById("outsourcedponumber").value="PCNSC";
             document.getElementById("selectbution").disabled = true;		 
		 }
		 
	    if(resource=="External"||resource=="choose") {
	       		 	 //document.getElementById("word").readOnly=false;
	       		     //document.getElementById("word").style.background="#FFFFFF";
	                 document.getElementById("selectbution").disabled = false;		 	       
		 }
		 
		 if(resource=="External") {
	       		document.getElementById("outsourcedponumber").value="";
		 }
		 
		 
		 
		 
		 
		 
     } 
     
    function countTotalWords() {
          var coorespondingwords;
          var workstyle = document.getElementById("worktype").value;
          if(workstyle=="choose") {
               alert("WorkStyle must be chosed first");
               clearinput();
		       return false;
               
           }
          if(workstyle=="hourlywork") {
		     return false;
	      }           
	      
          var vendorid = document.getElementById("vendorid").value;
          if( vendorid=="" || vendorid == null) {
		 		  alert("VendorId must be inserted ");
		 		  clearinput();
		          return false;
		 		} 
          var newwords=document.getElementById("newwords").value;
          var hourlywork=document.getElementById("hourlywork").value;
          var postediting=document.getElementById("postediting").value;         
          var startdate=document.getElementById("startdate").value;
          var enddate=document.getElementById("enddate").value;
          if( startdate=="" || startdate == null) {
		  alert("Please insert startdate");
		  clearinput();
		  return false;
	      } 
	      
	      if(enddate=="" || enddate == null) {
		  alert("Please insert enddate");
		  clearinput();
		  return false;
	      } 
          var rate1=document.getElementById("rate1").value;
          var rate2=document.getElementById("rate2").value;
          var toatlword = Number(newwords)+Number(postediting)+Number(rate1)+Number(rate2);

           if(workstyle=="translation") { 
                coorespondingwords = toatlword;
           }
           if(workstyle=="review") { 
             coorespondingwords = Number(toatlword)/3;
           }
           
           var ifoucg = checksparecapacity(vendorid,startdate,enddate);
           if(ifoucg==0) {
              alert("Vendor capactity has fully booked ");
              clearinput();
              return false;
           }
              if(ifoucg < coorespondingwords){
              if(pdsffs(ifoucg,coorespondingwords)) {
              }else {
                  return false;
              }

           } 
           
           coorespondingwords=coorespondingwords.toFixed(1);
           document.getElementById("totalwords").value = toatlword;
           document.getElementById("coorespondingwords").value = coorespondingwords;
     } 
     
     
     function clearinput() {
               document.getElementById("newwords").value="";
		       document.getElementById("postediting").value="";
		       document.getElementById("rate1").value="";
		       document.getElementById("rate2").value="";
		       document.getElementById("rate3").value="";
		       document.getElementById("rate4").value="";
		       document.getElementById("hourlywork").value="";
		       
		       document.getElementById("totalwords").value="";
		       document.getElementById("coorespondingwords").value="";
		       myFrame.window.clearchoose();
		       
     }
     
     function pdsffs(ifoucg,coorespondingwords) {
        
        if((coorespondingwords-ifoucg)>1000) {
            alert("Outsource words has exceed 1000 ");
            return false;
        }else {
           	if (confirm("Outsource words has exceed vendor capacity,are you sure to continue ?")) {
					return true;
				}else {
				 return false;
				
				}
				}
        }     
          
		  
     var hourlywork_jl;//积累的hourlywork值
     var postediting_jl;//积累的postediting值
     var newwords_jl ;//积累的newwords值
     var rate1_jl ;//积累的rate1值
     var rate2_jl ;//积累的rate2值
     var rate3_jl ;//积累的rate3值
     var rate4_jl ;//积累的rate4值
     
     
     
 function caculatedistribution(hourlywork,newwords,postediting,rate1,rate2,rate3,rate4,systemcode,startdate,enddate) {    
     //hourlywork  已全部外发，hourlywork小于0
     var hourly=parseFloat(hourlywork);
     if(hourly<0){
        hourly=0;
     }
     
     document.getElementById("hourlywork").value=hourly;
     document.getElementById("postediting").value=parseFloat(postediting);
     document.getElementById("newwords").value=parseFloat(newwords);
     document.getElementById("rate1").value=parseFloat(rate1);
     document.getElementById("rate2").value=parseFloat(rate2);
     document.getElementById("rate3").value=parseFloat(rate3);
     document.getElementById("rate4").value=parseFloat(rate4);  
     
     document.getElementById("startdate").value=startdate;  
     document.getElementById("enddate").value=enddate;  
     
     
     
     
     hourlywork_jl=hourlywork;//积累的hourlywork值
     postediting_jl=postediting;//积累的postediting值
     newwords_jl=newwords;//积累的newwords值
     rate1_jl=rate1 ;//积累的rate1值
     rate2_jl=rate2 ;//积累的rate2值
     rate3_jl=rate3 ;//积累的rate3值
     rate4_jl=rate4 ;//积累的rate4值
     
        
     document.getElementById("totalwords").value=parseFloat(postediting)+
     parseFloat(newwords)+parseFloat(rate1)+parseFloat(rate2)+parseFloat(rate3)+parseFloat(rate4);
    
     }
   
     var wf_systemcode = "";//外发的project
     
    var  projectes=0;
     function setbackroundecolor(projectgs,obj,dropname) {
         projectes=projectgs;
         wf_systemcode=obj;
         sfjs="";
         document.getElementById("systemcodeall").value=obj; 
         document.getElementById("dropname").value=dropname;
	if(projectgs>1 ) {
     	 document.getElementById("hourlywork").disabled=true;
		 document.getElementById("hourlywork").style.background="#E0E0E0";
         document.getElementById("postediting").disabled=true;
		 document.getElementById("postediting").style.background="#E0E0E0";
         document.getElementById("newwords").disabled=true;
		 document.getElementById("newwords").style.background="#E0E0E0";
         document.getElementById("rate1").disabled=true;
		 document.getElementById("rate1").style.background="#E0E0E0";
         document.getElementById("rate2").disabled=true;
		 document.getElementById("rate2").style.background="#E0E0E0";
		 document.getElementById("rate3").disabled=true;
		 document.getElementById("rate3").style.background="#E0E0E0";
		 document.getElementById("rate4").disabled=true;
		 document.getElementById("rate4").style.background="#E0E0E0";
		 
     }else {
         document.getElementById("hourlywork").disabled=false;
		 document.getElementById("hourlywork").style.background="#FFFFFF";
         document.getElementById("postediting").disabled=false;
		 document.getElementById("postediting").style.background="#FFFFFF";
         document.getElementById("newwords").disabled=false;
		 document.getElementById("newwords").style.background="#FFFFFF";
         document.getElementById("rate1").disabled=false;
		 document.getElementById("rate1").style.background="#FFFFFF";
         document.getElementById("rate2").disabled=false;
		 document.getElementById("rate2").style.background="#FFFFFF";
		 document.getElementById("rate3").disabled=false;
		 document.getElementById("rate3").style.background="#FFFFFF";
		 document.getElementById("rate4").disabled=false;
		 document.getElementById("rate4").style.background="#FFFFFF";
     }
     
        zdjs();
     
	}
	//计算作业
	function  zdjs(){
      var resource = document.getElementById("resource").value;
      var workstyle = document.getElementById("worktype").value;
      var vendorid = document.getElementById("vendorid").value;
      
         if(workstyle !="choose" & wf_systemcode != "" &  wf_systemcode  != null ) {
           if (resource == "External") {
			if (vendorid != "" & vendorid != null) {
                chooseworktype();
	      }	
	 }else {
	        chooseworktype();
	 }
	 }
	}

		   
     function selectall() 
		{  
		    var selectoption = document.getElementById("selectall").value;
		    document.getElementById("selectall").value="Cancel All";		       
		    if(selectoption=="Select All") {
		       myFrame.window.checkall();
		    }else {
		       myFrame.window.cancleall(); 
		       document.getElementById("selectall").value="Select All";		    
		    }
		     
		} 

        
     function clearall() 
		{ 
          document.getElementById("rate1").value=""; 
          document.getElementById("rate2").value=""; 
          document.getElementById("rate3").value=""; 
          document.getElementById("rate4").value=""; 
          
          document.getElementById("rate1").readOnly=false;
	      document.getElementById("rate1").style.background="#FFFFFF";
	      
	      document.getElementById("rate2").readOnly=false;
	      document.getElementById("rate2").style.background="#FFFFFF";
	      
	      document.getElementById("rate3").readOnly=false;
	      document.getElementById("rate3").style.background="#FFFFFF";
	      
	      document.getElementById("rate4").readOnly=false;
	      document.getElementById("rate4").style.background="#FFFFFF";
	       		     
	      document.getElementById("newwords").readOnly=false;
	      document.getElementById("newwords").style.background="#FFFFFF";
	      
	      document.getElementById("postediting").readOnly=false;
	      document.getElementById("postediting").style.background="#FFFFFF";
	      
	      document.getElementById("hourlywork").readOnly=false;
	      document.getElementById("hourlywork").style.background="#FFFFFF";		      		      		     
	       		     
		  document.getElementById("selectall").value="Select All";	
          document.getElementById("newwords").value="";
          document.getElementById("word").value=""; 
          document.getElementById("postediting").value="";
          //document.getElementById("dropname").value=""; 
          document.getElementById("hourlywork").value=""; 
          
          document.getElementById("enddate").value=""; 
          document.getElementById("startdate").value=""; 
          document.getElementById("coorespondingwords").value=""; 
          document.getElementById("outsourcedponumber").value="PCNSC"; 
          document.getElementById("projectvalue").value=""; 
          document.getElementById("totalwords").value=""; 
          document.getElementById("comments").value=""; 
          
          document.getElementById("vendorid").value=""; 
          document.getElementById("newword").value=""; 
                             
          var sel_resource=document.getElementById("resource");
          for(var i=0;i<sel_resource.options.length;i++)
              {
              
  	       if(sel_resource.options[i].text=="Please Choose")
  	         {
  	           sel_resource.options[i].selected=true;
  	       }
  	    }
  	      var sel_worktype=document.getElementById("worktype");
          for(var i=0;i<sel_resource.options.length;i++)
              {              
  	       if(sel_worktype.options[i].text=="Please Choose")
  	         {
  	           sel_worktype.options[i].selected=true;
  	       } 
  	       } 
  	       
		}    
      
 
  function counthourlywork(){     
               sfjs="s";
               chooseworktype();
               sfjs="";
               
   }
 
 var sfjs="";     
function countnewwords(){     
          var newwords=document.getElementById("newwords").value; 
          var newwordd= parseFloat(newwords);
          var newwords_jl_jl= parseFloat(newwords_jl);
          if(newwordd>newwords_jl_jl){
               alert(newwordd+" can not be greater than The sum of the new words");
               document.getElementById("newwords").value=newwords_jl;
               
          }else {
                              sfjs="s";
                              chooseworktype();
                              sfjs="";
                              
                    
          }
   }    
      
      
 function countrate1(){     
          var rate1=document.getElementById("rate1").value; 
          rate1= parseFloat(rate1);
          rate1_jl= parseFloat(rate1_jl);
          if(rate1>rate1_jl){
               alert(rate1+" can not be greater than The sum of the 75%-84% Fuzzy");
               document.getElementById("rate1").value=rate1_jl;
           }else {
                 sfjs="s";
                 chooseworktype();
                 sfjs="";
                 
          }
   }    
           
    function countrate2(){     
          var rate2=document.getElementById("rate2").value; 
          rate2= parseFloat(rate2);
          rate2_jl= parseFloat(rate2_jl);
          if(rate2>rate2_jl){
               alert(rate2+" can not be greater than The sum of the 85%-99% Fuzzy");
               document.getElementById("rate2").value=rate2_jl;
           }else {
                 sfjs="s";
                 chooseworktype();
                 sfjs="";
                 
          }
   }    
            
      function countrate3(){     
          var rate3=document.getElementById("rate3").value; 
          rate3= parseFloat(rate3);
          rate3_jl= parseFloat(rate3_jl);
          if(rate3>rate3_jl){
               alert(rate3+" can not be greater than The sum of the 75%-99% Fuzzy");
               document.getElementById("rate3").value=rate3_jl;
               
          }else {
                 sfjs="s";
                 chooseworktype();
                 sfjs="";
                 
          }
   }  
       var rate4_new ="aa";
       function countrate4(){     
          rate4_new=document.getElementById("rate4").value; 
          rate4_new= parseFloat(rate4_new);
          rate4_jl= parseFloat(rate4_jl);
          if(rate4_new>rate4_jl){
               alert(rate4_new+" can not be greater than The sum of the 100% Repetition");
               document.getElementById("rate4").value="0";
                 sfjs="s";
                 chooseworktype();
                 sfjs="";
             }else {
                 sfjs="s";
                 chooseworktype();
                 sfjs="";
          }
   } 
   
   
    function countpostediting(){     
          var postediting=document.getElementById("postediting").value; 
          postediting= parseFloat(postediting);
          postediting_jl= parseFloat(postediting_jl);
          if(postediting>postediting_jl){
               alert(postediting+" can not be greater than The sum of the postediting");
               document.getElementById("postediting").value=postediting_jl;
             }else {
                 sfjs="s";
                 chooseworktype();
                 sfjs="";
          }
   } 
   
    
  function caculateoutsource(){ 
          var workstyle = document.getElementById("coorespondingwords").value;
          var startdate=document.getElementById("startdate").value;
          var enddate=document.getElementById("enddate").value;
          if( startdate=="" || startdate == null) {
		  alert("Please insert startdate");
		  return false;
	      } 
	      
	      if(enddate=="" || enddate == null) {
		  alert("Please insert enddate");
		  return false;
	      } 
	      
	      var vendorid = document.getElementById("vendorid").value;
	      var dropname = document.getElementById("dropname").value;
	      
          if(resource=="External"){
		           var ifoucg = checksparecapacity(vendorid,startdate,enddate);
		           if(ifoucg==0) {
		              alert("Vendor capactity has fully booked ");
		              myFrame.window.clearchoose();
		              return false;
		           }
		              if(ifoucg < coorespondingwords){
		              if(pdsffs(ifoucg,coorespondingwords)) {
		              }else {
		                  return false;
		              }
		
		           } 
		              
           }
           
           
           		   
   } 
   
  var workstyle_qj="";//全局的workstyle
     // 选择worktype的时候计算  Cooresponding 
    function chooseworktype() {
         var coorespondingwords="";           
         var resource = document.getElementById("resource").value;
         var workstyle = document.getElementById("worktype").value;
         if(workstyle=="choose") {
	         alert("WorkStyle must be chosed first");
			 return false;
	      }
          workstyle_qj=workstyle;
          var vendorid = document.getElementById("vendorid").value;
	      var dropname = document.getElementById("dropname").value;
	      
	     if (resource == "External") {
			if (vendorid == "" || vendorid == null) {
				alert("Vendor must be inserted ");
				return false;
			}
		}
		
	    if(wf_systemcode == "" || wf_systemcode == null) {
				alert("Project must be chose ");
				return false;
			}
		
		
		fwymbz = "5";
		if (sfjs != "s") {
			sendRequest("loadprojectinfo.jsp?systemcode=" + wf_systemcode
					+ "&workstyle=" + workstyle);
		}
		if (isWF == "YWF") {
			clearall();
			return;
		}

		var newwords = document.getElementById("newwords").value;
		var hourlywork = document.getElementById("hourlywork").value;
		var postediting = document.getElementById("postediting").value;
		var rate1 = document.getElementById("rate1").value;
		var rate2 = document.getElementById("rate2").value;
		var rate3 = document.getElementById("rate3").value;
		if (workstyle == "translation" & rate4_new == "aa" ) {
			document.getElementById("rate4").value="0";
		}
		
		var rate4 = document.getElementById("rate4").value;
		
		
		

		if (workstyle == "hourlywork") {
			newwords = 0;
			postediting = 0;
			rate1 = 0;
			rate2 = 0;
			rate3 = 0;
			rate4 = 0;

			document.getElementById("newwords").disabled = true;
			document.getElementById("newwords").style.background = "#E0E0E0";

			document.getElementById("postediting").disabled = true;
			document.getElementById("postediting").style.background = "#E0E0E0";

			document.getElementById("rate1").disabled = true;
			document.getElementById("rate1").style.background = "#E0E0E0";

			document.getElementById("rate2").disabled = true;
			document.getElementById("rate2").style.background = "#E0E0E0";

			document.getElementById("rate3").disabled = true;
			document.getElementById("rate3").style.background = "#E0E0E0";

			document.getElementById("rate4").disabled = true;
			document.getElementById("rate4").style.background = "#E0E0E0";

		} else if (workstyle != "hourlywork" & projectes == 1) {

			document.getElementById("postediting").disabled = false;
			document.getElementById("postediting").style.background = "#FFFFFF";

			document.getElementById("newwords").disabled = false;
			document.getElementById("newwords").style.background = "#FFFFFF";

			document.getElementById("rate1").disabled = false;
			document.getElementById("rate1").style.background = "#FFFFFF";

			document.getElementById("rate2").disabled = false;
			document.getElementById("rate2").style.background = "#FFFFFF";

			document.getElementById("rate3").disabled = false;
			document.getElementById("rate3").style.background = "#FFFFFF";

			document.getElementById("rate4").disabled = false;
			document.getElementById("rate4").style.background = "#FFFFFF";

		}
		

		var totalwords = Number(newwords) + Number(postediting) + Number(rate1)+ Number(rate2) + Number(rate3) + Number(rate4);

		if (workstyle == "translation") {
			coorespondingwords = totalwords;
			document.getElementById("hourlywork").value = "0";
		}
		
		if (workstyle == "review") {
			coorespondingwords = Number(totalwords) / 3;
			document.getElementById("hourlywork").value = "0";
		}

		if (workstyle == "hourlywork" && resource != "Internal") {
			if (hourlywork == "" || hourlywork == null) {
				alert("Please insert hourlywork");
				return false;
			}
			
			var dalitycapacity = getDalityCapacity(vendorid);
			coorespondingwords = hourlywork * dalitycapacity / 8;
		}

		if (workstyle == "hourlywork") {

			document.getElementById("newwords").value = "0";
			document.getElementById("postediting").value = "0";
			document.getElementById("rate1").value = "0";
			document.getElementById("rate2").value = "0";
			document.getElementById("rate3").value = "0";
			document.getElementById("rate4").value = "0";
		}

		if (coorespondingwords != "") {
			coorespondingwords = parseInt(coorespondingwords);
		}
		
		
		document.getElementById("totalwords").value = totalwords;
		document.getElementById("coorespondingwords").value = coorespondingwords;

		/*       if(coorespondingwords==0&workstyle!="hourlywork") {
		          alert("Project has been distributed fully ! ");
		      } */

	}
</script>
  
  </head>
  
  <body>
  
    </br>
    <div class="biaoti"><center>Outsource Project</center></div>
    
    <div class="allpage"> 
      
    <form method="post" action="" id="myform"  name="myform" onsubmit="return checkpost2();" >
    <fieldset style="height:120px; ">
    <legend class="legend">Query Conditions</legend>
      <div class="tijiao">   
     <table width="100%" border="0" cellspacing="0"    cellpadding="0">
     

     <tr>
     
    <td align="right" >
     Date
     </td>
    <td><input type="text" id="datedate"  name="datedate"  onclick="new Calendar_new(null, null, 1).show(this);"  style="width:200px;height:22px;" ></td>
     
	</tr>
	
    </table>
      </div>  
     <div class="bottom">              
    	<input type="submit" value="Query" class="buttonstyle"  style="width:60px;height:25px;font-size: 11px;" />
    	<input type="reset" value="Reset" class="buttonstyle" style="width:60px;height:25px;font-size: 11px;" />
      </div> 
   
</fieldset>
    </form>
    </div>

</div>

	
    <div id="container">
    <fieldset style="height:500px; ">
    <legend class="legend">Project Information</legend>
    <div id="table1">
		<table cellspacing="0" cellpadding="0">
				<tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
				<th align="left"></th>
				<th align="left" >Client</th>
				<th align="left" >CostCode</th>
				
			    <th align="left" >Deadline</th>
				<th align="left">Hourlywork</th>
	        
							
				<th align="left" >Manager</th>
				<th align="left" >Lead</th>
			
			</tr>

		</table>
   </div>	
   
   <td width="100%" align="center" valign="top"><iframe id="ContentFrame1" name="myFrame" height="98%" width="100%"  border="0" frameborder="0" src=""> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    </fieldset>
	
	</div>
    </body>
</html> 

