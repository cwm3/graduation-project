<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.productsystem.model.Project"%>
<%@page import="com.productsystem.model.Project"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
    String vendorid=request.getParameter("vendorid");
    String vendordate=request.getParameter("vendordate");
    String capacity=request.getParameter("capacity");
    String available=request.getParameter("available");
    String bookedcapacity=request.getParameter("bookedcapacity");
 
    

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Update Cpacity</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"  src="vendormanger/updatevendor.js"></script>
<script type="text/javascript" src="js3/calendar.js"></script>
<script type="text/javascript" src="jquery/jquery-1.8.0.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="updatecss/css-table.css" />
<script type="text/javascript" src="updatecss/js/style-table.js"></script>

<script type="text/javascript">
 function test() {
    var vendorid=document.getElementById("vendorid").value;
    var vendordate=document.getElementById("vendordate").value;
    var available=document.getElementById("available").value;
    var capacity=document.getElementById("capacity").value;
    var bookedcapacity='<%=bookedcapacity %>';
    bookedcapacity=parseFloat(bookedcapacity);
    capacity=parseFloat(capacity);
    if(capacity<bookedcapacity){
         if(capacity<bookedcapacity) {
         alert("Capacity cannot be Less than bookedcapacity");
         return false;
    }
    }
    
    
    sendRequest("doupdatecapacity.jsp?vendorid="+vendorid+"&vendordate="+vendordate+"&available="+available+"&capacity="+capacity);     
    
 }
 
     function chooseAvaliable() {   
         var available_text=document.getElementById("available").value;
		 if(available_text=="Available") {
		      document.getElementById("capacity").readOnly=false;
		 }
         if(available_text=="Unavailable") {
		      document.getElementById("capacity").value="0";
		 	  document.getElementById("capacity").readOnly=true;
		 }
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
        XMLHttpReq.open("GET", url, true);
        XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
        XMLHttpReq.send(null);  // 发送请求
    }
    // 处理返回信息函数
    function processResponse() {
        if (XMLHttpReq.readyState == 4) { // 判断对象状态
            if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
                showstatus();
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
    }
    //更新菜单函数
    function showstatus() {    
            alert("Update Success！ ");
            window.close();
    }
    


</script>
</head>

<body style="background:url('images/back100.jpg');text-align:center;margin-left:70px;margin-top: 20px;" >

		<form id="updatecapacity" action=""  name="updatecapacity"  onsubmit="return ononon();">

<table id="travel" >

    <thead>    
    	<tr>
            <th scope="col"  colspan="2"><center>Update Capacity</center> </th>
        </tr>        
    </thead>
        
    <tbody>
  
        
    <tr>
    		<th colspan="1" scope="row" width="30%" >Vendor Id</th>
            <td colspan="1" > <input id="vendorid" name="vendorid"  type="text" value="<%=vendorid %>"  readonly="readonly"   style="width:100%;height:20px;font-size:11px;;background:#E0E0E0" readonly="true"  /></td>
    </tr>
    
    
            
            
    <tr>
    		<th colspan="1" scope="row" width="30%" >VendorDate</th>
            <td colspan="1" > <input id="vendordate" name="vendordate"  type="text" value="<%=vendordate %>"  readonly="readonly"   style="width:100%;height:20px;font-size:11px;;background:#E0E0E0" readonly="true"  /></td>
    </tr>
            
    <tr>
    		<th colspan="1" scope="row" width="30%" >Available</th>
            <td colspan="1" >
            <select id ="available" name="available"   style="width:100%;height:20px;font-size:11px;" onchange="chooseAvaliable(this)" ><option value="Available"  <% if(available.equals("Available")) {
		out.print("selected");}%> >Available</option><option value="Unavailable"  <% if(available.equals("Unavailable")) {
		out.print("selected");}%>  >Unavailable</option><span class='redtext'>*</span></td>
            
            </td>
    </tr>
            
            
       <tr>
    		<th colspan="1" scope="row" width="30%" >Capacity</th>
            <td colspan="1" > <input id="capacity" name="capacity"  type="text" value="<%=capacity %>"  style="width:100%;height:20px;font-size:11px;"   /></td>
    </tr>                 


    </tbody>

        <tfoot>
    	<tr>
            <td colspan="2" ><input type="button"  onclick="test()" value="Update" style="width:60px;height:25px;" /></td>

        </tr>
    </tfoot>


</table>
    </form>




  </body>
</html>
