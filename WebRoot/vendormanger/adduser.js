
function checkpost() { 
   alert(11); 
   if(myform.username.value=="" || myform.username.value== null )
       {
    	     alert("please input username"); 
    	     myform.username.focus(); 
    	     return false; 
        } 
   
   if(myform.password.value=="" || myform.password.value== null )
   {
	    alert("please input password"); 
	     myform.password.focus(); 
	     return false; 
    } 
   
   if(myform.password2.value=="" || myform.password2.value== null )
   {
	    alert("please input password2"); 
	     myform.password2.focus(); 
	     return false; 
    } 
   
   if(myform.userposition.value=="" || myform.userposition.value== null )
   {
	    alert("please input userposition"); 
	     myform.userposition.focus(); 
	     return false; 
    } 
   
   if(myform.userlead.value=="" || myform.userlead.value== null )
   {
	    alert("please input userlead"); 
	     myform.userlead.focus(); 
	     return false; 
    } 
   
   if(myform.userlead.value=="" || myform.userlead.value== null )
   {
	    alert("please input userlead"); 
	     myform.userlead.focus(); 
	     return false; 
    } 
   if(myform.yd_mc_id.value=="" || myform.yd_mc_id.value== null )
   {
	    alert("please input userlead"); 
	     myform.userlead.focus(); 
	     return false; 
    }
   
   
   if(myform.password.value != myform.password2.value)
   {
	    alert("Passwords don't match"); 
/*	    myform.userlead.focus(); 
*/	     return false; 
    }
   
   

}


