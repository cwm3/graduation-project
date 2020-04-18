<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.productsystem.model.Translator"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	Translator translator= (Translator)request.getAttribute("translator");
	String translatorname=translator.getTranslatorname();
    String office=translator.getOffice();
    String comment=translator.getComment();
    if(null==comment) {
       comment="";
    }
    
    String translatorid=translator.getTranslatorid()+"";
    
    

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Update Cost Code</title>
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
   		function closewindow() {
			        if (confirm("be sure to update this message ?")) {
 				}
		        return false;
			}


  $(document).ready(function () {
       $("#updatetranslator").click(function () { 
       //必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法
         var params = $("#subprojectForm").serialize();
        $.ajax({
            url:'updatetranslator.action',
            type:'post',
            data:params,
            dataType:'json',
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

<body style="background:url('images/back100.jpg');margin-top:50px;text-align:center;">

		<form id="subprojectForm" name="subprojectForm" >

<table id="travel" >

    
    <thead>    
    	<tr>
            <th scope="col"  colspan="2"><center>Update Translator</center> </th>
        </tr>        
    </thead>

    <tbody>
    
       <tr>
    		<th colspan="1" scope="row" width="30%" >Translator Name</th>
            <td colspan="1" >  <input id="translatorname" name="translatorname"  type="text" value="<%=translatorname %>"   style="width:100%;height:20px;font-size:11px;;background:#E0E0E0" readonly="true"  /></td>
   </tr> 
    
             <tr>
    		<th colspan="1" scope="row" width="30%" >Client Name</th>
            <td colspan="1" > <input id="office" name="office"  type="text" value="<%=office %>"    style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
    
    
    
    	<tr style="display: none" >
    		<th colspan="1" scope="row" width="30%" >translatorid</th>
            <td colspan="1" > <input id="translatorid" name="translatorid"  type="text" value="<%=translatorid %>"   style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
        <tr >
    		<th colspan="1" scope="row" width="30%" >Comment</th>
            <td colspan="1" > <input id="comment" name="comment"  type="text" value="<%=comment %>"    style="width:100%;height:20px;font-size:11px;"  /></td>
        </tr>
        
        
     

    </tbody>

        <tfoot>
    	<tr>
            <td colspan="2" ><input type="button" id="updatetranslator" value="Update"  style="width:60px;height:25px;" /></td>

        </tr>
    </tfoot>


</table>
    </form>




  </body>
</html>
