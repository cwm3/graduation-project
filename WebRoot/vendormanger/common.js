window.onload=function(){
	document.getElementsByTagName("body")[0].onkeydown = function(){
	    //获取事件对象   
	    var elem = event.relatedTarget || event.srcElement || event.target ||event.currentTarget;
		if(event.keyCode==8){//判断按键为backSpace键   
			     //获取按键按下时光标做指向的element   
			     var elem = event.srcElement || event.currentTarget;    
			        
			     //判断是否需要阻止按下键盘的事件默认传递   
			     var name = elem.nodeName;   
			        
			     if(name!='INPUT' && name!='TEXTAREA'){
			         return _stopIt(event);   
			     }   
			     var type_e = elem.type.toUpperCase();   
			     if(name=='INPUT' && (type_e!='TEXT' && type_e!='TEXTAREA' && type_e!='PASSWORD' && type_e!='FILE')){   
			         return _stopIt(event);   
			     }   
			     if(name=='INPUT' && (elem.readOnly==true || elem.disabled ==true)){
			         return _stopIt(event);   
		     }   
		}
	}
}

function _stopIt(e){   
    if(e.returnValue){   
        e.returnValue = false ;   
    }   
    if(e.preventDefault ){   
        e.preventDefault();   
    }                  
    return false;  
}

function getNowFormatDate() { 
    var date = new Date(); 
    var seperator1 = "-";
    var month = date.getMonth() + 1; 
    var strDate = date.getDate(); 
    if (month >= 1 && month <= 9) { 
        month = "0" + month; 
    } 
    if (strDate >= 0 && strDate <= 9) { 
        strDate = "0" + strDate; 
    } 
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    return currentdate; 
} 



/**
 * 公共JS方法

 * @copyright digitalChina 2007
 * @author majun
 * @date 2007-09-18
 */

/**
 * 对插入的数据进行校验
 * 只允许插入backspace键、tab键、del键和数字键
 */
function inputPureNumberType() {
    if ((
            (event.keyCode == 8) || //"backspace" of the left keyboard
                    (event.keyCode == 9) || //"tab" of the left keyboard
                    (event.keyCode == 46) || //del" of the right keyboard
                    (event.keyCode >= 35 && event.keyCode <= 40) || // direction keys of the right key board
                    (event.keyCode >= 48 && event.keyCode <= 57) || //0-9 of the left keyboard
                    (event.keyCode >= 96 && event.keyCode <= 105 //0-9 of the right keyboard
                            )) == false) {
        event.returnValue = false;
    }
}


/**
 * 对插入的数据进行校验
 * 只允许插入backspace键、tab键、del键和数字键和字母
 */
function inputPureCharNumberType(dataForm) {
    if ((
            (event.keyCode == 8) || //"backspace" of the left keyboard
                    (event.keyCode == 9) || //"tab" of the left keyboard
                    (event.keyCode == 46) || //del" of the right keyboard
                    (event.keyCode >= 35 && event.keyCode <= 40) || // direction keys of the right key board
                    (event.keyCode >= 48 && event.keyCode <= 57) || //0-9 of the left keyboard
                    (event.keyCode >= 65 && event.keyCode <= 90) || //字母
                    (event.keyCode >= 96 && event.keyCode <= 105 //0-9 of the right keyboard
                            )) == false) {
        event.returnValue = false;
    }
}

function testPureCharNumberType(src) {
    chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJGKLMNOPQRSTUVWXYZ";
    for (var i = 0; i <= src.length; i++) {
        if (chars.indexOf(src.charAt(i)) == -1) return false;
    }
    return true;
}


/** 显示/隐藏某一区域（层）
 * @param oLayer 区域（层）名，为对象，并非字符串
 * @param oImg 图片区域对象名&lt;img id="img_switch" src="img_open"&gt;
 * @param sImg1 区域显示时的图片
 * @param sImg2 区域隐藏时的图片
 */
function switchLayer(oLayer, oImg, sImg1, sImg2) {
    var flag = oLayer.style.display;

    if (flag == "none") {
        oLayer.style.display = "block";

        oImg.src = sImg1;
    } else {
        oLayer.style.display = "none";

        oImg.src = sImg2;
    }
}

/**
 * 去掉首尾空格
 */
function trim(str) {
    return str.replace(/(^\s*)|(\s*$)/g, "");
}

/**
 * 去掉字符串所有空格（左右中间）
 */
function trimAll(str) {
    return str.replace(/\s+/g, "");
}

/*****************************************************************
 *  purpose: 当输入回车键时触发,用tab键事件代替回车键(除非在textarea内)
 *
 *****************************************************************/
function doOnKeyDown() {
    if (event.keyCode == 13 && window.event.srcElement.tagName.toLowerCase() != "textarea") {
        event.keyCode = 9;
    }
}

/*****************************************************************
 *  purpose: 当输入CTRL+INSERT或者CTRL+DELETE时触发
 *
 *****************************************************************/
function keyDownInsert() {
    if (event.ctrlKey) {
        if (event.keyCode == 45) {        //CTRL+INSERT:增行
            addRow_xh();
        }
        else if (event.keyCode == 46) {    //CTRL+DELETE:删行
            delRow_xh();
        }
    }
}

/*************************************************************************
 *  purpose: 在选中的表中增加一行
 *
 *************************************************************************/
function addRow() {
    var oRow;		//行（TR）对象
    var oCell;		//单元（TD）对象
    if ((objTBY == null) || (nTbyRowNo < 0)) {
        alert("请先选中需要增行的位置");
        return -1;
    }
    else {
        oRow = objTBY.insertRow(nTbyRowNo + 1);
    }
    var nColspan = 1;
    for (var i = 0; i < objTBY.rows(0).cells.length; i++) {
        oCell = oRow.insertCell();
        nColspan = objTBY.rows(0).cells(i).colSpan;
        oCell.colSpan = nColspan;
        oCell.innerHTML = objTBY.rows(0).cells(i).innerHTML;
        clearAreaValue(oCell, "");
    }
    //getObject(objTBY,nTbyRowNo+1,0).style.backgroundColor = "#fffaf0";
    //getObject(objTBY,nTbyRowNo+1,0).style.borderBottomColor = "#fffaf0";

    var addRowNo = nTbyRowNo; //用于计算“序号”的值
    var obj = objTBY.childNodes(nTbyRowNo + 1).childNodes(nCellNo).childNodes(0);

    obj.focus();  //将光标下移一行
    resetGlobeVariable();
    return addRowNo;
}

/*************************************************************************
 *  purpose: 在选中的表中删除一行
 *
 *************************************************************************/
function delRow() {
    if ((objTBY == null) || (nTbyRowNo < 0)) {
        alert("请先选中需要删除的行");
        return -1;
    }
    if (objTBY.rows.length == 1) {
        clearAreaValue(objTBY.rows(0), "");
    }
    else {
        objTBY.deleteRow(nTbyRowNo);
    }
    var delRowNo = nTbyRowNo; //用于在“案卷目录”文书中计算“序号”的值
    if (nTbyRowNo == objTBY.rows.length) {
        var obj = objTBY.childNodes(nTbyRowNo - 1).childNodes(nCellNo).childNodes(0);
    }
    else {
        var obj = objTBY.childNodes(nTbyRowNo).childNodes(nCellNo).childNodes(0);
    }
    //tofocus.focus();	//为了使用快捷键（ctrl+del）删除行后光标聚焦(tofocus是“系统”菜单的id)
    obj.focus();  //光标位置保持不变
    resetGlobeVariable();
    return delRowNo;
}

/*************************************************************************
 *  purpose: 清空某区域中所有编辑框的数据,比如：input,select,textarea
 *  @param objId: 当前区域的ID,如div,table,span等的id
 *
 *************************************************************************/
function clearAreaValue(oObj, initVal) {
    clearEleValue(oObj, "input", initVal);
    clearEleValue(oObj, "select", initVal);
    clearEleValue(oObj, "textarea", initVal);
}

/*************************************************************************
 *  purpose: 清空某区域中某种编辑框的数据,比如：input,select,textarea
 *  @param objId: 当前区域的ID,如div,table,span等的id
 *  @param objId: 当前区域中编辑框的初始值
 *
 *************************************************************************/
