
function checkpost() { 
		 
   if(add_form.vendorid.value=="" || add_form.vendorid.value== null )
       {
    	     alert("please input vendorid"); 
    	     add_form.vendorid.focus(); 
    	     return false; 
        } 
   
   if(add_form.vendor_name.value=="" || add_form.vendor_name.value== null )
   {
	    alert("please input vendor_name"); 
	     add_form.vendor_name.focus(); 
	     return false; 
    } 
   
   
   if(add_form.chinese_name.value=="" || add_form.chinese_name.value== null )
   {
	    alert("please input chinese_name"); 
	     add_form.chinese_name.focus(); 
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

 function checkfieldandother() {
	   if(add_form.vendor_field_other.value != "" )
	   {
	   var lens = document.getElementsByName("vendor_field");
	   for(var i=0;i<lens.length;i++){ 
	   if(lens[i].checked == true){
	   //得到选中的单选按钮如果要得到值 那么可以：
	   alert("cannot input field and other at the same time");//弹出选中单选按钮的值
	   for(var j=0;j<lens.length;j++) {
		   lens[j].checked = false;
	   }
	   document.getElementById("vendor_field_other").value ="";
	   } 
	   }
	   }
	
 }


 function checkcatandother() {
	 
	   if(add_form.vendor_cat_other.value != "" )
	   {
	   var lens = document.getElementsByName("vendor_cat");
	   for(var i=0;i<lens.length;i++){ 
	   if(lens[i].checked == true){
	   //得到选中的单选按钮如果要得到值 那么可以：
	   alert("cannot input cat and other at the same time");//弹出选中单选按钮的值
	   for(var j=0;j<lens.length;j++) {
		   lens[j].checked = false;
	   }
	   document.getElementById("vendor_cat_other").value ="";
	   } 
	   }
	   }
 }


//增加一行
function addCommRow(tableId,start) {
	var tr = $("#" + tableId + " tr").eq(start).clone();
    var rowCount = $("#" + tableId).find("tr").length;
	rowCount = rowCount - start;

	//tr.find("td").get(1).innerHTML = rowCount + 1;
	tr.find("input").each(function () {
		this.checked = false;
		//this.name = changeNameOrId(this.name, rowCount);
		//this.id = changeNameOrId(this.id, rowCount);
 
		if ($(this).attr("readonly")){
			this.value = "0.00";
		}else{
			this.value = "";
		}
	});
	
	/*tr.find("select").each(function () {
		this.name = changeNameOrId(this.name, rowCount);
		this.id = changeNameOrId(this.id, rowCount);
	});*/
	tr.show();

	//新增的一行添加到表格中
	tr.appendTo("#" + tableId);
	     
    return rowCount;
}

//删除行
function delCommRow(tableId,start) {
	var isdelFlag = false;
	var alldelFlag = true;
	
	var j = 0;
	$("#" + tableId + " tr:gt(" + (start-1) + ")").each(function () {
		if ($(this).find("#ck").get(0).checked == true) {
			isdelFlag = true;
			if (j > 0){ //第一行不删除
				$(this).remove();
			}
		}else{
			alldelFlag = false;
		}
		j++;
	});

	if (alldelFlag){
		var tr = $("#" + tableId + " tr").eq(start);
		tr.find("input").each(function () {
			this.checked = false;
	
			if ($(this).attr("readonly")){
				this.value = "0.00";
			}else{
				this.value = "";
			}
		});
		
		tr.find("select").each(function () {
			this.value = "0";
		});
	}else{
		$("#" + tableId + " tr:eq(" + start + ")").each(function () {
			if ($(this).find("#ck").get(0).checked == true) {
				isdelFlag = true;
				$(this).remove();
			}
		});
	}
	

	

}


