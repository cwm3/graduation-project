<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<script language="javascript">
function role1(){
role=document.getElementById("sel1").value;

document.form1.action="#";
document.form1.submit();
}
</script>
<%
String role=request.getParameter("sel1");
String str1="";
String str2="";
String str3="";
int introle=0;
if(role==null){

}
else{
introle=Integer.parseInt(role);
if(introle==1){
str1="老师";
str2="导师";
str3="教授";
}
else if(introle==2){
str1="大学生";
str2="研究生";
str3="硕士生";
}
}
%>
<form name="form1" method="post" action="">
<select name="sel1" onchange="role1();">
<%
if(introle==0){
%>
  <option selected="selected">请选择</option>
  <option value="1">教师</option>
  <option value="2">学生</option>
<%
}else if(introle==1){
%>
  <option value="1" selected="selected">教师</option>
  <option value="2">学生</option>
<%
}else if(introle==2){
%>
  <option value="1">教师</option>
  <option value="2" selected="selected">学生</option>
<%
}
%>
</select>
<select name="sel2">
  <option>请选择</option>
  <option value="<%=introle%>*3+1"><%=str1%></option>
  <option value="<%=introle%>*3+2"><%=str2%></option>
  <option value="<%=introle%>*3+3"><%=str3%></option>
</select>
</form>
</body>
</html>
