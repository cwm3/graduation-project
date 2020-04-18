
  function HS_DateAdd(interval,number,date){
 number = parseInt(number);
 if (typeof(date)=="string"){var date = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2])}
 if (typeof(date)=="object"){var date = date}
 switch(interval){
 case "y":return new Date(date.getFullYear()+number,date.getMonth(),date.getDate()); break;
 case "m":return new Date(date.getFullYear(),date.getMonth()+number,checkDate(date.getFullYear(),date.getMonth()+number,date.getDate())); break;
 case "d":return new Date(date.getFullYear(),date.getMonth(),date.getDate()+number); break;
 case "w":return new Date(date.getFullYear(),date.getMonth(),7*number+date.getDate()); break;
 }
}
function checkDate(year,month,date){
 var enddate = ["31","28","31","30","31","30","31","31","30","31","30","31"];
 var returnDate = "";
 if (year%4==0){enddate[1]="29"}
 if (date>enddate[month]){returnDate = enddate[month]}else{returnDate = date}
 return returnDate;
}

function WeekDay(date){
 var theDate;
 if (typeof(date)=="string"){theDate = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2]);}
 if (typeof(date)=="object"){theDate = date}
 return theDate.getDay();
}
function HS_calender(){
 var lis = "";
 var style = "";
 style +="<style type='text/css'>";
 style +=".calender { width:170px; height:auto; font-size:12px; margin-right:14px; background:url(calenderbg.gif) no-repeat right center #fff; border:1px solid #397EAE; padding:1px}";
 style +=".calender ul {list-style-type:none; margin:0; padding:0;}";
 style +=".calender .day { background-color:#EDF5FF; height:20px;}";
 style +=".calender .day li,.calender .date li{ float:left; width:14%; height:20px; line-height:20px; text-align:center}";
 style +=".calender li a { text-decoration:none; font-family:Tahoma; font-size:11px; color:#333}";
 style +=".calender li a:hover { color:#f30; text-decoration:underline}";
 style +=".calender li a.hasArticle {font-weight:bold; color:#f60 !important}";
 style +=".lastMonthDate, .nextMonthDate {color:#bbb;font-size:11px}";
 style +=".selectThisYear a, .selectThisMonth a{text-decoration:none; margin:0 2px; color:#000; font-weight:bold}";
 style +=".calender .LastMonth, .calender .NextMonth{ text-decoration:none; color:#000; font-size:18px; font-weight:bold; line-height:16px;}";
 style +=".calender .LastMonth { float:left;}";
 style +=".calender .NextMonth { float:right;}";
 style +=".calenderBody {clear:both}";
 style +=".calenderTitle {text-align:center;height:20px; line-height:20px; clear:both}";
 style +=".today { background-color:#ffffaa;border:1px solid #f60; padding:2px}";
 style +=".today a { color:#f30; }";
 style +=".calenderBottom {clear:both; border-top:1px solid #ddd; padding: 3px 0; text-align:left}";
 style +=".calenderBottom a {text-decoration:none; margin:2px !important; font-weight:bold; color:#000}";
 style +=".calenderBottom a.closeCalender{float:right}";
 style +=".closeCalenderBox {float:right; border:1px solid #000; background:#fff; font-size:9px; width:11px; height:11px; line-height:11px; text-align:center;overflow:hidden; font-weight:normal !important}";
 style +="</style>";

 var now;
 if (typeof(arguments[0])=="string"){
  selectDate = arguments[0].split("-");
  var year = selectDate[0];
  var month = parseInt(selectDate[1])-1+"";
  var date = selectDate[2];
  now = new Date(year,month,date);
 }else if (typeof(arguments[0])=="object"){
  now = arguments[0];
 }
 var lastMonthEndDate = HS_DateAdd("d","-1",now.getFullYear()+"-"+now.getMonth()+"-01").getDate();
 var lastMonthDate = WeekDay(now.getFullYear()+"-"+now.getMonth()+"-01");
 var thisMonthLastDate = HS_DateAdd("d","-1",now.getFullYear()+"-"+(parseInt(now.getMonth())+1).toString()+"-01");
 var thisMonthEndDate = thisMonthLastDate.getDate();
 var thisMonthEndDay = thisMonthLastDate.getDay();
 var todayObj = new Date();
 today = todayObj.getFullYear()+"-"+todayObj.getMonth()+"-"+todayObj.getDate();
 
 for (i=0; i<lastMonthDate; i++){  // Last Month's Date
  lis = "<li class='lastMonthDate'>"+lastMonthEndDate+"</li>" + lis;
  lastMonthEndDate--;
 }
 for (i=1; i<=thisMonthEndDate; i++){ // Current Month's Date

  if(today == now.getFullYear()+"-"+now.getMonth()+"-"+i){
   var todayString = now.getFullYear()+"-"+(parseInt(now.getMonth())+1).toString()+"-"+i;
   lis += "<li><a href=javascript:void(0) class='today' onclick='_selectThisDay(this)' title='"+now.getFullYear()+"-"+(parseInt(now.getMonth())+1)+"-"+i+"'>"+i+"</a></li>";
  }else{
   lis += "<li><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"+now.getFullYear()+"-"+(parseInt(now.getMonth())+1)+"-"+i+"'>"+i+"</a></li>";
  }
  
 }
 var j=1;
 for (i=thisMonthEndDay; i<6; i++){  // Next Month's Date
  lis += "<li class='nextMonthDate'>"+j+"</li>";
  j++;
 }
 lis += style;

 var CalenderTitle = "<a href='javascript:void(0)' class='NextMonth' onclick=HS_calender(HS_DateAdd('m',1,'"+now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+"'),this) title='Next Month'>&raquo;</a>";
 CalenderTitle += "<a href='javascript:void(0)' class='LastMonth' onclick=HS_calender(HS_DateAdd('m',-1,'"+now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+"'),this) title='Previous Month'>&laquo;</a>";
 CalenderTitle += "<span class='selectThisYear'><a href='javascript:void(0)' onclick='CalenderselectYear(this)' title='Click here to select other year' >"+now.getFullYear()+"</a></span>年<span class='selectThisMonth'><a href='javascript:void(0)' onclick='CalenderselectMonth(this)' title='Click here to select other month'>"+(parseInt(now.getMonth())+1).toString()+"</a></span>月";

 if (arguments.length>1){
  arguments[1].parentNode.parentNode.getElementsByTagName("ul")[1].innerHTML = lis;
  arguments[1].parentNode.innerHTML = CalenderTitle;

 }else{
  var CalenderBox = style+"<div class='calender'><div class='calenderTitle'>"+CalenderTitle+"</div><div class='calenderBody'><ul class='day'><li>日</li><li>一</li><li>二</li><li>三</li><li>四</li><li>五</li><li>六</li></ul><ul class='date' id='thisMonthDate'>"+lis+"</ul></div><div class='calenderBottom'><a href='javascript:void(0)' class='closeCalender' onclick='closeCalender(this)'>&times;</a><span><span><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"+todayString+"'>Today</a></span></span></div></div>";
  return CalenderBox;
 }
}
function _selectThisDay(d){
 var boxObj = d.parentNode.parentNode.parentNode.parentNode.parentNode;
  boxObj.targetObj.value = d.title;
  boxObj.parentNode.removeChild(boxObj);
}
function closeCalender(d){
 var boxObj = d.parentNode.parentNode.parentNode;
  boxObj.parentNode.removeChild(boxObj);
}

