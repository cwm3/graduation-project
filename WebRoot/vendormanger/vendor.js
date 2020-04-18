
function checkpost() { 
	   if(active.vendorid.value=="" || active.vendorid.value== null )
       {
    	     alert("please input vendorid"); 
    	     active.vendorid.focus(); 
    	     return false; 
        } 
      
	   if(active.vendor_name.value=="" || active.vendor_name.value== null )
       {
    	     alert("please input password"); 
    	     active.vendor_name.focus(); 
    	     return false; 
        } 
}