function clearEleValue(obj, tagName, initVal) {
    var coll;
    coll = obj.all.tags(tagName);
    if (coll.length != 0) {
        for (var i = 0; i < coll.length; i++) {
            if (coll[i].disabled == false) {
                if (coll[i].type != "button" && coll[i].type != "radio") {
                    coll[i].value = initVal;
                }
                if (coll[i].type == "checkbox") {
                    coll[i].checked = false;
                }
            }
        }
    }
}

/**********************************************************************
 *   purpose: 得到对象在table中所在的点，页面的HTML格式为<TABLE><TBODY><TR><TD>
 *            注：使用此方法需要在页面上定义全局变量objTBL
 *   @param : obj：表格单元对象,即<td>下一层所对应的标签对象
 *    return: arrP：对象所在位置（行，列）
 ***********************************************************************/
function getObjPoint(obj) {
    var arrP = new Array();
    var cel = obj.parentElement;				//td
    objTBY = cel.parentElement.parentElement;	//TBODY
    arrP[0] = cel.parentElement.rowIndex;		//去掉TH项，行号
    arrP[1] = cel.cellIndex;					//去掉序号No项
    nRowNo = arrP[0];
    nCellNo = arrP[1];
    nTbyRowNo = cel.parentElement.sectionRowIndex;
}

/*************************************************************************
 *  purpose: 还原全局变量的值
 *
 *************************************************************************/
function resetGlobeVariable() {
    nRowNo = -1;
    nTbyRowNo = -1;
    nCellNo = -1;
}

/*************************************************************************
 *  purpose: 在行尾增加一行后,按照新行号重置新行的radio对象(如果有的话)
 *  @param iRow: 增加前光标所在的tbody中的行号
 *
 *************************************************************************/
function resetRadio_add1(iRow) {
    var t = objTBY.rows(iRow + 1).innerHTML;
    if (t.indexOf("radio") == -1) //没有radio对象则返回
        return;

    for (i = 0; i < objTBY.rows(iRow + 1).cells.length; i++) {
        k = 0;
        oCell = objTBY.rows(iRow + 1).cells(i);
        for (j = 0; j < oCell.childNodes.length; j++) {
            if (oCell.childNodes.item(j).type == "radio") {
                //t.item(j).name="r"+String(nTbyRowNo+2);
                t1 = oCell.innerHTML;
                pos = t1.indexOf("R1");
                pos1 = t1.indexOf(">", pos + 1);
                t1 = t1.substring(0, pos + 1) + (iRow + 2) + t1.substring(pos1);
                oCell.innerHTML = t1;
            }
        }
    }
}

/*************************************************************************
 *  purpose: 在行中增加一行后,按照新行号重置新行的radio对象(如果有的话)
 *  @param iRow: 增加前光标所在的tbody中的行号
 *
 *************************************************************************/
function resetRadio_add2(iRow) {
    var t = objTBY.rows(iRow).innerHTML;
    if (t.indexOf("radio") == -1) //没有radio对象则返回
        return;

    for (var i = 0; i < objTBY.rows(iRow).cells.length; i++) {
        k = 0;
        oCell = objTBY.rows(iRow).cells(i);
        for (j = 0; j < oCell.childNodes.length; j++) {
            if (oCell.childNodes.item(j).type == "radio") {
                t1 = oCell.innerHTML;
                pos = t1.indexOf("R" + iRow);
                pos1 = t1.indexOf(">", pos + 1);
                t1 = t1.substring(0, pos + 1) + (iRow + 1) + t1.substring(pos1);
                oCell.innerHTML = t1;
            }
        }
    }
}

/*************************************************************************
 *  purpose: 对增加的新行中的radio对象,需重置第1个radio为checked
 *  @param iRow: 增加前光标所在的tbody中的行号
 *
 *************************************************************************/
function resetRadio_chk(iRow) {
    var t = objTBY.rows(iRow + 1).innerHTML;
    if (t.indexOf("radio") == -1) //没有radio对象则返回
        return;

    for (i = 0; i < objTBY.rows(iRow + 1).cells.length; i++) {
        oCell = objTBY.rows(iRow + 1).cells(i);
        for (j = 0; j < oCell.childNodes.length; j++) {
            if (oCell.childNodes.item(j).type == "radio") {
                oCell.childNodes.item(j).checked = true;
                break;
            }
        }
    }
}

/*************************************************************************
 *  purpose: 增加一行(自动计算序号的值)
 *
 *************************************************************************/
function addRow_xh() {
    var rowNo = addRow();
    if (rowNo < 0) return;
    else {
        resetXh_add(rowNo);
    }
    return rowNo + 1;
}

/*************************************************************************
 *  purpose: 增加一行后重新设置序号和radio对象
 *  @param iRow: 增加前光标所在的tbody中的行号
 *
 *************************************************************************/
function resetXh_add(iRow) {
    if (iRow + 1 == objTBY.rows.length - 1) {    //增加到最后一行
        setCellValuef(objTBY, iRow + 1, 0, (iRow + 2));
        resetRadio_add1(iRow);
    }
    else {
        setCellValuef(objTBY, iRow + 1, 0, (iRow + 2));
        resetRadio_add1(iRow);

        //新行以下各行行号都加1，并重置其radio对象
        for (var i = iRow + 2; i < objTBY.rows.length; i++) {
            setCellValuef(objTBY, i, 0, Number(getCellValuef(objTBY, i, 0)) + 1);
            resetRadio_add2(i);
        }
    }
    //重置新行第1个radio为checked
    resetRadio_chk(iRow);
}

/*************************************************************************
 *  purpose: 增加一行后重新设置序号
 *  @param iRow: 增加前光标所在的tbody中的行号
 *
 *************************************************************************/
function resetXh_add1(iRow) {
    if (iRow + 1 == objTBY.rows.length - 1) {    //增加到最后一行
        setCellDisable(objTBY, iRow + 1, 0, true);
        setCellValuef(objTBY, iRow + 1, 0, (iRow + 2));
    }
    else {
        setCellDisable(objTBY, iRow + 1, 0, true);
        setCellValuef(objTBY, iRow + 1, 0, (iRow + 2));
        for (var i = iRow + 2; i < objTBY.rows.length; i++) {
            setCellDisable(objTBY, i, 0, true);
            setCellValuef(objTBY, i, 0, Number(getCellValuef(objTBY, i, 0)) + 1);
        }
    }
}

/*************************************************************************
 *  purpose: 在行中删除一行后,重置其后各行的radio对象(如果有的话)
 *  @param iRow: 删除前光标所在的tbody中的行号
 *
 *************************************************************************/
function resetRadio_del(iRow) {
    var t = objTBY.rows(iRow).innerHTML;
    if (t.indexOf("radio") == -1) //没有radio对象则返回
        return;

    for (i = 0; i < objTBY.rows(iRow).cells.length; i++) {
        oCell = objTBY.rows(iRow).cells(i);
        for (j = 0; j < oCell.childNodes.length; j++) {
            if (oCell.childNodes.item(j).type == "radio") {
                t1 = oCell.innerHTML;
                pos = t1.indexOf("R" + (iRow + 2));
                if (pos != -1) {
                    pos1 = t1.indexOf(">", pos + 1);
                    t1 = t1.substring(0, pos + 1) + (iRow + 1) + t1.substring(pos1);
                    oCell.innerHTML = t1;
                }
            }
        }
    }
}

/*************************************************************************
 *  purpose: 删除一行(自动计算序号的值)
 *
 *************************************************************************/
function delRow_xh() {
    //	if(nTbyRowNo < 0) return;
    var rowNo = delRow();
    if (rowNo < 0) return;
    resetXh_del(rowNo);
}

/*************************************************************************
 *  purpose: 删除一行后重新设置序号
 *  @param iRow: 删除前光标所在的tbody中的行号
 *
 *************************************************************************/
function resetXh_del(iRow) {
    if (iRow == 0) {//删除第一行
        if (objTBY.rows.length == 1) {
            setCellValuef(objTBY, 0, 0, 1);
            resetRadio_del(0);
        }
        else {
            for (var i = 0; i < objTBY.rows.length; i++) {
                setCellValuef(objTBY, i, 0, Number(getCellValuef(objTBY, i, 0)) - 1);
                resetRadio_del(i);
            }
        }
    }
    else if (iRow == objTBY.rows.length) {//删除最后一行
        return;
    }
    else {
        for (var i = iRow; i < objTBY.rows.length; i++) {
            setCellValuef(objTBY, i, 0, Number(getCellValuef(objTBY, i, 0)) - 1);
            resetRadio_del(i);
        }
    }
}

