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
    <script type="text/javascript" src="vendormanger/addtranslator.js"></script>
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
		
	</script>
  </head>
  
  <body>
                             <div class="biaoti"><center>Add Translator</center></div>
     
     <div class="allpage">   
    <form method="post" action="addtranslator.action" id="myform"  name="myform" onsubmit="return checkpost();" >
 
      <div class="tijiao">   
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
           <td align="right"><span class='title'>Translator Name</span></td>
           <td><input type="text" id="translatorname"  name="translatorname"  class="inputstyle"  style="width:200px;height:25px;" ><span class='redtext'>*</span></td>
           
           <td align="right" ><span class='title'>Translator Office</span></td>
           <td><input type="text" id="office"  name="office" class="inputstyle" style="width:200px;height:25px;" ><span class='redtext'>*</span></td>
           
         
            </tr> 
            <tr>
            
              <td align="right"><span class='title'>Comment</span></td>
              <td colspan="3" ><textarea input type="text" id="comment"  name="comment"  style="width:90%;height:55px;border:0.2px solid;" ></textarea><span class='redtext'>*</span></td>
         
            
            </tr> 
            
         

       </table>
      
        </div>  
        <div class="bottom">              
    	<input type="submit" value="Add" class="buttonstyle" style="width:60px;height:25px;font-size: 11px;" />
    	<input type="reset" value="Reset" class="buttonstyle" style="width:60px;height:25px;font-size: 11px;" />
    	<input type="button" value="Query" onclick="querytranslator()" class="buttonstyle" style="width:60px;height:25px;font-size: 11px;" />
    	
    	
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
				<th align="left">Translator Name</th>
				<th align="left" >Translator Office</th>
				<th align="left" >Comment</th>
			</tr>

		</table>
			</div>	
		<td width="100%" align="center" valign="top"><iframe id="ContentFrame1" name="I2" height="95%" width="100%" border="0" frameborder="0" src=""> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    </fieldset>

	</div>




  </body>
</html>