function CalenderselectYear(obj){
  var opt = "";
  var thisYear = obj.innerHTML;
  for (i=1970; i<=2020; i++){
   if (i==thisYear){
    opt += "<option value="+i+" selected>"+i+"</option>";
   }else{
    opt += "<option value="+i+">"+i+"</option>";
   }
  }
  opt = "<select onblur='selectThisYear(this)' onchange='selectThisYear(this)' style='font-size:11px'>"+opt+"</select>";
  obj.parentNode.innerHTML = opt;
}

function selectThisYear(obj){
 HS_calender(obj.value+"-"+obj.parentNode.parentNode.getElementsByTagName("span")[1].getElementsByTagName("a")[0].innerHTML+"-1",obj.parentNode);
}

function CalenderselectMonth(obj){
  var opt = "";
  var thisMonth = obj.innerHTML;
  for (i=1; i<=12; i++){
   if (i==thisMonth){
    opt += "<option value="+i+" selected>"+i+"</option>";
   }else{
    opt += "<option value="+i+">"+i+"</option>";
   }
  }
  opt = "<select onblur='selectThisMonth(this)' onchange='selectThisMonth(this)' style='font-size:11px'>"+opt+"</select>";
  obj.parentNode.innerHTML = opt;
}
function selectThisMonth(obj){
 HS_calender(obj.parentNode.parentNode.getElementsByTagName("span")[0].getElementsByTagName("a")[0].innerHTML+"-"+obj.value+"-1",obj.parentNode);
}
function HS_setDate(inputObj){
 var calenderObj = document.createElement("span");
 calenderObj.innerHTML = HS_calender(new Date());
 calenderObj.style.position = "absolute";
 calenderObj.targetObj = inputObj;
 inputObj.parentNode.insertBefore(calenderObj,inputObj.nextSibling);
}


  
  function HS_DateAdd(interval,number,date){
 number = parseInt(number);
 if (typeof(date)=="string"){var date = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2])}
 if (typeof(date)=="object"){var date = date}
 switch(interval){
 case "y":return new Date(date.getFullYear()+number,date.getMonth(),date.getDate()); break;
 case "m":return new Date(date.getFullYear(),date.getMonth()+number,checkDate(date.getFullYear(),date.getMonth()+number,date.getDate())); break;
 case "d":return new Date(date.getFullYear(),date.getMonth(),date.getDate()+number); break;
 case "w":return new Date(date.getFullYear(),date.getMonth(),7*number+date.getDate()); break;
 }
}
function checkDate(year,month,date){
 var enddate = ["31","28","31","30","31","30","31","31","30","31","30","31"];
 var returnDate = "";
 if (year%4==0){enddate[1]="29"}
 if (date>enddate[month]){returnDate = enddate[month]}else{returnDate = date}
 return returnDate;
}

