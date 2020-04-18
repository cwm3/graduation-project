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
    
    <title>客户列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
   <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
   <script type="text/javascript" src="js3/calendar.js"></script>
   <link href="css/commoncss.css" rel="stylesheet" type="text/css" media="screen" />
	
    
    <link href="tablecloth/tablecloth.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="images/fontSize12.css" rel="stylesheet" type="text/css"/>
    <link href="images/calendar.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.js"></script>

	<script type="text/javascript"  src="vendormanger/addvendor.js"></script>
    <script type="text/javascript" src="jquery/jquery-1.8.0.min.js"></script>
	<script type="text/javascript"  src="vendormanger/addproject.js"></script>
	
	
   <script type="text/javascript" src="js/jquery.js"></script>
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
	line-height:150%;
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
  font: bold 12px Arial, Helvetica, sans-serif;
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
	font-size:150%;
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


</style>

<script language="JavaScript"> 
			
 function checkpost() { 
                document.getElementById("table1").style.display="none";
                var vendorname= document.getElementById("vendorname").value;
                 var clientname= document.getElementById("clientname").value;
                var lead = document.getElementById("lead").value;
                var costcode = document.getElementById("costcode").value;
                var evaluatorname = document.getElementById("evaluator").value;
                var evaluator = document.getElementById("evaluator").value; 
                var startdate = document.getElementById("startdate").value;
                var enddate = document.getElementById("enddate").value;
                var time1 = new Date(startdate.replace(/-/g,"/"));
			    var time2 = new Date(enddate.replace(/-/g,"/"));
			    if(time1 > time2){
			    alert("Startdate cannot be greater than Enddate ");
				return false;
	            }
                var field = document.getElementById("field").value;
                var translationtype = document.getElementById("translationtype").value;
                var lmorgl = document.getElementById("lmorgl").value;
                
                var sourcelanguage = document.getElementById("sourcelanguage").value;
                var targetlanguage = document.getElementById("targetlanguage").value;
                
                document.getElementById("ContentFrame1").src="loadqaByTiaojian.action?vendorname="+vendorname+"&lead="+lead+"&sdlcostcode="+costcode
                +"&sector="+field+"&evaluatorname="+evaluatorname+"&translationtype="+translationtype
                +"&sourcelanguage="+sourcelanguage+"&targetlanguage="+targetlanguage+"&clientname="+clientname+"&startdate="+startdate+"&enddate="+enddate+"&lmorgl="+lmorgl+"&remark1=1"; 
                return false;
		}
		

			
	 function exportcapacity() {
                document.getElementById("table1").style.display="none";
                var vendorname= document.getElementById("vendorname").value;
                var clientname= document.getElementById("clientname").value;
                var lead = document.getElementById("lead").value;
                var costcode = document.getElementById("costcode").value;
                var evaluatorname = document.getElementById("evaluator").value;
                var evaluator = document.getElementById("evaluator").value; 
                var startdate = document.getElementById("startdate").value;
                var enddate = document.getElementById("enddate").value;
                var field = document.getElementById("field").value;
                var translationtype = document.getElementById("translationtype").value;
                var lmorgl = document.getElementById("lmorgl").value;
                
                var sourcelanguage = document.getElementById("sourcelanguage").value;
                var targetlanguage = document.getElementById("targetlanguage").value;
                //var username = document.getElementById("username").value;
                                
                window.document.location.href="loadqaexcel.jsp?vendorname="+vendorname+"&lead="+lead+"&sdlcostcode="+costcode
                +"&sector="+field+"&evaluatorname="+evaluatorname+"&translationtype="+translationtype
                +"&sourcelanguage="+sourcelanguage+"&targetlanguage="+targetlanguage+"&clientname="+clientname+"&startdate="+startdate+"&enddate="+enddate+"&lmorgl="+lmorgl; 
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
           <td><span class='redtext'>Vendor Name</span></td>
           <td><input type="text" id="vendorname"  name="vendorname" autocomplete="off"  class="inputstyle"  style="width:100%;height:25px;" ><div id ="vendornameauto"></div></td>
         
           <td><span class='redtext'>Client Name</span></td>
           <td><input type="text" id="clientname"  name="clientname" autocomplete="off" class="inputstyle"  style="width:100%;height:25px;" ><div id ="clientnameauto"></div></td>
           <td><span class='redtext'>Lead</span></td>
           <td><input type="text" id="lead"  name="lead" class="inputstyle" autocomplete="off"   style="width:100%;height:25px;" ><div id ="leadauto"></div></td>
           <td><span class='redtext'>Cost Code</span></td>
           <td><input type="text" id="costcode"  name="costcode" autocomplete="off"  class="inputstyle"  style="width:100%;height:25px;" ><div id ="costcodeauto"></div></td>
          <tr>
           <td><span class='redtext'>Evaluator</span></td>
           <td><input type="text" id="evaluator"  name="evaluator" class="inputstyle"  autocomplete="off"  style="width:100%;height:25px;" ></td>
           <td><span class='redtext'>Start Date</span>
           <td><input type="text" id="startdate"  name="startdate" onclick="new Calendar_new(null, null, 1).show(this);"  readonly="readonly" class="inputstyle"  style="width:100%;height:25px;" ></td>
           <td><span class='redtext'>End Date</span>
           <td><input type="text" id="enddate"  name="enddate" onclick="new Calendar_new(null, null, 1).show(this);"  readonly="readonly" class="inputstyle"  style="width:100%;height:25px;" ></td>
             <td><span class='redtext'>Field</span></td>
		         <td>  <select id ="field" name="field" style="width:150px;height:25px;font-size: 11px;">
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
						</select>
           </td>
           

          </tr> 
          
          <tr>
         
           <td><span class='redtext'>Translation Type</span></td>
             <td><select id ="translationtype" name="translationtype" style="width:150px;height:25px;font-size: 11px;">
		          	    <option value="">--please choose--</option>
					<option value="Conventional">Conventional</option>
				    <option value="i-MTpost-edit">i-MT post-edit</option>
						</select>
           
           </td>
           <td><span class='redtext'>Source Language</span></td>
           <td>  <select id ="sourcelanguage" name="sourcelanguage" style="width:150px;height:25px;font-size: 11px;">
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
					<option value="Chinese - Simplified">Chinese - Simplified</option>
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
           <td><span class='redtext'>Target Language</span></td>
            <td> <select id ="targetlanguage" name="targetlanguage" style="width:150px;height:25px;font-size: 11px;">
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
           <td><span class='redtext'>LM</span></td>
           <td><input type="text" id="lmorgl"  name="lmorgl"  class="inputstyle"  style="width:100%;height:25px;" ></td>
           
          </tr> 

       </table>
      
         </div>  
           <div class="bottom">              
    	<input type="submit" value="Query"  class="buttonstyle"  style="width:60px;height:25px;font-size: 10px;" />
    	<input type="reset" value="Reset"  class="buttonstyle"  style="width:60px;height:25px;font-size: 10px;" />
    	<input type="button" value="Export"  class="buttonstyle"  onclick="exportcapacity();" style="width:60px;height:25px;font-size: 10px;" />
    	
    	  </div> 
</fieldset>
    </form>
    </div>

 
  
</div>
 

    <div id="container">
	    <fieldset style="height:550px; ">
    <legend class="legend">Detail List</legend>
    <div id="table1">
		<table cellspacing="0" cellpadding="0">
				<tr style="font-size: 10px;font-family:Arial,Tahoma,Verdana;color: #033d61;">
				<th align="left">Number</th>
			
				<th align="left" >Vendor Name</th>
			    <th align="left">Lead</th>
			
				<th align="left" >Date</th>
				<th align="left" >Client Name</th>
     			<th align="left" > Cost Code</th>
				
				<th align="left" >Translation Type</th>
				<th align="left" >Translator Name</th>
				
				<th align="left">QA Score</th>
			    <th align="left">Source Language</th>
			

			</tr>

		</table>
			</div>	
		<td width="90%" align="center" valign="top"><iframe id="ContentFrame1" name="I2" height="95%" width="100%" border="0" frameborder="0" src=""> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    </fieldset>

	</div>




  </body>
</html>
