<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat;" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String vendordate=request.getParameter("vendordate");
String vendorid=request.getParameter("vendorid");
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客户列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
   <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
   <link href="images/calendar.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="js3/calendar.js"></script>
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
    background-color:rgba(204, 204, 204, 0.168627450980392);
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
}

.showcolor {
   margin-top:5px;
   margin-left:40%;
   font-size: 12px;

}

</style>

<script language="JavaScript"> 
			
 function checkpost() {
               document.getElementById("table1").style.display="none";
               var startdate = document.getElementById("startdate").value;
               var enddate= document.getElementById("enddate").value;
               if(startdate=="" || startdate == null ) {
                   alert("Startdate  must be input ");
                   return false;
               }
               
               if(enddate=="" || enddate == null ) {
                   alert(" Enddate must be input");
                   return false;
               }
               
               var time1 = new Date(startdate.replace(/-/g,"/"));
			   var time2 = new Date(enddate.replace(/-/g,"/"));
			   if(time1 > time2){
			    alert("Startdate cannot be greater than Enddate ");
				return false;
	          }
                              
               var vendor_field_str="";
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
				   vendor_field_str=vendor_field_str+fg+str[i].value;
				  }
				} 
		        var vendor_cat_str="";
		        fg="";
		        count=0;
		        var str_cat=document.getElementsByName("vendor_cat");
				var objarrayt_cat=str_cat.length;
				for (var j=0;j<objarrayt_cat;j++)
				{//牛图库JS特效，http://js.niutuku.com/
				  if(str_cat[j].checked == true)
				  {
				   count=count+1;
				   if(count>1) {
					   fg=","; 
				   }
				   vendor_cat_str=vendor_cat_str+fg+str_cat[j].value;
				  }  
				}
				
               var Languagebegin= document.getElementById("Languagebegin").value;
               var Languageend= document.getElementById("Languageend").value;
               var vendorid= document.getElementById("vendorid").value;
               var vendorname= document.getElementById("vendorname").value;
              // var chinesename= document.getElementById("chinesename").value;
               var averagescore= document.getElementById("averagescore").value;
               //var grade= document.getElementById("grade").value;
               var rate= document.getElementById("rate").value;
               document.getElementById("ContentFrame1").src="listschedulebytiaojian.jsp?startdate="+startdate+"&enddate="+enddate+"&Languagebegin="+Languagebegin+"&Languageend="+Languageend+"&rate="+rate
               +"&vendorid="+vendorid+"&vendorname="+vendorname+"&averagescore="+averagescore+"&vendor_field="+vendor_field_str+"&vendor_cat="+vendor_cat_str;
               return false;
               
		}
		
		 function exportcapacity() {
                document.getElementById("table1").style.display="none";
               var startdate = document.getElementById("startdate").value;
               var enddate= document.getElementById("enddate").value;
               if(startdate=="" || startdate == null ) {
                   alert("Startdate  must be input ");
                   return false;
               }
               
               if(enddate=="" || enddate == null ) {
                   alert(" Enddate must be input");
                   return false;
               }
                              
               var vendor_field_str="";
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
				   vendor_field_str=vendor_field_str+fg+str[i].value;
				  }
				} 
		        var vendor_cat_str="";
		        fg="";
		        count=0;
		        var str_cat=document.getElementsByName("vendor_cat");
				var objarrayt_cat=str_cat.length;
				for (var j=0;j<objarrayt_cat;j++)
				{//牛图库JS特效，http://js.niutuku.com/
				  if(str_cat[j].checked == true)
				  {
				   count=count+1;
				   if(count>1) {
					   fg=","; 
				   }
				   vendor_cat_str=vendor_cat_str+fg+str_cat[j].value;
				  }  
				}
				               
               var obj_Languagebegin= document.getElementById("Languagebegin"); //定位id
               var index_Languagebegin = obj_Languagebegin.selectedIndex; // 选中索引
               var Languagebegin = obj_Languagebegin.options[index_Languagebegin].value; // 选中值
               
               
               var obj_Languageend = document.getElementById("Languageend"); //定位id
               var index_Languageend = obj_Languageend.selectedIndex; // 选中索引
               var Languageend = obj_Languageend.options[index_Languageend].value; // 选中值

               var Languageend= document.getElementById("Languageend").value;
               var vendorid= document.getElementById("vendorid").value;
               var vendorname= document.getElementById("vendorname").value;
               var averagescore= document.getElementById("averagescore").value;
      /*          var grade= document.getElementById("grade").value;*/
               var rate= document.getElementById("rate").value; 
               
               window.document.location.href="loadcapacityexcel.jsp?startdate="+startdate+"&enddate="+enddate+"&Languagebegin="+Languagebegin+"&Languageend="+Languageend
               +"&vendorid="+vendorid+"&vendorname="+vendorname+"&averagescore="+averagescore+"&rate="+rate+"&vendor_field="+vendor_field_str+"&vendor_cat="+vendor_cat_str;
                 
             /*   document.getElementById("ContentFrame1").src="listschedulebytiaojian.jsp?startdate="+startdate+"&enddate="+enddate+"&Languagebegin="+Languagebegin+"&Languageend="+Languageend
               +"&vendorid="+vendorid+"&vendorname="+vendorname+"&chinesename="+chinesename+"&averagescore="+averagescore+"&rate="+rate+"&vendor_field="+vendor_field_str+"&vendor_cat="+vendor_cat_str; */
               return false;
		}
		
      var XMLHttpReq;
      var currentSort;
      var fhym="";
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
                updateMenu();
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
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
    
    // 创建级联菜单函数
    function getvendorname(){
               var vendor_field_str="";
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
				   vendor_field_str=vendor_field_str+fg+str[i].value;
				  }
				} 
             sendRequest("getvendorname.jsp?vendor_field="+vendor_field_str);       
    }
		
	function choosevendorname (){
	
	           var vendor_field_str="";
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
				   vendor_field_str=vendor_field_str+fg+str[i].value;
				  }
				} 
				
				var vendor_cat_str="";
		        fg="";
		        count=0;
		        var str_cat=document.getElementsByName("vendor_cat");
				var objarrayt_cat=str_cat.length;
				for (var j=0;j<objarrayt_cat;j++)
				{//牛图库JS特效，http://js.niutuku.com/
				  if(str_cat[j].checked == true)
				  {
				   count=count+1;
				   if(count>1) {
					   fg=","; 
				   }
				   vendor_cat_str=vendor_cat_str+fg+str_cat[j].value;
				  }  
				}
				
	           var obj_Languagebegin= document.getElementById("Languagebegin"); //定位id
               var index_Languagebegin = obj_Languagebegin.selectedIndex; // 选中索引
               var languagebegin = obj_Languagebegin.options[index_Languagebegin].value; // 选中值
               
               
               var obj_Languageend = document.getElementById("Languageend"); //定位id
               var index_Languageend = obj_Languageend.selectedIndex; // 选中索引
               var languageend = obj_Languageend.options[index_Languageend].value; // 选中值 */
               
               var vendorid= document.getElementById("vendorid").value;
               var averagescore= document.getElementById("averagescore").value;
               var rate= document.getElementById("rate").value; 
               var ren = window.showModalDialog("getvendorname.jsp?languagebegin="+languagebegin+"&languageend="+languageend
               +"&vendorid="+vendorid+"&averagescore="+averagescore+"&rate="+rate+"&vendor_field="+vendor_field_str+"&vendor_cat="+vendor_cat_str,"","dialogwidth:500px;dialogheight:450px;center:1;status:0");
	           if(ren==undefined){
	             ren="";
	           }
	           document.getElementById("vendorname").value = ren;
	}	 
		
		
