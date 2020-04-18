<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Vendor Schedule</title>
    
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
    <script type="text/javascript" src="js/laydate.js"></script>
  </head>
   
  <body>

  <div class="main">
  <div class="pathBar" style="margin-bottom:2px;">
  <div class="pathBarPos"> </div>
  </div>
  <div id="myrl" style="width:1000px; margin-left:auto; margin-right:auto; height:1200px; overflow:hidden;">
     <TABLE class="biao" width="1000px" id="sucaijiayuan">
        <TBODY>
          <TR>
            <TD class="calTit" colSpan=7 style="height:30px;padding-top:3px;text-align:center;"><a href="<%=basePath%>vendorschedule.jsp#" title="last year" id="nianjian" class="ymNaviBtn lsArrow"></a> <a href="<%=basePath%>vendorschedule.jsp#" title="last month" id="yuejian" class="ymNaviBtn lArrow"></a><div style="width:250px; float:left; padding-left:230px;"> <span id="dateSelectionRili" class="dateSelectionRili" style="cursor:hand;color: white; border-bottom: 1px solid white;" > <span id="nian" class="topDateFont"></span><span class="topDateFont">-</span><span id="yue" class="topDateFont"></span><span class="topDateFont">&nbsp;</span></span> &nbsp;&nbsp;<font id=GZ class="topDateFont"></font></div>              
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
          <TR class="calWeekTit" style="font-size:12px; height:20px;text-align:center;">
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
      <td width="100%" align="center">
   
    <form id="schedule" name="schedule" method="post"  action="" onsubmit="return h_submit();" >
      
      <table  border="1"  cellpadding="0" cellspacing="0">
          <tr align="left">
             <td  width="180"><label>&nbsp;Reason&nbsp;</label><select id ="available" name="available" class="capacity"  onchange="chooseAvaliable(this)" style="font-size: 12px;"><option value="available">Available</option><option value="unavailable">Unavailable</option>
             </select></td>
            <td width="180"><label>&nbsp;Capacity&nbsp;</label><input type="text"  name ="capacity" id="capacity"   class="capacity"  ></td>
            <td width="180"><label>&nbsp;StartDate&nbsp;</label><input type="text" name ="startdate"  class="laydate-icon" id="startdate"   readonly="readonly" />
            <td width="180">&nbsp;EndDate&nbsp;<input type="text"  name ="enddate"  class="laydate-icon" id="enddate"  readonly="readonly" /></td>
            <td width="240">&nbsp;&nbsp;<input type="button" value="submit" id="submit" class="button6"  onclick="h_submit()" >
            <input type="button" value="schedule" id="shedule" class="button6"  onclick="showshedules()">
            <input type="button" value="lastmonth" id="lastmonth" class="button6"  onclick="showlastmonthshedules()"></td>
            <td style="display:none"><input type="text" id= "vendorid" name="vendorid" value='<%=session.getAttribute("vendorid") %>' ></td>
            <td style="display:none"><input type="text" id= "vendorname" name="vendorname" value='<%=session.getAttribute("vendor_name") %>' ></td>
    
      </tr>
      </table>
    </form>
    </td>
    
    
  </div>
</div>


      <div id="details" style="margin-top:-1px;"></div>

	   <table cellspacing="0" cellpadding="0" width="80%" height="400px">
		   <tr> 
		   <td align="center" valign="top"><iframe id="ContentFrame" name="I2" height="400px" width="100%" border="0" frameborder="0" src="">浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
		   </tr> 
       </table>
    
	
  </body>
</html>

       
<SCRIPT language="JavaScript">
      
!function(){
	laydate.skin('molv');//切换皮肤，请查看skins下面皮肤库
	laydate({elem: '#startdate'});//绑定元素 
	laydate({elem: '#enddate'});//绑定元素
}();

//日期范围限制
var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',
    min: laydate.now(), //设定最小日期为当前日期
    max: '2100-01-01', //最大日期
    istime: true,
    istoday: false,
    choose: function(datas){
         end.min = datas; //开始日选好后，重置结束日的最小日期
         end.start = datas //将结束日的初始值设定为开始日
    }
};

var end = {
    elem: '#end',
    format: 'YYYY-MM-DD',
    min: laydate.now(),
    max: '2100-01-01',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //结束日选好后，充值开始日的最大日期
    }
};
laydate(start);
laydate(end);

//自定义日期格式
laydate({
    elem: '#test1',
    format: 'YYYY年MM月DD日',
    festival: true, //显示节日
    choose: function(datas){ //选择日期完毕的回调
        alert('得到：'+datas);
    }
});

//日期范围限定在昨天到明天
laydate({
    elem: '#hello3',
    min: laydate.now(-1), //-1代表昨天，-2代表前天，以此类推
    max: laydate.now(+1) //+1代表明天，+2代表后天，以此类推
});


