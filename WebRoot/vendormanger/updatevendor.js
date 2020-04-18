function checkpost() { 
	
/*    
   if(add_form.vendor_comment.value== "" || add_form.vendor_comment.value== null )
       {
    	     alert("please input vendor_commment"); 
    	     myform.vendor_comment.focus(); 
    	     return false; 
        } */
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