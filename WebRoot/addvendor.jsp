<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>addvendor.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript"  src="vendormanger/addvendor.js"></script>
    <script type="text/javascript" src="js3/calendar.js"></script>
    <script type="text/javascript" src="jquery/jquery-1.8.0.min.js"></script>
    <script type="text/javascript"  src="js/spin.min.js" ></script>
	<script type="text/javascript" src="js/common.js"></script>
    <link href="css/commoncss.css" rel="stylesheet" type="text/css" media="screen" />	
	<style type="text/css">
	body {
		margin: 0px;
		background-color: rgba(204, 204, 204, 0.168627450980392);
		background-image: none;
	}
	
	table {
		border-collapse: collapse;
		border: none;
	}
	
	td {
		border: solid #000 1px;
	}
	
	.title {
		font-size: 11px;
		font-family: Arial, Tahoma, Verdana;
		color: #033d61;
	}
	
	.redtext {
		color: red;
	}
	
	.language {
		margin-top: 5px;
	}
	
	#fullbg {
		background-color: gray;
		left: 0;
		opacity: 0.5;
		position: absolute;
		top: 0;
		z-index: 3;
		filter: alpha(opacity = 50);
		-moz-opacity: 0.5;
		-khtml-opacity: 0.5;
	}
	
	#dialog {
		background-color: #fff;
		border: 5px solid rgba(0, 0, 0, 0.4);
		height: 200px;
		left: 50%;
		margin: -200px 0 0 -200px;
		padding: 1px;
		position: fixed !important; /* 浮动对话框 */
		position: absolute;
		top: 50%;
		width: 300px;
		z-index: 5;
		border-radius: 5px;
		display: none;
	}
	
	#dialog p {
		margin: 0 0 12px;
		height: 24px;
		line-height: 24px;
		background: #CCCCCC;
	}
	
	#dialog p.close {
		text-align: right;
		padding-right: 10px;
	}
	
	#dialog p.close a {
		color: #fff;
		text-decoration: none;
	}
	
	.biaoti {
		margin-top: 50px;
		font-size: 14px;
		font-family: Arial, Tahoma, Verdana;
		color: #033d61;
    }
</style>
		
		<script language="javascript">  
		    // 处理返回信息函数
		    function processResponse() {
		        if (XMLHttpReq.readyState == 4) { // 判断对象状态
		            if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
		                calculateNumber();
		            } else { //页面不正常
		                  alert("您所请求的页面有异常。");
		            }
		        }
		    }
		    //更新菜单函数
		    function calculateNumber() {    
		        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
		        if(res=='true'){
		            alert("Vendor ID has existed！ ");
		            document.getElementById("vendorid").value=""; 
		        }
		    }
		    // 检查vendorid
		    function checkvendorid() { 
		        var vendorid = document.getElementById("vendorid").value; 
		        sendRequest("check.jsp?vendorid="+vendorid);     
		    }
		      
		   
		   
		  $(document).ready(function () {
		       $("#addVenor").click(function () { 
		       
		       if( document.getElementById("vendorid").value== ""|| document.getElementById("vendorid").value== null )
		       {
		    	     alert("please input Vendor Id"); 
		    	     return false; 
		        } 
		   
		        if(document.getElementById("vendor_name").value=="" || document.getElementById("vendor_name").value== null )
		        {
			    alert("please input Vendor Name"); 
			     return false; 
		         } 
		         
		         
		         if(document.getElementById("vendor_email").value=="" || document.getElementById("vendor_email").value== null )
		        {
			    alert("please input Email"); 
			     return false; 
		         } 
		         
		                 
		         if(document.getElementById("newword").value=="" || document.getElementById("newword").value== null )
		        {
			    alert("please input New Word"); 
			     return false; 
		         } 
		         
		         
		                 
		         if(document.getElementById("review").value=="" || document.getElementById("review").value== null )
		        {
			    alert("please input Review"); 
			     return false; 
		         } 
		         
		         
		                 
		         if(document.getElementById("fuzzy_84").value=="" || document.getElementById("fuzzy_84").value== null )
		        {
			    alert("please input 75%-84% Fuzzy"); 
			     return false; 
		         } 
		         
		        if(document.getElementById("fuzzy_85").value=="" || document.getElementById("fuzzy_85").value== null )
		        {
			    alert("please input 85%-99% Fuzzy"); 
			     return false; 
		         } 
		         
		       if(document.getElementById("fuzzy_99").value=="" || document.getElementById("fuzzy_99").value== null )
		        {
			    alert("please input 75%-99% Fuzzy"); 
			     return false; 
		         } 
		         
		                  
		       if(document.getElementById("postediting").value=="" || document.getElementById("postediting").value== null )
		        {
			    alert("please input Post Editing"); 
			     return false; 
		         } 
		         
		         
		         
		         
		        if(document.getElementById("dailycapacity").value=="" || document.getElementById("dailycapacity").value== null )
		        {
			    alert("please input dong"); 
			     return false; 
		         } 
		
		
		
		   
		   
		       
		       
		        //必须先对提交表单数据数据进行序列化，采用jQuery的serialize()方法
		        var params = $("#subVendorForm").serialize();
		        $.ajax({
		            url:'addvendor.action',
		            type:'post',
		            data:params,
		            dataType:'json',
		            beforeSend:function()
		              {  
		               showBg();
		                //document.getElementById("addVenor").disabled = true;
		               
		               },
		
		            success:function (data) {
		            	alert("Increased Sucess");
		            	$("input[type=reset]").trigger("click");       	
		            },
		            error:function(XMLResponse){
		                  alert(XMLResponse.responseText);
		            },
		             complete: function(){ 
		                closeBg();
		             }
		            
		            
		        });
		       
		    });
		   
		
		});

				var spinner;
				function loading()
				{
					var opts = {
  				lines: 13, //The number of lines to draw   菊花瓣的数目 
  				length: 7, //The length of each line   菊花瓣的长度
  				width: 4, //The line thickness   菊花瓣的宽度
  				radius: 10, //The radius of the inner circle   菊花中心的半径   
  				corners: 1, //Corner roundness (0..1)   菊花瓣的圆滑度(0--1) 
  				rotate: 0, //The rotation offset   让菊花旋转的角度
  				color: '#000', //#rgb or #rrggbb   菊花的颜色
  				speed: 1, //Rounds per second   菊花旋转的速度
  				trail: 60, //Afterglow percentage   菊花旋转时的余辉
  				shadow: false, //Whether to render a shadow   是否需要菊花的阴影
  				hwaccel: false, //Whether to use hardware acceleration   是否需要菊花高速旋转(硬件加速)
  				className: 'spinner', //The CSS class to assign to the spinner   菊花的classname
  				zIndex: 2e9, //The z-index (defaults to 2000000000)   菊花的z-index值
  				top: 'auto', //Top position relative to parent in px   菊花相对定位的top
  				left: 'auto' //Left position relative to parent in px  菊花相对定位的left
				};
					var target = document.getElementById('foo');
					spinner = new Spinner(opts).spin(target);
				}
				
				function unload()
				{
					spinner.stop();
				}
				
				//显示灰色 jQuery 遮罩层 
				function showBg() { 
				var bh = $("body").height(); 
				var bw = $("body").width(); 
				$("#fullbg").css({ 
				height:bh, 
				width:bw, 
				display:"block" 
				}); 
				$("#dialog").show(); 
				} 
				//关闭灰色 jQuery 遮罩 
				function closeBg() { 
				$("#fullbg,#dialog").hide(); 
				}
				
				</script>  
	
