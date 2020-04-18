<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@page import="com.datacollect.QaInfoDao"%>
<%@page import="com.productsystem.model.Qa"%>
<%@page import="java.text.NumberFormat"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String vendorid = request.getParameter("vendorid");
String month =  request.getParameter("month").toString();
QaInfoDao qadao = new QaInfoDao();
Qa qa  = qadao.listQaEvaluation(vendorid,month);
//1
String wrongall = Float.valueOf(qa.getWrongcategory())+Float.valueOf(qa.getWrongminor())+Float.valueOf(qa.getWrongpoints())
+ Float.valueOf(qa.getWrongserious())+ Float.valueOf(qa.getWrongweighted())+"";

//2
String meanall = Float.valueOf(qa.getMeaningcategory())+Float.valueOf(qa.getMeaningminor())+Float.valueOf(qa.getMeaningpoints())
+ Float.valueOf(qa.getMeaningserious())+ Float.valueOf(qa.getMeaningweighted())+"";

//3
String omissionall = Float.valueOf(qa.getOmissioncategory())+Float.valueOf(qa.getOmissionminor())+Float.valueOf(qa.getOmissionpoints())
+ Float.valueOf(qa.getOmissionserious())+ Float.valueOf(qa.getOmissionweighted())+"";

//4
String structuralall = Float.valueOf(qa.getStructuralcategory())+Float.valueOf(qa.getStructuralnminor())+Float.valueOf(qa.getStructuralpoints())
+ Float.valueOf(qa.getStructuralserious())+ Float.valueOf(qa.getStructuralweighted())+"";

//5
String misspellingall = Float.valueOf(qa.getMisspellingcategory())+Float.valueOf(qa.getMisspellingminor())+Float.valueOf(qa.getMisspellingpoints())
+ Float.valueOf(qa.getMisspellingserious())+ Float.valueOf(qa.getMisspellingweighted())+"";

//6
String punctuationall = Float.valueOf(qa.getPunctuationcategory())+Float.valueOf(qa.getPunctuationminor())+Float.valueOf(qa.getPunctuationpoints())
+ Float.valueOf(qa.getPunctuationserious())+ Float.valueOf(qa.getPunctuationweighted())+"";

//7
String styleall = Float.valueOf(qa.getStylecategory())+Float.valueOf(qa.getStyleminor())+Float.valueOf(qa.getStylepoints())
+ Float.valueOf(qa.getStyleserious())+ Float.valueOf(qa.getStyleweighted())+"";

//8
String miscellaneousall = Float.valueOf(qa.getMiscellaneouscategory())+Float.valueOf(qa.getMiscellaneousminor())+Float.valueOf(qa.getMiscellaneouspoints())
+ Float.valueOf(qa.getMiscellaneousserious())+ Float.valueOf(qa.getMiscellaneousweighted())+"";


//11
String categoryall = Float.valueOf(qa.getWrongcategory())+Float.valueOf(qa.getMeaningcategory())+Float.valueOf(qa.getStructuralcategory())
    +Float.valueOf(qa.getMisspellingcategory())+Float.valueOf(qa.getPunctuationcategory())+Float.valueOf(qa.getStylecategory())+Float.valueOf(qa.getMiscellaneouscategory())+"";
//22
String minorall = Float.valueOf(qa.getWrongminor())+Float.valueOf(qa.getMeaningminor())+Float.valueOf(qa.getOmissionminor())+Float.valueOf(qa.getStructuralnminor()) 
    +Float.valueOf(qa.getMisspellingminor())+Float.valueOf(qa.getPunctuationminor())+Float.valueOf(qa.getStyleminor())+Float.valueOf(qa.getMiscellaneousminor())+"";
 //33
String weightedall = Float.valueOf(qa.getWrongweighted())+Float.valueOf(qa.getMeaningweighted())+Float.valueOf(qa.getOmissionweighted())
    +Float.valueOf(qa.getStructuralweighted())+Float.valueOf(qa.getMisspellingweighted())+Float.valueOf(qa.getPunctuationweighted())
    +Float.valueOf(qa.getStyleweighted())+Float.valueOf(qa.getMiscellaneousweighted())+"";

