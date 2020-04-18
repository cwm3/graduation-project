<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String permissionsmodule = session.getAttribute("permissionsmodule").toString();
System.out.println(permissionsmodule);
String [] module = permissionsmodule.split(",");
String username = session.getAttribute("username").toString();


%>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;s
}
.STYLE1 {
	font-size: 18px;
	font-family : Arial,Tahoma,Verdana;
	color: #FFFFFF;
}
.STYLE3 {
	font-size: 10px;
	font-family : Arial,Tahoma,Verdana;
	color: #033d61;
}
</style>
<style type="text/css">
.menu_title SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #ffffff; POSITION: relative; TOP: 2px 
}
.menu_title2 SPAN {
	FONT-WEIGHT: bold; LEFT: 3px; COLOR: #FFCC00; POSITION: relative; TOP: 2px
}

</style>
<script>
//var he=document.body.clientHeight-105;
var he = document.documentElement.clientHeight;// - 105;
document.write("<div id=tt style=height:"+he+";overflow:hidden>");
</script>

<table width="165"  border="0" cellpadding="0" cellspacing="0">


   <tr>
    <td height="28" background="images/main_40.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="19%">&nbsp;</td>
        <td width="81%" height="20"><span class="STYLE1">管理菜单</span></td>
      </tr>
    </table></td>
  </tr> 
  

 
<tr>
  <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
   <td height="23" background="images/main_47.gif" id="imgmenu2" class="menu_title" onMouseOver="this.className='menu_title2';" onClick="showsubmenu(2)" onMouseOut="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
              <td width="18%">&nbsp;</td>
              <td width="82%" class="STYLE1">供应商管理</td>
        </tr>
          </table></td>
        </tr>
        <tr>
          <td background="images/main_51.gif" id="submenu2">
		 <div class="sec_menu" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                
                  <tr   <%
                  
                  if(permissionsmodule.indexOf("Add New Vendor")==-1){ 
                           out.print("style='display:none'");
                   }         
                     
                  
                   %>    >
<!--                   <td width="16%" height="25"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
 -->                  <td align="center" height="23"><table width="95%" border="0" cellspacing="0" cellpadding="0">
                   <tr>
                        <td align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="vendor" onclick="addvendor()">Add New Vendor</span></td>
                      </tr>
                  </table></td>
                </tr>
                
                 <tr   <%  
                    if(permissionsmodule.indexOf("Vendor Detail List")==-1){ 
                           out.print("style='display:none'");
                   }             
                   %>    >
<!--                   <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
 -->                  <td align="center" height="23"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td  align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="vendorlist" onclick="vendorlist()">Vendor Detail List</span></td>
                      </tr>
                  </table></td>
                </tr> 

            
                  <tr   <%  
      
                            if(permissionsmodule.indexOf("Vendor Detail Selection")==-1){ 
                           out.print("style='display:none'");
                   }   
                   
                   %>    >
          
<!--                   <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
 -->                  <td align="center" height="23"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td  align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="vendorselection"  onclick="vendorselection();" >Vendor Detail Selection</span></td>
                      </tr>
                  </table></td>
                </tr>    
                
                
            
                  <tr   <%  
        
                     if(permissionsmodule.indexOf("Vendor Capacity Search")==-1){ 
                           out.print("style='display:none'");
                   }   
                   
                   %>    >
<!--                   <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
 -->                  <td  align="center" height="23"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td  align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id ="capacitysearch" onclick="capacitysearch()" >Vendor Capacity Search</span></td>
                      </tr>
                  </table></td>
                </tr>
    
    
              </table></td>
            </tr>
            <tr>
              <td height="5"><img src="images/main_52.gif" width="151" height="5" /></td>
            </tr>
          </table></div></td>
        </tr>
      </table></td>
    </tr>


            
      <tr>
  <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
   <td height="23" background="images/main_47.gif" id="imgmenu6" class="menu_title" onMouseOver="this.className='menu_title5';" onClick="showsubmenu(6)" onMouseOut="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
              <td width="18%">&nbsp;</td>
              <td width="82%" class="STYLE1">项目管理</td>
        </tr>
          </table></td>
        </tr>
        <tr>
          <td background="images/main_51.gif" id="submenu6">
		 <div class="sec_menu" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
     
                 <tr   <%  
            
                           if(permissionsmodule.indexOf("Add New Project")==-1){ 
                           out.print("style='display:none'");
                   }   
                   
                   %>    >
