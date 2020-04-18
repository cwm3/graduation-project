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
    
    <title>selectqamonth</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
   <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
   <script type="text/javascript" src="js3/calendar.js"></script>
   <link href="images/fontSize12.css" rel="stylesheet" type="text/css"/>
   <link href="images/calendar.css" rel="stylesheet" type="text/css"/>
   <script type="text/javascript" src="js/jquery.js"></script>
   <script type="text/javascript" src="jquery/jquery-1.8.0.min.js"></script>
   <link href="css/commoncss.css" rel="stylesheet" type="text/css" media="screen" />
   <script type="text/javascript" src="js/vendorname.js"></script>
   <script type="text/javascript" src="js/clientname.js"></script>
   <script type="text/javascript" src="js/lead.js"></script>
   <script type="text/javascript" src="js/costcode.js"></script>
      
<style>

body{
	margin:0;
	padding:0;
	font:70% Arial, Helvetica, sans-serif;
	background-color:rgba(204, 204, 204, 0.168627450980392);
	line-height:130%;
	text-align:left;
}
fieldset
{
  border: 1px solid #61B5CF;
  margin-top: 10px;
  padding: 8px;
  width:98%;
  height:330px;
}
legend
{
  font: bold 10px Arial, Helvetica, sans-serif;
  color: #00008B;
  background-color: #FFFFFF;
}
a{
	text-decoration:none;
	color:#057fac;
}
a:hover{
	text-decoration:none;
	color:#999;
}
h1{
	font-size:140%;
	margin:0 20px;
	line-height:80px;	
}
h2{
	font-size:130%;
}
#container{
	margin:0 auto;
	width:100%;
	margin-left:20px;
	background-color:rgba(204, 204, 204, 0.168627450980392);
	padding-bottom:20px;
}
#content{margin:0 20px;}
p.sig{	
	margin:0 auto;
	width:680px;
	padding:1em 0;
}

.allpage{
   margin-top:5px;
   margin-left: 20px;

}


.bottom {
   margin-top:5px;
   margin-left:40%;
   font-size: 11px;
}

.redtext {
	font-size: 11px;
	font-family:Arial,Tahoma,Verdana;
	color: #033d61; 
	float:right;
}

.tabpage{
   margin-top:50px;
}
</style>

