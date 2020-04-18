<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>文件上传</title>
  </head>
  
  <body>
  <center>
  	<h2>单文件上传</h2>
  	<form action="upload.action" method="post" enctype="multipart/form-data">
  		文件路径：<input type="file" name="upload" value="浏览"><br/>
  		<input type="submit" value="上传">
  	</form>
  </center>
  </body>
</html>