<!--                   <td width="16%" height="25"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
 -->                  <td align="center" height="23"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="addproject"  onclick="addproject()">Add New Project</span></td>
                      </tr>
                  </table></td>
                </tr>
                

                 <tr   <%  
             
                   
                     if(permissionsmodule.indexOf("Project Detail Selection")==-1){ 
                           out.print("style='display:none'");
                   }   
                   
                   
                   %>    >
<!--                   <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
 -->                  <td align="center" height="23"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="projectselection" onclick="projectselection()" >Project Detail Selection</span></td>
                      </tr>
                  </table></td>
                </tr>
 
                 <tr   <%  
             
                   
                          if(permissionsmodule.indexOf("OutSource  Management")==-1){ 
                           out.print("style='display:none'");
                   } 
                   
                   %>    >
<!--                   <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
 -->                  <td align="center" height="23"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="outsourcemanagement" onclick="outsourcemanagement()" >OutSource  Management</span></td>
                      </tr>
                  </table></td>
                </tr>
                
                
                                 <tr>
                 <td align="center" height="23"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="outsourceselection" onclick="outsourceselection()"   >Outsource Detail Selection</span></td>
                      </tr>
                  </table></td>
                </tr>
                
                
                 <tr>
                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="5"><img src="images/main_52.gif" width="151" height="5" /></td>
            </tr>
          </table></div></td>
        </tr>
      </table></td>
    </tr>
    
    
     
        <tr>
  <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
   <td height="23" background="images/main_47.gif" id="imgmenu5" class="menu_title" onMouseOver="this.className='menu_title5';" onClick="showsubmenu(5)" onMouseOut="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
              <td width="18%">&nbsp;</td>
              <td width="82%" class="STYLE1">绩效管理</td>
        </tr>
          </table></td>
        </tr>
        <tr>
          <td background="images/main_51.gif" id="submenu5">
		 <div class="sec_menu" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0">

              <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              
                        
              
              
                <tr   <%  
           
                   
                                  if(permissionsmodule.indexOf("Add New QA")==-1){ 
                           out.print("style='display:none'");
                   } 
                   
                   %>    >
              
<!--                 <tr>
 --><!--                   <td width="16%" height="25"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
 -->                  <td align="center" height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                 
              <tr>
                       <td align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="addqa" onclick="addqa()">Add New QA</span></td>
                      </tr>
                  </table></td>
                </tr>

                 <tr   <%  
      
                   
                       if(permissionsmodule.indexOf("My QA Report")==-1){ 
                           out.print("style='display:none'");
                   } 
                   

                   %>    >
<!--                   <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
 -->                  <td align="center" height="23"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="qasection" onclick="qasection()" >My QA Report</span></td>
                      </tr>
                  </table></td>
                </tr>
         
                 <tr   <%  
               
                       if(permissionsmodule.indexOf("QA Search")==-1){ 
                           out.print("style='display:none'");
                   } 
                   %>    >
<!--                   <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
 -->                  <td align="center" height="23"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="qaqa" onclick="qaqa()" >QA Search</span></td>
                      </tr>
                  </table></td>
                </tr>
                       <tr   <%  
       
                   
                             if(permissionsmodule.indexOf("QA Summary")==-1){ 
                           out.print("style='display:none'");
                   } 
                   
                   %>    >
<!--                   <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
 -->                  <td align="center" height="23"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="qamonth" onclick="qamonth()" >QA Summary</span></td>
                      </tr>
                  </table></td>
                </tr>
                 <tr>
               
                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="5"><img src="images/main_52.gif" width="151" height="5" /></td>
            </tr>
          </table></div></td>
        </tr>
      </table></td>
    </tr>
    
    
          <tr>
  <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
   <td height="23" background="images/main_47.gif" id="imgmenu7" class="menu_title" onMouseOver="this.className='menu_title7';" onClick="showsubmenu(7)" onMouseOut="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
              <td width="18%">&nbsp;</td>
              <td width="82%" class="STYLE1">用户管理</td>
        </tr>
          </table></td>
        </tr>
        <tr>
          <td background="images/main_51.gif" id="submenu7">
		 <div class="sec_menu" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              
   
                 <tr   <%  
        
                               if(permissionsmodule.indexOf("Add New User")==-1){ 
                           out.print("style='display:none'");
                   } 
                   
                   
                   %>    >
