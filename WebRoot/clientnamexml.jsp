<%@ page contentType="text/xml;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- 导入jstl标签库 -->


<words>
		<c:forEach var = "w" items = "${clientname}">  <!-- 用jstl标签做循环 -->
		<clientname>${w}</clientname>   <!-- 每次循环都新建个 <clientname>标签 并写入每次循环的值  标签可随意定义-->
		</c:forEach>
</words>