<script language="JavaScript"> 


 function getparam(){
           var startyear_obj = document.getElementById("startyear");
		        var index_startyear = startyear_obj.selectedIndex; // 选中索引
		        var startyear = startyear_obj.options[index_startyear].value; // 选中值
     
     
	            var startmonth_obj = document.getElementById("startmonth");
		        var index_startmonth = startmonth_obj.selectedIndex; // 选中索引
		        var startmonth = startmonth_obj.options[index_startmonth].value; // 选中值
		        
		        var endyear_obj = document.getElementById("endyear");
		        var index_endyear = endyear_obj.selectedIndex; // 选中索引
		        var endyear = endyear_obj.options[index_endyear].value; // 选中值
		        
		        var endmonth_obj = document.getElementById("endmonth");
		        var index_endmonth = endmonth_obj.selectedIndex; // 选中索引
		        var endmonth = endmonth_obj.options[index_endmonth].value; // 选中值
	            var translationtype_obj = document.getElementById("translationtype");
		        var translationtype_index = translationtype_obj.selectedIndex; // 选中索引
		        var translationtype = translationtype_obj.options[translationtype_index].value; // 选中值
		        
		        var sourcelanguage_obj = document.getElementById("sourcelanguage");
		        var sourcelanguage_index = sourcelanguage_obj.selectedIndex; // 选中索引
		        var sourcelanguage = sourcelanguage_obj.options[sourcelanguage_index].value; // 选中值
		        
		        var targetlanguage_obj = document.getElementById("targetlanguage");
		        var targetlanguage_index = targetlanguage_obj.selectedIndex; // 选中索引
		        var targetlanguage = targetlanguage_obj.options[targetlanguage_index].value; // 选中值
		        
		        var field_obj = document.getElementById("field");
		        var field_index = field_obj.selectedIndex; // 选中索引
		        var field = field_obj.options[field_index].value; // 选中值
	        
	             document.getElementById("table1").style.display="none";
	             var vendorname= document.getElementById("vendorname").value;
	             var clientname= document.getElementById("clientname").value;
	             var lmorgl= document.getElementById("lmorgl").value;
	             var field= document.getElementById("field").value;
             
	             var lead = document.getElementById("lead").value;
	             var costcode = document.getElementById("costcode").value;
	             var evaluator = document.getElementById("evaluator").value; 
	             
	             var parm = "?vendorname="+vendorname+"&lead="+lead+"&startyear="+startyear+"&startmonth="+startmonth+"&endyear="+endyear+"&endmonth="+endmonth+"&evaluator="+evaluator+"&costcode="+costcode
                +"&translationtype="+translationtype+"&sourcelanguage="+sourcelanguage+"&targetlanguage="+targetlanguage+"&clientname="+clientname+"&lmorgl="+lmorgl+"&field="+field;
                return parm;
    }
 
  function choosetype(){
       	 var choosetype = document.getElementById("choosetype").value;
       	 var parm  = getparam();
       	 var lianjie="";
         if(choosetype=="Vendor Name") {
              lianjie="listqabymonth.jsp"+parm;
         }else if(choosetype=="Client Name") {
              lianjie="listqabyclientname.jsp"+parm;
         }else if(choosetype=="Lead Name") {
              lianjie="listqabyleadname.jsp"+parm;
         }else if(choosetype=="Field") {
              lianjie="listqabyfield.jsp"+parm;
         }
         document.getElementById("ContentFrame1").src=lianjie;
         
  }
  
  function showzhexiantu(){
  
       document.getElementById("table1").style.display="none";
       var choosetype = document.getElementById("choosetype").value;
       var parm  = getparam();       
       sendRequest("listqazhexiantu.jsp"+parm+"&method="+choosetype);
       
       lianjie="zhexiantu.html?month="+monthstr+"&vendorname="+vendornamestr+"&clientname="+clientnamestr
       +"&lead="+leadstr+"&field="+fieldstr+"&score="+scorestr+"&method="+choosetype;
       document.getElementById("ContentFrame1").src=lianjie;

   }
 
 
  function checkpost(){ 
                choosetype();
                return false; 
   }
  
   function exportcapacity() {
                 var parm  = getparam();
                 window.document.location.href="loadqamonthexcel.jsp"+parm;
                 return false;
                
		}
		
		
	var currentSort;
    var XMLHttpReq;

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
                    getzhexiantu();
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
    }
    
    
    var monthstr="";
    var vendoridstr="";
    var clientnamestr="";
    var leadstr="";
    var fieldstr="";
    var scorestr="";
    var vendornamestr="";
    
    
     function getzhexiantu() { 
         monthstr=XMLHttpReq.responseXML.getElementsByTagName("monthstr")[0].firstChild.data;
         vendoridstr=XMLHttpReq.responseXML.getElementsByTagName("vendoridstr")[0].firstChild.data;
         vendornamestr=XMLHttpReq.responseXML.getElementsByTagName("vendornamestr")[0].firstChild.data;
         clientnamestr=XMLHttpReq.responseXML.getElementsByTagName("clientnamestr")[0].firstChild.data;
         leadstr=XMLHttpReq.responseXML.getElementsByTagName("leadstr")[0].firstChild.data;
         fieldstr=XMLHttpReq.responseXML.getElementsByTagName("fieldstr")[0].firstChild.data;
         scorestr=XMLHttpReq.responseXML.getElementsByTagName("scorestr")[0].firstChild.data;
     }
    

