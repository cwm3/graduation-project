<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.datacollect.VendorDao"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>List Lead</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
    <script language="JavaScript"> 
 var project=0;
 var ren="";		
 function savechoose() {
                  var cb = document.getElementsByName("allcheck");
			      for(var i = 0; i < cb.length; i++){
			            if(cb[i].checked == true) {
			             project++;
			             if(project==1){
				            ren=cb[i].value;
				        }else {
				            ren=ren+","+cb[i].value;
				        }
			            
			        }
			        }
			       	window.returnValue=ren;
            	    window.close(); 
			             
		}
		
	 function Close() {
            	    window.close(); 
			             
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
}
a{
	text-decoration:none;
	color:#057fac;
}
a:hover{
	text-decoration:none;
	color:#999;
}

#container{
	margin:0 auto;
    text-align:center;
	width:98%;
	background:#fff;
}

</style>
<body>
<div><input type="button" value="Save" onclick="savechoose()" style="width:60px;height:25px;" />
<input type="button" value="Close" onclick="Close()" style="width:60px;height:25px;" /></div>

<div id="container">
      <table cellspacing="0" cellpadding="0" align="center" >
			<tr style="font-size: 10px;">
			   <th></th>
			   <th>Lead</th>
			</tr> 
<%
	String lead = request.getParameter("lead");
    System.out.print(lead+"lead");
    VendorDao vendordao = new VendorDao();
    List list  = vendordao.findLead(lead);
    for(int i=0; i<list.size(); i++ ) {	 
        out.print("<tr align='left'><td><input  type='checkbox' name='allcheck' value='"+list.get(i)+"' /> </td><td>"+list.get(i)+"</td></tr>");
	   }	
	   
%>
</table>
</div>


</body>
</html>