/**********************************************************************
 *   当选中行时，使该行颜色发生变化（变深）
 ***********************************************************************/
function selectRow() {
    var bc = objTBY.parentElement.bgColor; //得到当前行所在表的背景色
    for (var i = 0; i < objTBY.rows.length; i++) {
        objTBY.rows[i].bgColor = bc;
    }
    objTBY.rows[nTbyRowNo].bgColor = "D6E0F7"; //选中行背景色
}

function selectRow1() {
    for (var i = 0; i < objTBY.rows.length; i++) {
        //		getObject(objTBY,i,0).style.backgroundColor = "#ffffff";
        //		getObject(objTBY,i,0).style.borderBottomColor = "#ffffff";
        //		getObject(objTBY,i,1).style.backgroundColor = "#ffffff";
        objTBY.rows[i].bgColor = "#E8ECE8";//"#fffaf0";
    }
    //	getObject(objTBY,nTbyRowNo,0).style.backgroundColor = strSelectRowColor;
    //	getObject(objTBY,nTbyRowNo,0).style.borderBottomColor = strSelectRowColor;
    //	getObject(objTBY,nTbyRowNo,1).style.backgroundColor = strSelectRowColor;
    objTBY.rows[nTbyRowNo].bgColor = "D6E0F7";//"#419799";
}

/**********************************************************************
 *   使指定行颜色变成指定颜色
 ***********************************************************************/
function setRowColor(obj, color) {
    var tr = obj.parentElement.parentElement; //obj所在行对象
    tr.bgColor = color;
    //objTBY.rows[tr.rowIndex-1].bgColor = color;
    //alert("当前表总行数="+objTBY.rows.length+" 当前行索引="+tr.rowIndex+" 当前行="+nTbyRowNo);
}

/**********************************************************************
 *   purpose: 设置checkbox是否被选中
 *   @param : objTbody：指定表格对象
 *   @param : nRow：指定表格行号
 *   @param : nCol：指定表格列号
 *   @param : boolFlag：未选中/选中（false/true）
 ***********************************************************************/
function setCellCheck(objTbody, nRow, nCol, boolFlag) {
    if (objTbody == null) return;
    if (nRow >= objTbody.rows.length) return;
    if (nCol >= objTbody.rows(nRow).cells.length) return;
    objTbody.rows(nRow).cells(nCol).childNodes.item(0).checked = boolFlag;
}

function setCheckboxVal(obj) {
    if (obj.checked == true) {
        obj.value = "Y";
    }
    else {
        obj.value = "N";
    }
}

function setCheckboxHidVal(objchb, objhid) {
    if (objchb.checked == true) {
        objhid.value = "Y";
    }
    else {
        objhid.value = "N";
    }
}
/**********************************************************************
 *   purpose: 设置单元格是否可编辑
 *   @param : objTbody：指定表格对象
 *   @param : nRow：指定表格行号
 *   @param : nCol：指定表格列号
 *   @param : boolFlag：允许编辑/禁止编辑（false/true）
 ***********************************************************************/
function setCellDisable(objTbody, nRow, nCol, boolFlag) {
    if (objTbody == null) return;
    if (nRow >= objTbody.rows.length) return;
    if (nCol >= objTbody.rows(nRow).cells.length) return;
    objTbody.rows(nRow).cells(nCol).childNodes.item(0).disabled = boolFlag;
}

/**********************************************************************
 *   purpose: 设置单元格焦点
 *   @param : objTbody：指定表格对象
 *   @param : nRow：指定表格行号
 *   @param : nCol：指定表格列号
 ***********************************************************************/
function setCellFocus(objTbody, nRow, nCol) {
    if (objTbody == null) return;
    if (nRow >= objTbody.rows.length) return;
    if (nCol >= objTbody.rows(nRow).cells.length) return;
    objTbody.rows(nRow).cells(nCol).childNodes.item(0).focus();
}

/**********************************************************************
 *   purpose: 得到单元格内容
 *   @param : objTbody：指定表格对象
 *   @param : nRow：指定表格行号
 *   @param : nCol：指定表格列号
 *   return : 对象元素的值
 ***********************************************************************/
function getCellValuef(objTbody, nRow, nCol) {
    if (objTbody == null) return;
    if (nRow >= objTbody.rows.length) return;
    if (nCol >= objTbody.rows(nRow).cells.length) return;
    return objTbody.rows(nRow).cells(nCol).childNodes.item(0).value;
}

/**********************************************************************
 *   purpose: 设置单元格内容
 *   @param : objTbody：指定表格对象
 *   @param : nRow：指定表格行号
 *   @param : nCol：指定表格列号
 *   @param : val：值
 ***********************************************************************/
function setCellValuef(objTbody, nRow, nCol, val) {
    if (objTbody == null) return;
    if (nRow >= objTbody.rows.length) return;
    if (nCol >= objTbody.rows(nRow).cells.length) return;
    objTbody.rows(nRow).cells(nCol).childNodes.item(0).value = val;
}

/**********************************************************************
 *   purpose: 得到单元格对象
 *   @param : objTbody：指定表格对象
 *   @param : nRow：指定表格行号
 *   @param : nCol：指定表格列号
 *   return : 对象
 ***********************************************************************/
function getObject(objTbody, nRow, nCol) {
    if (objTbody == null) return;
    if (nRow >= objTbody.rows.length) return;
    if (nCol >= objTbody.rows(nRow).cells.length) return;
    return objTbody.rows(nRow).cells(nCol).childNodes.item(0);
}

/**********************************************************************
 *   purpose: 删除指定表格所有行，最后留下一空行
 *   @param : objTbody：指定表格对象
 ***********************************************************************/
function delAllRow(objTbody) {
    while (objTbody.rows.length > 1) {
        objTbody.deleteRow(1);
    }
    clearRowVal(objTbody, 0);
    setCellValuef(objTbody, 0, 0, 1);
}

/**********************************************************************
 *   purpose: 清空指定表格行
 *   @param : objTbody：指定表格对象
 *   @param : nRow：指定表格行号
 ***********************************************************************/
function clearRowVal(objTbody, nRow) {
    if (objTbody == null) return;
    if (nRow >= objTbody.rows.length) return;
    for (var i = 1; i < objTbody.rows(nRow).cells.length; i++) {    //表格第一个元素为序号，所以从表格第二个元素开始设置
        objTbody.rows(nRow).cells(i).childNodes.item(0).value = "";
    }
}

function rowsSelected(objTBY, nRow) {
    if (objTBY == null) return;
    if (nRow >= objTBY.rows.length) return;
    //	getObject(objTBY,nRow,0).style.backgroundColor = strSelectRowColor;
    //	getObject(objTBY,nRow,0).style.borderBottomColor = strSelectRowColor;
    //	getObject(objTBY,nRow,1).style.backgroundColor = strSelectRowColor;
    objTBY.rows[nRow].bgColor = "#e5a8b9";
}

function clearRowsSelected(objTBY) {
    if (objTBY == null) return;
    for (var i = 0; i < objTBY.rows.length; i++) {
        getObject(objTBY, i, 0).style.backgroundColor = "#ffffff";
        getObject(objTBY, i, 0).style.borderBottomColor = "#ffffff";
        getObject(objTBY, i, 1).style.backgroundColor = "#ffffff";
        objTBY.rows[i].bgColor = "white";
    }
}

/********************************************************************
 *    purpose:比较两个日期的大小
 *    @param firstDate
 *    @param secondDate
 *    return 结果：firstDate=secondDate返回0
 *                 firstDate<secondDate返回>0的数
 *                 firstDate>secondDate返回<0的数
 ********************************************************************/
function compareDate(firstDate, secondDate) {
    var firstDateArray = new Array();
    var secondDateArray = new Array();
    firstDateArray = firstDate.split("-");
    secondDateArray = secondDate.split("-");
    var tmp = Number(secondDateArray[0]) - Number(firstDateArray[0]);
    if (tmp != 0) return tmp;
    else {
        tmp = Number(secondDateArray[1]) - Number(firstDateArray[1]);
        if (tmp != 0) return tmp;
        else {
            tmp = Number(secondDateArray[2]) - Number(firstDateArray[2]);
            return tmp;
        }
    }
}