function WeekDay(date){
 var theDate;
 if (typeof(date)=="string"){theDate = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2]);}
 if (typeof(date)=="object"){theDate = date}
 return theDate.getDay();
}
function HS_calender(){
 var lis = "";
 var style = "";
 style +="<style type='text/css'>";
 style +=".calender { width:170px; height:auto; font-size:12px; margin-right:14px; background:url(calenderbg.gif) no-repeat right center #fff; border:1px solid #397EAE; padding:1px}";
 style +=".calender ul {list-style-type:none; margin:0; padding:0;}";
 style +=".calender .day { background-color:#EDF5FF; height:20px;}";
 style +=".calender .day li,.calender .date li{ float:left; width:14%; height:20px; line-height:20px; text-align:center}";
 style +=".calender li a { text-decoration:none; font-family:Tahoma; font-size:11px; color:#333}";
 style +=".calender li a:hover { color:#f30; text-decoration:underline}";
 style +=".calender li a.hasArticle {font-weight:bold; color:#f60 !important}";
 style +=".lastMonthDate, .nextMonthDate {color:#bbb;font-size:11px}";
 style +=".selectThisYear a, .selectThisMonth a{text-decoration:none; margin:0 2px; color:#000; font-weight:bold}";
 style +=".calender .LastMonth, .calender .NextMonth{ text-decoration:none; color:#000; font-size:18px; font-weight:bold; line-height:16px;}";
 style +=".calender .LastMonth { float:left;}";
 style +=".calender .NextMonth { float:right;}";
 style +=".calenderBody {clear:both}";
 style +=".calenderTitle {text-align:center;height:20px; line-height:20px; clear:both}";
 style +=".today { background-color:#ffffaa;border:1px solid #f60; padding:2px}";
 style +=".today a { color:#f30; }";
 style +=".calenderBottom {clear:both; border-top:1px solid #ddd; padding: 3px 0; text-align:left}";
 style +=".calenderBottom a {text-decoration:none; margin:2px !important; font-weight:bold; color:#000}";
 style +=".calenderBottom a.closeCalender{float:right}";
 style +=".closeCalenderBox {float:right; border:1px solid #000; background:#fff; font-size:9px; width:11px; height:11px; line-height:11px; text-align:center;overflow:hidden; font-weight:normal !important}";
 style +="</style>";

 var now;
 if (typeof(arguments[0])=="string"){
  selectDate = arguments[0].split("-");
  var year = selectDate[0];
  var month = parseInt(selectDate[1])-1+"";
  var date = selectDate[2];
  now = new Date(year,month,date);
 }else if (typeof(arguments[0])=="object"){
  now = arguments[0];
 }
 var lastMonthEndDate = HS_DateAdd("d","-1",now.getFullYear()+"-"+now.getMonth()+"-01").getDate();
 var lastMonthDate = WeekDay(now.getFullYear()+"-"+now.getMonth()+"-01");
 var thisMonthLastDate = HS_DateAdd("d","-1",now.getFullYear()+"-"+(parseInt(now.getMonth())+1).toString()+"-01");
 var thisMonthEndDate = thisMonthLastDate.getDate();
 var thisMonthEndDay = thisMonthLastDate.getDay();
 var todayObj = new Date();
 today = todayObj.getFullYear()+"-"+todayObj.getMonth()+"-"+todayObj.getDate();
 
 for (i=0; i<lastMonthDate; i++){  // Last Month's Date
  lis = "<li class='lastMonthDate'>"+lastMonthEndDate+"</li>" + lis;
  lastMonthEndDate--;
 }
 for (i=1; i<=thisMonthEndDate; i++){ // Current Month's Date

  if(today == now.getFullYear()+"-"+now.getMonth()+"-"+i){
   var todayString = now.getFullYear()+"-"+(parseInt(now.getMonth())+1).toString()+"-"+i;
   lis += "<li><a href=javascript:void(0) class='today' onclick='_selectThisDay(this)' title='"+now.getFullYear()+"-"+(parseInt(now.getMonth())+1)+"-"+i+"'>"+i+"</a></li>";
  }else{
   lis += "<li><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"+now.getFullYear()+"-"+(parseInt(now.getMonth())+1)+"-"+i+"'>"+i+"</a></li>";
  }
  
 }
 var j=1;
 for (i=thisMonthEndDay; i<6; i++){  // Next Month's Date
  lis += "<li class='nextMonthDate'>"+j+"</li>";
  j++;
 }
 lis += style;

 var CalenderTitle = "<a href='javascript:void(0)' class='NextMonth' onclick=HS_calender(HS_DateAdd('m',1,'"+now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+"'),this) title='Next Month'>&raquo;</a>";
 CalenderTitle += "<a href='javascript:void(0)' class='LastMonth' onclick=HS_calender(HS_DateAdd('m',-1,'"+now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+"'),this) title='Previous Month'>&laquo;</a>";
 CalenderTitle += "<span class='selectThisYear'><a href='javascript:void(0)' onclick='CalenderselectYear(this)' title='Click here to select other year' >"+now.getFullYear()+"</a></span>年<span class='selectThisMonth'><a href='javascript:void(0)' onclick='CalenderselectMonth(this)' title='Click here to select other month'>"+(parseInt(now.getMonth())+1).toString()+"</a></span>月";

 if (arguments.length>1){
  arguments[1].parentNode.parentNode.getElementsByTagName("ul")[1].innerHTML = lis;
  arguments[1].parentNode.innerHTML = CalenderTitle;

 }else{
  var CalenderBox = style+"<div class='calender'><div class='calenderTitle'>"+CalenderTitle+"</div><div class='calenderBody'><ul class='day'><li>日</li><li>一</li><li>二</li><li>三</li><li>四</li><li>五</li><li>六</li></ul><ul class='date' id='thisMonthDate'>"+lis+"</ul></div><div class='calenderBottom'><a href='javascript:void(0)' class='closeCalender' onclick='closeCalender(this)'>&times;</a><span><span><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"+todayString+"'>Today</a></span></span></div></div>";
  return CalenderBox;
 }
}
function _selectThisDay(d){
 var boxObj = d.parentNode.parentNode.parentNode.parentNode.parentNode;
  boxObj.targetObj.value = d.title;
  boxObj.parentNode.removeChild(boxObj);
}
function closeCalender(d){
 var boxObj = d.parentNode.parentNode.parentNode;
  boxObj.parentNode.removeChild(boxObj);
}

