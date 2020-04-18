<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<% 
 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	Distribution distribution= (Distribution)request.getAttribute("distribution");
	String systemcode=distribution.getSystemcode();
	String vendorname=distribution.getVendorname();
    String vendorid=distribution.getVendorid();
    String id= String.valueOf(distribution.getId());
        
    String worktype=distribution.getWorktype();
    String hourlywork=distribution.getHourlywork();
    if(hourlywork==null){
       hourlywork="";
    };
    String newwords=distribution.getNewwords();
    if(newwords==null){
       newwords="0";
    };
    String postediting=distribution.getPostediting();
    if(postediting==null){
       postediting="0";
    };
    String dropname=distribution.getDropname();
    String rate1=distribution.getRate1();
    String rate2=distribution.getRate2();
    String rate3=distribution.getRate3();
    String rate4=distribution.getRate4();
    String totalwords=distribution.getTotalwords();
    String outsourcedponumber=distribution.getOutsourcedponumber();
    String startdate=distribution.getStartdate();
    String enddate=distribution.getEnddate();
    String lead=distribution.getLead();
    String projectvalue=distribution.getProjectvalue();
    String coorespondingwords=distribution.getCoorespondingwords();
    String pzxh=distribution.getPzxh();
    String resource=distribution.getResource();
    String comments=distribution.getComments();
    String status=distribution.getStatus();
    String ho=distribution.getHo();
      if(ho==null){
       ho="";
    };
   
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%@page import="com.productsystem.model.Distribution"%>

