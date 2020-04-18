<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@page import="com.datacollect.QaInfoDao"%>
<%@page import="com.productsystem.model.Qa"%>

<%

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
String method = request.getParameter("method");

System.out.println(method+"method");


QaInfoDao qadao = new QaInfoDao();
List list = qadao.loadzhexiantu(vendorname,clientname,evaluator,lead,costcode,translationtype,targetlanguage, sourcelanguage,startyear,startmonth,endyear,endmonth,lmorgl,field,method);
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

String monthstr="";
for(int j = 0;j <listmonth.size(); j++) {
   if(j==0){
      monthstr=listmonth.get(0);
   }else {
      monthstr=monthstr+","+listmonth.get(j);
   }
   
}

String vendoridstr="";
String clientnamestr="";
String leadstr="";
String fieldstr="";
String scorestr="";
String vendornamestr="";


for(int i=0; i<list.size(); i++ ) {
	Qa qa =  new Qa();
	qa=(Qa)list.get(i);
    String vendoridnew= qa.getVendorid();
    vendoridnew=vendoridnew.replace("&", "20181010").replace(",", "20182020");
    
    String vendornamenew= qa.getVendorname();
/*     vendornamenew=vendornamenew.replace("&", "20181010").replace(",", "20182020");
 */    
    
    String clientnamenew =  qa.getClientname();
/*     clientnamenew=clientnamenew.replace("&", "20181010").replace(",", "20182020");
 */    
    String leadnew= qa.getLead();
/*     leadnew=leadnew.replace("&", "20181010").replace(",", "20182020");
 */    
    
    String fieldnew =  qa.getSector();    
/*     fieldnew=fieldnew.replace("&", "20181010").replace(",", "20182020");
 */    
    
    String scorenew= qa.getScore();
    if(i==0){
	      vendoridstr=vendoridnew;
	      vendornamestr=vendornamenew; 
	      clientnamestr=clientnamenew;
	      leadstr=leadnew;
	      fieldstr=fieldnew;
	      scorestr="["+scorenew+"]";
	            
    }else {
	    vendoridstr=vendoridstr+"||"+vendoridnew;
	    vendornamestr=vendornamestr+"||"+vendornamenew; 
	    clientnamestr=clientnamestr+"||"+clientnamenew;
	    leadstr=leadstr+"||"+leadnew;
	    fieldstr=fieldstr+"||"+fieldnew;
	    scorestr=scorestr+"|["+scorenew+"]";    
    }
}

System.out.println(vendornamestr);

	response.setContentType("text/xml; charset=utf-8");
	response.setHeader("Cache-Control", "no-cache");
	out.println("<response>");
	out.println("<monthstr>"+monthstr+"</monthstr>");
	out.println("<vendoridstr>"+vendoridstr+"</vendoridstr>");
	out.println("<vendornamestr>"+vendornamestr+"</vendornamestr>");
	out.println("<clientnamestr>"+clientnamestr+"</clientnamestr>");
	out.println("<leadstr>"+leadstr+"</leadstr>");
	out.println("<fieldstr>"+fieldstr+"</fieldstr>");
	out.println("<scorestr>"+scorestr+"</scorestr>");

   out.println("</response>");
    
    

 
%>