/********************************************************************
 *    purpose:比较两个日期的大小：UPDATED BY DZGK209_CLIXUAN
 *    @param firstDate
 *    @param secondDate
 *    return 结果：firstDate=secondDate返回0
 *                 firstDate<secondDate返回>0的数
 *                 firstDate>secondDate返回<0的数
 ********************************************************************/
function compareDate2(firstDate, secondDate) {
    var fDate = firstDate.replace(/-/g, "/");
    var sDate = secondDate.replace(/-/g, "/");
    var f_Date = new Date(fDate);
    var s_Date = new Date(sDate);
    var _times = f_Date.getTime() - s_Date.getTime();
    return _times / (1000 * 60 * 60 * 24);
}

/**
 charCounter
 caculates how many specified characters a string contains.

 Params:
 str, represents the string
 c,    specifies the character
 Return value: the number of the c character contained in the str.
 */
function charCounter(str, c) {
    strError = "";
    var i = 0;
    var count = 0;
    while (i < str.length) {
        if (str.charAt(i) == c) count++;
        i++;
    }
    return count;
}


/**
 * 校验日期格式
 */
function isValidDate(dataForm) {
    cDate = dataForm.value;
    dSize = cDate.length;
    sCount = 0;
    if (cDate == '') return true;
    for (var i = 0; i < dSize; i++)
        (cDate.substr(i, 1) == "-") ? sCount++ : sCount;
    if (sCount != 2) {
        return("您输入的日期格式错误 !\n日期格式必须是'年-月-日'");
    }
    //将输入的日期字符串分隔成3部分
    idxBarI = cDate.indexOf("-");
    idxBarII = cDate.lastIndexOf("-");
    strY = cDate.substring(0, idxBarI);
    strM = cDate.substring(idxBarI + 1, idxBarII);
    strD = cDate.substring(idxBarII + 1, dSize);
    if (!TestKey(strY) || !TestKey(strM) || !TestKey(strD)) {
        return("您输入的日期格式错误 !\n日期格式必须是'年-月-日'");
    }
    strM = (strM.length < 2 ? '0' + strM : strM);
    strD = (strD.length < 2 ? '0' + strD : strD);
    if (strY.length == 2)
        strY = (strY > 50 ? '19' + strY : '20' + strY);
    dataForm.value = strY + '-' + strM + '-' + strD;
    ok = ValDate(strM, strD, strY);
    if (ok == false) {
        return("您输入的日期格式错误 !\n日期格式必须是'年-月-日'");
    }
    return true;
}



/**
 * 校验数字格式
 */
function isValidNumber(dataForm) {
    if (dataForm.value == "") return true;
    if (isNaN(dataForm.value)) {
        return "您输入非数字！";
    }
    dataForm.value = Number(dataForm.value);
    return true;
}

//检测字符串是否为整数
function TestKey(src) {
    chars = "0123456789";
    for (var i = 0; i <= src.length; i++) {
        if (chars.indexOf(src.charAt(i)) == -1) return false;
    }
    return true;
}

//检查电话号码
function TestPhone(phoneObj) {
    var src = phoneObj.value;
    var aa,bb;
    chars = "-0123456789";
    for (var i = 0; i <= src.length; i++) {
        if (chars.indexOf(src.charAt(i)) == -1) {
            alert("您输入非数字！");
            phoneObj.focus();
            return false;
        }
    }
    if (src.search("-") == -1) {
        aa = src;
        bb = "";
    }
    else {
        aa = src.substring(0, src.search("-"));
        bb = src.substr((src.search("-") + 1), (src.length - src.search("-") - 1));
    }
    if (aa.length > 12) {
        alert("电话号码的长度超出范围！");
        phoneObj.focus();
        return false;
    }
    if (bb.length > 0) {
        if (TestKey(bb) == false) {
            alert("您输入非数字！");
            phoneObj.focus();
            return false;
        }
        if (bb.length > 6) {
            alert("电话号码的长度超出范围！");
            phoneObj.focus();
            return false;
        }
    }
    return true;
}

function ValDate(M, D, Y) {
    Months = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    Leap = false;
    if ((Y % 4 == 0) && ((Y % 100 != 0) || (Y % 400 == 0)))
        Leap = true;
    if ((D < 1) || (D > 31) || (M < 1) || (M > 12) || (Y < 0))
        return(false);
    if ((D > Months[M - 1]) && !((M == 2) && (D > 28)))
        return(false);
    if (!(Leap) && (M == 2) && (D > 28))
        return(false);
    if ((Leap) && (M == 2) && (D > 29))
        return(false);
}

//四舍五人保留m位小数
function formatnumber(val, m) {
    var num,intPart,dotPart,dotPos,destNum;
    //小数点位置
    dotPos = String(val).indexOf(".");
    //整数，不处理
    if (dotPos == -1)
        destNum = val;
    //有小数
    else {
        //整数部分(含小数点)
        intPart = String(val).substring(0, dotPos + 1);
        //小数部分
        dotPart = String(val).substring(dotPos + 1);
        //小数位数小于m，不处理
        if (dotPart.length <= m)
            destNum = val;
        //小数位数大于m
        else {
            var tmp = new Array();
            for (var i = 0; i <= m; i++) {
                //小数点后第i位数
                tmp[i] = String(dotPart).charAt(i);
            }
            //小数点后第m+1位数为5
            if (tmp[m] == 5) {
                //小数点后第m位数为奇数1,3,5,7，round函数自动进位
                if (tmp[m - 1] == 1 || tmp[m - 1] == 3 || tmp[m - 1] == 5 || tmp[m - 1] == 7 || tmp[m - 1] == 9)
                    destNum = Math.round(val * Math.pow(10, m)) / Math.pow(10, m);
                //小数点后第二位数为偶数0,2,4,6,8，用以下方法进位
                else {
                    //小数点后第m位数加1
                    tmp[m - 1] = Number(tmp[m - 1]) + Number(1);
                    //整数与小数合并
                    dotPart = "";
                    for (var i = 0; i < m; i++) {
                        dotPart = dotPart + String(tmp[i]);
                    }
                    destNum = intPart + dotPart;
                }
            }
            //小数点后第m+1位数不为5，round函数自动进位
            else
                destNum = Math.round(val * Math.pow(10, m)) / Math.pow(10, m);
        }
    }
    return(destNum);
}

/** 格式化数字
 *    @param dataForm：需要进行格式化的数字
 *    @param n：整数的位数
 *    @param m：小数的位数
 *
 */
function formatNumberType(val, n, m) {
    n_str = String(formatnumber(val, m));
    return formatDotpart(n_str, m);
}

/** 计算小数点后的位数
 *    @param val：数字
 *    @return 小数的位数
 *
 */
function countDot(val) {
    var dotPos = String(val).indexOf(".");
    if (dotPos != -1)
        return String(val).substring(dotPos + 1).length;
    else return 0;
}

/** 形成有指定小数位数的数字
 *
 */
function formatDotpart(str, m) {
    if (m == 0) return str;
    var dotPart = "";
    var pl = countDot(str);
    for (var i = 0; i < m - pl; i++) {
        dotPart = dotPart + "0";
    }
    if (pl == 0) str = str + "." + dotPart;
    else str = str + dotPart;
    return str;
}

/**
 * 带逗号的千分位数字格式化为整形数字。
 * 
 * Add by LiJun 2011-09-30
 *
 */
function formatQfwToNumber(number){   
    var num = number + "";   
    num = num.replace(new RegExp(",", "g"), "");    
    if(/^[-+]?[0-9]+(\.[0-9]+)?$/.test(num)){
        return num;    
    }else{
        return number;    
    }
}

/**
 * 整形数字格式化为带逗号的千分位数字
 * 
 * Add by LiJun 2011-09-30
 *
 */
function formatNumberToQfw(number) { 
    var num = number + "";
    num = num.replace(new RegExp(",", "g"), "");

    // 正负号处理
    var symble = "";
    if(/^([-+]).*$/.test(num)) {
        symble = num.replace(/^([-+]).*$/, "$1");    
        num = num.replace(/^([-+])(.*)$/, "$2");    
    }    

    if(/^[0-9]+(\.[0-9]+)?$/.test(num)){
        var num = num.replace(new RegExp("^[0]+","g"), "");  
        if(/^\./.test(num)){
           num = "0" + num;
        }

	    var decimal = num.replace(/^[0-9]+(\.[0-9]+)?$/, "$1");    
	    var integer= num.replace(/^([0-9]+)(\.[0-9]+)?$/, "$1");    
	
	    var re=/(\d+)(\d{3})/;
	
	    while(re.test(integer)){
	        integer = integer.replace(re,"$1,$2"); 
	    }
	    return symble + integer + decimal;
    }else {    
        return number;    
    }    
}

