<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String startdate = request.getParameter("startdate");
String enddate = request.getParameter("enddate");
String Languagebegin = request.getParameter("Languagebegin");
String Languageend = request.getParameter("Languageend");
String vendorid = request.getParameter("vendorid");
String vendorname = request.getParameter("vendorname");
String averagescore = request.getParameter("averagescore");
String rate = request.getParameter("rate");

String vendor_field = request.getParameter("vendor_field");
String vendor_cat = request.getParameter("vendor_cat");
VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
List list  = vendorscheduledao.FindByTiaojJian(Languagebegin,Languageend,vendorid,vendorname,averagescore,rate,startdate,enddate,vendor_field,vendor_cat);
int sizelist = list.size();



%>
<%@page import="com.datacollect.VendorScheduleDao"%>
<%@page import="com.productsystem.model.VendorSchedule"%>

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

   <link href="style/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />

<style>

body{
	margin:0;
	padding:0;
	font:70% Arial, Helvetica, sans-serif; 
	color:#555;
	line-height:150%;
	text-align:center;
	width:100%;
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
	background:#fff;
}

</style>
<script type="text/javascript">
			
			function init() {
			    var vendorsize=<%=sizelist %>;
			    if(vendorsize==0) {
			         alert("No result Match");
			    }
			}
			
	     function open_win(vendorid,vendorname) {
			
			var rq = window.showModalDialog("showzhuzhuangtu.jsp?vendorid="+vendorid,"","dialogWidth:600px;dialogHeight:300px;center:1;status:0");
			   
			}		
		
			
			
			</script>
  </head>
  <body style="background:url('images/1.jpg');text-align:center;" onload="init()" >
    </br>

    <div id="container">
	
		<table cellspacing="0" cellpadding="0" align="center" >
			<tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
				<th colspan="1" rowspan="2">Vendor Id</th>
				<th colspan="1" rowspan="2">Vendor Name</th>
				<th colspan="1" rowspan="2">Average Scores</th>
<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dBegin = sdf.parse(startdate);
	    Date dEnd = sdf.parse(enddate);
			
		List<Date> lDate = new ArrayList<Date>();
		lDate.add(dBegin);// 把开始时间加入集合
		Calendar cal = Calendar.getInstance();
		// 使用给定的 Date 设置此 Calendar 的时间
		cal.setTime(dBegin);
		boolean bContinue = true;
		while (bContinue) {
			// 根据日历的规则，为给定的日历字段添加或减去指定的时间量
			cal.add(Calendar.DAY_OF_MONTH, 1);
			// 测试此日期是否在指定日期之后
			if (dEnd.after(cal.getTime())) {
				lDate.add(cal.getTime());
			} else {
				break;
			}
		}
		lDate.add(dEnd);// 把结束时间加入集合
	
		for( int j = 0 ; j < lDate.size() ; j++) {
			     out.print("<th align='left'>"+sdf.format(lDate.get(j))+"</th>");
			}			
			 %>	
		
			</tr>
	<tr>
			<%

		for(int j = 0 ; j < lDate.size() ; j++) {
			     out.print("<th align='left' >"+lDate.get(j).toString().substring(0, 3)+"</th>");
			}
		   
		    %>	
	</tr>
	
	<%
    /*       VendorScheduleDao vendorscheduledao = new VendorScheduleDao();
	      List list  = vendorscheduledao.FindByTiaojJian(Languagebegin,Languageend,vendorid,vendorname,averagescore,rate,startdate,enddate,vendor_field,vendor_cat);
	      System.out.print(list.size()+"ee");
	      if(list.size()==0)  {  
	      <SCRIPT LANGUAGE="JavaScript">function show(){ alert("No result Match");}</SCRIPT>
	    	<%  }   */
	    	
	    	
	 	  for(int i=0; i<list.size(); i++ ) {	 	  
	      VendorSchedule vendorschedule =  new VendorSchedule();
	      vendorschedule=(VendorSchedule)list.get(i);
	      String vendorid1= vendorschedule.getVendorid();
	      String vendorname1= vendorschedule.getVendorname();
	      String averagescores1= vendorschedule.getAveragescores();
	      String sparecapacity1= vendorschedule.getSparecapacity();
	      out.print("<tr align='left'><td width='60px' bgcolor='#e5f1f4' >"+vendorid1+"</td>");
	      out.print("<td width='90px' bgcolor='#e5f1f4' >"+vendorname1+"</td>");
	      out.print("<td width='90px' bgcolor='#e5f1f4' ><a href='javascript:void(0)' onclick='open_win(\"" +vendorid1+ "\",\"" +vendorid1+"\")'>"+averagescores1+"</a></td>");
	      
/* 	      out.print("<td width='110px' bgcolor='#e5f1f4' ><a href='javascript:void(0)' onclick='open_win(\"" +vendorid1+ "\",\"" +vendorname1+"\")'>"+averagescores1+"</a></td>");
 */	      String[] aa = sparecapacity1.split(",");
	      for(int j=0;j<aa.length;j++) {
	         if(!"aaa".equals(aa[j]) && Double.valueOf(aa[j])>2000) {
	         	  out.print("<td bgcolor='#64A600'>&nbsp;"+aa[j]+"&nbsp;</td>");
	         }else if(!"aaa".equals(aa[j]) && Double.valueOf(aa[j])>0) {
	         	  out.print("<td bgcolor='yellow'>&nbsp;"+aa[j]+"&nbsp;</td>");
	         }else if(!"aaa".equals(aa[j]) &&  Double.valueOf(aa[j])==0 ) {
	         	  out.print("<td bgcolor='#E0E0E0'>&nbsp;"+aa[j]+"&nbsp;</td>");
	         
	         }
	         else {
	         	  out.print("<td>&nbsp;&nbsp;</td>");
	         
	         }
	      }
	       out.print("</tr>");
	   }	
    %>	


	</div>
</div>

  </body>
</html>
