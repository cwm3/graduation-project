//初始化		  
$(function () {
            $('#status').combotree({
                valueField: "id", //Value字段
                textField: "text", //Text字段
                multiple: false,
                data:  [{ "id": "inprocess", "text": "in process" }, { "id": "close", "text": "close" }, { "id": "heads up", "text": "heads up"}],                 
                onChange:function(){  
                	showSubMenu(); 
                }
            });
            
           $('#worktype').combotree({
                valueField: "id", //Value字段
                textField: "text", //Text字段
                multiple: false,
                data:  [{ "id": "hourlywork", "text": "Hourly Work" }, { "id": "translation", "text": "Translation" }, { "id": "review", "text": "Review" }],           
                onChange:function(){  
                    chooseworktype(); 
                 }
            });
          
           
           $('#ho').combotree({
            valueField: "id", //Value字段
            textField: "text", //Text字段
            multiple: false,
            data:  [{ "id": "N", "text": "N" }, { "id": "Y", "text": "Y" }]
        });
           
           
           
            
            $('#resource').combotree({
                valueField: "id", //Value字段
                textField: "text", //Text字段
                multiple: false,
                data:  [{ "id": "Internal", "text": "Internal" }, { "id": "External", "text": "External" }],              
                onChange:function(){  
                    chooseResourceType(); 
               }
            });
                   
            $('#startdate').datebox({  
            	 closeText:'close',  
            	 formatter:function(date){  
            	  var y = date.getFullYear();  
            	  var m = date.getMonth()+1;  
            	  var d = date.getDate();   
            	  function formatNumber(value){  
            	   return (value < 10 ? '0' : '') + value;  
            	  }  
            	  return y+'-'+formatNumber(m)+'-'+formatNumber(d);  
            	 },  
            	 parser:function(s){  
            	  var t = Date.parse(s);  
            	  if (!isNaN(t)){  
            	   return new Date(t);  
            	  } else {  
            	   return new Date();  
            	  }  
            	 }  
            	}); 

            	$('#enddate').datebox({  
            	 closeText:'close',  
            	 formatter:function(date){  
            	  var y = date.getFullYear();  
            	  var m = date.getMonth()+1;  
            	  var d = date.getDate();   
            	  function formatNumber(value){  
            	   return (value < 10 ? '0' : '') + value;  
            	  }  
            	  return y+'-'+formatNumber(m)+'-'+formatNumber(d);  
            	 },  
            	 parser:function(s){  
            	  var t = Date.parse(s);  
            	  if (!isNaN(t)){  
            	   return new Date(t);  
            	  } else {  
            	   return new Date();  
            	  }  
            	 }  
            	});

            	$('#datedate').datebox({  
            	 closeText:'close',  
            	 formatter:function(date){  
            	  var y = date.getFullYear();  
            	  var m = date.getMonth()+1;  
            	  var d = date.getDate();   
            	  function formatNumber(value){  
            	   return (value < 10 ? '0' : '') + value;  
            	  }  
            	  return y+'-'+formatNumber(m)+'-'+formatNumber(d);  
            	 },  
            	 parser:function(s){  
            	  var t = Date.parse(s);  
            	  if (!isNaN(t)){  
            	   return new Date(t);  
            	  } else {  
            	   return new Date();  
            	  }  
            	 }  
            	});
         
        $("input",$("#hourlywork").next("span")).blur(function(){  
          		  counthourlywork(); 
        });  
        $("input",$("#newwords").next("span")).blur(function(){  
        	       countnewwords(); 
        });
        $("input",$("#postediting").next("span")).blur(function(){  
        	countpostediting(); 
       });  
        $("input",$("#rate1").next("span")).blur(function(){  
        	    countrate1(); 
            });   	
        $("input",$("#rate2").next("span")).blur(function(){  
        	    countrate2(); 
          });   	
          $("input",$("#rate3").next("span")).blur(function(){  
      	    countrate3(); 
        });   	
        $("input",$("#rate4").next("span")).blur(function(){  
    	    countrate4(); 
      });   	 
      	            
 //结束           
 })
 