</script>
  </head>
  
  <body>
  
     <div class="allpage">   
    <form method="post" action="" id="myform"  name="myform" onsubmit="return checkpost();" >
    <fieldset style="height:200px; ">
    <legend class="legend">Query Conditions</legend>
      <div class="tijiao">   
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
           <td  style="width:100px;"><span class='redtext'>Vendor Name</span> </td>
           <td><input type="text" id="vendorname"  autocomplete="off"  name="vendorname" class="inputstyle"  style="width:100%;height:25px;" ><div id ="vendornameauto"></div></td>
           <td style="width:100px;" ><span class='redtext'>Client Name</span> </td>
           <td><input type="text" id="clientname"  name="clientname" autocomplete="off"  class="inputstyle" style="width:100%;height:25px;" ><div id ="clientnameauto"></div></td>
           <td style="width:100px;" ><span class='redtext'>Lead</span>
           <td><input type="text" id="lead"  name="lead" autocomplete="off"  class="inputstyle" style="width:100%;height:25px;"  ><div id ="leadauto"></div></td>
           <td style="width:100px;" ><span class='redtext'>Cost Code</span> </td>
           <td><input type="text" id="costcode"  name="costcode" autocomplete="off"  class="inputstyle" style="width:100%;height:25px;"  ><div id ="costcodeauto"></div></td>
          <tr>
          <td><span class='redtext'>Start Month</td>
          
          <td><select id ="startyear" name="startyear" style="width:40%;height:20px;font-size: 11px;">
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
					    <option value="2019">2019</option>
						<option value="2020">2020</option>
						<option value="2021">2021</option>
						<option value="2022">2022</option>
						<option value="2023">2023</option>
						
						</select></span>
         <select id ="startmonth" name="startmonth" style="width:55%;height:20px;font-size: 11px;">
						<option value="01">January</option>
						<option value="02">February</option>
						<option value="03">March</option>
					    <option value="04">April</option>
						<option value="05">May</option>
						<option value="06">June</option>
						<option value="07">July</option>
						<option value="08">August</option>
						<option value="09">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
						</select>
          
           </td>
           
           <td><span class='redtext'>End Month</td>
           
            <td> <select id ="endyear" name="endyear" style="width:40%;height:20px;font-size: 11px;">
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
					    <option value="2019">2019</option>
						<option value="2020">2020</option>
					    <option value="2021">2021</option>
						<option value="2022">2022</option>
						<option value="2023">2023</option>
						
						</select></span> 
              <select id ="endmonth" name="endmonth" style="width:55%;height:20px;font-size: 11px;">
					    <option value="01">January</option>
						<option value="02">February</option>
						<option value="03">March</option>
					    <option value="04">April</option>
						<option value="05">May</option>
						<option value="06">June</option>
						<option value="07">July</option>
						<option value="08">August</option>
						<option value="09">September</option>
						<option value="10">October</option>
						<option value="11">November</option>
						<option value="12">December</option>
						</select>
           </td>
				    <td><span class='redtext'>Translation Type</span> </td>
				             <td> <select id ="translationtype" name="translationtype" style="width:100%;height:20px;font-size: 11px;">
									<option value="">--please choose--</option>
									<option value="Conventional">Conventional</option>
								    <option value="i-MTpost-edit">i-MT post-edit</option>
										</select> </td>
										
	      <td><span class='redtext'>Evaluator</span> </td>
	      <td><input type="text" id="evaluator"  name="evaluator" class="inputstyle"  style="width:100%;height:25px;" ></td>

          </tr> 
          <tr>
       
          
                       <td><span class='redtext'>Source Language</span> </td>
                         <td><select id ="sourcelanguage" name="sourcelanguage" style="width:100%;height:20px;font-size: 11px;">
             		    <option value="">--please choose--</option>
						<option value="Acholi">Acholi</option>
						<option value="Afrikaans">Afrikaans</option>
						<option value="Akan">Akan</option>
						<option value="Albanian">Albanian</option>
						<option value="Amharic">Amharic</option>
						<option value="Arabic">Arabic</option>
						<option value="Armenian">Armenian</option>
						<option value="Assamese">Assamese</option>
						<option value="Aymara">Aymara</option>
						<option value="Azerbaijani">Azerbaijani</option>
						<option value="Azeri-Cyrillic">Azeri-Cyrillic</option>
						<option value="Basque">Basque</option>
						<option value="Belarusian">Belarusian</option>
						<option value="Bemba">Bemba</option>
						<option value="Bengali">Bengali</option>
						<option value="Bengali-Bangladesh">Bengali-Bangladesh</option>
						<option value="Bosnian">Bosnian</option>
						<option value="Bulgarian">Bulgarian</option>
						<option value="Burmese">Burmese</option>
						<option value="Catalan">Catalan</option>
						<option value="Cebuano">Cebuano</option>
						<option value="Chechen">Chechen</option>
						<option value="Chewa">Chewa</option>
						<option value="Chinese-Simplified">Chinese-Simplified</option>
						<option value="Chinese-HongKong">Chinese-HongKong</option>
						<option value="Chinese-Traditional">Chinese-Traditional</option>
						<option value="Cree Plains">Cree Plains</option>
						<option value="Creole-Haitian">Creole-Haitian</option>
						<option value="Croatian">Croatian</option>
						<option value="Czech">Czech</option>
						<option value="Danish">Danish</option>
						<option value="Dari">Dari</option>
						<option value="Dinka">Dinka</option>
						<option value="Dutch-Netherlands">Dutch-Netherlands</option>
						<option value="Dutch-Belgian">Dutch-Belgian</option>
						<option value="Dzongkha">Dzongkha</option>
						<option value="Ebira">Ebira</option>
						<option value="English-Australian">English-Australian</option>
						<option value="English-International">English-International</option>
						<option value="English-UK">English-UK</option>
						<option value="English - US">English - US</option>
						<option value="English-Canada">English-Canada</option>
						<option value="English-New Zealand">English-New Zealand</option>
						<option value="English-South Africa">English-South Africa</option>
						<option value="Estonian">Estonian</option>
						<option value="Faroese">Faroese</option>
						<option value="Farsi">Farsi</option>
						<option value="Fijian">Fijian</option>
						<option value="Filipino">Filipino</option>
						<option value="Finnish">Finnish</option>
						<option value="French-France">French-France</option>
						<option value="French-Canada">French-Canada</option>
						<option value="French-Swiss">French-Swiss</option>
						<option value="French-Belgium">French-Belgium</option>
						<option value="French-Luxembourg">French-Luxembourg</option>
						<option value="Frisian">Frisian</option>
						<option value="Fulani">Fulani</option>
						<option value="Ga">Ga</option>
						<option value="Gaelic Irish">Gaelic Irish</option>
						<option value="Gaelic Scots">Gaelic Scots</option>
						<option value="Galician">Galician</option>
						<option value="Ganda">Ganda</option>
						<option value="Georgian">Georgian</option>
						<option value="German-Germany">German-Germany</option>
						<option value="German-Austrian">German-Austrian</option>
						<option value="German-Swiss">German-Swiss</option>
						<option value="Gikuyu">Gikuyu</option>
						<option value="Greek">Greek</option>
						<option value="Greenlandic">Greenlandic</option>
						<option value="Guarani">Guarani</option>
						<option value="Gujarati">Gujarati</option>
						<option value="Gun">Gun</option>
						<option value="Hausa">Hausa</option>
						<option value="Haya">Haya</option>
						<option value="Hebrew">Hebrew</option>
						<option value="Hiligaynon">Hiligaynon</option>
						<option value="Hindi">Hindi</option>
						<option value="Hindi-Fiji">Hindi-Fiji</option>
						<option value="Hmong">Hmong</option>
						<option value="Hungarian">Hungarian</option>
						<option value="Ibanag">Ibanag</option>
						<option value="Icelandic">Icelandic</option>
						<option value="Igbo">Igbo</option>
						<option value="Ilocano">Ilocano</option>
						<option value="Indonesian">Indonesian</option>
						<option value="Inuktitut">Inuktitut</option>
						<option value="Isekiri">Isekiri</option>
						<option value="Italian">Italian</option>
						<option value="Italian-Switzerland">Italian-Switzerland</option>
						<option value="Japanese">Japanese</option>
						<option value="Javanese">Javanese</option>
						<option value="Jopara">Jopara</option>
						<option value="K’iche’">K’iche’</option>
						<option value="Kannada">Kannada</option>
						<option value="Kapampangan">Kapampangan</option>
						<option value="Kashmiri">Kashmiri</option>
						<option value="Kazakh">Kazakh</option>
						<option value="Khmer">Khmer</option>
						<option value="Kirghiz">Kirghiz</option>
						<option value="Kituba">Kituba</option>
						<option value="Konkani">Konkani</option>
						<option value="Koongo">Koongo</option>
						<option value="Korean">Korean</option>
						<option value="Krio">Krio</option>
						<option value="Kurdish-Kurmanji">Kurdish-Kurmanji</option>
						<option value="Kurdish-Sorani">Kurdish-Sorani</option>
						<option value="Lao">Lao</option>
						<option value="Latin">Latin</option>
						<option value="Latvian">Latvian</option>
						<option value="Lingala">Lingala</option>
						<option value="Lithuanian">Lithuanian</option>
						<option value="Luo">Luo</option>
						<option value="Luxembourgish">Luxembourgish</option>
						<option value="Macedonian">Macedonian</option>
						<option value="Makassar">Makassar</option>
						<option value="Malagasy">Malagasy</option>
						<option value="Malay">Malay</option>
						<option value="Malayalam">Malayalam</option>
						<option value="Maldivian (Dhivehi)">Maldivian (Dhivehi)</option>
						<option value="Maltese">Maltese</option>
						<option value="Maori">Maori</option>
						<option value="Marathi">Marathi</option>
						<option value="Mauritian Creole">Mauritian Creole</option>
						<option value="Moldovian">Moldovian</option>
						<option value="Mongolian">Mongolian</option>
						<option value="Montenegrin">Montenegrin</option>
						<option value="Moroccan Darija">Moroccan Darija</option>
						<option value="Nama">Nama</option>
						<option value="Ndebele">Ndebele</option>
						<option value="Nepali">Nepali</option>
						<option value="Nicaraguan">Nicaraguan</option>
						<option value="Nigerian Pidgin">Nigerian Pidgin</option>
						<option value="Norwegian">Norwegian</option>
						<option value="Norwegian-Nynorsk">Norwegian-Nynorsk</option>
						<option value="Nuer">Nuer</option>
						<option value="Ojibway">Ojibway</option>
						<option value="Oriya">Oriya</option>
						<option value="Oromo">Oromo</option>
						<option value="Papiamentu">Papiamentu</option>
						<option value="Pashto">Pashto</option>
						<option value="Polish">Polish</option>
						<option value="Portuguese-Brazil">Portuguese-Brazil</option>
						<option value="Portuguese-Portugal">Portuguese-Portugal</option>
						<option value="Punjabi-Indian">Punjabi-Indian</option>
						<option value="Punjabi-Pakistani">Punjabi-Pakistani</option>
						<option value="Quechua">Quechua</option>
						<option value="Romanian">Romanian</option>
						<option value="Romansch">Romansch</option>
						<option value="Rundi">Rundi</option>
						<option value="Russian">Russian</option>
						<option value="Rwanda">Rwanda</option>
						<option value="Sami">Sami</option>
						<option value="Samoan">Samoan</option>
						<option value="Sepedi">Sepedi</option>
						<option value="Serbian-Cyrillic">Serbian-Cyrillic</option>
						<option value="Serbian-Latin">Serbian-Latin</option>
						<option value="Sesotho">Sesotho</option>
						<option value="Shona">Shona</option>
						<option value="Sindhi">Sindhi</option>
						<option value="Sinhala">Sinhala</option>
						<option value="Lakota">Lakota</option>
						<option value="Dakota">Dakota</option>
						<option value="Sioux">Sioux</option>
						<option value="Slovak">Slovak</option>
						<option value="Slovenian">Slovenian</option>
						<option value="Somali">Somali</option>
						<option value="Spanish-Argentinean">Spanish-Argentinean</option>
						<option value="Spanish-Chilean">Spanish-Chilean</option>
						<option value="Spanish-Colombian">Spanish-Colombian</option>
						<option value="Spanish-Spain">Spanish-Spain</option>
						<option value="Spanish-Guatemalan">Spanish-Guatemalan</option>
						<option value="Spanish-International">Spanish-International</option>
						<option value="Spanish-Latin American">Spanish-Latin American</option>
						<option value="Spanish-Mexican">Spanish-Mexican</option>
						<option value="Spanish-Peruvian">Spanish-Peruvian</option>
						<option value="Spanish-Uruguayan">Spanish-Uruguayan</option>
						<option value="Spanish-Venezulean">Spanish-Venezulean</option>
						<option value="Spanish-Bolivia">Spanish-Bolivia</option>
						<option value="Spanish-Costa Rica">Spanish-Costa Rica</option>
						<option value="Spanish-Ecuador">Spanish-Ecuador</option>
						<option value="Spanish-El Salvador">Spanish-El Salvador</option>
						<option value="Spanish-Nicaragua">Spanish-Nicaragua</option>
						<option value="Spanish-Panama">Spanish-Panama</option>
						<option value="Spanish-Paraguay">Spanish-Paraguay</option>
						<option value="Spanish-Puerto Rico">Spanish-Puerto Rico</option>
						<option value="Spanish-Cuban">Spanish-Cuban</option>
						<option value="Sudanese">Sudanese</option>
						<option value="Sundanese">Sundanese</option>
						<option value="Swahili">Swahili</option>
						<option value="Swati">Swati</option>
						<option value="Swedish">Swedish</option>
						<option value="Tagalog">Tagalog</option>
						<option value="Tajik">Tajik</option>
						<option value="Tamil">Tamil</option>
						<option value="Tatar">Tatar</option>
						<option value="Telugu">Telugu</option>
						<option value="Thai">Thai</option>
						<option value="Tibetan">Tibetan</option>
						<option value="Tigrinya">Tigrinya</option>
						<option value="Tok Pisin">Tok Pisin</option>
						<option value="Tooro">Tooro</option>
						<option value="Tsonga">Tsonga</option>
						<option value="Tswana">Tswana</option>
						<option value="Turkish">Turkish</option>
						<option value="Turkmen">Turkmen</option>
						<option value="Uighur">Uighur</option>
						<option value="Ukrainian">Ukrainian</option>
						<option value="Urdu">Urdu</option>
						<option value="Uzbek">Uzbek</option>
						<option value="Uzbek (Latin)">Uzbek (Latin)</option>
						<option value="Valencian">Valencian</option>
						<option value="Venda">Venda</option>
						<option value="Vietnamese">Vietnamese</option>
						<option value="Welsh">Welsh</option>
						<option value="Xhosa">Xhosa</option>
						<option value="Yiddish">Yiddish</option>
						<option value="Yoruba">Yoruba</option>
						<option value="Zhuang">Zhuang</option>
						<option value="Zulu">Zulu</option>
				        </select>
					    
						</select>
                      </td>
                                            
           <td><span class='redtext'>Target Language</span> </td>
             <td> <select id ="targetlanguage" name="targetlanguage" style="width:100%;height:20px;font-size: 11px;">
                    <option value="">--please choose--</option>
					<option value="Acholi">Acholi</option>
					<option value="Afrikaans">Afrikaans</option>
					<option value="Akan">Akan</option>
					<option value="Albanian">Albanian</option>
					<option value="Amharic">Amharic</option>
					<option value="Arabic">Arabic</option>
					<option value="Armenian">Armenian</option>
					<option value="Assamese">Assamese</option>
					<option value="Aymara">Aymara</option>
					<option value="Azerbaijani">Azerbaijani</option>
					<option value="Azeri-Cyrillic">Azeri-Cyrillic</option>
					<option value="Basque">Basque</option>
					<option value="Belarusian">Belarusian</option>
					<option value="Bemba">Bemba</option>
					<option value="Bengali">Bengali</option>
					<option value="Bengali-Bangladesh">Bengali-Bangladesh</option>
					<option value="Bosnian">Bosnian</option>
					<option value="Bulgarian">Bulgarian</option>
					<option value="Burmese">Burmese</option>
					<option value="Catalan">Catalan</option>
					<option value="Cebuano">Cebuano</option>
					<option value="Chechen">Chechen</option>
					<option value="Chewa">Chewa</option>
					<option value="Chinese - Simplified">Chinese-Simplified</option>
					<option value="Chinese-HongKong">Chinese-HongKong</option>
					<option value="Chinese-Traditional">Chinese-Traditional</option>
					<option value="Cree Plains">Cree Plains</option>
					<option value="Creole-Haitian">Creole-Haitian</option>
					<option value="Croatian">Croatian</option>
					<option value="Czech">Czech</option>
					<option value="Danish">Danish</option>
					<option value="Dari">Dari</option>
					<option value="Dinka">Dinka</option>
					<option value="Dutch-Netherlands">Dutch-Netherlands</option>
					<option value="Dutch-Belgian">Dutch-Belgian</option>
					<option value="Dzongkha">Dzongkha</option>
					<option value="Ebira">Ebira</option>
					<option value="English-Australian">English-Australian</option>
					<option value="English-International">English-International</option>
					<option value="English-UK">English-UK</option>
					<option value="English - US">English - US</option>
					<option value="English-Canada">English-Canada</option>
					<option value="English-New Zealand">English-New Zealand</option>
					<option value="English-South Africa">English-South Africa</option>
					<option value="Estonian">Estonian</option>
					<option value="Faroese">Faroese</option>
					<option value="Farsi">Farsi</option>
					<option value="Fijian">Fijian</option>
					<option value="Filipino">Filipino</option>
					<option value="Finnish">Finnish</option>
					<option value="French-France">French-France</option>
					<option value="French-Canada">French-Canada</option>
					<option value="French-Swiss">French-Swiss</option>
					<option value="French-Belgium">French-Belgium</option>
					<option value="French-Luxembourg">French-Luxembourg</option>
					<option value="Frisian">Frisian</option>
					<option value="Fulani">Fulani</option>
					<option value="Ga">Ga</option>
					<option value="Gaelic Irish">Gaelic Irish</option>
					<option value="Gaelic Scots">Gaelic Scots</option>
					<option value="Galician">Galician</option>
					<option value="Ganda">Ganda</option>
					<option value="Georgian">Georgian</option>
					<option value="German-Germany">German-Germany</option>
					<option value="German-Austrian">German-Austrian</option>
					<option value="German-Swiss">German-Swiss</option>
					<option value="Gikuyu">Gikuyu</option>
					<option value="Greek">Greek</option>
					<option value="Greenlandic">Greenlandic</option>
					<option value="Guarani">Guarani</option>
					<option value="Gujarati">Gujarati</option>
					<option value="Gun">Gun</option>
					<option value="Hausa">Hausa</option>
					<option value="Haya">Haya</option>
					<option value="Hebrew">Hebrew</option>
					<option value="Hiligaynon">Hiligaynon</option>
					<option value="Hindi">Hindi</option>
					<option value="Hindi-Fiji">Hindi-Fiji</option>
					<option value="Hmong">Hmong</option>
					<option value="Hungarian">Hungarian</option>
					<option value="Ibanag">Ibanag</option>
					<option value="Icelandic">Icelandic</option>
					<option value="Igbo">Igbo</option>
					<option value="Ilocano">Ilocano</option>
					<option value="Indonesian">Indonesian</option>
					<option value="Inuktitut">Inuktitut</option>
					<option value="Isekiri">Isekiri</option>
					<option value="Italian">Italian</option>
					<option value="Italian-Switzerland">Italian-Switzerland</option>
					<option value="Japanese">Japanese</option>
					<option value="Javanese">Javanese</option>
					<option value="Jopara">Jopara</option>
					<option value="K’iche’">K’iche’</option>
					<option value="Kannada">Kannada</option>
					<option value="Kapampangan">Kapampangan</option>
					<option value="Kashmiri">Kashmiri</option>
					<option value="Kazakh">Kazakh</option>
					<option value="Khmer">Khmer</option>
					<option value="Kirghiz">Kirghiz</option>
					<option value="Kituba">Kituba</option>
					<option value="Konkani">Konkani</option>
					<option value="Koongo">Koongo</option>
					<option value="Korean">Korean</option>
					<option value="Krio">Krio</option>
					<option value="Kurdish-Kurmanji">Kurdish-Kurmanji</option>
					<option value="Kurdish-Sorani">Kurdish-Sorani</option>
					<option value="Lao">Lao</option>
					<option value="Latin">Latin</option>
					<option value="Latvian">Latvian</option>
					<option value="Lingala">Lingala</option>
					<option value="Lithuanian">Lithuanian</option>
					<option value="Luo">Luo</option>
					<option value="Luxembourgish">Luxembourgish</option>
					<option value="Macedonian">Macedonian</option>
					<option value="Makassar">Makassar</option>
					<option value="Malagasy">Malagasy</option>
					<option value="Malay">Malay</option>
					<option value="Malayalam">Malayalam</option>
					<option value="Maldivian (Dhivehi)">Maldivian (Dhivehi)</option>
					<option value="Maltese">Maltese</option>
					<option value="Maori">Maori</option>
					<option value="Marathi">Marathi</option>
					<option value="Mauritian Creole">Mauritian Creole</option>
					<option value="Moldovian">Moldovian</option>
					<option value="Mongolian">Mongolian</option>
					<option value="Montenegrin">Montenegrin</option>
					<option value="Moroccan Darija">Moroccan Darija</option>
					<option value="Nama">Nama</option>
					<option value="Ndebele">Ndebele</option>
					<option value="Nepali">Nepali</option>
					<option value="Nicaraguan">Nicaraguan</option>
					<option value="Nigerian Pidgin">Nigerian Pidgin</option>
					<option value="Norwegian">Norwegian</option>
					<option value="Norwegian-Nynorsk">Norwegian-Nynorsk</option>
					<option value="Nuer">Nuer</option>
					<option value="Ojibway">Ojibway</option>
					<option value="Oriya">Oriya</option>
					<option value="Oromo">Oromo</option>
					<option value="Papiamentu">Papiamentu</option>
					<option value="Pashto">Pashto</option>
					<option value="Polish">Polish</option>
					<option value="Portuguese-Brazil">Portuguese-Brazil</option>
					<option value="Portuguese-Portugal">Portuguese-Portugal</option>
					<option value="Punjabi-Indian">Punjabi-Indian</option>
					<option value="Punjabi-Pakistani">Punjabi-Pakistani</option>
					<option value="Quechua">Quechua</option>
					<option value="Romanian">Romanian</option>
					<option value="Romansch">Romansch</option>
					<option value="Rundi">Rundi</option>
					<option value="Russian">Russian</option>
					<option value="Rwanda">Rwanda</option>
					<option value="Sami">Sami</option>
					<option value="Samoan">Samoan</option>
					<option value="Sepedi">Sepedi</option>
					<option value="Serbian-Cyrillic">Serbian-Cyrillic</option>
					<option value="Serbian-Latin">Serbian-Latin</option>
					<option value="Sesotho">Sesotho</option>
					<option value="Shona">Shona</option>
					<option value="Sindhi">Sindhi</option>
					<option value="Sinhala">Sinhala</option>
					<option value="Lakota">Lakota</option>
					<option value="Dakota">Dakota</option>
					<option value="Sioux">Sioux</option>
					<option value="Slovak">Slovak</option>
					<option value="Slovenian">Slovenian</option>
					<option value="Somali">Somali</option>
					<option value="Spanish-Argentinean">Spanish-Argentinean</option>
					<option value="Spanish-Chilean">Spanish-Chilean</option>
					<option value="Spanish-Colombian">Spanish-Colombian</option>
					<option value="Spanish-Spain">Spanish-Spain</option>
					<option value="Spanish-Guatemalan">Spanish-Guatemalan</option>
					<option value="Spanish-International">Spanish-International</option>
					<option value="Spanish-Latin American">Spanish-Latin American</option>
					<option value="Spanish-Mexican">Spanish-Mexican</option>
					<option value="Spanish-Peruvian">Spanish-Peruvian</option>
					<option value="Spanish-Uruguayan">Spanish-Uruguayan</option>
					<option value="Spanish-Venezulean">Spanish-Venezulean</option>
					<option value="Spanish-Bolivia">Spanish-Bolivia</option>
					<option value="Spanish-Costa Rica">Spanish-Costa Rica</option>
					<option value="Spanish-Ecuador">Spanish-Ecuador</option>
					<option value="Spanish-El Salvador">Spanish-El Salvador</option>
					<option value="Spanish-Nicaragua">Spanish-Nicaragua</option>
					<option value="Spanish-Panama">Spanish-Panama</option>
					<option value="Spanish-Paraguay">Spanish-Paraguay</option>
					<option value="Spanish-Puerto Rico">Spanish-Puerto Rico</option>
					<option value="Spanish-Cuban">Spanish-Cuban</option>
					<option value="Sudanese">Sudanese</option>
					<option value="Sundanese">Sundanese</option>
					<option value="Swahili">Swahili</option>
					<option value="Swati">Swati</option>
					<option value="Swedish">Swedish</option>
					<option value="Tagalog">Tagalog</option>
					<option value="Tajik">Tajik</option>
					<option value="Tamil">Tamil</option>
					<option value="Tatar">Tatar</option>
					<option value="Telugu">Telugu</option>
					<option value="Thai">Thai</option>
					<option value="Tibetan">Tibetan</option>
					<option value="Tigrinya">Tigrinya</option>
					<option value="Tok Pisin">Tok Pisin</option>
					<option value="Tooro">Tooro</option>
					<option value="Tsonga">Tsonga</option>
					<option value="Tswana">Tswana</option>
					<option value="Turkish">Turkish</option>
					<option value="Turkmen">Turkmen</option>
					<option value="Uighur">Uighur</option>
					<option value="Ukrainian">Ukrainian</option>
					<option value="Urdu">Urdu</option>
					<option value="Uzbek">Uzbek</option>
					<option value="Uzbek (Latin)">Uzbek (Latin)</option>
					<option value="Valencian">Valencian</option>
					<option value="Venda">Venda</option>
					<option value="Vietnamese">Vietnamese</option>
					<option value="Welsh">Welsh</option>
					<option value="Xhosa">Xhosa</option>
					<option value="Yiddish">Yiddish</option>
					<option value="Yoruba">Yoruba</option>
					<option value="Zhuang">Zhuang</option>
					<option value="Zulu">Zulu</option>
				    </select>
           </td>
  	      <td><span class='redtext'>LM</span> </td>
	      <td><input type="text" id="lmorgl"  name="lmorgl" class="inputstyle"  style="width:100%;height:25px;" ></td>  
         
             <td><span class='redtext'>Field</span></td>
          
          <td><select id ="field" name="field" style="width:100%;height:20px;font-size: 11px;">
						<option value="">--please choose--</option>
						<option value="Aerospace">Aerospace</option>
						<option value="Automotive">Automotive</option>
						<option value="Commercial">Commercial</option>
					    <option value="Consumer">Consumer</option>
						<option value="Defence">Defence</option>
						<option value="EnergyUtilities">Energy & Utilities</option>
						<option value="Finance">Finance</option>
						<option value="Games">Games</option>
						<option value="General">General</option>
						<option value="IT">IT</option>
						<option value="Legal">Legal</option>
						<option value="Life Sciences">Life Sciences</option>
						<option value="Manufacturing">Manufacturing</option>
						<option value="MechanicalEngineering">Mechanical Engineering</option>
						<option value="Patents">Patents</option>
						<option value="Telecommunications">Telecommunications</option>
						<option value="TravelTourism">Travel&Tourism</option>
						
						</select></span>
          
           </td>
         
         
         
         
         
         
         
           </tr>
       </table>
      
         </div>  
           <div class="bottom">              
    	<input type="submit" value="Query"  class="buttonstyle" style="width:60px;height:25px;font-size: 11px;" />
    	<input type="reset" value="Reset"  class="buttonstyle"  style="width:60px;height:25px;font-size: 11px;" />
    	<input type="button" value="Export" onclick="exportcapacity();"   class="buttonstyle"  style="width:60px;height:25px;font-size: 11px;" />
    	  </div> 