//44
String seriousall = Float.valueOf(qa.getWrongserious())+Float.valueOf(qa.getMeaningserious())+Float.valueOf(qa.getStructuralserious())
    +Float.valueOf(qa.getMisspellingserious())+Float.valueOf(qa.getPunctuationserious())+Float.valueOf(qa.getStyleserious())+Float.valueOf(qa.getMiscellaneousserious())+"";

//55
String pointall = Float.valueOf(qa.getWrongpoints())+Float.valueOf(qa.getMeaningpoints())+Float.valueOf(qa.getStructuralpoints())
    +Float.valueOf(qa.getMisspellingpoints())+Float.valueOf(qa.getPunctuationpoints())+Float.valueOf(qa.getStylepoints())+Float.valueOf(qa.getMiscellaneouspoints())+"";


String qadata =Float.valueOf(qa.getWrongcategory())+","+Float.valueOf(qa.getMeaningcategory())+","+Float.valueOf(qa.getOmissioncategory())+","+Float.valueOf(qa.getStructuralcategory())+","+
		       Float.valueOf(qa.getMisspellingcategory())+","+Float.valueOf(qa.getPunctuationcategory())+","+Float.valueOf(qa.getStylecategory())+","+Float.valueOf(qa.getMiscellaneouscategory());



String allall = Float.valueOf(qa.getWrongcategory())+Float.valueOf(qa.getMeaningcategory())+Float.valueOf(qa.getOmissioncategory())+Float.valueOf(qa.getStructuralcategory())+Float.valueOf(qa.getMisspellingcategory())
                +Float.valueOf(qa.getPunctuationcategory())+Float.valueOf(qa.getStylecategory())+Float.valueOf(qa.getMiscellaneouscategory())+"";

// 创建一个数值格式化对象
NumberFormat numberFormat = NumberFormat.getInstance();
// 设置精确到小数点后2位
numberFormat.setMaximumFractionDigits(2);

String wrongall_ = numberFormat.format(Float.valueOf(qa.getWrongcategory())/Float.valueOf(allall)*100)+"%";
String meanall_ = numberFormat.format(Float.valueOf(qa.getMeaningcategory())/Float.valueOf(allall)*100)+"%";
String omissionall_ = numberFormat.format(Float.valueOf(qa.getOmissioncategory())/Float.valueOf(allall)*100)+"%";
String structuralall_ = numberFormat.format(Float.valueOf(qa.getStructuralcategory())/Float.valueOf(allall)*100)+"%";
String misspellingall_ = numberFormat.format(Float.valueOf(qa.getMisspellingcategory())/Float.valueOf(allall)*100)+"%";
String punctuationall_ = numberFormat.format(Float.valueOf(qa.getPunctuationcategory())/Float.valueOf(allall)*100)+"%";
String styleall_ = numberFormat.format(Float.valueOf(qa.getStylecategory())/Float.valueOf(allall)*100)+"%";
String miscellaneousall_ = numberFormat.format(Float.valueOf(qa.getMiscellaneouscategory())/Float.valueOf(allall)*100)+"%";