var XMLHttpReq;
var currentSort;
var ifcg="";//是否超过
var dalitycapacity="";//每日产能
var fwymbz="";//返回页面标志
    
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
                if(fwymbz=="1") {
                    updateMenu();
                }else if(fwymbz=="2") {
                     checkcapacity();
                }else if(fwymbz=="3") {
                    getdality();
                }else if(fwymbz=="4") {
                     getvendorid();
                }else if(fwymbz=="5") {
                    caculate();
                }
                
            } else { //页面不正常
                  alert("页面不正常.");
            }
        }
    }
    
    //更新菜单函数
    function updateMenu() {
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        var obj = eval('(' + res + ')');
        $('#systemcode').combotree({
                valueField: "id", //Value字段
                textField: "text", //Text字段
                multiple: false,
                data: obj
            });
     
    }
    
    // 创建级联菜单函数
    function showSubMenu() {
        fwymbz = "1";
        var username = document.getElementById("username").value;
        var datedate = $("#datedate").textbox("getValue");
        var status = $("#status").combobox("getValue");
        sendRequest("menu2.jsp?sort=" + status+"&username="+username+"&datedate="+datedate);       
    }
    
   function checkpost2() {
                 document.getElementById("table1").style.display="none";
                 var systemcode = $("#systemcode").combobox("getValue");
                 var status = $("#status").combobox("getValue");
                 var dropdate = $("#datedate").datebox("getValue");
                 var username = document.getElementById("username").value;
                 document.getElementById("ContentFrame1").src="selectprojectbytiaojian.action?systemcode="+systemcode+"&status="
                 +status+"&dropdate="+dropdate+"&lead="+username;
                 return false;
 		 }
   var wf_systemcode = "";//外发的project
   var  projectes=0;
   function setbackroundecolor(projectgs,obj,dropname){
	   projectes=projectgs;
       wf_systemcode=obj;
       sfjs=""; 
       $("#dropname").textbox("setValue", dropname);  
   }
   
   function selectVendor() {
       var word = encodeURI($("#word").textbox("getValue"));  
	     //var word = encodeURI(document.getElementById("word").value);
	     if( word=="" || word == null) {
		 alert("Please insert Vendor Name");
		      return false;
		 } else {
		    fwymbz = "4";
            word = encodeURI(word);  //需要通过两次编码
		    sendRequest("showvendor.jsp?vendor_name="+word);
		 } 
  }
   
   //
   function getvendorid() { 
      var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
      var a = res.split("||||");
      var vendorid = a[0];
      if(vendorid=="notfound") {
         alert("Vendor Name has not existed ");
         $("#word").textbox("setValue", "");
         $("#newword").textbox("setValue", "");            
      } else {
         $("#vendorid").textbox("setValue",a[0]);
         $("#newword").textbox("setValue",a[1]);   
      }       
  }
   
 var workstyle_qj="";//全局的workstyle
 // 选择worktype的时候计算  Cooresponding 
 function chooseworktype() {
       var coorespondingwords=""; 
       var resource = $("#resource").combobox("getText");
       var worktype = $("#worktype").combobox("getText");
       //workstyle_qj=workstyle;
        var vendorid = $("#vendorid").textbox("getValue");
	    if(resource=="External"){
        if(vendorid=="" || vendorid == null) {
		 		  alert("Vendor must be inserted ");
		          return false;
          }
         }
		 fwymbz="5";
         if( sfjs != "s" ) {
         sendRequest("loadprojectinfo.jsp?systemcode=" + wf_systemcode+"&workstyle="+worktype);
         }
         if(isWF=="YWF") {
            clearall();
            return;
         }
        var newwords = $("#newwords").textbox("getValue");
        var hourlywork = $("#hourlywork").textbox("getValue");
        var postediting = $("#postediting").textbox("getValue");
        var rate1 = $("#rate1").textbox("getValue");
        var rate2 = $("#rate2").textbox("getValue");
        var rate3 = $("#rate3").textbox("getValue");
        var rate4 = $("#rate4").textbox("getValue");

                        
        if(worktype=="hourlywork") {
              newwords=0;
              postediting=0;          
              rate1=0;
              rate2=0;
              rate3=0;
              rate4=0;

       }  else if(worktype != "hourlywork" & projectes==1) {
       
      }

       //var totalwords = Number(newwords)+Number(postediting)+Number(rate1)+Number(rate2)+Number(rate3)+Number(rate4);
        var totalwords = $("#totalwords").textbox("getValue");
         if(worktype=="translation" || worktype=="Translation") { 
             coorespondingwords = totalwords;
             $("#hourlywork").textbox("setValue", "0");
             
         }
         if(worktype=="review" || worktype=="Review") { 
             coorespondingwords = Number(totalwords)/3;
             $("#hourlywork").textbox("setValue", "0");
         }
	      
         if(worktype=="hourlywork" && resource!="Internal") {         
	          if( hourlywork=="" || hourlywork == null) {
				  alert("Please insert hourlywork");
				  return false;
			      } 
			     var dalitycapacity = getDalityCapacity(vendorid);
			     coorespondingwords = hourlywork*dalitycapacity/8;
         }

         if(worktype=="hourlywork") {         
	               $("#newwords").textbox("setValue", "0");
	               $("#postediting").textbox("setValue", "0"); 
	               $("#rate1").textbox("setValue", "0"); 
	               $("#rate2").textbox("setValue", "0"); 
	               $("#rate3").textbox("setValue", "0"); 
	               $("#rate4").textbox("setValue", "0"); 	                
         }

         alert(coorespondingwords+"coorespondingwords");
         if(coorespondingwords!=""){
             coorespondingwords=parseInt(coorespondingwords);           
           }
         //$("#totalwords").textbox("setValue", totalwords); 
         $("#coorespondingwords").textbox("setValue", coorespondingwords); 
  } 
 
 var isWF="";
 function caculate() { 
  var hourlywork=XMLHttpReq.responseXML.getElementsByTagName("hourlywork")[0].firstChild.data;
  var postediting=XMLHttpReq.responseXML.getElementsByTagName("postediting")[0].firstChild.data;         
  var newwords=XMLHttpReq.responseXML.getElementsByTagName("newwords")[0].firstChild.data; 
  var rate1=XMLHttpReq.responseXML.getElementsByTagName("rate1")[0].firstChild.data;        
  var rate2=XMLHttpReq.responseXML.getElementsByTagName("rate2")[0].firstChild.data;
  var rate3=XMLHttpReq.responseXML.getElementsByTagName("rate3")[0].firstChild.data;
  var rate4=XMLHttpReq.responseXML.getElementsByTagName("rate4")[0].firstChild.data;
  var systemcode=XMLHttpReq.responseXML.getElementsByTagName("systemcode")[0].firstChild.data;
  var yxbz=XMLHttpReq.responseXML.getElementsByTagName("yxbz")[0].firstChild.data;
  isWF="";
  if(yxbz=="YWF"&workstyle_qj!="hourlywork") {
      alert(systemcode + " has been distributed fully ");
      isWF="YWF";
      clearall();
      return;
  }else {
      caculatedistribution(hourlywork,newwords,postediting,rate1,rate2,rate3,rate4,systemcode);         
  } 
}
     var hourlywork_jl;//积累的hourlywork值
     var postediting_jl;//积累的postediting值
     var newwords_jl ;//积累的newwords值
     var rate1_jl ;//积累的rate1值
     var rate2_jl ;//积累的rate2值
     var rate3_jl ;//积累的rate3值
     var rate4_jl ;//积累的rate4值
