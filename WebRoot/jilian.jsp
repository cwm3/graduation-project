<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
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
str1="��ʦ";
str2="��ʦ";
str3="����";
}
else if(introle==2){
str1="��ѧ��";
str2="�о���";
str3="˶ʿ��";
}
}
%>
<form name="form1" method="post" action="">
<select name="sel1" onchange="role1();">
<%
if(introle==0){
%>
  <option selected="selected">��ѡ��</option>
  <option value="1">��ʦ</option>
  <option value="2">ѧ��</option>
<%
}else if(introle==1){
%>
  <option value="1" selected="selected">��ʦ</option>
  <option value="2">ѧ��</option>
<%
}else if(introle==2){
%>
  <option value="1">��ʦ</option>
  <option value="2" selected="selected">ѧ��</option>
<%
}
%>
</select>
<select name="sel2">
  <option>��ѡ��</option>
  <option value="<%=introle%>*3+1"><%=str1%></option>
  <option value="<%=introle%>*3+2"><%=str2%></option>
  <option value="<%=introle%>*3+3"><%=str3%></option>
</select>
</form>
</body>
</html>