<!--                   <td width="16%" height="25"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
 -->                  <td align="center" height="23"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="adduser"  onclick="adduser()">Add New User</span></td>
                      </tr>
                  </table></td>
                </tr>    
                
                 <tr   <%  
         
                   
                      if(permissionsmodule.indexOf("User Detail List")==-1){ 
                           out.print("style='display:none'");
                   } 
                   
                   
                   %>    >
                   
       
<!--                   <td height="23"><div align="center"><img src="images/left.gif" width="10" height="10" /></div></td>
 -->                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="userlist" onclick="userlist()" >User Detail List</span></td>
                      </tr>
                  </table></td>
                </tr>
                 <tr>
             

                </tr>
              </table></td>
            </tr>
            <tr>
              <td height="5"><img src="images/main_52.gif" width="151" height="5" /></td>
            </tr>
          </table></div></td>
        </tr>
      </table></td>
    </tr>
    
     <tr
    <%  
        if(permissionsmodule.indexOf("Add Cost Code")==-1){ 
                           out.print("style='display:none'");
                   } 
                   
       %> 
             >
  <td valign="top"><table width="151" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
   <td height="23" background="images/main_47.gif" id="imgmenu8" class="menu_title" onMouseOver="this.className='menu_title8';" onClick="showsubmenu(8)" onMouseOut="this.className='menu_title';" style="cursor:hand"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
              <td width="18%">&nbsp;</td>
              <td width="82%" class="STYLE1">信息管理</td>
        </tr>
          </table></td>
        </tr>
        <tr>
          <td background="images/main_51.gif" id="submenu8">
		 <div class="sec_menu" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              
   
                 <tr>
                     <td align="center" height="23"><table width="98%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="addcostcode"  onclick="addcostcode()">Add Cost Code</span></td>
                      </tr>
                  </table></td>
                </tr>
                
                  <td height="23"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td align="center" height="25" style="cursor:hand" onmouseover="this.style.borderStyle='solid';this.style.borderWidth='0';borderColor='#7bc4d3'; "onmouseout="this.style.borderStyle='none'"><span class="STYLE3" id="addtranslator" onclick="addtranslator()" >Add Translator</span></td>
                      </tr>
                  </table></td>
                </tr>
                 <tr>
              
                

              </table></td>
            </tr>
            <tr>
              <td height="5"><img src="images/main_52.gif" width="151" height="5" /></td>
            </tr>
          </table></div></td>
        </tr>
      </table></td>
    </tr>
    
    
    

    
</table>


<script>


function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
imgmenu = eval("imgmenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
imgmenu.background="images/main_47.gif";
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
imgmenu.background="images/main_48.gif";
}
}


function addvendor()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>addvendor.jsp';
   document.getElementById("vendor").style.color="blue";
   document.getElementById("vendor").style.fontSize = "12px";
   
}
function vendorlist()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>selectvendor.jsp';
   document.getElementById("vendorlist").style.color="blue";
   document.getElementById("vendorlist").style.fontSize = "12px";
   
}
function vendorselection()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>selectvendorbytiaojian.jsp';
   document.getElementById("vendorselection").style.color="blue";
   document.getElementById("vendorselection").style.fontSize = "12px";
   
}

function vendorselection()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>selectvendorbytiaojian.jsp';
   document.getElementById("vendorselection").style.color="blue";
   document.getElementById("vendorselection").style.fontSize = "12px";
   
}

function capacitysearch()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>selectcapacitytiaojian.jsp';
   document.getElementById("capacitysearch").style.color="blue";
   document.getElementById("capacitysearch").style.fontSize = "12px";
   
}

function addproject()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>addProject.jsp';
   document.getElementById("addproject").style.color="blue";
   document.getElementById("addproject").style.fontSize = "12px";
   
}

