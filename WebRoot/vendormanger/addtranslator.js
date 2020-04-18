var currentSort;
var XMLHttpReq;
var iscz="";			


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
                    docheckcostcode();
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
    }
    
     function docheckcostcode() {        
        var res=XMLHttpReq.responseXML.getElementsByTagName("res")[0].firstChild.data;
        if(res=="bucunzai2017"){
           iscz=0;
        }else {
           iscz=1;
        }
     }

    function checkpost() { 
                iscz="";
                var translatorname= document.getElementById("translatorname").value;
                if(translatorname==""||translatorname==null) {
                   alert("Translator Name  must be inserted");
                   return false;
                }else {
                  sendRequest("checktranslator.jsp?translatorname="+translatorname);
                  if(iscz == "1"){
                       alert("Translator Name has been existed");
                       document.getElementById("translatorname").value="";
                       return false;
                  }
                }
                
                var office = document.getElementById("office").value;
                if(office==""||office==null) {
                   alert("Office must be inserted");
                   return false;                   
                }
                


		}
		
 //查询   Translator
 function querytranslator() {
	             document.getElementById("table1").style.display="none";
	             var translatorname= document.getElementById("translatorname").value;
                 var office = document.getElementById("office").value;
	             document.getElementById("ContentFrame1").src="listtranslatorbypageaction.action?page=1&translatorname="
	            	+translatorname+"&office="+office+"&yxbz=1";
         }
         
         
