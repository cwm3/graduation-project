var currentSort;
var XMLHttpReq;
var iscz="";			


//����XMLHttpRequest����      
function createXMLHttpRequest() {
if(window.XMLHttpRequest) { //Mozilla �����
            XMLHttpReq = new XMLHttpRequest();
        }
        else if (window.ActiveXObject) { // IE�����
            try {
                XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {}
            }
        }
    }
    
	//����������
	function sendRequest(url) {
	        createXMLHttpRequest();
	        XMLHttpReq.open("GET", url, false);
	        XMLHttpReq.onreadystatechange = processResponse;//ָ����Ӧ����
	        XMLHttpReq.send(null);  // ��������
	}


    
    // ��������Ϣ����
    function processResponse() {
        if (XMLHttpReq.readyState == 4) { // �ж϶���״̬
            if (XMLHttpReq.status == 200) { // ��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ
                    docheckcostcode();
            } else { //ҳ�治����
                  alert("���������ҳ�����쳣��");
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
		
 //��ѯ   Translator
 function querytranslator() {
	             document.getElementById("table1").style.display="none";
	             var translatorname= document.getElementById("translatorname").value;
                 var office = document.getElementById("office").value;
	             document.getElementById("ContentFrame1").src="listtranslatorbypageaction.action?page=1&translatorname="
	            	+translatorname+"&office="+office+"&yxbz=1";
         }
         
         