function caculatedistribution(hourlywork,newwords,postediting,rate1,rate2,rate3,rate4,systemcode) {    
    //hourlywork  已全部外发，hourlywork小于0
    var hourly=parseFloat(hourlywork);
    if(hourly<0){
       hourly=0;
    }
    $("#hourlywork").textbox("setValue", hourly);                
    $("#postediting").textbox("setValue",postediting);                
    $("#newwords").textbox("setValue", newwords);
    $("#rate1").textbox("setValue", rate1);
    $("#rate2").textbox("setValue", rate2);
    $("#rate3").textbox("setValue", rate3);
    $("#rate4").textbox("setValue", rate4);
    hourlywork_jl=hourlywork;//积累的hourlywork值
    postediting_jl=postediting;//积累的postediting值
    newwords_jl=newwords;//积累的newwords值
    rate1_jl=rate1 ;//积累的rate1值
    rate2_jl=rate2 ;//积累的rate2值
    rate3_jl=rate3 ;//积累的rate3值
    rate4_jl=rate4 ;//积累的rate4值
    var all_totalwords=parseFloat(postediting)+parseFloat(newwords)+parseFloat(rate1)+parseFloat(rate2)+parseFloat(rate3)+parseFloat(rate4);
    $("#totalwords").textbox("setValue", all_totalwords);
    $("#systemcodeall").textbox("setValue", systemcode);
    alert("fff");
    } 