<title>Update Distribution</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" media="screen" href="updatecss/css-table.css" />
<script type="text/javascript" src="updatecss/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="updatecss/js/style-table.js"></script>
<script type="text/javascript" src="js3/calendar.js"></script>

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
                }else if(fwymbz=="2") {
                   checkcapacity();
                }else if(fwymbz=="3") {
                   getdality();
                }else if(fwymbz=="4") {
                   getsyzy();
                }
                
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
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
    
    var newwords_sy="0";
    var postediting_sy="0";
    var rate1_sy="0";
    var rate2_sy="0";
    var rate3_sy="0";
    var rate4_sy="0";
     //查询剩余作业数量
     function getsyzy() { 
          newwords_sy=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
          postediting_sy=XMLHttpReq.responseXML.getElementsByTagName("res")[1].firstChild.data;
          rate1_sy=XMLHttpReq.responseXML.getElementsByTagName("res")[2].firstChild.data;
          rate2_sy=XMLHttpReq.responseXML.getElementsByTagName("res")[3].firstChild.data;
          rate3_sy=XMLHttpReq.responseXML.getElementsByTagName("res")[4].firstChild.data;
          rate4_sy=XMLHttpReq.responseXML.getElementsByTagName("res")[5].firstChild.data;
     }
    
    
     // 检测剩余产能
    function checksparecapacity(vendorid,startdate,enddate,pzxh){
        fwymbz = "2";
        sendRequest("checksparecapacitybyupdate.jsp?vendorid="+vendorid+"&startdate="+startdate+"&enddate="+enddate+"&pzxh="+pzxh);
        return  ifcg;  
    }
    
    function getDalityCapacity(vendorid){
         fwymbz = "3";
        sendRequest("getdalitycapacity.jsp?vendorid="+vendorid);
        return  dalitycapacity;  
    }
    
    
    function updatecapacitybydistribution(startdate,enddate,vendorid,vendorname,coorespondingwords,systemcode,systemid,lead,worktype,totalwords){
    
        sendRequest("updatecapacitybydistribution.jsp?startdate="+startdate+"&enddate="+enddate+"&vendorid="+vendorid+"&capacity="+coorespondingwords+"&systemcode="+systemcode+"&systemid="+systemid
        +"&lead="+lead+"&worktype="+worktype+"&totalwords="+totalwords+"&vendorname="+vendorname);   
    }
    //检查剩余作业
    function checksyzy(systemcode,worktype){
         fwymbz = "4";
        sendRequest("getsyzy.jsp?systemcode="+systemcode+"&worktype="+worktype);
    }
    
    
    var ifnwf="";
    function checkdistribution() {
                var systemcode = document.getElementById("systemcode").value;
                var vendorname = document.getElementById("vendorname").value;
                var vendorid = document.getElementById("vendorid").value;
                var hourlywork = document.getElementById("hourlywork").value;
                var projectvalue = document.getElementById("projectvalue").value;
                var worktype = document.getElementById("worktype").value;
                var resource = document.getElementById("resource").value;
                
                var newwords = document.getElementById("newwords").value;
                var postediting = document.getElementById("postediting").value;
                var rate1 = document.getElementById("rate1").value;
                var rate2 = document.getElementById("rate2").value;
                var totalwords = document.getElementById("totalwords").value;
                var coorespondingwords = document.getElementById("coorespondingwords").value;
                var outsourcedponumber = document.getElementById("outsourcedponumber").value;
                var startdate = document.getElementById("startdate").value;
                var enddate = document.getElementById("enddate").value;
                var lead = document.getElementById("lead").value;
                var pzxh = document.getElementById("pzxh").value;
                ifnwf="Y";
		 		if(coorespondingwords=="" || coorespondingwords == null) {
		 		  alert(" please insert distribtion infomation ");
		 		  ifnwf="N";
		 		  return false;
		 		  
		 		}
		 		if(resource=="External"){
		 		  var totalcapacity=checksparecapacity(vendorid,startdate,enddate,pzxh);
		 		  if(Number(totalcapacity)<Number(totalwords)) {
		 		  alert(vendorid+" has not enough sparecapity !");
		 		  ifnwf="N";
		 		  return false;
		 		}
		 		}
		 	  
                
		}         

    function countTotalWords() {
         
          var coorespondingwords;          
          var workstyle = document.getElementById("worktype").value;          
          var pzxh = document.getElementById("pzxh").value;           
          var vendorid = document.getElementById("vendorid").value;
          var newwords=document.getElementById("newwords").value;
          var hourlywork=document.getElementById("hourlywork").value;
          var postediting=document.getElementById("postediting").value;         
          var startdate=document.getElementById("startdate").value;
          var enddate=document.getElementById("enddate").value;
          var enddate=document.getElementById("enddate").value;
          
          var rate1=document.getElementById("rate1").value;
          var rate2=document.getElementById("rate2").value;
          var rate3=document.getElementById("rate3").value;
          var rate4=document.getElementById("rate4").value;
          
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
                
          var systemcode=document.getElementById("systemcode").value;
          // 检查剩余作业数量
          checksyzy(systemcode,workstyle);
          
          var  newwords_ywf ='<%=newwords %>';
          newwords_sy= parseFloat(newwords_sy);
          newwords= parseFloat(newwords);
          newwords_ywf= parseFloat(newwords_ywf);
          var syzy_newwords = newwords_sy+newwords_ywf;
          if(newwords>newwords_sy+newwords_ywf) {
             alert("The remaining of New Words is "+ syzy_newwords+",and "+newwords +" has been greater than it ! " );   
             document.getElementById("newwords").value=newwords_ywf;
             return false;       
          }
          
          
          postediting= parseFloat(postediting);
          postediting_sy= parseFloat(postediting_sy);
          
          var postediting_ywf ='<%=postediting %>';
          postediting_ywf= parseFloat(postediting_ywf);
          var syzy_postediting = postediting_sy+postediting_ywf;
          if(postediting>syzy_postediting) {
             alert("The remaining of Postediting is "+ syzy_postediting+",and "+postediting +" has been greater than it ! " );   
             document.getElementById("postediting").value=postediting_ywf;
             return false;       
          }
          

          rate1= parseFloat(rate1);
          rate1_sy= parseFloat(rate1_sy);
          
          var rate1_ywf ='<%=rate1 %>';
          rate1_ywf= parseFloat(rate1_ywf);
          var syzy_rate1 = rate1_sy+rate1_ywf;
          if(rate1>syzy_rate1) {
             alert("The remaining of 75%-84% Fuzzy is "+ syzy_rate1+",and "+rate1 +" has been greater than it ! " );   
             document.getElementById("rate1").value=rate1_ywf;
             return false;       
          }
           
          rate2= parseFloat(rate2);
          rate2_sy= parseFloat(rate2_sy);
          
          var rate2_ywf ='<%=rate2 %>';
          rate2_ywf= parseFloat(rate2_ywf);
          var syzy_rate2 = rate2_sy+rate2_ywf;
          if(rate2>syzy_rate2) {
             alert("The remaining of 85%-99% Fuzzy is "+ syzy_rate2+",and "+rate2 +" has been greater than it ! " );   
             document.getElementById("rate2").value=rate2_ywf;
             return false;       
          }
          
          rate3= parseFloat(rate3);
          rate3_sy= parseFloat(rate3_sy);
          
          var rate3_ywf ='<%=rate3 %>';
          rate3_ywf= parseFloat(rate3_ywf);
          var syzy_rate3 = rate3_sy+rate3_ywf;
          if(rate3>syzy_rate3) {
             alert("The remaining of 75%-99% Fuzzy is "+ syzy_rate3+",and "+rate3 +" has been greater than it ! " );   
             document.getElementById("rate3").value=rate3_ywf;
             return false;       
          }
          
          rate4= parseFloat(rate4);
          rate4_sy= parseFloat(rate4_sy);
          
          var rate4_ywf ='<%=rate4 %>';
          rate4_ywf= parseFloat(rate4_ywf);
          var syzy_rate4 = rate4_sy+rate4_ywf;
          if(rate4>syzy_rate4) {
             alert("The remaining of 100% Repetition is "+ syzy_rate4+",and "+rate4 +" has been greater than it ! " );   
             document.getElementById("rate4").value=rate4_ywf;
             return false;       
          }
          
          var toatlword = Number(newwords)+Number(postediting)+Number(rate1)+Number(rate2)+Number(rate3)+Number(rate4);

           if(workstyle=="translation") { 
                coorespondingwords = toatlword;
           }
           if(workstyle=="review") { 
             coorespondingwords = Number(toatlword)/3;
           }
           
            if(workstyle=="hourlywork") {         
	          if( hourlywork=="" || hourlywork == null) {
				  alert("Please insert hourlywork");
				  return false;
			      } 
			     var dalitycapacity = getDalityCapacity(vendorid);
			     coorespondingwords = hourlywork*dalitycapacity/8;
           }
           coorespondingwords=coorespondingwords.toFixed(1);
           document.getElementById("totalwords").value = toatlword;
           document.getElementById("coorespondingwords").value = coorespondingwords;      
     } 
     
     
   function clearinput() {
               document.getElementById("newwords").value="";
               document.getElementById("hourlywork").value="";
		       document.getElementById("postediting").value="";
		       document.getElementById("rate1").value="";
		       document.getElementById("rate2").value="";
		       document.getElementById("rate3").value="";
		       document.getElementById("rate4").value="";
		       document.getElementById("totalwords").value="";
		       document.getElementById("coorespondingwords").value="";
     }
     
     function pdsffs(ifoucg,coorespondingwords) {
        if((coorespondingwords-ifoucg)>1000) {
            alert("Outsource words has exceed 1000 ");
            clearinput();
            return false;
        }else {
           	if (confirm("Outsource words has exceed vendor capacity,are you sure to continue ?")) {
					return true;
				}else {
		         clearinput();
				 return false;
				
				}
				}
        }     
            
 $(document).ready(function () {          
 
       $("#updatedistribution").click(function () { 
       //必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法
         var params = $("#subdistributionForm").serialize();
        $.ajax({
            url:'updatedistribution.action',
            type:'post',
            data:params,
            dataType:'json',
            beforeSend:function(){
		          if (confirm("be sure to update this message ?")) {
		            checkdistribution();
		            if(ifnwf=="N") {
		                return false;
		            }		          
					return true;
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

    // 选择worktype的时候计算  Cooresponding 
    function chooseworktype() {
         var coorespondingwords="";  
         var resource = document.getElementById("resource").value;
         var worktype = document.getElementById("worktype").value;
         var vendorid = document.getElementById("vendorid").value;
         
         if(worktype=="choose") {
	         alert("WorkType must be chosed first");
			 return false;
	      }
	      
  	      if(resource=="External"){
          if(vendorid=="" || vendorid == null) {
		 		  alert("Vendor must be inserted ");
		          return false;
           }
           }
           
          var newwords=document.getElementById("newwords").value;
          var hourlywork=document.getElementById("hourlywork").value;
          var postediting=document.getElementById("postediting").value;          
          var rate1=document.getElementById("rate1").value;
          var rate2=document.getElementById("rate2").value;
          var rate3=document.getElementById("rate3").value;
          var rate4=document.getElementById("rate4").value;
          
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
                
      
          
          var totalwords = Number(newwords)+Number(postediting)+Number(rate1)+Number(rate2)+Number(rate3)+Number(rate4);

           if(worktype=="translation") { 
               coorespondingwords = totalwords;
           }
           if(worktype=="review") { 
               coorespondingwords = Number(totalwords)/3;
           }

           if(worktype=="hourlywork" & resource!="Internal") {         
	            if(hourlywork=="" || hourlywork == null) {
				    alert("Please insert hourlywork");
				    return false;
			      } 
			     var dalitycapacity = getDalityCapacity(vendorid);
			     coorespondingwords = hourlywork*dalitycapacity/8;
           }
           if(coorespondingwords!=""){
               coorespondingwords=coorespondingwords.toFixed(1);           
           }
           document.getElementById("totalwords").value = totalwords;
           document.getElementById("coorespondingwords").value = coorespondingwords;   
    }
    
    
      
</script>
</head>

<body style="background:url('images/back100.jpg');text-align:center;" >
		<form  id="subdistributionForm" name="subdistributionForm" >

<table id="travel" >

    
    <thead>    
    	<tr>
            <th scope="col"  colspan="2"  >Update Distribution</th>
        </tr>
        
       
    </thead>
    <tbody>
    	<tr style="display: none" >
    		<th colspan="1" scope="row" width="30%" >Id</th>
            <td colspan="1" > <input id="id" name="id"  type="text" value="<%=id %>" style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
            	<tr>
    		<th colspan="1" scope="row" width="30%" >lead</th>
            <td colspan="1" > <input id="lead" name="lead"  type="text" value="<%=lead %>" style="width:100%;height:20px;font-size:11px;;background:#E0E0E0" readonly="true"  /></td>
        </tr>
        
                    	<tr>
    		<th colspan="1" scope="row" width="30%" >status</th>
            <td colspan="1" > <input id="status" name="status"  type="text" value="<%=status %>" style="width:100%;height:20px;font-size:11px;;background:#E0E0E0" readonly="true"  /></td>
        </tr>
        
                    
         <tr style="display: none" >
    		<th colspan="1" scope="row" width="30%" >pzxh</th>
            <td colspan="1" >  <input id="pzxh" name="pzxh"  type="text" value="<%=pzxh %>" style="width:100%;height:20px;font-size:11px;;background:#E0E0E0" readonly="true"  /></td>
        </tr> 
        <tr>
    		<th colspan="1" scope="row" width="30%"  >System Code</th>
            <td colspan="1" ><input id="systemcode" name="systemcode" value="<%=systemcode %>" style="width:100%;height:20px;font-size:11px;;background:#E0E0E0" readonly="true"  /></td>
        </tr>    
        
        <tr>
    		<th colspan="1" scope="row" width="30%" >Resource</th>
            <td colspan="1" > <input id="resource" name="resource"  value="<%=resource %>" style="width:100%;height:20px;font-size:11px;background:#E0E0E0"  /></td>
        </tr>
       
       <tr>
    		<th colspan="1" scope="row" width="30%" >Vendor/Translator Name</th>
            <td colspan="1" > <input id="vendorname" name="vendorname"  value="<%=vendorname %>"   readonly="true" style="width:100%;height:20px;font-size:11px;background:#E0E0E0"  /></td>
        </tr>
        
        
        <tr style="display: none" >
    		<th colspan="1" scope="row" width="30%" >Vendor Id</th>
            <td colspan="1" >  <input id="vendorid" name="vendorid" value="<%=vendorid %>"  style="width:100%;height:20px;font-size:11px;background:#E0E0E0""  /></td>
        </tr>
        
          <tr>
    		<th colspan="1" scope="row" width="30%" >Drop Name</th>
            <td colspan="1" ><input id="dropname" name="dropname"  value="<%=dropname %>" style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        

        <tr>
    		<th colspan="1" scope="row" width="30%" >Work Type</th>
            <td colspan="1" style="text-align:left" >
               <select id ="worktype" name="worktype"  style="font-size:12px;width:20%;"    onchange="chooseworktype()" >
		           <option  <% if(worktype.equals("hourlywork")) {  out.print("selected='selected'");} %>  value="hourlywork">Hourly Work</option>
		           <option <% if(worktype.equals("translation")) { out.print("selected='selected'");}  %>  value="translation">Translation</option>
		           <option <% if(worktype.equals("review")) { out.print("selected='selected'");}  %>  value="review">Review</option>
		   </select>            
            </td>          
        </tr>
        
           <tr>
    		<th colspan="1" scope="row" width="30%" >Start Date</th>
            <td colspan="1" > <input id="startdate" name="startdate"  value="<%=startdate %>"  readonly="readonly" onclick="new Calendar_new(null, null, 1).show(this);"   style="width:100%;height:20px;font-size:11px;" /></td>
        </tr>
        
         <tr>
    		<th colspan="1" scope="row" width="30%" >End Date</th>
            <td colspan="1" ><input id="enddate" name="enddate"  value="<%=enddate %>"  readonly="readonly" onclick="new Calendar_new(null, null, 1).show(this);"  style="width:100%;height:20px;font-size:11px;" /></td>
        </tr>
        
        
    
        <tr>
    		<th colspan="1" scope="row" width="30%" >Hourly</th>
            <td colspan="1" > <input id="hourlywork" name="hourlywork"  type="text" value="<%=hourlywork %>"   onBlur="countTotalWords();"  onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"  style="width:100%;height:20px;font-size:11px;"   /></td>
        </tr>
                <tr>
    		<th colspan="1" scope="row" width="30%" >New Words</th>
            <td colspan="1" > <input id="newwords" name="newwords"  value="<%=newwords %>" onBlur="countTotalWords();"   onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"  style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
        
             <tr>
    		<th colspan="1" scope="row" width="30%" >Post-Editing</th>
            <td colspan="1" ><input id="postediting" name="postediting"  value="<%=postediting %>" onBlur="countTotalWords();"   onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
             <tr>
    		<th colspan="1" scope="row" width="30%" >75%-84% Fuzzy</th>
            <td colspan="1" ><input id="rate1" name="rate1"  value="<%=rate1 %>" onBlur="countTotalWords();"  onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"  style="width:100%;height:20px;font-size:11px;" /></td>
        </tr>
        
             <tr>
    		<th colspan="1" scope="row" width="30%" >85%-99% Fuzzy</th>
            <td colspan="1" ><input id="rate2" name="rate2"  value="<%=rate2 %>" onBlur="countTotalWords();"   onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))" style="width:100%;height:20px;font-size:11px;" /></td>
        </tr>
        
                  <tr>
    		<th colspan="1" scope="row" width="30%" >75%-99% Fuzzy</th>
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
    		<th colspan="1" scope="row" width="30%" >Cooresponding Words</th>
            <td colspan="1" ><input id="coorespondingwords" name="coorespondingwords"  value="<%=coorespondingwords %>" readonly="readonly"  style="width:100%;height:20px;font-size:11px;background:#E0E0E0" /></td>
        </tr>
        
          <tr>
    		<th colspan="1" scope="row" width="30%" >Value(RMB)</th>
            <td colspan="1" ><input id="projectvalue" name="projectvalue" value="<%=projectvalue %>"   style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
          <tr>
    		<th colspan="1" scope="row" width="30%" >Outsourced PO Number</th>
            <td colspan="1" > <input id="outsourcedponumber" name="outsourcedponumber" value="<%=outsourcedponumber %>"  style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
         <tr>
    		<th colspan="1" scope="row" width="30%" >HO</th>
            <td colspan="1" > <input id="ho" name="ho" value="<%=ho %>"  style="width:100%;height:20px;font-size:11px;background:#E0E0E0"  readonly="true"  /></td>
        </tr>
        

        
           <tr>
    		<th colspan="1" scope="row" width="30%" >Comment</th>
            <td colspan="1" > <input id="comments" name="comments" value="<%=comments %>"  style="width:100%;height:60px;font-size:11px;"  /></td>
        </tr>

        
        
        
        
    </tbody>

        <tfoot>
    	<tr>
            <td colspan="2" ><input type="button" id="updatedistribution" value="Update"  style="width:60px;height:25px;" /></td>

        </tr>
    </tfoot>


</table>
    </form>




  </body>
</html>