%>


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

  </head>
  <body style="background:url('images/1.jpg');text-align:center;">
    </br>

    <div id="container">
	
		<table  width="100%" cellspacing="0" cellpadding="0" align="center" >
				<tr align="left">
				<th>Error Category</th>
				<th>Abbrev.</th>
			    <th>Minor Error</th>
			    <th>Weighted Error Points</th>
			    <th>Serious Error</th>
			    <th>Weighted Error Points</th>
			    <th>Category Error Points</th>
			    <th>%</th>
			    </tr>
			    
			    
			  <tr>
				<td>Wrong Term</td>
				<td>WT</td>
				
				<td><%=qa.getWrongminor()%></td>
			    <td><%=qa.getWrongweighted()%></td>
				<td><%=qa.getWrongserious()%></td>
				<td><%=qa.getWrongpoints()%></td>
				<td><%=qa.getWrongcategory() %></td>
				<td><%=wrongall_ %></td>
				
			    </tr>
				
				<tr>
				<td>Wrong Meaning</td>   
				<td>WM</td>   
				<td><%=qa.getMeaningminor()%></td>
				<td><%=qa.getMeaningweighted()%></td>
				<td><%=qa.getMeaningserious()%></td>
				<td><%=qa.getMeaningpoints()%></td>
				<td><%=qa.getMeaningcategory()%></td>
		        <td><%=meanall_ %></td>
			    </tr>
			    
			    			<tr>
				<td>Omission</td>   
				<td>OM</td>   
				<td><%=qa.getOmissionminor() %></td>
				<td><%=qa.getOmissionweighted()  %></td>
				<td><%=qa.getOmissionserious() %></td>
				<td><%=qa.getOmissionpoints() %></td>
				<td><%=qa.getOmissioncategory() %></td>
				<td><%=omissionall_ %></td>
				
			    </tr>
			    
			        <tr>
				<td>Structural Error</td>
				<td>SE</td>
				<td><%=qa.getStructuralnminor()%></td>
				<td><%=qa.getStructuralweighted()%></td>
				<td><%=qa.getStructuralserious()%></td>
				<td><%=qa.getStructuralpoints()%></td>
				<td><%=qa.getStructuralcategory()%></td>
				<td><%=structuralall_ %></td>
				
			    </tr>
			    
                    
			    <tr>
				<td>Misspelling</td>
				<td>SP</td>
				<td><%=qa.getMisspellingminor() %></td>
				<td><%=qa.getMisspellingweighted()  %></td>
				<td><%=qa.getMisspellingserious()  %></td>
				<td><%=qa.getMisspellingpoints() %></td>
				<td><%=qa.getMisspellingcategory() %></td>
				<td><%=misspellingall_ %></td>
				
			    </tr>
			    
    	    		    <tr>
				<td>Punctuation</td>
				<td>PE</td>
				<td><%=qa.getPunctuationminor()%></td>
				<td><%=qa.getPunctuationweighted()%></td>
				<td><%=qa.getPunctuationserious()%></td>
				<td><%=qa.getPunctuationpoints()%></td>
				<td><%=qa.getPunctuationcategory()%></td>
				<td><%=punctuationall_ %></td>
				
			    </tr>
			    
			    <tr>
				<td>Style</td>
				<td>ST</td>
				<td><%=qa.getStyleminor()%></td>
				<td><%=qa.getStyleweighted()%></td>
				<td><%=qa.getStyleserious()%></td>
				<td><%=qa.getStylepoints()%></td>
				<td><%=qa.getStylecategory()%></td>
				<td><%=styleall_ %></td>
				
			    </tr>
			    
		

		        <tr>
				<td>Miscellaneous</td>
				<td>ME</td>
				<td><%=qa.getMiscellaneousminor()  %></td>
				<td><%=qa.getMiscellaneousweighted()  %></td>
				<td><%=qa.getMiscellaneousserious()   %></td>
				<td><%=qa.getMiscellaneouspoints()   %></td>
				<td><%=qa.getMiscellaneouscategory() %></td>
				<td><%=miscellaneousall_ %></td>
				
			    </tr>
			    
			      <tr>
				<td>Grand Total</td>
				<td></td>
				<td><%=minorall  %></td>
				<td><%=weightedall  %></td>
				<td><%=seriousall   %></td>
				<td><%=pointall   %></td>
				<td><%=allall %></td>
				<td>100%</td>
			 </table>   

	</div>
</div>

<div>
		<td width="100%" align="center" valign="top"><iframe id="ContentFrame1" name="I2" height="100%" width="100%" border="0" frameborder="0" src="11.html?aa=<%=qadata %>"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
</div>



  </body>
</html>