function csubmittiom() {
    alert("ddd");
    var resource = $("#resource").combobox("getText"); 
    var worktype = $("#worktype").combobox("getText"); 
    var ho = $("#ho").combobox("getText"); 

    var startdate = $("#startdate").datebox("getValue");
    var enddate = $("#enddate").datebox("getValue");
    
    var dropname = $("#dropname").textbox("getValue");
    var comments = $("#comments").textbox("getValue");
    var outsourcedponumber = $("#outsourcedponumber").textbox("getValue");
    var coorespondingwords = $("#coorespondingwords").textbox("getValue");
    var totalwords = $("#totalwords").textbox("getValue");
    var projectvalue = $("#projectvalue").textbox("getValue");
    //var lead = $("#username").textbox("getValue");
    var lead = document.getElementById("username").value;
    var vendorid = $("#vendorid").textbox("getValue");
    var vendorname = $("#word").textbox("getValue");
    var systemcodeall = $("#systemcodeall").textbox("getValue");

    var newwords = $("#newwords").textbox("getValue");
    var hourlywork = $("#hourlywork").textbox("getValue");
    var postediting = $("#postediting").textbox("getValue");
    var rate1 = $("#rate1").textbox("getValue");
    var rate2 = $("#rate2").textbox("getValue");
    var rate3 = $("#rate3").textbox("getValue");
    var rate4 = $("#rate4").textbox("getValue");
    if(newwords==""||newwords==null) {
          newwords=0;
    }
    
    if(newwords==""||newwords==null) {
          newwords=0;
    }
    
    if(postediting==""||postediting==null) {
          postediting=0;
    }
    
    if(rate1==""||rate1==null) {
          rate1=0;
    }
    
    if(rate2==""||rate2==null) {
          rate2=0;
    }
    
    if(rate3==""||rate3==null) {
          rate3=0;
    }
    
    if(rate4==""||rate4==null) {
          rate4=0;
    }
    
                
    if(hourlywork==""||hourlywork==null) {
          hourlywork=0;
    }

    hourlywork= parseFloat(hourlywork);
    hourlywork_jl= parseFloat(hourlywork_jl);
    
    postediting= parseFloat(postediting);
    postediting_jl= parseFloat(postediting_jl);
    
    newwords= parseFloat(newwords);
    newwords_jl= parseFloat(newwords_jl);
    
    rate1= parseFloat(rate1);
    rate1_jl= parseFloat(rate1_jl);
    
    rate2= parseFloat(rate2);
    rate2_jl= parseFloat(rate2_jl);
    
    rate3= parseFloat(rate3);
    rate3_jl= parseFloat(rate3_jl);
    
    rate4= parseFloat(rate4);
    rate4_jl= parseFloat(rate4_jl);

    
    var systemcode = systemcodeall.split(",");
    var actionurl = "";
  
    if(enddate=="" || enddate == null) {
	   alert("Please insert enddate");
	   return false;
     } 
      
    if(systemcode.length== 1 & resource=="External" ) {
	        var ifoucg = checksparecapacity(vendorid,startdate,enddate);
	        alert(ifoucg+"ifoucg");
	        if(ifoucg==0) {
	              alert("Vendor capactity has fully booked ");
	              return false;
	          }
	         ifoucg= parseFloat(ifoucg);
             coorespondingwords= parseFloat(coorespondingwords);
	         if(ifoucg < coorespondingwords){
	               if(pdsffs(ifoucg,coorespondingwords)) {
	              }else {
	                  return false;
	              }
	            }           
         actionurl = "addOneExternalDistribution.action?vendorid="+
         vendorid+"&hourlywork="+hourlywork+"&newwords="+newwords+"&postediting="+postediting+"&lead="+lead+"&vendorname="+vendorname+"&comments=&resource="+resource+"&dropname="+dropname+
         "&rate1="+rate1+"&rate2="+rate2+"&rate3="+rate3+"&rate4="+rate4+"&totalwords="+totalwords+"&coorespondingwords="+coorespondingwords+"&outsourcedponumber="
         +outsourcedponumber+"&startdate="+startdate+"&projectvalue="+projectvalue+"&enddate="+enddate+"&worktype="+worktype+"&systemcode="+systemcode+"&systemcodeall="+systemcodeall+"&ho="+ho;
         document.getElementById("ContentFrame3").src= actionurl;
    }
    
    if(systemcode.length== 1 & resource=="Internal" ) {
         actionurl = "addOneInternalDistribution.action?vendorid="+
         vendorid+"&hourlywork="+hourlywork+"&newwords="+newwords+"&postediting="+postediting+"&lead="+lead+"&vendorname="+vendorname+"&comments=&resource="+resource+"&dropname="+dropname+
         "&rate1="+rate1+"&rate2="+rate2+"&rate3="+rate3+"&rate4="+rate4+"&totalwords="+totalwords+"&coorespondingwords="+coorespondingwords+"&outsourcedponumber="
         +outsourcedponumber+"&startdate="+startdate+"&projectvalue="+projectvalue+"&enddate="+enddate+"&worktype="+worktype+"&systemcode="+systemcode+"&systemcodeall="+systemcodeall+"&ho="+ho;
         document.getElementById("ContentFrame3").src= actionurl;
    }
    
    
    if(systemcode.length>1 & resource=="Internal" ) {
         actionurl = "addMuchInternalDistribution.action?vendorid="+
         vendorid+"&hourlywork="+hourlywork+"&newwords="+newwords+"&postediting="+postediting+"&lead="+lead+"&vendorname="+vendorname+"&comments=&resource="+resource+"&dropname="+dropname+
         "&rate1="+rate1+"&rate2="+rate2+"&rate3="+rate3+"&rate4="+rate4+"&totalwords="+totalwords+"&coorespondingwords="+coorespondingwords+"&outsourcedponumber="
         +outsourcedponumber+"&startdate="+startdate+"&projectvalue="+projectvalue+"&enddate="+enddate+"&worktype="+worktype+"&systemcode="+systemcode+"&systemcodeall="+systemcodeall+"&ho="+ho;
         document.getElementById("ContentFrame3").src= actionurl;
    }
    
                  
    if(systemcode.length>1 & resource=="External" ) {
        var ifoucg = checksparecapacity(vendorid,startdate,enddate);
	    if(ifoucg==0) {
	         alert("Vendor capactity has fully booked ");
	              return false;
	     }
	    ifoucg= parseFloat(ifoucg);
        coorespondingwords= parseFloat(coorespondingwords);
	    if(ifoucg < coorespondingwords){
	         if(pdsffs(ifoucg,coorespondingwords)) {
	          }else {
	                  return false;
	              }
	            } 
    
         actionurl = "addMuchExternalDistribution.action?vendorid="+
         vendorid+"&hourlywork="+hourlywork+"&newwords="+newwords+"&postediting="+postediting+"&lead="+lead+"&vendorname="+vendorname+"&comments=&resource="+resource+"&dropname="+dropname+
         "&rate1="+rate1+"&rate2="+rate2+"&rate3="+rate3+"&rate4="+rate4+"&totalwords="+totalwords+"&coorespondingwords="+coorespondingwords+"&outsourcedponumber="
         +outsourcedponumber+"&startdate="+startdate+"&projectvalue="+projectvalue+"&enddate="+enddate+"&worktype="+worktype+"&systemcode="+systemcode+"&systemcodeall="+systemcodeall+"&ho="+ho;
         document.getElementById("ContentFrame3").src= actionurl;
    }
    alert(" Outsource Success ");                
    //clearall();//清空所有的输入
    //myFrame.window.clearchoose();
    return false;
} 