iftj="111";
var bookcapacity="";
var fwym="";
//提交
function h_submit(){
        var available = document.getElementById("available").value;
		var capacity = document.getElementById("capacity").value;
        var vendorid = document.getElementById("vendorid").value;
        var vendorname = document.getElementById("vendorname").value;
	   
 	    if(capacity =="" || capacity==null){
		    alert("Please insert capacity ");
		    return false; 
	    }
	    
	    var date = new Date();
        var seperator1 = "-";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
	    if (month >= 1 && month <= 9) {
	        month = "0" + month;
	    }
	    if (strDate >= 0 && strDate <= 9) {
	        strDate = "0" + strDate;
	    }
	    
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
        
	    
        var startdate = "";
        var enddate = ""
        var str=new Array(); 
         if(hDays != "") {
           var date_year = hDays.toString().substr(9,4);
           var date_month = hDays.toString().substr(13,2);
           var date_date = hDays.toString().substr(15,2);
           str[0]= date_year+"-"+date_month+"-"+date_date; 
        }
        
         if(hDays != "" && hDays.toString().length>30) {
            for(var i = 1;i <=(hDays.toString().length-23)/24;i++) {
                  str[i] =  hDays.toString().substr(9+i*24,4)+"-"+hDays.toString().substr(13+i*24,2)+"-"+hDays.toString().substr(15+i*24,2);
           }
           
        } 
      
          
       if(hDays != "") {
       
          var updatedate = "";
          for(var j= 0;j<str.length;j++) {
            if(currentdate>=str[j]) {
                alert("The selected dates  must be greater than Today");
                return false;        
            }
          
             if(j==0){
                updatedate=str[0];
               }else {
                updatedate=updatedate+","+str[j];   
              }   
           }
             fwym="checkbookcapacity";
             sendRequest("checkcapacity.jsp?updatedate="+updatedate+"&vendorid="+vendorid);
             if(Number(bookcapacity)>Number(capacity)) {
                	 alert("Capacity must be greater than the Max Bookcapacity ！");
		             return false; 
             }else {
                 fwym="";
             }
         	 sendRequest("updatemuchschedule.jsp?updatedate="+updatedate+"&vendorid="+vendorid+"&capacity="+capacity);  
         	 window.location.reload();
             return false; 
               
       }
        
        
		if(startdate == "") {
		    startdate = document.getElementById("startdate").value;
		}
	    if(enddate == "") {
		     enddate = document.getElementById("enddate").value;
		}
		 if(hDays=="" && startdate =="" && enddate == ""){
		 alert("please insert startdate and enddate！");
		 return false; 
	     }
		

        if(currentdate>=startdate) {
               alert("Startdate must be greater than Today");
               return false;        
        }
        
         fwym="checkbookcapacity";
             sendRequest("checklinecapacity.jsp?startdate="+startdate+"&vendorid="+vendorid+"&enddate="+enddate);
             if(Number(bookcapacity)>Number(capacity)) {
                	 alert("Capacity must be greater than the Max Bookcapacity ！");
		             return false; 
             }else {
                 fwym="";
             } 
        
    	 sendRequest("updateschedulebyrili.jsp?startdate="+startdate+"&enddate="+enddate+"&vendorid="+vendorid+"&capacity="+capacity);
         document.getElementById("ContentFrame").src="listschedulebypageaction.action?page=1&Schedule.vendorid="+vendorid;
         document.getElementById("capacity").value="";
         document.getElementById("startdate").value="";
         document.getElementById("enddate").value="";
		} 
		
	   function init() {
          var vendorid = document.getElementById("vendorid").value;
          document.getElementById("ContentFrame").src="listschedulebypageaction.action?page=1&Schedule.vendorid="+vendorid;
       }
       
	    
		//重置
		function rebuild(){
			$("#huiyi8 td").removeClass("selday").attr("on",0);
			hDays=[];
			document.getElementById("capacity").value="";
			document.getElementById("startdate").value="";
			document.getElementById("enddate").value="";
		 }   

       function showshedules() {
                var vendorid = document.getElementById("vendorid").value;
                document.getElementById("ContentFrame").src="listschedulebypageaction.action?page=1&Schedule.vendorid="+vendorid;
		} 
		
        function showlastmonthshedules() {
                var vendorid = document.getElementById("vendorid").value;
                document.getElementById("ContentFrame").src="listlastmonthschedule.jsp?vendorid="+vendorid;
		} 
		
		
		
		
    var XMLHttpReq;
    var currentSort;
     //创建XMLHttpRequest对象      
    function createXMLHttpRequest() {
        if(window.XMLHttpRequest) { //Mozilla 浏览器
            XMLHttpReq = new XMLHttpRequest();
        }
        else if (window.ActiveXObject) { // IE浏览器
            try {
                XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {}
            }
        }
    }
    //发送请求函数
    function sendRequest(url) {
        createXMLHttpRequest();
        XMLHttpReq.open("GET", url, false);
        XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
        XMLHttpReq.send(null);  // 发送请求
    }
    // 处理返回信息函数
    
   function processResponse() {
        if (XMLHttpReq.readyState == 4) { // 判断对象状态
            if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
                  if(fwym=="checkbookcapacity") {
                      getbookcapactiy();
                  }else {
                       alert("Update Success");
                  }
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
    } 


      //
     function getbookcapactiy() { 
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        bookcapacity=res;
    }
    
    
    // 选择 Avaliable
    function chooseAvaliable() {   
         var available_text=document.getElementById("available").value;
		 if(available_text=="available") {
		 	  document.getElementById("capacity").value="";
		      document.getElementById("capacity").readOnly=false;
		 }
         if(available_text=="unavailable") {
		      document.getElementById("capacity").value="0";
		 	  document.getElementById("capacity").readOnly=true;
		 }
    }
    
        
   </SCRIPT>
   