</fieldset>
    </form>
    </div>

 
  
</div>
 

    <div id="container">
	    <fieldset style="height:500px; ">
    <legend class="legend">Detail List</legend>
    <div id="tab">
    <select id ="choosetype" name="choosetype"  onchange="choosetype()"  style="width:100px;height:25px;font-size: 11px;margin-left:5px;">
						<option value="Vendor Name">Vendor Name</option>
						<option value="Client Name">Client Name</option>
						<option value="Lead Name">Lead Name</option>
					    <option value="Field">Field</option>
						</select>&nbsp;&nbsp;&nbsp;
    <button id="chart"  value="chart"   onclick="showzhexiantu();" class="buttonstyle"  style="width:50px;height:25px;font-size: 11px;">chart</button>
    </div>	
    
    <div id="table1">
		<table cellspacing="0" cellpadding="0">
				<tr style="font-size: 11px;font-family:Arial,Tahoma,Verdana;color: #033d61;align:left;">
				<th style="text-align:left;">Vendor ID</th>
				<th style="text-align:left;">Vendor Name</th>
				<th style="text-align:left;">Scores</th>
			</tr>
		</table>
		
	</div>	
		<td width="100%" align="center" valign="top"><iframe id="ContentFrame1" name="I2" height="100%" width="100%" border="0" frameborder="0" src=""> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    </fieldset>

	</div>




  </body>
</html>
