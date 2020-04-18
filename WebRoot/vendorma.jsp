<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'rili33.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="images/all.css" rel="stylesheet" type="text/css"/>
	<link href="images/skin.css" rel="stylesheet" type="text/css"/>
	<link href="images/fontSize12.css" rel="stylesheet" type="text/css"/>
	<link href="images/calendar.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/calendar.js"></script>
	
  </head>
  
 <body >

 
<div class="main">

  <div id="myrl" style="width:1020px; margin-left:18%; margin-right:auto; height:840px; overflow:hidden;">
      <TABLE class="biao" width="1000px" id="huiyi8">
        <TBODY>
          <TR>
            <TD class="calTit" colSpan=7 style="height:30px;padding-top:3px;text-align:center;"><a href="<%=basePath%>vendorschedule.jsp#" title="last year" id="nianjian" class="ymNaviBtn lsArrow"></a> <a href="<%=basePath%>vendorschedule.jsp#" title="last month" id="yuejian" class="ymNaviBtn lArrow"></a><div style="width:250px; float:left; padding-left:230px;"> <span id="dateSelectionRili" class="dateSelectionRili" style="cursor:hand;color: white; border-bottom: 1px solid white;" > <span id="nian" class="topDateFont"></span><span class="topDateFont">-</span><span id="yue" class="topDateFont"></span></span> &nbsp;&nbsp;<font id=GZ class="topDateFont"></font></div>              
              <!--新加导航功能-->              
              <div style="left: 250px; display: none;" id="dateSelectionDiv">
                <div id="dateSelectionHeader"></div>
                <div id="dateSelectionBody">
                  <div id="yearList">
                    <div id="yearListPrev" onclick="dateSelection.prevYearPage()">&lt;</div>
                    <div id="yearListContent"></div>
                    <div id="yearListNext" onclick="dateSelection.nextYearPage()">&gt;</div>
                  </div>
                  <div id="dateSeparator"></div>
                  <div id="monthList">
                    <div id="monthListContent">
                        <span id="SM0" class="month" onclick="dateSelection.setMonth(0)">1</span>
                        <span id="SM1" class="month" onclick="dateSelection.setMonth(1)">2</span>
                        <span id="SM2" class="month" onclick="dateSelection.setMonth(2)">3</span>
                        <span id="SM3" class="month" onclick="dateSelection.setMonth(3)">4</span>
                        <span id="SM4" class="month" onclick="dateSelection.setMonth(4)">5</span>
                        <span id="SM5" class="month" onclick="dateSelection.setMonth(5)">6</span>
                        <span id="SM6" class="month" onclick="dateSelection.setMonth(6)">7</span>
                        <span id="SM7" class="month" onclick="dateSelection.setMonth(7)">8</span>
                        <span id="SM8" class="month" onclick="dateSelection.setMonth(8)">9</span>
                        <span id="SM9" class="month" onclick="dateSelection.setMonth(9)">10</span>
                        <span id="SM10" class="month" onclick="dateSelection.setMonth(10)">11</span>
                        <span id="SM11" class="month curr" onclick="dateSelection.setMonth(11)">12</span>
                    </div>
                    <div style="clear:both;"></div>
                  </div>
                  <div id="dateSelectionBtn">
                    <div id="dateSelectionTodayBtn" onclick="dateSelection.goToday()">今天</div>
                    <div id="dateSelectionOkBtn" onclick="dateSelection.go()">确定</div>
                    <div id="dateSelectionCancelBtn" onclick="dateSelection.hide()">取消</div>
                  </div>
                </div>
                <div id="dateSelectionFooter"></div>
              </div>
              <a href="<%=basePath%>vendorschedule.jsp#" id="nianjia" title="next year" class="ymNaviBtn rsArrow" style="float:right;"></a> <a href="<%=basePath%>vendorschedule.jsp#"  id="yuejia" title="next month" class="ymNaviBtn rArrow" style="float:right;"></a> 
			</TD>
          </TR>
          <TR class="calWeekTit" style="font-size:12px; height:30px;text-align:center;">
            <TD width="100" class="red">Sunday</TD>
            <TD width="100">Monday</TD>
            <TD width="100">Tuesday</TD>
            <TD width="100">Wednesday</TD>
            <TD width="100">Thursday</TD>
            <TD width="100">Friday</TD>
            <TD width="100" class="red">Saturday</TD>
          </TR>
     <SCRIPT language="JavaScript">
        var gNum;
        for (var i = 0; i < 6; i++) {
            document.write('<tr align=center height="50" id="tt">');
        for (var j = 0; j < 7; j++) {
        gNum = i * 7 + j ;
            document.write('<td  id="GD' + gNum + '" on="0" ><font  id="SD' + gNum + '" style="font-size:22px;"  face="Arial"');
        if (j == 0)  document.write('color=red');
        if (j == 6)
        if (i % 2 == 1)  document.write('color=red');
        else  document.write('color=red');
            document.write('  TITLE="">  </font><br><font  id="LD' + gNum + '"  size=2  style="white-space:nowrap;overflow:hidden;cursor:default;">  </font></td>');
        }
            document.write('</tr>');
        }
    </SCRIPT>
        </tbody>
      </TABLE>
     
      </td>
      
      </tr>
      </table>

      
  </div>
</div>
<SCRIPT language="JavaScript">
//提交
function h_submit(){

        var available = document.getElementById("available").value;
		var capacity = document.getElementById("capacity").value;
		var startdate = document.getElementById("startdate").value;
		var enddate = document.getElementById("enddate").value;
		var vendorid = document.getElementById("vendorid").value;
	
	
	if(hDays=="" && startdate =="" && enddate == ""){
		alert("没有选中任何日期！");
		 return false; 
	}

   if( hDays!= "" && (startdate != "" || enddate != "")){
		 alert("不能同时选中单个日期和一段日期");
		 return false; 
	}
	
	
 	if(capacity =="" || capacity==null){
		alert("产能不能为空！");
		return false; 
	}
		
	else{
	   
	    document.getElementById('ContentFrame').src="addschedule.action?vendordate="+hDays+"&vendorid="+vendorid+"&available="+available+"&startdate="+startdate+"&capacity="+capacity+"&enddate="+enddate; 
	}
}
//重置
function rebuild(){
	$("#huiyi8 td").removeClass("selday").attr("on",0);
	hDays=[];
	document.getElementById("capacity").value="";
	document.getElementById("startdate").value="";
	document.getElementById("enddate").value="";
	
	
}          
</SCRIPT>
<div id="details" style="margin-top:-1px;"></div>
</div>
</body>
</html>