/**
 *    设置键盘Down时，对输入框进行校验
 */
function setFormatDown(type, dataForm) {
    switch (type) {
        case "TYPE_DATE":
            inputDateType1(dataForm);
            break;
        case "TYPE_NUMBER":
            inputNumberType(dataForm);
            break;
        case "PURE_NUMBER":
            inputPureNumberType(dataForm);
            break;
        case "TYPE_PHONE":
            inputPhoneType(dataForm);
            break;
        case "TYPE_CHAR_NUMBER":
            inputPureCharNumberType(dataForm);
            break;
        default:
            break;
    }
    return;
}
/**
 *    设置键盘up时，对输入框进行校验
 */
function setFormatUp(type, dataForm) {
    switch (type) {
        case "TYPE_DATE":
            setDateType(dataForm);
            break;
        case "TYPE_NUMBER":
            break;
        case "PURE_NUMBER":
            break;
        default:
            break;
    }
    return;
}

function setFormatBlur(type, dataForm, n, m) {
    var strResult = true;
    switch (type) {
        case "TYPE_DATE":
            strResult = isValidDate(dataForm);
            break;
        case "TYPE_NUMBER":
            strResult = isValidNumber(dataForm);
            if (strResult == true) {
                if (n != null) {
                    if (n != "*") {
                        if (dataForm.value >= Math.pow(10, n)) {
                            strResult = "输入数字超出范围！";
                        }
                        if (formatFloatValue(dataForm.value, 2) < 0.00 && Math.abs(dataForm.value) >= Math.pow(10, n - 1)) {
                            strResult = "输入数字超出范围！";
                        }
                    }
                    if (m != null) {
                        dataForm.value = formatNumberType(dataForm.value, n, m);
                    }
                }
            }
            break;
        case "PURE_NUMBER":
            strResult = TestKey(dataForm.value);
            if (strResult == true) {
                if (n != null) {
                    if (dataForm.value >= Math.pow(10, n)) {
                        strResult = "输入数字超出范围！";
                    }
                }
            }
            else {
                strResult = "输入非数字！";
            }
            break;
        case "TYPE_CHAR_NUMBER":
            strResult = testPureCharNumberType(dataForm.value);
            if (strResult == false) {
                strResult = "必须录入字母或数字";
            }
            break;
        default:
            break;
    }
    return strResult;
}

function showErrorBlur(type, dataForm, n, m) {
    if (dataForm.value == "") return true;
    var strResult = true;
    strResult = setFormatBlur(type, dataForm, n, m);
    if (strResult != true) {
        alert(strResult);
        dataForm.value = "";
        dataForm.focus();
        return false;
    }
    return true;
}

function inputPureNumberType(dataForm) {
    if ((
            (event.keyCode == 8) || //"backspace" of the left keyboard
                    (event.keyCode == 9) || //"tab" of the left keyboard
                    (event.keyCode == 46) || //del" of the right keyboard
                    (event.keyCode >= 35 && event.keyCode <= 40) || // direction keys of the right key board
                    (event.keyCode >= 48 && event.keyCode <= 57) || //0-9 of the left keyboard
                    (event.keyCode >= 96 && event.keyCode <= 105 //0-9 of the right keyboard
                            )) == false) {
        event.returnValue = false;
    }
}

//电话号码（允许输入多个，使用","或空格分隔）
function inputPhoneType(dataForm) {
    if ((
            (event.keyCode == 8) || //"backspace" of the left keyboard
                    (event.keyCode == 9) || //"tab" of the left keyboard
                    (event.keyCode == 32) || //space of the left keyboard
                    (event.keyCode == 46) || //"del" of the right keyboard
                    (event.keyCode == 109) || //"-" of the right keyboard
                //(event.keyCode == 110) || //"." of the left keyboard
                    (event.keyCode == 188) || //"," of the left keyboard
                    (event.keyCode == 189) || //"-" of the left keyboard
                //(event.keyCode == 190) || //"." of the right keyboard
                    (event.keyCode >= 35 && event.keyCode <= 40) || // direction keys of the right key board
                    (event.keyCode >= 48 && event.keyCode <= 57) || //0-9 of the left keyboard
                    (event.keyCode >= 96 && event.keyCode <= 105 //0-9 of the right keyboard
                            )) == false) {
        event.returnValue = false;
    }
    //不允许出现两次-
    //if(event.keyCode == 109 ||event.keyCode == 189){
    //	if(dataForm.value.indexOf("-") != -1) event.returnValue = false;
    //}
}

function inputNumberType(dataForm) {

    if ((
            (event.keyCode == 8) || //"backspace" of the left keyboard
                    (event.keyCode == 9) || //"tab" of the left keyboard
                    (event.keyCode == 46) || //del" of the right keyboard
                    (event.keyCode == 109) || //"-" of the right keyboard
                    (event.keyCode == 110) || //"." of the left keyboard
                    (event.keyCode == 189) || //"-" of the left keyboard
                    (event.keyCode == 190) || //"." of the right keyboard
                    (event.keyCode >= 35 && event.keyCode <= 40) || // direction keys of the right key board
                    (event.keyCode >= 48 && event.keyCode <= 57) || //0-9 of the left keyboard
                    (event.keyCode >= 96 && event.keyCode <= 105 //0-9 of the right keyboard
                            )) == false) {
        event.returnValue = false;
    }

    /*
     Exceptions that will be processed below:
     1. Don't permit two "." in one input number.
     2. Don't permit the symbol of "-" exists in anywhere unless the head of the input string. And we should change the input number's positive or negative signal when the number of "-" character in user input is above one.
     */
    //1.process the 1st case
    if (event.keyCode == 110 || event.keyCode == 190) {
        if (dataForm.value.indexOf(".") != -1) event.returnValue = false;
    }
    //2.process the 2rd case
    if (event.keyCode == 109 || event.keyCode == 189) {
        if (dataForm.value.indexOf("-") == -1) {
            dataForm.value = "-" + dataForm.value;
        }
        else {
            //var fieldText = getFieldValue();
            dataForm.value = dataForm.value.substr(1, dataForm.value.length - 1);
            event.returnValue = false;
        }
        event.returnValue = false;
    }
}

function inputDateType1(dataForm) {
    if ((
            (event.keyCode == 8) || //"backspace" of the left keyboard
                    (event.keyCode == 9) || //"tab" of the left keyboard
                    (event.keyCode == 46) || //del" of the right keyboard
                    (event.keyCode == 109) || //"-" of the right keyboard
                    (event.keyCode == 189) || //"-" of the left keyboard
                    (event.keyCode >= 35 && event.keyCode <= 40) || // direction keys of the right key board
                    (event.keyCode >= 48 && event.keyCode <= 57) || //0-9 of the left keyboard
                    (event.keyCode >= 96 && event.keyCode <= 105 //0-9 of the right keyboard
                            )) == false) {
        event.returnValue = false;
    }
    /*
     Here we list some cases need to be processed below:
     1.Requires just two "-" in the string.
     */
    //1.handle the case 1:
    if (event.keyCode == 109 || event.keyCode == 189) {//denote the "-" key
        if (charCounter(dataForm.value, "-") >= 2) {
            event.returnValue = false;
        }
    }
}

function setDateType1(dataForm) {
    if (event.keyCode != 8 && event.keyCode != 46) {//denote "backspace" and "del" keys.
        if (dataForm.value.length == 4 || dataForm.value.length == 7) {
            if (charCounter(dataForm.value, "-") < 2)
                dataForm.value += "-";
        }
        else if (dataForm.value.length == 6) {
            if (event.keyCode > 49) {
                dataForm.value += "-";
            }
        }
    }
}

