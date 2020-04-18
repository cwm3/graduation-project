<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

int startmonth = Integer.parseInt(request.getParameter("startmonth").toString());
int startyear = Integer.parseInt(request.getParameter("startyear").toString());
int endmonth =  Integer.parseInt(request.getParameter("endmonth").toString());
int endyear =  Integer.parseInt(request.getParameter("endyear").toString()); 
int endnextmonth=endmonth+1;

String startdate= startyear+"-"+startmonth+"-"+"01";
String enddate= endyear+"-"+endnextmonth+"-"+"01";

String costcode = request.getParameter("costcode");
String vendorname = request.getParameter("vendorname");
String clientname = request.getParameter("clientname");
String translationtype = request.getParameter("translationtype");
String targetlanguage = request.getParameter("targetlanguage");
String sourcelanguage = request.getParameter("sourcelanguage");
String lead = request.getParameter("lead");
String evaluator = request.getParameter("evaluator");
String lmorgl = request.getParameter("lmorgl");
String field = request.getParameter("field");


QaInfoDao qadao = new QaInfoDao();
List list  = qadao.loadqaByLeadName(vendorname,clientname,evaluator,lead,costcode,translationtype,targetlanguage, sourcelanguage,startyear,startmonth,endyear,endmonth,lmorgl,field);
int listszie=  list.size();	
List<String> listmonth = new ArrayList<String>(); 
int enddmonth = endmonth+1;
Date d1 = new SimpleDateFormat("yyyy-MM").parse(startyear+"-"+startmonth);//定义起始日期
Date d2 = new SimpleDateFormat("yyyy-MM").parse(endyear+"-"+enddmonth);//定义结束日期
Calendar dd = Calendar.getInstance();//定义日期实例
dd.setTime(d1);//设置日期起始时间
while(dd.getTime().before(d2)){//判断是否到结束日期
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
String str = sdf.format(dd.getTime());
listmonth.add(str);
dd.add(Calendar.MONTH, 1);//进行当前日期月份加1
}

 
%>
<%@page import="com.datacollect.QaInfoDao"%>
<%@page import="com.productsystem.model.Qa"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>List Schedule</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

   <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />

<style>

body{
	margin:0;
	padding:0;
	font:70% Arial, Helvetica, sans-serif; 
	color:#555;
	width:100%;
	line-height:150%;
	text-align:center;
}
a{
	text-decoration:none;
	color:#057fac;
}
a:hover{
	text-decoration:none;
	color:#999;
}

#container{
	margin:0 auto;
    text-align:center;
	width:98%;
	background:#fff;
}

</style>
<script type="text/javascript">
			
			function init() {
			    var vendorsize=<%=listszie %>;
			    if(vendorsize==0) {
			         alert("No result Match");
			    }
			}
						
			</script>
  </head>
  <body style="background:url('images/1.jpg');text-align:center;" onload="init()">

   <div id="container">
	
		<table  width="100%" cellspacing="0" cellpadding="0" >
				<tr  style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;align:left;">
				<th colspan="1"  style="text-align:left;" >Lead Name</th>
				<th colspan="1"  style="text-align:left;" >Manager</th>
				<%
		       for(int j = 0 ; j <listmonth.size() ; j++) {
		           out.print("<th style='text-align:left;'>"+listmonth.get(j)+"</th>");
		         }
			 %>	
			 
			    </tr>

	 	<%
			 	  for(int i=0; i<list.size(); i++ ) {
			 	  int month_value=startmonth-1;
			 	  
			      Qa qa =  new Qa();
			      qa=(Qa)list.get(i);
			      String lead1= qa.getLead();
			      String lmorgl1= qa.getLmorgl();
			    
			      String score= qa.getScore();
			      out.print("<tr align='left'><td><a href='listqaclientname.jsp?startdate="+startdate+"&enddate="+enddate+"&lead="+lead1+"&clientname=&field=&vendorid='>"+lead1+"</a></td>");			      
			      out.print("<td>"+lmorgl1+"</td>");
			      String[] aa = score.split(","); 
			      for(int j=0;j<aa.length;j++) {
			        if(aa[j].equals("0")) {
			         		  out.print("<td></td>");
			        }else {  
			                   DecimalFormat df = new DecimalFormat("0.0");
                               double x =  Double.valueOf(aa[j]).doubleValue();
                               String result = df.format(x);                  
			              out.print("<td>"+result+"</td>");
			        }
			      }
			       out.print("</tr>");
			   }
		%>	
	</div>
</div>
  </body>
</html>
