<%-- <%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>
<%@page import="com.datacollect.QaInfoDao"%>
<%@page import="com.productsystem.model.Qa"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String startdate = request.getParameter("startdate");
String enddate =  request.getParameter("enddate");



QaInfoDao qadao = new QaInfoDao();
Qa qa  = qadao.listQaClientName(startdate,enddate);


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
			    </tr>
			    
			    
			    <tr>
				<td>Wrong Term</td>
				<td>WT</td>
				
				<td><%=qa.getWrongminor()%></td>
			    <td><%=qa.getWrongweighted()%></td>
				<td><%=qa.getWrongserious()%></td>
				<td><%=qa.getWrongpoints()%></td>
				<td><%=qa.getWrongcategory() %></td>
					    </tr>
				
				<tr>
				<td>Wrong Meaning</td>   
				<td>WM</td>   
				<td><%=qa.getMeaningminor()%></td>
				<td><%=qa.getMeaningweighted()%></td>
				<td><%=qa.getMeaningserious()%></td>
				<td><%=qa.getMeaningpoints()%></td>
				<td><%=qa.getMeaningcategory()%></td>
			    </tr>
			    
			    			<tr>
				<td>Omission</td>   
				<td>OM</td>   
				<td><%=qa.getOmissionminor() %></td>
				<td><%=qa.getOmissionweighted()  %></td>
				<td><%=qa.getOmissionserious() %></td>
				<td><%=qa.getOmissionpoints() %></td>
				<td><%=qa.getOmissioncategory() %></td>
			    </tr>
			    
			        <tr>
				<td>Structural Error</td>
				<td>SE</td>
				<td><%=qa.getStructuralnminor()%></td>
				<td><%=qa.getStructuralweighted()%></td>
				<td><%=qa.getStructuralserious()%></td>
				<td><%=qa.getStructuralpoints()%></td>
				<td><%=qa.getStructuralcategory()%></td>
			    </tr>
			    
                    
			    <tr>
				<td>Misspelling</td>
				<td>SP</td>
				<td><%=qa.getMisspellingminor() %></td>
				<td><%=qa.getMisspellingweighted()  %></td>
				<td><%=qa.getMisspellingserious()  %></td>
				<td><%=qa.getMisspellingpoints() %></td>
				<td><%=qa.getMisspellingcategory() %></td>
				
			    </tr>
			    
    	    		    <tr>
				<td>Punctuation</td>
				<td>PE</td>
				<td><%=qa.getPunctuationminor()%></td>
				<td><%=qa.getPunctuationweighted()%></td>
				<td><%=qa.getPunctuationserious()%></td>
				<td><%=qa.getPunctuationpoints()%></td>
				<td><%=qa.getPunctuationcategory()%></td>
				
			    </tr>
			    
			    <tr>
				<td>Style</td>
				<td>ST</td>
				<td><%=qa.getStyleminor()%></td>
				<td><%=qa.getStyleweighted()%></td>
				<td><%=qa.getStyleserious()%></td>
				<td><%=qa.getStylepoints()%></td>
				<td><%=qa.getStylecategory()%></td>
				
			    </tr>
			    
		

		    		    <tr>
				<td>Miscellaneous</td>
				<td>ME</td>
				<td><%=qa.getMiscellaneousminor()  %></td>
				<td><%=qa.getMiscellaneousweighted()  %></td>
				<td><%=qa.getMiscellaneousserious()   %></td>
				<td><%=qa.getMiscellaneouspoints()   %></td>
				<td><%=qa.getMiscellaneouscategory() %></td>
			    </tr>
			 </table>   

	</div>
</div>

  </body>
</html>
 --%>