function inputDateType(dataForm) {
    //只允许输入数字/"-"/删除/方向/Tab/退格键
    if ((
            (event.keyCode == 8) || //"backspace" of the left keyboard
                    (event.keyCode == 9) || //"tab" of the left keyboard
                    (event.keyCode == 46) || //del" of the right keyboard
                    (event.keyCode == 109) || //"-" of the right keyboard
                    (event.keyCode == 189) || //"-" of the left keyboard
                    (event.keyCode >= 35 && event.keyCode <= 40) || // direction keys of the right key board
                    (event.keyCode >= 48 && event.keyCode <= 57) || //0-9 of the left keyboard
                    (event.keyCode >= 96 && event.keyCode <= 105 //0-9 of the right keyboard
                            )) == false) {
        event.returnValue = false;
    }

    var t = "";

    //只判断输入是数字或-的情况
    if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) || (event.keyCode == 109 || event.keyCode == 189)) {
        if (event.keyCode == 109 || event.keyCode == 189) //不允许输入输入三次"-"
        {
            if (charCounter(dataForm.value, "-") >= 2) {
                event.returnValue = false;
            }
        }

        if (dataForm.value.length <= 5) {
            if (event.keyCode == 109 || event.keyCode == 189) //年不允许输入-
                event.returnValue = false;
            if (dataForm.value.length == 4) {
                if (event.keyCode != 109 && event.keyCode != 189) //年份已输入2位数字后自动加上-
                    event.returnValue = false;
            }
        }
        else if (dataForm.value.length == 6) {
            t = dataForm.value.charAt(5);
            if (t == "0" && (event.keyCode == 48 || event.keyCode == 96 || event.keyCode == 109 || event.keyCode == 189)) //月份不允许输入00,0-
                event.returnValue = false;
            else if (t == "1" && (event.keyCode >= 51 && event.keyCode <= 57 || event.keyCode >= 99 && event.keyCode <= 105)) //月份不允许输入大于12的数
                event.returnValue = false;
            else if (parseInt(t) >= 2) //月份第1位已输入2以上的数后不允许继续输入(会自动加上-)
                event.returnValue = false;
        }
        else if (dataForm.value.length == 7) {
            t1 = dataForm.value;
            p1 = t1.indexOf("-");
            p2 = t1.indexOf("-", p1 + 1);
            if (p2 != -1)
                yf = t1.substring(p1 + 1, p2);
            else
                yf = t1.substring(p1 + 1);
            if (yf.length == 2) {
                if (event.keyCode != 109 && event.keyCode != 189) //月份已输入2位数字后自动加上-
                    event.returnValue = false;
            }
        }
        else if (dataForm.value.length >= 8) {
            t1 = dataForm.value;
            p1 = t1.indexOf("-");
            p2 = t1.lastIndexOf("-");
            yf = t1.substring(p1 + 1, p2);
            yfz = parseInt(yf, 10);

            if (dataForm.value.length == 9 && yf.length == 1) //禁止输入3位日子
                event.returnValue = false;
            else if ((dataForm.value.length == 8 && yf.length == 1) || dataForm.value.length == 9) {
                if (dataForm.value.length == 8)
                    t = t1.charAt(7);
                else
                    t = t1.charAt(8);

                if (t == "0" && (event.keyCode == 48 || event.keyCode == 96)) //日子不允许输入00
                    event.returnValue = false;
                else if (yfz == 2) //若月份是2,日子第1位已输入3以上的数后不允许继续输入数字
                {
                    if (parseInt(t) >= 3)
                        event.returnValue = false;
                    else if (parseInt(t) == 2) //日子第1位已输入2时，第2位最大可输入数由是否闰年决定
                    {
                        leap = false;
                        nf = t1.substring(0, 4);
                        if (nf % 4 == 0 && (nf % 100 != 0 || nf % 400 == 0))
                            leap = true;
                        if (!leap) {
                            if (event.keyCode == 57 || event.keyCode == 105)
                                event.returnValue = false;
                        }
                    }
                }
                else if (parseInt(t) == 3) //对其他月份,当日子第1位是3时
                {
                    if (yfz == 4 || yfz == 6 || yfz == 9 || yfz == 11) //若月份是4,6,9,11，第2位只能输入0
                    {
                        if (event.keyCode != 48 && event.keyCode != 96)
                            event.returnValue = false;
                    }
                    else //若月份是1,3,5,7,8,10,12，第2位只能输入0/1
                    {
                        if (event.keyCode != 48 && event.keyCode != 49 && event.keyCode != 96 && event.keyCode != 97)
                            event.returnValue = false;
                    }
                }
                else if (parseInt(t) >= 4) //日子第1位已输入4以上的数后不允许继续输入数字
                {
                    event.returnValue = false;
                }
            }
        }
    }
}

function setDateType(dataForm) {
    if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) || (event.keyCode == 109 || event.keyCode == 189)) {
        if (dataForm.value.length == 4 || dataForm.value.length == 7) {
            if (charCounter(dataForm.value, "-") < 2)
                dataForm.value += "-";
        }
        else if (dataForm.value.length == 6) {
            t = dataForm.value.charAt(5);
            if (parseInt(t) >= 2)
                dataForm.value += "-";
        }
    }
}

//id为TABLE的id
function addOneRow(tbname) {
    var oRow;		 //行（TR）对象
    var oCell;		 //单元（TD）对象
    var nTbyRowNum; //总行数

    var id = document.all(tbname);
    if (id.rows.length <= 0) return;

    nTbyRowNum = id.rows.length;
    oRow = id.insertRow(-1);

    var cellsLength = id.rows(0).cells.length;
    for (var i = 0; i < cellsLength; i++) {
        oCell = oRow.insertCell();
        oCell.innerHTML = id.rows(nTbyRowNum - 1).cells(i).innerHTML;
        clearAreaValue(oCell, "");
    }

    //设置新增加行的序号值（第一列）
    id.rows(nTbyRowNum).cells(0).childNodes.item(0).value = nTbyRowNum;

    //设置按钮的值
    var cols = cellsLength - 1;   //最后一列
    t = id.rows(nTbyRowNum - 1).cells(cols).innerHTML;
    var rule = /addOneRow/g;
    var replaceText = "delOneRow";
    t = t.replace(rule, replaceText);

    var row = nTbyRowNum - 1;
    var pos1 = t.indexOf(")");
    t = t.substring(0, pos1) + "," + row + t.substring(pos1);

    id.rows(row).cells(cols).innerHTML = t;
    id.rows(row).cells(cols).childNodes.item(0).value = '-';
}

//id为TABLE的id，n为删除的记录号
function delOneRow(tbname, n) {
    var id = document.all(tbname);
    if (id.rows.length <= 0) return;

    if (confirm("确定要删除指定行吗？") == false) return;

    id.deleteRow(n);

    var nTbyRowNum = id.rows.length;
    if (nTbyRowNum <= 1) {
        return;
    }

    var cols = id.rows(0).cells.length;
    cols--;

    //该行以下各行号都减1
    for (k = n; k <= nTbyRowNum - 1; k++) {
        //设置行的序号（第一列）
        id.rows(k).cells(0).childNodes.item(0).value = k;

        //设置按钮的值（最后一列）
        t = id.rows(k).cells(cols).innerHTML;
        pos = t.indexOf("delOneRow");
        if (pos != -1) {
            pos1 = t.indexOf(",");
            pos2 = t.indexOf(")");
            t = t.substring(0, pos1) + "," + k + t.substring(pos2);
            id.rows(k).cells(cols).innerHTML = t;
        }
    }
}

//校验年
//只允许为1900-2150之间的数字
function checkyear(year) {
    if (year.length == 4) {
        var temp = parseInt(year);
        if (!isNaN(temp)) {
            //if (year == 0) return true;
            low = 1900;
            high = 2150;
            if ((year >= low) && (year <= high)) return true;
        }
    }
    alert("年份必须是数字并且只能在1900-2150之间！");
    return false;
}

//校验月份
//只允许在low 和high之间
function checkmonth(month, low, high) {
    var temp = parseInt(month, 10);
    if (!isNaN(temp)) {
        var tmp = parseInt(low);
        if (isNaN(tmp)) low = 1;
        tmp = parseInt(high);
        if (isNaN(tmp)) high = 12;
        if ((temp >= low) && (temp <= high)) {
            return true;
        }
    }
    alert("月份必须是数字并且只能在" + low + "-" + high + "之间！");
    return false;
}