// 检测剩余产能
function checksparecapacity(vendorid,startdate,enddate){
    fwymbz = "2";
   sendRequest("checksparecapacity.jsp?vendorid="+vendorid+"&startdate="+startdate+"&enddate="+enddate);
   return  ifcg;  
}

function pdsffs(ifoucg,coorespondingwords) {
    if((coorespondingwords-ifoucg)>1000) {
        alert("Outsource words has exceed 1000 ");
        return false;
    }else {
       	if (confirm("Outsource words has exceed vendor capacity,are you sure to continue ?")) {
				return true;
			}else {
			 return false;
			
	     }
	    }
    }


//更新菜单函数
function getdality() { 
dalitycapacity=""; 
var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
dalitycapacity=res;
}

//更新菜单函数
function checkcapacity() { 
   ifcg=""; 
   var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
   ifcg=res;
}


function counthourlywork(){     
    sfjs="s";
    chooseworktype();
}

var sfjs="";     
function countnewwords(){     
var newwords = $("#newwords").textbox("getValue");
var newwordd= parseFloat(newwords);
var newwords_jl_jl= parseFloat(newwords_jl);
if(newwordd>newwords_jl_jl){
    alert(newwordd+" can not be greater than The sum of the new words");
    //document.getElementById("newwords").value=newwords_jl;
    $("#newwords").textbox("setValue", newwords_jl);                
}else {
          sfjs="s";
          chooseworktype();
         
}
}    