</script>
  </head>
  
  <body>
  
     <div class="allpage">   
     
    <form method="post" action="" id="myform"  name="myform" onsubmit="return checkpost();" >
    <fieldset style="height:260px; ">
    <legend class="legend">Query Conditions</legend>
      <div class="tijiao">   
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
                  
		 <td  colspan="6" height="40px"><span class='title'> &nbsp;Language Pairs：<select id ="Languagebegin" name="Languagebegin" style="width:15%;font-size:10px;height:25px;">
		<option value="English">English</option>
		<option value="Chinese-Simplified">Chinese-Simplified</option>
		<option value="Chinese-Hongkong">Chinese-Hongkong</option>
		<option value="Chinese-Traditional">Chinese-Traditional</option>
		<option value="Japanese">Japanese</option>
	    <option value="German">German</option>
	    <option value="Korean">Korean</option>
		</select>
		  to <select id ="Languageend" name="Languageend" style="width:15%;font-size:10px;height:25px;">
	         <option value="Chinese-Simplified">Chinese-Simplified</option>
		     <option value="Chinese-Hongkong">Chinese-Hongkong</option>
		     <option value="Chinese-Traditional">Chinese-Traditional</option>
		     <option value="English">English</option>
		     <option value="Japanese">Japanese</option>
	         <option value="German">German</option>
	         <option value="Korean">Korean</option>
		</select></span>
	  </td>	
     </tr>  
        <tr>
      
             <td colspan="6" height="40px">&nbsp;<span class='title'>Field:&nbsp;&nbsp;&nbsp;<label><input id="vendor_field" name="vendor_field" type="checkbox"  value="IT" />IT</label>
                 &nbsp;<label><input id="vendor_field1"  name="vendor_field" type="checkbox"    value="Marketing" />Marketing </label>
                 &nbsp;<label><input id="vendor_field2"  name="vendor_field" type="checkbox"  value="Medical" />Medical</label>
                 &nbsp;<label><input id="vendor_field3"  name="vendor_field" type="checkbox"  value="Legal" />Legal</label>
                 &nbsp;<label><input id="vendor_field4"  name="vendor_field" type="checkbox"  value="Auto" />Auto</label>
                 &nbsp;<label><input id="vendor_field5"  name="vendor_field" type="checkbox"  value="Electronics" />Electronics</label>
                 &nbsp;<label><input id="vendor_field6"  name="vendor_field" type="checkbox" value="Game" />Game </label>
                 &nbsp;<label><input id="vendor_field7"  name="vendor_field" type="checkbox" value="Sport" />Sport </label>
                 &nbsp; <label><input id="vendor_field8" name="vendor_field" type="checkbox" value="Chemical" />Chemical</label>
                 &nbsp;<label><input id="vendor_field9" name="vendor_field" type="checkbox"   value="Finance"/>Finance</label>
                 &nbsp; <label><input id="vendor_field10" name="vendor_field" type="checkbox" value="Mechanical" />Mechanical</label></span>