/**
 *数字取值判断(不做 "是否为数字" 判断),是否 start<=num<=end
 *如果不是 : 打出errorStr ,num清零.
 *如果是   : 什么都不做,返回.
 *
 *
 *@param : start    左边界
 *         end      右边界
 *         num      要判断的数
 *         strError 当出错时,打出的提示
 *
 *@author : 刘宇康
 *时间 2008-3-26
 *活动号：WSSB_JXH_NB724
 */
function isIn(start, end, num, strError) {

    if (num.value < start || num.value > end) {
        alert(strError);
        num.value = "";
        num.focus();
        return false;
    }
    num.value = Number(num.value);
    return true;
}


/**
 * 把给定值转换为指定小数点位数的浮点数
 * @param val - 要转换的值,可以是字符串,也可以是数值
 * @param num - 指定小数点位数
 * @author liangjin
 */
function formatFloatValue(val, num) {
    var t = parseFloat(val);

    if (isNaN(t) || isNaN(num)) {
        return "";
    }

    //对绝对值小于0.000001的数，使用parseFloat时会自动转换成科学计数法，必须专门处理
    if (Math.abs(t) < 0.000001) {
        t = formatNumberType(0, 0, num);
    }
    else {
        t = formatNumberType(t, 0, num);
    }

    return t;
}

/**
 * 改变前台控件的背景颜色，本方法不负责检测该控件是否有“背景颜色”这一属性
 * @param : 控件
 * @param : 颜色值
 * @author : cliuyk  DZGK_137_cliuly
 */
function changeBackground(obj, color) {
    obj.style.background = color;
}

/*
 * 删除js或者css样式文件
 * author:WSSB_JXH_NB924_CLIXUAN
 *
 * */
function replacejscssfile(oldfilename, newfilename, filetype) {

    var targetelement = (filetype == "js") ? "script" : (filetype == "css") ? "link" : "none";
    var targetattr = (filetype == "js") ? "src" : (filetype == "css") ? "href" : "none";
    var allsuspects = document.getElementsByTagName(targetelement);
    for (var i = allsuspects.length; i >= 0; i--) {
        if (allsuspects[i] && allsuspects[i].getAttribute(targetattr) != null && allsuspects[i].getAttribute(targetattr).indexOf(oldfilename) != -1) {
            if (newfilename && !newfilename == "") {
                var newelement = createjscssfile(newfilename, filetype);
                allsuspects[i].parentNode.replaceChild(newelement, allsuspects[i]);
            } else {
                allsuspects[i].parentNode.removeChild(allsuspects[i]);
            }

        }
    }
}

/*
 *
 * 替换js或者css文件
 * author：WSSB_JXH_NB924_CLIXUAN
 *
 * */
function createjscssfile(filename, filetype) {

    var fileref;
    if (filetype == "js") {
        fileref = document.createElement('script');
        fileref.setAttribute("type", "text/javascript");
        fileref.setAttribute("src", filename);
    } else if (filetype == "css") {
        fileref = document.createElement("link");
        fileref.setAttribute("rel", "stylesheet");
        fileref.setAttribute("type", "text/css");
        fileref.setAttribute("href", filename);
    }
    return fileref;
}

//打印页面
function webPrint()
{
	window.print();
}


/*
*四舍五入的方法
*@param val  代表传进来要处理的数值
*@param weishu 要精确到的小数位数
*
*@return 返回计算的数值
**备注：此方法适合于进行加减但是不适合用于两个很小的数值进行相乘（比如：0.000001*0.00000001）
*如果要计算2个数值相乘请使用multiply方法
*/
function round(val,weishu) {
	var num,intPart,dotPart,dotPos,destNum;	
	var m=weishu;
	//处理传进来的是科学计数法的问题，只针对极小的数字
	if(Math.abs(val)<0.5*Math.pow(0.1,weishu)){
		return 0;
	}
	//小数点位置
	dotPos=String(val).indexOf(".");
	//整数，不处理
	if(dotPos==-1){
		destNum=val;
	//有小数
	}else{
		//整数部分(含小数点)
		intPart=Math.abs(String(val).substring(0,dotPos));
		//小数部分
		dotPart=String(val).substring(dotPos+1);		
		//小数位数小于m，不处理
		if(dotPart.length<=m){
			destNum=val;			
		//小数位数大于m
		}else {
			
			var tmp = new Array();
			for(var i=0;i<=m;i++) {
				//小数点后第i位数
				tmp[i] = String(dotPart).charAt(i);
			}
			//小数点后第m+1位数>5第m位数+1
			if(tmp[m]>=5){
				//小数点后第m位数加1
				if(tmp[m-1]<9){
					tmp[m-1]=Number(tmp[m-1]) + Number(1);
				}else{
					tmp[m-1]=0;
					for(var k=m-2;k>=0;k--){							
						if(tmp[k]==9){							
							tmp[k]=0;
							if(k==0){//小数位数的第一位
								//整数位数加1
								intPart=Number(intPart)+Number(1);
								break;
							}
					    }else{  //
							tmp[k]=Number(tmp[k])+Number(1);
							break;
						}
					}
					//如果是保留1位小数
					if(m==1){						
						intPart=Number(intPart)+Number(1);						
					}
				}
				//整数与小数合并
				dotPart = "";
				for(var i=0;i<m;i++) {
					dotPart = dotPart + String(tmp[i]);
				}
				destNum=intPart+"."+ dotPart;				
			}else{
				//整数与小数合并
				dotPart = "";
				for(var i=0;i<m;i++) {							
					dotPart = dotPart + String(tmp[i]);
				}
				destNum=intPart+"."+ dotPart;
			}
			if(val<0 && parseFloat(destNum)>0){
				destNum="-"+destNum;
			}
		}		
	}
	return parseFloat(destNum);
}

/*
*四舍五入的方法
*@param val  代表传进来要处理的数值
*默认精确到2位小数
*
*@return 返回计算的数值
**备注：此方法适合于进行加减但是不适合用于两个很小的数值进行相乘（比如：0.000001*0.00000001）
*如果要计算2个数值相乘请使用multiply方法
*/
function round2(val) {
	return round(val,2);
}
/*
*计算2个精确小数的浮点数相乘，精确度保留为y位小数
*@
*@param a 数字1
*@param b 数字2
*@param y 要精确到的小数位数
*比如multiply(0.2,0.02,3) 表示计算0.2与0.02的乘积，结果保留3为小数
*@return 返回计算的数值
*
*/
function multiply(a,b,y) {
	var stra=new String(a);
	var strb=new String(b);
	//计算出来a有几位小数
	var aLength=0;
	if(stra.indexOf(".")>0){
		aLength=(stra.substring((stra.indexOf(".")+1),stra.length)).length;
	}
	//计算出来b有几位小数
	var bLength=0;
	if(strb.indexOf(".")>0){
		bLength=(strb.substring((strb.indexOf(".")+1),strb.length)).length;
	}
	//把a扩大（10*小数位数倍）
	//var va = a*Math.pow(10,aLength);
	//var vb = b*Math.pow(10,bLength);  00003
	var va = stra.replace(".","");
	var vb = strb.replace(".","");
	var vaLength=va.length;//
	for(var i=0;i<vaLength-1 && vaLength>0;i++) {//去掉所有的小数点全部转化为整数进行处理
		if(va.charAt(0)==0){//如果左边的第一个数字为0
			va=va.substring(1,va.length);//就截掉左边的数字0
		}else{
			break;
		}
	}
	//app.alert("va="+va);
	var vbLength=vb.length;//
	for(var i=0;i<vbLength-1&& vbLength>0;i++) {//去掉所有的小数点全部转化为整数进行处理
		if(vb.charAt(0)==0){//如果左边的第一个数字为0
			vb=vb.substring(1,vb.length);//就截掉左边的数字0
		}else{
			break;
		}
	}	
	//计算va *vb 
	var c = parseInt(va)*parseInt(vb) ;	
	var flag="" ;
	if(c<0) {
		flag = "-" ;
		c = -c ;
	}	
	c = c+"" ;
	// 前缀0,保证至少有(aLength+bLength+1)位数字
	var sLength=c.length;
	var zero="";
	for(var i=0;i<((aLength+bLength+1)-sLength);i++){
		zero=zero+"0";
	}
	c=zero+""+c;
	var re = "/[+-]?([0-9]+)([0-9]{"+(aLength+bLength)+"})/";
	var vv = flag+c.replace(eval(re), "$1.$2") ;
	return round(vv,y) ;
}
function filter(obj){
  obj.value = filter_str(obj.value);
}
//过滤所有的非中文,字母,数字字符
 function filter_str(str) {
	 interval=typeof(arguments[1])!='undefined'?arguments[1]:'';
	 if(str.length>0)str=DBC2SBC(str)
	 return str.replace(/[^\u4E00-\u9FA5a-zA-Z0-9]/g,interval);
 }
 //* 参数说明:
 //* str:要转换的字符串
 //* flag:标记，为０时半转全，为非０时全转半 默认是1
 //* 返回值类型：字符串
 function DBC2SBC(str) {
    var i;
	var result = '';
	flag = typeof(arguments[1]) != 'undefined' ? arguments[1] : 1;
	if (str.length <= 0) {
		return false;
	}
	for (i = 0; i < str.length; i++) {
		str1 = str.charCodeAt(i);
		reg = /[\u4E00-\u9FA5]/;
		if (!reg.test(str.substr(i, 1))) {
			if (str1 < 125 && !flag)
				result += String.fromCharCode(str.charCodeAt(i) + 65248);
			else if (str1 > 125)
				result += String.fromCharCode(str.charCodeAt(i) - 65248);
			else
				result += str.substr(i, 1);
		} else {
			result += str.substr(i, 1);
		}
	}
	return result;
 }