function CalenderselectYear(obj){
  var opt = "";
  var thisYear = obj.innerHTML;
  for (i=1970; i<=2020; i++){
   if (i==thisYear){
    opt += "<option value="+i+" selected>"+i+"</option>";
   }else{
    opt += "<option value="+i+">"+i+"</option>";
   }
  }
  opt = "<select onblur='selectThisYear(this)' onchange='selectThisYear(this)' style='font-size:11px'>"+opt+"</select>";
  obj.parentNode.innerHTML = opt;
}

function selectThisYear(obj){
 HS_calender(obj.value+"-"+obj.parentNode.parentNode.getElementsByTagName("span")[1].getElementsByTagName("a")[0].innerHTML+"-1",obj.parentNode);
}

function CalenderselectMonth(obj){
  var opt = "";
  var thisMonth = obj.innerHTML;
  for (i=1; i<=12; i++){
   if (i==thisMonth){
    opt += "<option value="+i+" selected>"+i+"</option>";
   }else{
    opt += "<option value="+i+">"+i+"</option>";
   }
  }
  opt = "<select onblur='selectThisMonth(this)' onchange='selectThisMonth(this)' style='font-size:11px'>"+opt+"</select>";
  obj.parentNode.innerHTML = opt;
}
function selectThisMonth(obj){
 HS_calender(obj.parentNode.parentNode.getElementsByTagName("span")[0].getElementsByTagName("a")[0].innerHTML+"-"+obj.value+"-1",obj.parentNode);
}
function HS_setDate(inputObj){
 var calenderObj = document.createElement("span");
 calenderObj.innerHTML = HS_calender(new Date());
 calenderObj.style.position = "absolute";
 calenderObj.targetObj = inputObj;
 inputObj.parentNode.insertBefore(calenderObj,inputObj.nextSibling);
}


    	var request;
    	function test(){
    	
    	 	<%--AJAX判断浏览器的类型--%>
    		if(window.XMLHttpRequest){
    			request = new XMLHttpRequest();
    		}else if(window.ActiveXObject){
    			request = new ActiveXObject("Microsoft.XMLHTTP");
    		}
    		<%--设置回调函数--%>
    		request.onreadystatechange = callback;
    		<%--得到select的值--%>
    		var s1 = document.getElementById("s1").value;
    		var url = "machineinfo.jsp?p_id=" + s1;
    		<%--转到其他页面machineinfo.jsp去处理--%>
    		request.open("get",url,true);
    		request.send(null);	
    	}
    	
    	
    	function callback(){
    		 <%--如果成功返回--%>
    		if(request.readyState==4){
    			if(200 == request.status){
    				<%--得到返回的xml文件--%>
    				var dom = request.responseXML;
    				var firstmachineEle = dom.getElementsByTagName("machineinfo");
    				<%--调用innerContent函数把根节点传进去--%>
    				innerContent(firstmachineEle);
    			}
    		}
    	} 	
    	<%--清空select2里面的值--%>
    	function clearCity(){
    		var s2 = document.getElementById("s2")
    		s2.length = 0;
    	}
    	<%--清空select3里面的值--%>
    	function clearDistrict(){
    		var s3 = document.getElementById("s3")
    		s3.length = 0;
    	}
    	
    	
    	function innerContent(firstmachineEle){
    		clearCity();
    		clearDistrict();  	
    		<%--用循环得到xml字节点的值--%>
    		for(i = 0; i < firstmachineEle.length;i++){
    				var c_idEle = firstmachineEle[i].getElementsByTagName("c_id");
    				var c_id = c_idEle[0].firstChild.data;
    				var c_nameEle =  firstmachineEle[i].getElementsByTagName("c_name");
         			var c_name = c_nameEle[0].firstChild.data;
         			var s2 = document.getElementById("s2");
         			<%--并添加到select2里面--%>
         			s2[i] = new Option(c_name,c_id);					
    			}
    			<%--如果select2里面只有一个值就不能onchange的时候这时自动
    			调用test1方法去直接获取select3的值--%>
    			/* test1();	 */		
    	}
    	
 	function test1(){
    		if(window.XMLHttpRequest){
    			request = new XMLHttpRequest();
    		}else if(window.ActiveXObject){
    			request = new ActiveXObject("Microsoft.XMLHTTP");
    		}
    		request.onreadystatechange = callback1;
    		var s2 = document.getElementById("s2").value;
    		var url1 = "showmachine.jsp?c_id=" + s2;
    	    转到其他页面showmachine.jsp去处理
    		request.open("get",url1,true);
    		request.send(null);	
    	}
    	
    	function callback1(){
    		if(request.readyState==4){
    			if(200 == request.status){
    				var dom1 = request.responseXML;
    				var citeEle = dom1.getElementsByTagName("parts");
    				innerContent1(citeEle);
    			}
    		} 
    	} 
    	
    	
    	
    	function innerContent1(citeEle){
    		clearDistrict();		
    			for(i = 0; i < citeEle.length;i++){
    				var d_idEle = citeEle[i].getElementsByTagName("partsid");
    				var d_id = d_idEle[0].firstChild.data;
    				var d_nameEle =  citeEle[i].getElementsByTagName("partsname");
         			var d_name = d_nameEle[0].firstChild.data;
         			var s3 = document.getElementById("s3");
         			s3[i] = new Option(d_name,d_id);        		
    			} 	
    	}	

    	
    	  function checkpost1() 
    	  { 
    	     
    	     
    	   window.alert = function(str) 
    	  { 
    	  var shield = document.createElement("DIV"); 
    	  shield.id = "shield"; 
    	  shield.style.position = "absolute"; 
    	  shield.style.left = "0px"; 
    	  shield.style.top = "0px"; 
    	  shield.style.width = "100%"; 
    	  shield.style.height = document.body.scrollHeight+"px"; 
    	  //弹出对话框时的背景颜色 
    	  shield.style.background = "#fff"; 
    	  shield.style.textAlign = "center"; 
    	  shield.style.zIndex = "25"; 
    	  //背景透明 IE有效 
    	  //shield.style.filter = "alpha(opacity=0)"; 
    	  var alertFram = document.createElement("DIV"); 
    	  alertFram.id="alertFram"; 
    	  alertFram.style.position = "absolute"; 
    	  alertFram.style.left = "50%"; 
    	  alertFram.style.top = "50%"; 
    	  alertFram.style.marginLeft = "-225px"; 
    	  alertFram.style.marginTop = "-75px"; 
    	  alertFram.style.width = "450px"; 
    	  alertFram.style.height = "100px"; 
    	  alertFram.style.background = "#d0d0d0"; 
    	  alertFram.style.textAlign = "center"; 
    	  alertFram.style.lineHeight = "50px"; 
    	  alertFram.style.zIndex = "300"; 
    	  strHtml = "<ul style=\"list-style:none;margin:0px;padding:0px;width:100%\">\n"; 
    	  strHtml += " <li style=\"background:#d0d0d0;text-align:left;padding-left:20px;font-size:14px;font-weight:bold;height:25px;line-height:25px;border:1px solid #F9CADE;\">[错误提示]</li>\n"; 
    	  strHtml += " <li style=\"background:#fff;text-align:center;font-size:12px;height:60px;line-height:60px;border-left:1px solid #F9CADE;border-right:1px solid #F9CADE;\">"+str+"</li>\n"; 
    	  strHtml += " <li style=\"background:#d0d0d0;text-align:center;font-weight:bold;height:25px;line-height:25px; border:1px solid #F9CADE;\"><input type=\"button\" value=\"确 定\" onclick=\"doOk()\" /></li>\n"; 
    	  strHtml += "</ul>\n"; 
    	  alertFram.innerHTML = strHtml; 
    	  document.body.appendChild(alertFram); 
    	  document.body.appendChild(shield); 
    	  var ad = setInterval("doAlpha()",5); 
    	  this.doOk = function(){ 
    	  alertFram.style.display = "none"; 
    	  shield.style.display = "none"; 
    	  } 
    	  alertFram.focus(); 
    	  document.body.onselectstart = function(){return false;}; 
    	  } 
    	   
    	   
    	   
    	    
    	   if(myform.innumber.value=="" || myform.innumber.value== null )
    	        {
    	        alert("请输入入库数量"); 
    	        myform.innumber.focus(); 
    	        return false; 
    	      
    	     } 
    	     
    	   
    	     
    	      if(myform.priovider.value=="" ||  myform.priovider.value== null )
    	        {
    	        alert("请输入供应商名称"); 
    	        myform.priovider.focus(); 
    	        return false; 
    	      
    	     } 
    	     
    	     if(myform.indate.value=="" || myform.indate.value== null )
    	        {
    	        alert("请输入入库时间"); 
    	        myform.indate.focus(); 
    	        return false; 
    	      
    	     } 
    	     
    	     
    	        if(myform.partsprice.value=="" || myform.partsprice.value== null )
    	        {
    	        alert("请输入零件价格"); 
    	        myform.partsprice.focus(); 
    	        return false; 
    	      
    	     } 
    	     
    	     
    	      if(myform.inagent.value=="" || myform.inagent.value== null )
    	        {
    	        alert("请输入经办人名"); 
    	        myform.inagent.focus(); 
    	        return false; 
    	      
    	     } 
    	   
    	  }
    	   
    	
    	