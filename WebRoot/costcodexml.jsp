<%@ page contentType="text/xml;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- 导入jstl标签库 -->


<words>
		<c:forEach var = "w" items = "${costcode}">  <!-- 用jstl标签做循环 -->
		<costcode>${w}</costcode>   <!-- 每次循环都新建个 <costcode>标签 并写入每次循环的值  标签可随意定义-->
		</c:forEach>
</words>