/**判断是否为空
**/
function isNullOrEmpty(vjmyy){
  	if(!vjmyy && typeof vjmyy != "undefined"){
		return true;
	 }else if(vjmyy  == "null"||vjmyy  == "NULL"){
	 	 return true;
	 }else{
	 	return false;
	 }
}
/**
 * 比较两个日期大小
 * @param {} firstDate  日期格式：yyyy-MM-dd
 * @param {} secondDate 日期格式：yyyy-MM-dd
 */
function compare2Date(firstDate, secondDate) {
	var dFirstDay = new Date();
	var first_Year =  firstDate.substring(0,4);
	var first_Month = firstDate.substring(5,7)-1;
	var first_Day = firstDate.substring(8,10);
	dFirstDay.setFullYear(first_Year,first_Month,first_Day);
	
	var dSecondDate = new Date();
	var secondDate_Year = secondDate.substring(0,4);
	var secondDate_Month = secondDate.substring(5,7)-1;	
	var secondDate_Day = secondDate.substring(8,10);		
	dSecondDate.setFullYear(secondDate_Year,secondDate_Month,secondDate_Day);
	
	if(dFirstDay > dSecondDate) {
	   return "-1";
	} else if(dFirstDay < dSecondDate) {
	    return "1";
	} else {
	   return "0";
	}

} 

/*
 * value: 值； byteLength：数据库字节长度 title：字段中文名称 attribute：属性名称 使用方法说明： 添加 （1）
 * onkeyup="limitLength(this.value,100,'名称','name')" (2) id="name"
 * 或【struts标签】styleId="name" 注意：id名称和 attribute属性名称要一样
 * 
 * 例子：<textarea name="explain" id="explain"
 * onkeyup="limitLength(value,5,'语义说明','explain')" >
 * 
 * 或<input type="text" name="explain" id="explain"
 * onkeyup="limitLength(value,5,'语义说明','explain')" >
 * 
 */ 
function limitLength(value, byteLength, title, attribute) {
       
	var  newvalue  =  value.replace(/[^\x00-\xff]/g,"**");
    
    var  length  =  newvalue.length;
    var msg = "";
    // 当填写的字节数小于设置的字节数
    if  (length  *   1   <= byteLength  *   1 ){
             return  msg;
    } else {
	    var  limitDate  =  newvalue.substr( 0 , byteLength);
	    var  count  =   0 ;
	    var  limitvalue  =   "" ;
	    for( var  i  =   0 ; i  <  limitDate.length; i ++ ) {
	        var  flat  =  limitDate.substr(i,  1 );
	        if  (flat  ==   " * " ) {
	           count ++ ;
	         }
	     }
	     var  size  =   0 ;
	     var  istar  =  newvalue.substr(byteLength  *   1   -   1 ,  1 ); // 校验点是否为“×”
	  
	     // if 基点是×; 判断在基点内有×为偶数还是奇数
	    if  (count  %   2   ==   0 ) {
	       // 当为偶数时
	       size  =  count  /   2   +  (byteLength  *   1   -  count);
	       limitvalue  =  value.substr( 0 , size);
	    }  else  {
	       // 当为奇数时
	       size  =  (count  -   1 )  /   2   +  (byteLength  *   1   -  count);
	       limitvalue  =  value.substr( 0 , size);
	    }
	   msg = title  +   " 最大输入 "   +  byteLength  +   " 个字节（相当于 " + byteLength  / 2 + " 个汉字）！ ";
	   return msg;
    }
}

//过滤特殊字符
function trimContent3(tmp) { 
   var content = new String(tmp);
   while(content.indexOf("<") != -1) { content = content.replace("<", "〈"); }
   while(content.indexOf(">") != -1) { content = content.replace(">", "〉"); }
   while(content.indexOf("\"") != -1) { content = content.replace("\"", "＂");  }
   while(content.indexOf("\'") != -1) { content = content.replace("\'", "＇"); }  
   while(content.indexOf("&") != -1) { content = content.replace("&", "＆"); }  
   return content; 
}
//替换所有字符串
String.prototype.replaceAll = function(s1,s2) { 
    return this.replace(new RegExp(s1,"gm"),s2); 
}

/**
 * 27、显示隐藏挡板
 * 说明：如果挡板已经显示则调用该方法后就隐藏挡板，如果挡板没有显示则调用该方法后就显示挡板
 * @param msg 挡板上面需要显示的提示文字，如果传空字符串则默认为“正在执行请求，请稍等……”
 * @return 根据参数自动显示或隐藏挡板
 */
function showHideOverlayer(msg){
	if(msg == null || msg == ""){
		msg = "正在执行请求，请稍等……";
	}
	if($("#overlayer").html() == null || $("#overlayer").html() == ""){
		var resourceRoot = $("#resourceRoot").val();
		var htmlStr="<div id='overlayer'><div id='loadbox'><img src='"+resourceRoot+"/images/loadingPic.gif' style='vertical-align: middle;'/><br/><strong id='overlayerStrong'>"+msg+"</strong></div></div>";
		$(htmlStr).appendTo("body");
	}
	$("#overlayerStrong").html(msg);
	$("#overlayer").css("height",$("body").attr("height"));
	$("#loadbox").css("top",($("body").attr("height")/2-50) < 0 ? 0 : ($("body").attr("height")/2-50));
	$("#overlayer").toggle();
}
/**
 * 27.1、显示隐藏挡板(根据参数来确认)
 * 说明：根据第二个参数来确定是显示还是隐藏
 * @param msg 挡板上面需要显示的提示文字，如果传空字符串则默认为“正在执行请求，请稍等……”
 * @param sfxs 如果为Y则显示，如果为N则隐藏
 * @return 根据参数自动显示或隐藏挡板
 */
function showHideOverlayer2(msg,sfxs){
	if(msg == null || msg == ""){
		msg = "正在执行请求，请稍等……";
	}
	if($("#overlayer").html() == null || $("#overlayer").html() == ""){
		var resourceRoot = $("#resourceRoot").val();
		var htmlStr="<div id='overlayer'><div id='loadbox'><img src='"+resourceRoot+"/images/loadingPic.gif' style='vertical-align: middle;'/><br/><strong id='overlayerStrong'>"+msg+"</strong></div></div>";
		$(htmlStr).appendTo("body");
	}
	
	$("#overlayerStrong").html(msg);
	$("#overlayer").css("height",$("body").attr("height"));
	$("#loadbox").css("top",($("body").attr("height")/2-50) < 0 ? 0 : ($("body").attr("height")/2-50));
	if(sfxs == "Y"){
		$("#overlayer").show();
	}else{
		$("#overlayer").hide();
	}
}


function initSelOption(selId,valArray,initKey,initValue){
	$("#"+selId).html("");
	if (initKey == null || initValue == null){
		initKey = "0";
		initValue = "-请选择-";
	}
	$("#"+selId).append( "<option value=\""+initKey+"\">"+initValue+"</option>" );
	$.each(valArray,function(key,obj) {
		$("#"+selId).append( "<option value=\""+obj.dM+"\">"+obj.mC+"</option>" );
    });
}