function projectselection()
{  
   clearall();
  parent.document.getElementById('ContentFrame').src='<%=basePath %>selectprojectbytiaojian.jsp';
   document.getElementById("projectselection").style.color="blue";
   document.getElementById("projectselection").style.fontSize = "12px";
   
}

function outsourcemanagement()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>managerproject.jsp';
   document.getElementById("outsourcemanagement").style.color="blue";
   document.getElementById("outsourcemanagement").style.fontSize = "12px";
   
}


function addqa()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>addqa.jsp';
   document.getElementById("addqa").style.color="blue";
   document.getElementById("addqa").style.fontSize = "12px";
}

function qasection()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>selectqabytiaojian.jsp';
   document.getElementById("qasection").style.color="blue";
   document.getElementById("qasection").style.fontSize = "12px";
   
}


function qaqa()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>selectqatiaojian.jsp';
   document.getElementById("qaqa").style.color="blue";
   document.getElementById("qaqa").style.fontSize = "12px";
   
}


function qamonth()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>selectqamonth.jsp';
   document.getElementById("qamonth").style.color="blue";
   document.getElementById("qamonth").style.fontSize = "12px";
   
}



function adduser()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>adduser.jsp';
   document.getElementById("adduser").style.color="blue";
   document.getElementById("adduser").style.fontSize = "12px";
   
}

function userlist()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>listuserbypageaction.action';
   document.getElementById("userlist").style.color="blue";
   document.getElementById("userlist").style.fontSize = "12px";
   
}

function outsourceselection()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>selectdistribution.jsp';
   document.getElementById("outsourceselection").style.color="blue";
   document.getElementById("outsourceselection").style.fontSize = "12px";
   
}

function addcostcode()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>addcostcode.jsp';
   document.getElementById("addcostcode").style.color="blue";
   document.getElementById("addcostcode").style.fontSize = "12px";
   
}

function addtranslator()
{  
   clearall();
   parent.document.getElementById('ContentFrame').src='<%=basePath %>addtranslator.jsp';
   document.getElementById("addtranslator").style.color="blue";
   document.getElementById("addtranslator").style.fontSize = "12px";
   
}





function clearall()
{  
   document.getElementById("vendor").style.color="#033d61";
   document.getElementById("vendor").style.fontSize = "10px"; 
   
   document.getElementById("vendorlist").style.color="#033d61";
   document.getElementById("vendorlist").style.fontSize = "10px"; 
   
   document.getElementById("vendorselection").style.color="033d61";
   document.getElementById("vendorselection").style.fontSize = "10px";
   
   document.getElementById("capacitysearch").style.color="033d61";
   document.getElementById("capacitysearch").style.fontSize = "10px";
   
   document.getElementById("addproject").style.color="033d61";
   document.getElementById("addproject").style.fontSize = "10px";
   
   document.getElementById("projectselection").style.color="033d61";
   document.getElementById("projectselection").style.fontSize = "10px";
   
   document.getElementById("outsourcemanagement").style.color="033d61";
   document.getElementById("outsourcemanagement").style.fontSize = "10px";
   
   document.getElementById("outsourceselection").style.color="033d61";
   document.getElementById("outsourceselection").style.fontSize = "10px";
   
   
   document.getElementById("addqa").style.color="033d61";
   document.getElementById("addqa").style.fontSize = "10px";
   
   document.getElementById("qasection").style.color="033d61";
   document.getElementById("qasection").style.fontSize = "10px";
   
   document.getElementById("qamonth").style.color="033d61";
   document.getElementById("qamonth").style.fontSize = "10px";
   
   document.getElementById("adduser").style.color="033d61";
   document.getElementById("adduser").style.fontSize = "10px";
   
   document.getElementById("userlist").style.color="033d61";
   document.getElementById("userlist").style.fontSize = "10px";
   
   document.getElementById("qaqa").style.fontSize = "10px";
   document.getElementById("qaqa").style.color="033d61";
   
   document.getElementById("addcostcode").style.fontSize = "10px";
   document.getElementById("addcostcode").style.color="033d61";
   
   document.getElementById("addtranslator").style.fontSize = "10px";
   document.getElementById("addtranslator").style.color="033d61";
   
 }


</script>
