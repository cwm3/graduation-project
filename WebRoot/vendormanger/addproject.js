
function checkpost() { 
		 
   if(add_form.lead.value=="" || add_form.lead.value== null )
       {
    	     alert("please input lead"); 
    	     add_form.lead.focus(); 
    	     return false; 
        } 
   
   if(add_form.client.value=="" || add_form.client.value== null )
   {
	    alert("please input client"); 
	     add_form.client.focus(); 
	     return false; 
    } 
   
   if(add_form.imtquality.value=="" || add_form.imtquality.value== null )
   {
	     alert("please input imtquality"); 
	     add_form.imtquality.focus(); 
	     return false; 
    } 
   
   if(add_form.vendor_email.value=="" || add_form.vendor_email.value== null )
   {
	    alert("please input vendor_email"); 
	     add_form.vendor_email.focus(); 
	     return false; 
    } 
   
   if(add_form.vendor_tel.value=="" || add_form.vendor_tel.value== null )
   {
	    alert("please input vendor_tel"); 
	     add_form.vendor_tel.focus(); 
	     return false; 
    } 
   
   if(add_form.vendorid.value=="" || add_form.vendorid.value== null )
   {
	     alert("please input vendorid"); 
	     add_form.vendorid.focus(); 
	     return false; 
    } 
   
  
}

function autoSystemCode() {
	  var code = document.getElementById("costcode").value;
	  var code1 = code.substr(0, 3);
	  
	  var myDate = new Date();
	  var year = myDate.getFullYear();
	  var month = myDate.getMonth()+1;

	  if(month.toString().length==1) {
		  month=0+month.toString();
	  }
	  
	  var date  = myDate.getDate();
	  if(date.toString().length==1) {
		  date=0+date.toString();
	  }
	  
	  var systemcode = year.toString()+ month.toString()+ date.toString();
	  var rnd  = RndNum(4); //四位随机数
	  systemcode = code1 + systemcode + rnd ;
	  document.getElementById("systemcode").value=systemcode;
}
 
/**
 * Description:[输出指定n位数的随机数的随机整数]
 *
 * @param n  指定n位数
 *
 */
function RndNum(n) {
    var rnd = "";
    for (var i = 0; i < n; i++) {
        rnd += Math.floor(Math.random() * 10);
    }
    return rnd;
}