function countrate1(){   
var rate1 = $("#rate1").textbox("getValue");
rate1= parseFloat(rate1);
rate1_jl= parseFloat(rate1_jl);
if(rate1>rate1_jl){
    alert(rate1+" can not be greater than The sum of the 75%-84% Fuzzy");
    $("#rate1").textbox("setValue", rate1_jl); 
}else {
        sfjs="s";
      chooseworktype();
}
}    

function countrate2(){     
var rate2 = $("#rate2").textbox("getValue");
rate2= parseFloat(rate2);
rate2_jl= parseFloat(rate2_jl);
if(rate2>rate2_jl){
    alert(rate2+" can not be greater than The sum of the 85%-99% Fuzzy");
    //document.getElementById("rate2").value=rate2_jl;
    $("#rate2").textbox("setValue", rate2_jl); 
    
}else {
       sfjs="s";
      chooseworktype();
}
}    
 
function countrate3(){     
//var rate3=document.getElementById("rate3").value; 
var rate3 = $("#rate3").textbox("getValue");
rate3= parseFloat(rate3);
rate3_jl= parseFloat(rate3_jl);
if(rate3>rate3_jl){
    alert(rate3+" can not be greater than The sum of the 75%-99% Fuzzy");
    //document.getElementById("rate3").value=rate3_jl;
    $("#rate3").textbox("setValue", rate3_jl);                
}else {
      sfjs="s";
      chooseworktype();
}
}  

function countrate4(){     
//var rate4=document.getElementById("rate4").value;
var rate4 = $("#rate4").textbox("getValue");

rate4= parseFloat(rate4);
rate4_jl= parseFloat(rate4_jl);
if(rate4>rate4_jl){
    alert(rate4+" can not be greater than The sum of the 100% Repetition");
    //document.getElementById("rate4").value=rate4_jl;
    $("#rate4").textbox("setValue", rate4_jl); 
    
  }else {
      sfjs="s";
      chooseworktype();
}
} 


function countpostediting(){     
//var postediting=document.getElementById("postediting").value;
var postediting = $("#postediting").textbox("getValue");

postediting= parseFloat(postediting);
postediting_jl= parseFloat(postediting_jl);
if(postediting>postediting_jl){
    alert(postediting+" can not be greater than The sum of the postediting");
    document.getElementById("postediting").value=postediting_jl;
  }else {
      sfjs="s";
      chooseworktype();
}
} 