</head>
  
   <body>  
    
                <div class="biaoti"><center>Add New Vendor</center></div>
                </br>
           <form  id="subVendorForm" >  
            <table width="94%" align="center" border="1" >  
            
                <tr>  
                 <td width="20%" align="center" bgcolor='#e5f1f4'  height="30px" ><span class='title'>Vendor ID</span></td>
                 <td  align="left">&nbsp;<input id="vendorid" name="vendorid" type="text"   onBlur="checkvendorid()"   style="width:90%;height:20px"  /><span class='redtext'>*</span>   
                    </td>    
                  <td align="center"  height="30px" bgcolor='#e5f1f4'  ><span class='title'>Vendor Type</span></td>
                    <td>
                   &nbsp;<select id ="vendortype" name="vendortype" style="width:90%;height:20px;font-size: 10px;">
						<option value="Freelancer">Freelancer</option>
						<option value="Group">Group</option>
						<option value="Agency">Agency</option>
						</select><span class='redtext'>*</span></td>
                             
                </tr>  
                 <tr>  
                    <td bgcolor='#e5f1f4' width="20%" align="center" height="30px" ><span class='title'>Vendor Name</span></td>
                    <td width="30%">&nbsp;<input id="vendor_name" name="vendor_name" type="text" style="width:90%;height:20px"/><span class='redtext'>*</span></td>
                    <td width="20%" align="center" bgcolor='#e5f1f4' ><span class='title'>Chinese Name</span></td>
                     <td  width="30%">&nbsp;<input  type="text" id="chinese_name"   name="chinese_name"  style="width:90%;height:20px" /><span class='redtext'>*</span></td>
                </tr> 
                              
                 <tr>  
                 <td bgcolor='#e5f1f4' align="center" height="30px" ><span class='title'>Email</span></td>
               <td>&nbsp;<input type="text" id="vendor_email" name="vendor_email"      style="width:90%;height:20px"    ><span class='redtext'>*</span></td>
                <td align="center" bgcolor='#e5f1f4' bgcolor='#e5f1f4'><span class='title'>Telephone</span></td>
                 <td>&nbsp;<input type="text" id="vendor_tel"  name="vendor_tel" style="width:90%;height:20px"  ><span class='redtext'>*</span></td>
                 </tr>
                   
               
                 <tr>  
                 <td bgcolor='#e5f1f4' align="center" height="30px" ><span class='title'>QQ</span></td>
                 <td>&nbsp;<input type="text" id="vendor_qq"     name="vendor_qq" style="width:90%;height:20px" ></td>
                 <td align="center" bgcolor='#e5f1f4'><span class='title'>Qualified Date</span></td>
                 <td>&nbsp;<input type="text" id="qualified_date"  name="qualified_date" onclick="new Calendar_new(null, null, 1).show(this);"  readonly="readonly" style="width:90%;height:20px"  ><span class='redtext'>*</span></td>
                 </tr>
                
    
            <tr>  
		 <td  colspan="4"><table width="95%" align="center"  class='language' id="language"   border="1" cellspacing="0" cellpadding="0" bordercolor="#000000" bordercolordark="#FFFFFF" bgcolor="#FFFFFF"  >  
		 
		   <tr>
	       <td width="5px">&nbsp;</td>
		   <td width="60%">&nbsp;</td>
		   <td>&nbsp;<input type="button" value="Add" onclick= " addCommRow('language',1);"  style="width:60px;height:25px;font-size: 10px;" />
		    <input type="button" value="delete" onclick= " delCommRow('language',1);"   style="width:60px;height:25px;font-size: 10px;" /></td>
		   </tr>  
      <tr>  
        <td width="5px" ><input id="ck" type="checkbox" /></td>
		 <td><span class='title'> &nbsp;Language Pairs：<select id ="Languagebegin" name="Languagebegin" style="width:32%;font-size: 10px;">
		<option value="English">English</option>
		<option value="Chinese-Simplified">Chinese-Simplified</option>
		<option value="Chinese-Hongkong">Chinese-Hongkong</option>
		<option value="Chinese-Traditional">Chinese-Traditional</option>
		<option value="Japanese">Japanese</option>
	    <option value="German">German</option>
	    <option value="Korean">Korean</option>
		</select>
		  to <select id ="Languageend" name="Languageend" style="width:32%;font-size: 10px;">
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
            </table>  
		</td>
      </tr>      
       <tr> 
      <td colspan="4" height="40px">&nbsp;<span class='title'>Field&nbsp;&nbsp;&nbsp;<label><input id="vendor_field" name="vendor_field" type="checkbox"    value="IT" />IT</label>
                 &nbsp;<label><input id="vendor_field2"  name="vendor_field" type="checkbox"   value="Marketing"/>Marketing</label>
                 &nbsp;<label><input id="vendor_field3"  name="vendor_field" type="checkbox"   value="Medical" />Medical</label>
                 &nbsp;<label><input id="vendor_field4"  name="vendor_field" type="checkbox"   value="Legal" />Legal</label>
                 &nbsp;<label><input id="vendor_field5"  name="vendor_field" type="checkbox"   value="Auto" />Auto</label>
                 &nbsp;<label><input id="vendor_field6"  name="vendor_field" type="checkbox"   value="Electronics" />Electronics</label>
                 &nbsp;<label><input id="vendor_field7"  name="vendor_field" type="checkbox"   value="Game" />Game</label>
                 &nbsp;<label><input id="vendor_field8"  name="vendor_field" type="checkbox"  value="Sport" />Sport</label>
                 &nbsp; <label><input id="vendor_field9" name="vendor_field" type="checkbox"   value="Chemical"/>Chemical</label>
                 &nbsp; <label><input id="vendor_field10" name="vendor_field" type="checkbox"   value="Finance"/>Finance</label>
                 &nbsp; <label><input id="vendor_field11" name="vendor_field" type="checkbox"   value="Mechanical" />Mechanical</label>
                 &nbsp;&nbsp;   &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;<label> Other <input id="vendor_field_other"  name="vendor_field_other"   /></label></span>
                 </span>
                 </td> 	  
     </tr> 
        
     
  
                      
     <tr> 
     <td colspan="4" bgcolor='#e5f1f4'><span class='title'>&nbsp;Comment&nbsp;</span><textarea input type="text" id="vendor_comment" name="vendor_comment" style="width:92%;height:85px;"  > </textarea></td>
	  </tr>      
            </table>   
      <br>
      <center>
                <input id="addVenor" type="button" value="Add" class="buttonstyle"  style="width:60px;height:25px;font-size: 12px;" />&nbsp;<input type="reset" value="Reset" class="buttonstyle"  style="width:60px;height:25px;font-size: 12px;" /><input id="Hidden1" type="hidden" /></div> 
      
<div id="main">
<div id="fullbg"></div> 
<div id="dialog"> 
<p class="close"><a href="#" onclick="closeBg();">关闭</a></p> 
<div> Increasing Schedule....</div> 
</div> 
</div> 
         </form>  
        
    </body>  
</html>