</td> 	  
     </tr> 
         
       <tr>
      	  
     </tr>
           <tr>
           <td><span class='title'>Vendor ID:</span></td>
           <td><input type="text" id="vendorid"  name="vendorid"  class="inputstyle" style="width:170px;height:25px;" ></td>
           <td><span class='title'>Vendor Name:</span></td>
           <td><input type="text" id="vendorname"  name="vendorname"  onclick="choosevendorname()"    class="inputstyle" style="width:170px;height:25px;" ></td>

           </tr>
         
            <tr>
           <td><span class='title'>Start Date:</span></td>
           <td><input type="text" id="startdate"  name="startdate" onclick="new Calendar_new(null, null, 1).show(this);"  readonly="readonly"  class="inputstyle" style="width:170px;height:25px;" ><span class='redtext'>*</span></td>
           <td><span class='title'>End Date:</span></td>
           <td><input type="text" id="enddate"  name="enddate" onclick="new Calendar_new(null, null, 1).show(this);"   readonly="readonly"  class="inputstyle" style="width:170px;height:25px;" ><span class='redtext'>*</span></td>     
          
           </tr> 
       </table>
      
         </div>
           
        <div class="bottom">              
    	<input type="submit" value="Query" class="buttonstyle" style="width:60px;height:25px;" />
    	<input type="reset" value="Reset" class="buttonstyle" style="width:60px;height:25px;" />
    	<input type="button" value="Export" class="buttonstyle"  onclick="exportcapacity();" style="width:60px;height:25px;" />
   	  </div> 
   	  
 
</fieldset>
    </form>
    </div>

 
  
</div>
 
    <div id="container">
	    <fieldset style="height:500px; ">
    <legend class="legend">Detail List</legend>
    <div id="table1">
		<table cellspacing="0" cellpadding="0">
				<tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
			    <th align="left" width="30%">Number</th>
				<th align="left" width="30%">Vendor ID</th>
				<th align="left" width="40%">Vendor Name</th>
			
			</tr>

		</table>
			</div>	
		<td width="100%" align="center" valign"top"><iframe id="ContentFrame1" name="I2" height="92%" width="100%" border="0" frameborder="0" src=""> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    </fieldset>

	</div>




  </body>
</html>
