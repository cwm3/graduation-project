<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.datacollect.DistributionDao"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String id = request.getParameter("id");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Set Status</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="jquery/jquery-1.8.0.min.js"></script>

<script language="JavaScript">  
function savechoose() {
       	    var status= document.getElementById("status").value;
            var id="<%=id %>";
            $.ajax({
            url:"setstatus.jsp",
            type:'post' ,
            data: "status="+status+"&id="+id,
            dataType:'json' ,
            async: false,
            success:function (data) {
            	alert("Set Status Sucess");
            	window.returnValue="1";
            	window.close();
                
            },
            error:function(XMLResponse){
                  alert(XMLResponse.responseText);
            }
        });
        

}
			
</script>
  </head>
  <style>
  body{
	margin:0;
	padding:0;
	font:70% Arial, Helvetica, sans-serif; 
	color:#555;
	width:100%;
	line-height:150%;
	text-align:center;
}


#container{
	margin:60px auto;
    text-align:center;
	width:98%;
	background:#fff;
}

</style>
<body style="background:url('images/back100.jpg');text-align:center;"  >

<div id="container">

   Status&nbsp;&nbsp;&nbsp;<select id ="status" name="status" style="width:70%;font-size: 10px;">
   						<option value="">---please choose---</option>
						<option value="in process">in process</option>
						<option value="closed">closed</option>
						</select>
</div>

<div>
<input type="button" value="Save" onclick="savechoose()" style="width:60px;height:25px;" />
<input type="button" value="Close" onclick="savechoose()" style="width:60px;height:25px;" />
</div>

</body>
</html>
