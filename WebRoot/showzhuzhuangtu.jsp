<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.datacollect.VendorDao"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String vendorid =  request.getParameter("vendorid");
VendorDao vendordao = new VendorDao();
String currentsscore = vendordao.getAvgScore(vendorid);
String currentyear = "2017";
/* String currentsscore = "2, 3, 4, 6, 1.3, 4, 3, 4, 5.5, 3, 4, 5.5";
 */String scoreArry[] = currentsscore.split(",");
String score0 = scoreArry[0];
String score1 = scoreArry[1];
String score2 = scoreArry[2];
String score3 = scoreArry[3];
String score4 = scoreArry[4];
String score5 = scoreArry[5];
String score6 = scoreArry[6];
String score7 = scoreArry[7];
String score8 = scoreArry[8];
String score9 = scoreArry[9];
String score10 = scoreArry[10];
String score11 = scoreArry[11];


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Average Score</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <script type="text/javascript" src="echarts/js/echarts.min.js"></script>
    <script type="text/javascript" src="echarts/js/zhuzhuangtu.js"></script>
    <script type="text/javascript">
    
    function init() {
    var year = "<%=currentyear %>";
    var qascore0 = "<%=score0 %>";
    var qascore1 = "<%=score1 %>";
    var qascore2 = "<%=score2 %>";
    var qascore3 = "<%=score3 %>";
    var qascore4 = "<%=score4 %>";
    var qascore5 = "<%=score5 %>";
    var qascore6 = "<%=score6 %>";
    var qascore7 = "<%=score7 %>";
    var qascore8 = "<%=score8 %>";
    var qascore9 = "<%=score9 %>";
    var qascore10 = "<%=score10 %>";
    var qascore11 = "<%=score11 %>";
    
    var dom = document.getElementById("container");
	var myChart = echarts.init(dom);
	var app = {};
	option = null;
	option = {
	    title: {
	        text: 'Vendor Average Score'
	    },
	    tooltip: {},
	    legend: {
	        data:['Average Score']
	    },
		color : ['#5f9ea0'],
	    xAxis: {
	        data: [year+"-Jan",year+"-Feb",year+"-Mar",year+"-April",year+"-May",year+"-June",year+"-July",year+"-Aug",year+"-Sep",year+"-Oct",year+"-Nov",year+"-Dec"]
	    },
	    yAxis: {
		},
	    series: [{
	        name: 'Average Score',
	        type: 'bar',
            data: [qascore0, qascore1, qascore2, qascore3, qascore4, qascore5, qascore6, qascore7, qascore8, qascore9, qascore10, qascore11]
	    }]
	};
	    myChart.setOption(option, true);
	    
}   
</script>

  </head>
  
   <body style="height: 100%; margin: 0" onload="init()">
       <div id="container" style="height: 100%"></div>
  </body>
</html>
