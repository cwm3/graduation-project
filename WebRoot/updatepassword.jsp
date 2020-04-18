<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
    
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Update Password</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" media="screen" href="updatecss/css-table.css" />
<script type="text/javascript" src="updatecss/js/jquery-1.2.6.min.js"></script>
<script type="text/javascript" src="updatecss/js/style-table.js"></script>

<style type="text/css">
.redtext{
   color:red;
}
</style>
<script language="JavaScript"> 
    var XMLHttpReq;
    var currentSort;
    var ifcz="";
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
                if(ifcz=="check") {
                     checkuser();
                }else if(ifcz=="update"){
                     updateuser();
                }
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
    }
    //更新菜单函数
    function checkuser() {    
           var username = document.getElementById("username").value; 
        var password = document.getElementById("password").value; 
        var newpassword = document.getElementById("newpassword").value; 
        var res=XMLHttpReq.responseXML.getElementsByTagName("RES")[0].firstChild.data;
        if(res=="cz"){
            ifcz="update";
            sendRequest("doupdateuserpassword.jsp?password="+password+"&username="+username+"&newpassword="+newpassword);   
        }else {
             alert("UserName or Password is not correct  ");
        }
    }
    
        //更新菜单函数
    function updateuser() {    
        var res=XMLHttpReq.responseXML.getElementsByTagName("RES")[0].firstChild.data;
        if(res=="updatesuccess"){
           alert("Update Success");
           window.close();
        }
    }
    
    
    
        // 检查vendorid
    function updateuserpassword() { 
        var username = document.getElementById("username").value; 
        var password = document.getElementById("password").value; 
        var newpassword = document.getElementById("newpassword").value; 
        ifcz="check";
        sendRequest("checkuserpassword.jsp?password="+password+"&username="+username); 
   
        return false;
    }
    

      
    
    
        

</script>
</head>

<body style="background:url('images/back100.jpg');text-align:center;margin-left:40px;margin-top: 30px;" >
		
		<form method="post" action="" id="add_form" name="add_form" onsubmit="return updateuserpassword();">

<table id="travel" >

    
    <thead>    
    	<tr>
            <th scope="col"  colspan="2"  >Update Password</th>
        </tr>
        
       
    </thead>
    
    
    <tbody>
    	<tr >
    		<th colspan="1" scope="row" width="20%" >User Name</th>
            <td colspan="1" > <input id="username" name="username"  type="text" style="width:60%;height:20px;font-size:11px;"  /><span class='redtext'>*</span></td>
        </tr>
        
        <tr>
    		<th colspan="1" scope="row" width="20%" >Password</th>
            <td colspan="1" > <input id="password" name="password"  type="text"  style="width:60%;height:20px;font-size:11px;" /><span class='redtext'>*</span></td>
        </tr>
            
      <tr>
    		<th colspan="1" scope="row" width="20%" >New Password</th>
            <td colspan="1" > <input id="newpassword" name="newpassword"  type="text"  style="width:60%;height:20px;font-size:11px;" /><span class='redtext'>*</span></td>
        </tr>
            
 

        

        

        
    </tbody>

        <tfoot>
    	<tr>
            <td colspan="2" >
            <input type="submit" value="Update"  style="width:60px;height:25px;" />
            <input type="reset"  value="Reset"  style="width:60px;height:25px;" />
            
            </td>
        </tr>
    </tfoot>


</table>
    </form>




  </body>
</html>
