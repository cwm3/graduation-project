window.onload=function(){
	document.getElementsByTagName("body")[0].onkeydown = function(){
	    //��ȡ�¼�����   
	    var elem = event.relatedTarget || event.srcElement || event.target ||event.currentTarget;
		if(event.keyCode==8){//�жϰ���ΪbackSpace��   
			     //��ȡ��������ʱ�����ָ���element   
			     var elem = event.srcElement || event.currentTarget;    
			        
			     //�ж��Ƿ���Ҫ��ֹ���¼��̵��¼�Ĭ�ϴ���   
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
 * ����JS����

 * @copyright digitalChina 2007
 * @author majun
 * @date 2007-09-18
 */

/**
 * �Բ�������ݽ���У��
 * ֻ�������backspace����tab����del�������ּ�
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
 * �Բ�������ݽ���У��
 * ֻ�������backspace����tab����del�������ּ�����ĸ
 */
function inputPureCharNumberType(dataForm) {
    if ((
            (event.keyCode == 8) || //"backspace" of the left keyboard
                    (event.keyCode == 9) || //"tab" of the left keyboard
                    (event.keyCode == 46) || //del" of the right keyboard
                    (event.keyCode >= 35 && event.keyCode <= 40) || // direction keys of the right key board
                    (event.keyCode >= 48 && event.keyCode <= 57) || //0-9 of the left keyboard
                    (event.keyCode >= 65 && event.keyCode <= 90) || //��ĸ
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


/** ��ʾ/����ĳһ���򣨲㣩
 * @param oLayer ���򣨲㣩����Ϊ���󣬲����ַ���
 * @param oImg ͼƬ���������&lt;img id="img_switch" src="img_open"&gt;
 * @param sImg1 ������ʾʱ��ͼƬ
 * @param sImg2 ��������ʱ��ͼƬ
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
 * ȥ����β�ո�
 */
function trim(str) {
    return str.replace(/(^\s*)|(\s*$)/g, "");
}

/**
 * ȥ���ַ������пո������м䣩
 */
function trimAll(str) {
    return str.replace(/\s+/g, "");
}

/*****************************************************************
 *  purpose: ������س���ʱ����,��tab���¼�����س���(������textarea��)
 *
 *****************************************************************/
function doOnKeyDown() {
    if (event.keyCode == 13 && window.event.srcElement.tagName.toLowerCase() != "textarea") {
        event.keyCode = 9;
    }
}

/*****************************************************************
 *  purpose: ������CTRL+INSERT����CTRL+DELETEʱ����
 *
 *****************************************************************/
function keyDownInsert() {
    if (event.ctrlKey) {
        if (event.keyCode == 45) {        //CTRL+INSERT:����
            addRow_xh();
        }
        else if (event.keyCode == 46) {    //CTRL+DELETE:ɾ��
            delRow_xh();
        }
    }
}

/*************************************************************************
 *  purpose: ��ѡ�еı�������һ��
 *
 *************************************************************************/
function addRow() {
    var oRow;		//�У�TR������
    var oCell;		//��Ԫ��TD������
    if ((objTBY == null) || (nTbyRowNo < 0)) {
        alert("����ѡ����Ҫ���е�λ��");
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

    var addRowNo = nTbyRowNo; //���ڼ��㡰��š���ֵ
    var obj = objTBY.childNodes(nTbyRowNo + 1).childNodes(nCellNo).childNodes(0);

    obj.focus();  //���������һ��
    resetGlobeVariable();
    return addRowNo;
}

/*************************************************************************
 *  purpose: ��ѡ�еı���ɾ��һ��
 *
 *************************************************************************/
function delRow() {
    if ((objTBY == null) || (nTbyRowNo < 0)) {
        alert("����ѡ����Ҫɾ������");
        return -1;
    }
    if (objTBY.rows.length == 1) {
        clearAreaValue(objTBY.rows(0), "");
    }
    else {
        objTBY.deleteRow(nTbyRowNo);
    }
    var delRowNo = nTbyRowNo; //�����ڡ�����Ŀ¼�������м��㡰��š���ֵ
    if (nTbyRowNo == objTBY.rows.length) {
        var obj = objTBY.childNodes(nTbyRowNo - 1).childNodes(nCellNo).childNodes(0);
    }
    else {
        var obj = objTBY.childNodes(nTbyRowNo).childNodes(nCellNo).childNodes(0);
    }
    //tofocus.focus();	//Ϊ��ʹ�ÿ�ݼ���ctrl+del��ɾ���к���۽�(tofocus�ǡ�ϵͳ���˵���id)
    obj.focus();  //���λ�ñ��ֲ���
    resetGlobeVariable();
    return delRowNo;
}

/*************************************************************************
 *  purpose: ���ĳ���������б༭�������,���磺input,select,textarea
 *  @param objId: ��ǰ�����ID,��div,table,span�ȵ�id
 *
 *************************************************************************/
function clearAreaValue(oObj, initVal) {
    clearEleValue(oObj, "input", initVal);
    clearEleValue(oObj, "select", initVal);
    clearEleValue(oObj, "textarea", initVal);
}

/*************************************************************************
 *  purpose: ���ĳ������ĳ�ֱ༭�������,���磺input,select,textarea
 *  @param objId: ��ǰ�����ID,��div,table,span�ȵ�id
 *  @param objId: ��ǰ�����б༭��ĳ�ʼֵ
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
 *   purpose: �õ�������table�����ڵĵ㣬ҳ���HTML��ʽΪ<TABLE><TBODY><TR><TD>
 *            ע��ʹ�ô˷�����Ҫ��ҳ���϶���ȫ�ֱ���objTBL
 *   @param : obj�����Ԫ����,��<td>��һ������Ӧ�ı�ǩ����
 *    return: arrP����������λ�ã��У��У�
 ***********************************************************************/
function getObjPoint(obj) {
    var arrP = new Array();
    var cel = obj.parentElement;				//td
    objTBY = cel.parentElement.parentElement;	//TBODY
    arrP[0] = cel.parentElement.rowIndex;		//ȥ��TH��к�
    arrP[1] = cel.cellIndex;					//ȥ�����No��
    nRowNo = arrP[0];
    nCellNo = arrP[1];
    nTbyRowNo = cel.parentElement.sectionRowIndex;
}

/*************************************************************************
 *  purpose: ��ԭȫ�ֱ�����ֵ
 *
 *************************************************************************/
function resetGlobeVariable() {
    nRowNo = -1;
    nTbyRowNo = -1;
    nCellNo = -1;
}

/*************************************************************************
 *  purpose: ����β����һ�к�,�������к��������е�radio����(����еĻ�)
 *  @param iRow: ����ǰ������ڵ�tbody�е��к�
 *
 *************************************************************************/
function resetRadio_add1(iRow) {
    var t = objTBY.rows(iRow + 1).innerHTML;
    if (t.indexOf("radio") == -1) //û��radio�����򷵻�
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
 *  purpose: ����������һ�к�,�������к��������е�radio����(����еĻ�)
 *  @param iRow: ����ǰ������ڵ�tbody�е��к�
 *
 *************************************************************************/
function resetRadio_add2(iRow) {
    var t = objTBY.rows(iRow).innerHTML;
    if (t.indexOf("radio") == -1) //û��radio�����򷵻�
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
 *  purpose: �����ӵ������е�radio����,�����õ�1��radioΪchecked
 *  @param iRow: ����ǰ������ڵ�tbody�е��к�
 *
 *************************************************************************/
function resetRadio_chk(iRow) {
    var t = objTBY.rows(iRow + 1).innerHTML;
    if (t.indexOf("radio") == -1) //û��radio�����򷵻�
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
 *  purpose: ����һ��(�Զ�������ŵ�ֵ)
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
 *  purpose: ����һ�к�����������ź�radio����
 *  @param iRow: ����ǰ������ڵ�tbody�е��к�
 *
 *************************************************************************/
function resetXh_add(iRow) {
    if (iRow + 1 == objTBY.rows.length - 1) {    //���ӵ����һ��
        setCellValuef(objTBY, iRow + 1, 0, (iRow + 2));
        resetRadio_add1(iRow);
    }
    else {
        setCellValuef(objTBY, iRow + 1, 0, (iRow + 2));
        resetRadio_add1(iRow);

        //�������¸����кŶ���1����������radio����
        for (var i = iRow + 2; i < objTBY.rows.length; i++) {
            setCellValuef(objTBY, i, 0, Number(getCellValuef(objTBY, i, 0)) + 1);
            resetRadio_add2(i);
        }
    }
    //�������е�1��radioΪchecked
    resetRadio_chk(iRow);
}

/*************************************************************************
 *  purpose: ����һ�к������������
 *  @param iRow: ����ǰ������ڵ�tbody�е��к�
 *
 *************************************************************************/
function resetXh_add1(iRow) {
    if (iRow + 1 == objTBY.rows.length - 1) {    //���ӵ����һ��
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
 *  purpose: ������ɾ��һ�к�,���������е�radio����(����еĻ�)
 *  @param iRow: ɾ��ǰ������ڵ�tbody�е��к�
 *
 *************************************************************************/
function resetRadio_del(iRow) {
    var t = objTBY.rows(iRow).innerHTML;
    if (t.indexOf("radio") == -1) //û��radio�����򷵻�
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
 *  purpose: ɾ��һ��(�Զ�������ŵ�ֵ)
 *
 *************************************************************************/
function delRow_xh() {
    //	if(nTbyRowNo < 0) return;
    var rowNo = delRow();
    if (rowNo < 0) return;
    resetXh_del(rowNo);
}

/*************************************************************************
 *  purpose: ɾ��һ�к������������
 *  @param iRow: ɾ��ǰ������ڵ�tbody�е��к�
 *
 *************************************************************************/
function resetXh_del(iRow) {
    if (iRow == 0) {//ɾ����һ��
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
    else if (iRow == objTBY.rows.length) {//ɾ�����һ��
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
 *   ��ѡ����ʱ��ʹ������ɫ�����仯�����
 ***********************************************************************/
function selectRow() {
    var bc = objTBY.parentElement.bgColor; //�õ���ǰ�����ڱ�ı���ɫ
    for (var i = 0; i < objTBY.rows.length; i++) {
        objTBY.rows[i].bgColor = bc;
    }
    objTBY.rows[nTbyRowNo].bgColor = "D6E0F7"; //ѡ���б���ɫ
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
 *   ʹָ������ɫ���ָ����ɫ
 ***********************************************************************/
function setRowColor(obj, color) {
    var tr = obj.parentElement.parentElement; //obj�����ж���
    tr.bgColor = color;
    //objTBY.rows[tr.rowIndex-1].bgColor = color;
    //alert("��ǰ��������="+objTBY.rows.length+" ��ǰ������="+tr.rowIndex+" ��ǰ��="+nTbyRowNo);
}

/**********************************************************************
 *   purpose: ����checkbox�Ƿ�ѡ��
 *   @param : objTbody��ָ��������
 *   @param : nRow��ָ������к�
 *   @param : nCol��ָ������к�
 *   @param : boolFlag��δѡ��/ѡ�У�false/true��
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
 *   purpose: ���õ�Ԫ���Ƿ�ɱ༭
 *   @param : objTbody��ָ��������
 *   @param : nRow��ָ������к�
 *   @param : nCol��ָ������к�
 *   @param : boolFlag������༭/��ֹ�༭��false/true��
 ***********************************************************************/
function setCellDisable(objTbody, nRow, nCol, boolFlag) {
    if (objTbody == null) return;
    if (nRow >= objTbody.rows.length) return;
    if (nCol >= objTbody.rows(nRow).cells.length) return;
    objTbody.rows(nRow).cells(nCol).childNodes.item(0).disabled = boolFlag;
}

/**********************************************************************
 *   purpose: ���õ�Ԫ�񽹵�
 *   @param : objTbody��ָ��������
 *   @param : nRow��ָ������к�
 *   @param : nCol��ָ������к�
 ***********************************************************************/
function setCellFocus(objTbody, nRow, nCol) {
    if (objTbody == null) return;
    if (nRow >= objTbody.rows.length) return;
    if (nCol >= objTbody.rows(nRow).cells.length) return;
    objTbody.rows(nRow).cells(nCol).childNodes.item(0).focus();
}

/**********************************************************************
 *   purpose: �õ���Ԫ������
 *   @param : objTbody��ָ��������
 *   @param : nRow��ָ������к�
 *   @param : nCol��ָ������к�
 *   return : ����Ԫ�ص�ֵ
 ***********************************************************************/
function getCellValuef(objTbody, nRow, nCol) {
    if (objTbody == null) return;
    if (nRow >= objTbody.rows.length) return;
    if (nCol >= objTbody.rows(nRow).cells.length) return;
    return objTbody.rows(nRow).cells(nCol).childNodes.item(0).value;
}

/**********************************************************************
 *   purpose: ���õ�Ԫ������
 *   @param : objTbody��ָ��������
 *   @param : nRow��ָ������к�
 *   @param : nCol��ָ������к�
 *   @param : val��ֵ
 ***********************************************************************/
function setCellValuef(objTbody, nRow, nCol, val) {
    if (objTbody == null) return;
    if (nRow >= objTbody.rows.length) return;
    if (nCol >= objTbody.rows(nRow).cells.length) return;
    objTbody.rows(nRow).cells(nCol).childNodes.item(0).value = val;
}

/**********************************************************************
 *   purpose: �õ���Ԫ�����
 *   @param : objTbody��ָ��������
 *   @param : nRow��ָ������к�
 *   @param : nCol��ָ������к�
 *   return : ����
 ***********************************************************************/
function getObject(objTbody, nRow, nCol) {
    if (objTbody == null) return;
    if (nRow >= objTbody.rows.length) return;
    if (nCol >= objTbody.rows(nRow).cells.length) return;
    return objTbody.rows(nRow).cells(nCol).childNodes.item(0);
}

/**********************************************************************
 *   purpose: ɾ��ָ����������У��������һ����
 *   @param : objTbody��ָ��������
 ***********************************************************************/
function delAllRow(objTbody) {
    while (objTbody.rows.length > 1) {
        objTbody.deleteRow(1);
    }
    clearRowVal(objTbody, 0);
    setCellValuef(objTbody, 0, 0, 1);
}

/**********************************************************************
 *   purpose: ���ָ�������
 *   @param : objTbody��ָ��������
 *   @param : nRow��ָ������к�
 ***********************************************************************/
function clearRowVal(objTbody, nRow) {
    if (objTbody == null) return;
    if (nRow >= objTbody.rows.length) return;
    for (var i = 1; i < objTbody.rows(nRow).cells.length; i++) {    //����һ��Ԫ��Ϊ��ţ����Դӱ��ڶ���Ԫ�ؿ�ʼ����
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
 *    purpose:�Ƚ��������ڵĴ�С
 *    @param firstDate
 *    @param secondDate
 *    return �����firstDate=secondDate����0
 *                 firstDate<secondDate����>0����
 *                 firstDate>secondDate����<0����
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
 *    purpose:�Ƚ��������ڵĴ�С��UPDATED BY DZGK209_CLIXUAN
 *    @param firstDate
 *    @param secondDate
 *    return �����firstDate=secondDate����0
 *                 firstDate<secondDate����>0����
 *                 firstDate>secondDate����<0����
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
 * У�����ڸ�ʽ
 */
function isValidDate(dataForm) {
    cDate = dataForm.value;
    dSize = cDate.length;
    sCount = 0;
    if (cDate == '') return true;
    for (var i = 0; i < dSize; i++)
        (cDate.substr(i, 1) == "-") ? sCount++ : sCount;
    if (sCount != 2) {
        return("����������ڸ�ʽ���� !\n���ڸ�ʽ������'��-��-��'");
    }
    //������������ַ����ָ���3����
    idxBarI = cDate.indexOf("-");
    idxBarII = cDate.lastIndexOf("-");
    strY = cDate.substring(0, idxBarI);
    strM = cDate.substring(idxBarI + 1, idxBarII);
    strD = cDate.substring(idxBarII + 1, dSize);
    if (!TestKey(strY) || !TestKey(strM) || !TestKey(strD)) {
        return("����������ڸ�ʽ���� !\n���ڸ�ʽ������'��-��-��'");
    }
    strM = (strM.length < 2 ? '0' + strM : strM);
    strD = (strD.length < 2 ? '0' + strD : strD);
    if (strY.length == 2)
        strY = (strY > 50 ? '19' + strY : '20' + strY);
    dataForm.value = strY + '-' + strM + '-' + strD;
    ok = ValDate(strM, strD, strY);
    if (ok == false) {
        return("����������ڸ�ʽ���� !\n���ڸ�ʽ������'��-��-��'");
    }
    return true;
}



/**
 * У�����ָ�ʽ
 */
function isValidNumber(dataForm) {
    if (dataForm.value == "") return true;
    if (isNaN(dataForm.value)) {
        return "����������֣�";
    }
    dataForm.value = Number(dataForm.value);
    return true;
}

//����ַ����Ƿ�Ϊ����
function TestKey(src) {
    chars = "0123456789";
    for (var i = 0; i <= src.length; i++) {
        if (chars.indexOf(src.charAt(i)) == -1) return false;
    }
    return true;
}

//���绰����
function TestPhone(phoneObj) {
    var src = phoneObj.value;
    var aa,bb;
    chars = "-0123456789";
    for (var i = 0; i <= src.length; i++) {
        if (chars.indexOf(src.charAt(i)) == -1) {
            alert("����������֣�");
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
        alert("�绰����ĳ��ȳ�����Χ��");
        phoneObj.focus();
        return false;
    }
    if (bb.length > 0) {
        if (TestKey(bb) == false) {
            alert("����������֣�");
            phoneObj.focus();
            return false;
        }
        if (bb.length > 6) {
            alert("�绰����ĳ��ȳ�����Χ��");
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

//�������˱���mλС��
function formatnumber(val, m) {
    var num,intPart,dotPart,dotPos,destNum;
    //С����λ��
    dotPos = String(val).indexOf(".");
    //������������
    if (dotPos == -1)
        destNum = val;
    //��С��
    else {
        //��������(��С����)
        intPart = String(val).substring(0, dotPos + 1);
        //С������
        dotPart = String(val).substring(dotPos + 1);
        //С��λ��С��m��������
        if (dotPart.length <= m)
            destNum = val;
        //С��λ������m
        else {
            var tmp = new Array();
            for (var i = 0; i <= m; i++) {
                //С������iλ��
                tmp[i] = String(dotPart).charAt(i);
            }
            //С������m+1λ��Ϊ5
            if (tmp[m] == 5) {
                //С������mλ��Ϊ����1,3,5,7��round�����Զ���λ
                if (tmp[m - 1] == 1 || tmp[m - 1] == 3 || tmp[m - 1] == 5 || tmp[m - 1] == 7 || tmp[m - 1] == 9)
                    destNum = Math.round(val * Math.pow(10, m)) / Math.pow(10, m);
                //С�����ڶ�λ��Ϊż��0,2,4,6,8�������·�����λ
                else {
                    //С������mλ����1
                    tmp[m - 1] = Number(tmp[m - 1]) + Number(1);
                    //������С���ϲ�
                    dotPart = "";
                    for (var i = 0; i < m; i++) {
                        dotPart = dotPart + String(tmp[i]);
                    }
                    destNum = intPart + dotPart;
                }
            }
            //С������m+1λ����Ϊ5��round�����Զ���λ
            else
                destNum = Math.round(val * Math.pow(10, m)) / Math.pow(10, m);
        }
    }
    return(destNum);
}

/** ��ʽ������
 *    @param dataForm����Ҫ���и�ʽ��������
 *    @param n��������λ��
 *    @param m��С����λ��
 *
 */
function formatNumberType(val, n, m) {
    n_str = String(formatnumber(val, m));
    return formatDotpart(n_str, m);
}

/** ����С������λ��
 *    @param val������
 *    @return С����λ��
 *
 */
function countDot(val) {
    var dotPos = String(val).indexOf(".");
    if (dotPos != -1)
        return String(val).substring(dotPos + 1).length;
    else return 0;
}

/** �γ���ָ��С��λ��������
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
 * �����ŵ�ǧ��λ���ָ�ʽ��Ϊ�������֡�
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
 * �������ָ�ʽ��Ϊ�����ŵ�ǧ��λ����
 * 
 * Add by LiJun 2011-09-30
 *
 */
function formatNumberToQfw(number) { 
    var num = number + "";
    num = num.replace(new RegExp(",", "g"), "");

    // �����Ŵ���
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
 *    ���ü���Downʱ������������У��
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
 *    ���ü���upʱ������������У��
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
                            strResult = "�������ֳ�����Χ��";
                        }
                        if (formatFloatValue(dataForm.value, 2) < 0.00 && Math.abs(dataForm.value) >= Math.pow(10, n - 1)) {
                            strResult = "�������ֳ�����Χ��";
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
                        strResult = "�������ֳ�����Χ��";
                    }
                }
            }
            else {
                strResult = "��������֣�";
            }
            break;
        case "TYPE_CHAR_NUMBER":
            strResult = testPureCharNumberType(dataForm.value);
            if (strResult == false) {
                strResult = "����¼����ĸ������";
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

//�绰���루������������ʹ��","��ո�ָ���
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
    //�������������-
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
    //ֻ������������/"-"/ɾ��/����/Tab/�˸��
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

    //ֻ�ж����������ֻ�-�����
    if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) || (event.keyCode == 109 || event.keyCode == 189)) {
        if (event.keyCode == 109 || event.keyCode == 189) //������������������"-"
        {
            if (charCounter(dataForm.value, "-") >= 2) {
                event.returnValue = false;
            }
        }

        if (dataForm.value.length <= 5) {
            if (event.keyCode == 109 || event.keyCode == 189) //�겻��������-
                event.returnValue = false;
            if (dataForm.value.length == 4) {
                if (event.keyCode != 109 && event.keyCode != 189) //���������2λ���ֺ��Զ�����-
                    event.returnValue = false;
            }
        }
        else if (dataForm.value.length == 6) {
            t = dataForm.value.charAt(5);
            if (t == "0" && (event.keyCode == 48 || event.keyCode == 96 || event.keyCode == 109 || event.keyCode == 189)) //�·ݲ���������00,0-
                event.returnValue = false;
            else if (t == "1" && (event.keyCode >= 51 && event.keyCode <= 57 || event.keyCode >= 99 && event.keyCode <= 105)) //�·ݲ������������12����
                event.returnValue = false;
            else if (parseInt(t) >= 2) //�·ݵ�1λ������2���ϵ����������������(���Զ�����-)
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
                if (event.keyCode != 109 && event.keyCode != 189) //�·�������2λ���ֺ��Զ�����-
                    event.returnValue = false;
            }
        }
        else if (dataForm.value.length >= 8) {
            t1 = dataForm.value;
            p1 = t1.indexOf("-");
            p2 = t1.lastIndexOf("-");
            yf = t1.substring(p1 + 1, p2);
            yfz = parseInt(yf, 10);

            if (dataForm.value.length == 9 && yf.length == 1) //��ֹ����3λ����
                event.returnValue = false;
            else if ((dataForm.value.length == 8 && yf.length == 1) || dataForm.value.length == 9) {
                if (dataForm.value.length == 8)
                    t = t1.charAt(7);
                else
                    t = t1.charAt(8);

                if (t == "0" && (event.keyCode == 48 || event.keyCode == 96)) //���Ӳ���������00
                    event.returnValue = false;
                else if (yfz == 2) //���·���2,���ӵ�1λ������3���ϵ��������������������
                {
                    if (parseInt(t) >= 3)
                        event.returnValue = false;
                    else if (parseInt(t) == 2) //���ӵ�1λ������2ʱ����2λ�������������Ƿ��������
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
                else if (parseInt(t) == 3) //�������·�,�����ӵ�1λ��3ʱ
                {
                    if (yfz == 4 || yfz == 6 || yfz == 9 || yfz == 11) //���·���4,6,9,11����2λֻ������0
                    {
                        if (event.keyCode != 48 && event.keyCode != 96)
                            event.returnValue = false;
                    }
                    else //���·���1,3,5,7,8,10,12����2λֻ������0/1
                    {
                        if (event.keyCode != 48 && event.keyCode != 49 && event.keyCode != 96 && event.keyCode != 97)
                            event.returnValue = false;
                    }
                }
                else if (parseInt(t) >= 4) //���ӵ�1λ������4���ϵ��������������������
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

//idΪTABLE��id
function addOneRow(tbname) {
    var oRow;		 //�У�TR������
    var oCell;		 //��Ԫ��TD������
    var nTbyRowNum; //������

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

    //�����������е����ֵ����һ�У�
    id.rows(nTbyRowNum).cells(0).childNodes.item(0).value = nTbyRowNum;

    //���ð�ť��ֵ
    var cols = cellsLength - 1;   //���һ��
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

//idΪTABLE��id��nΪɾ���ļ�¼��
function delOneRow(tbname, n) {
    var id = document.all(tbname);
    if (id.rows.length <= 0) return;

    if (confirm("ȷ��Ҫɾ��ָ������") == false) return;

    id.deleteRow(n);

    var nTbyRowNum = id.rows.length;
    if (nTbyRowNum <= 1) {
        return;
    }

    var cols = id.rows(0).cells.length;
    cols--;

    //�������¸��кŶ���1
    for (k = n; k <= nTbyRowNum - 1; k++) {
        //�����е���ţ���һ�У�
        id.rows(k).cells(0).childNodes.item(0).value = k;

        //���ð�ť��ֵ�����һ�У�
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

//У����
//ֻ����Ϊ1900-2150֮�������
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
    alert("��ݱ��������ֲ���ֻ����1900-2150֮�䣡");
    return false;
}

//У���·�
//ֻ������low ��high֮��
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
    alert("�·ݱ��������ֲ���ֻ����" + low + "-" + high + "֮�䣡");
    return false;
}


/**
 *����ȡֵ�ж�(���� "�Ƿ�Ϊ����" �ж�),�Ƿ� start<=num<=end
 *������� : ���errorStr ,num����.
 *�����   : ʲô������,����.
 *
 *
 *@param : start    ��߽�
 *         end      �ұ߽�
 *         num      Ҫ�жϵ���
 *         strError ������ʱ,�������ʾ
 *
 *@author : ���
 *ʱ�� 2008-3-26
 *��ţ�WSSB_JXH_NB724
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
 * �Ѹ���ֵת��Ϊָ��С����λ���ĸ�����
 * @param val - Ҫת����ֵ,�������ַ���,Ҳ��������ֵ
 * @param num - ָ��С����λ��
 * @author liangjin
 */
function formatFloatValue(val, num) {
    var t = parseFloat(val);

    if (isNaN(t) || isNaN(num)) {
        return "";
    }

    //�Ծ���ֵС��0.000001������ʹ��parseFloatʱ���Զ�ת���ɿ�ѧ������������ר�Ŵ���
    if (Math.abs(t) < 0.000001) {
        t = formatNumberType(0, 0, num);
    }
    else {
        t = formatNumberType(t, 0, num);
    }

    return t;
}

/**
 * �ı�ǰ̨�ؼ��ı�����ɫ����������������ÿؼ��Ƿ��С�������ɫ����һ����
 * @param : �ؼ�
 * @param : ��ɫֵ
 * @author : cliuyk  DZGK_137_cliuly
 */
function changeBackground(obj, color) {
    obj.style.background = color;
}

/*
 * ɾ��js����css��ʽ�ļ�
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
 * �滻js����css�ļ�
 * author��WSSB_JXH_NB924_CLIXUAN
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

//��ӡҳ��
function webPrint()
{
	window.print();
}


/*
*��������ķ���
*@param val  ��������Ҫ�������ֵ
*@param weishu Ҫ��ȷ����С��λ��
*
*@return ���ؼ������ֵ
**��ע���˷����ʺ��ڽ��мӼ����ǲ��ʺ�����������С����ֵ������ˣ����磺0.000001*0.00000001��
*���Ҫ����2����ֵ�����ʹ��multiply����
*/
function round(val,weishu) {
	var num,intPart,dotPart,dotPos,destNum;	
	var m=weishu;
	//�����������ǿ�ѧ�����������⣬ֻ��Լ�С������
	if(Math.abs(val)<0.5*Math.pow(0.1,weishu)){
		return 0;
	}
	//С����λ��
	dotPos=String(val).indexOf(".");
	//������������
	if(dotPos==-1){
		destNum=val;
	//��С��
	}else{
		//��������(��С����)
		intPart=Math.abs(String(val).substring(0,dotPos));
		//С������
		dotPart=String(val).substring(dotPos+1);		
		//С��λ��С��m��������
		if(dotPart.length<=m){
			destNum=val;			
		//С��λ������m
		}else {
			
			var tmp = new Array();
			for(var i=0;i<=m;i++) {
				//С������iλ��
				tmp[i] = String(dotPart).charAt(i);
			}
			//С������m+1λ��>5��mλ��+1
			if(tmp[m]>=5){
				//С������mλ����1
				if(tmp[m-1]<9){
					tmp[m-1]=Number(tmp[m-1]) + Number(1);
				}else{
					tmp[m-1]=0;
					for(var k=m-2;k>=0;k--){							
						if(tmp[k]==9){							
							tmp[k]=0;
							if(k==0){//С��λ���ĵ�һλ
								//����λ����1
								intPart=Number(intPart)+Number(1);
								break;
							}
					    }else{  //
							tmp[k]=Number(tmp[k])+Number(1);
							break;
						}
					}
					//����Ǳ���1λС��
					if(m==1){						
						intPart=Number(intPart)+Number(1);						
					}
				}
				//������С���ϲ�
				dotPart = "";
				for(var i=0;i<m;i++) {
					dotPart = dotPart + String(tmp[i]);
				}
				destNum=intPart+"."+ dotPart;				
			}else{
				//������С���ϲ�
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
*��������ķ���
*@param val  ��������Ҫ�������ֵ
*Ĭ�Ͼ�ȷ��2λС��
*
*@return ���ؼ������ֵ
**��ע���˷����ʺ��ڽ��мӼ����ǲ��ʺ�����������С����ֵ������ˣ����磺0.000001*0.00000001��
*���Ҫ����2����ֵ�����ʹ��multiply����
*/
function round2(val) {
	return round(val,2);
}
/*
*����2����ȷС���ĸ�������ˣ���ȷ�ȱ���ΪyλС��
*@
*@param a ����1
*@param b ����2
*@param y Ҫ��ȷ����С��λ��
*����multiply(0.2,0.02,3) ��ʾ����0.2��0.02�ĳ˻����������3ΪС��
*@return ���ؼ������ֵ
*
*/
function multiply(a,b,y) {
	var stra=new String(a);
	var strb=new String(b);
	//�������a�м�λС��
	var aLength=0;
	if(stra.indexOf(".")>0){
		aLength=(stra.substring((stra.indexOf(".")+1),stra.length)).length;
	}
	//�������b�м�λС��
	var bLength=0;
	if(strb.indexOf(".")>0){
		bLength=(strb.substring((strb.indexOf(".")+1),strb.length)).length;
	}
	//��a����10*С��λ������
	//var va = a*Math.pow(10,aLength);
	//var vb = b*Math.pow(10,bLength);  00003
	var va = stra.replace(".","");
	var vb = strb.replace(".","");
	var vaLength=va.length;//
	for(var i=0;i<vaLength-1 && vaLength>0;i++) {//ȥ�����е�С����ȫ��ת��Ϊ�������д���
		if(va.charAt(0)==0){//�����ߵĵ�һ������Ϊ0
			va=va.substring(1,va.length);//�ͽص���ߵ�����0
		}else{
			break;
		}
	}
	//app.alert("va="+va);
	var vbLength=vb.length;//
	for(var i=0;i<vbLength-1&& vbLength>0;i++) {//ȥ�����е�С����ȫ��ת��Ϊ�������д���
		if(vb.charAt(0)==0){//�����ߵĵ�һ������Ϊ0
			vb=vb.substring(1,vb.length);//�ͽص���ߵ�����0
		}else{
			break;
		}
	}	
	//����va *vb 
	var c = parseInt(va)*parseInt(vb) ;	
	var flag="" ;
	if(c<0) {
		flag = "-" ;
		c = -c ;
	}	
	c = c+"" ;
	// ǰ׺0,��֤������(aLength+bLength+1)λ����
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
//�������еķ�����,��ĸ,�����ַ�
 function filter_str(str) {
	 interval=typeof(arguments[1])!='undefined'?arguments[1]:'';
	 if(str.length>0)str=DBC2SBC(str)
	 return str.replace(/[^\u4E00-\u9FA5a-zA-Z0-9]/g,interval);
 }
 //* ����˵��:
 //* str:Ҫת�����ַ���
 //* flag:��ǣ�Ϊ��ʱ��תȫ��Ϊ�ǣ�ʱȫת�� Ĭ����1
 //* ����ֵ���ͣ��ַ���
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


/**�ж��Ƿ�Ϊ��
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
 * �Ƚ��������ڴ�С
 * @param {} firstDate  ���ڸ�ʽ��yyyy-MM-dd
 * @param {} secondDate ���ڸ�ʽ��yyyy-MM-dd
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
 * value: ֵ�� byteLength�����ݿ��ֽڳ��� title���ֶ��������� attribute���������� ʹ�÷���˵���� ��� ��1��
 * onkeyup="limitLength(this.value,100,'����','name')" (2) id="name"
 * ��struts��ǩ��styleId="name" ע�⣺id���ƺ� attribute��������Ҫһ��
 * 
 * ���ӣ�<textarea name="explain" id="explain"
 * onkeyup="limitLength(value,5,'����˵��','explain')" >
 * 
 * ��<input type="text" name="explain" id="explain"
 * onkeyup="limitLength(value,5,'����˵��','explain')" >
 * 
 */ 
function limitLength(value, byteLength, title, attribute) {
       
	var  newvalue  =  value.replace(/[^\x00-\xff]/g,"**");
    
    var  length  =  newvalue.length;
    var msg = "";
    // ����д���ֽ���С�����õ��ֽ���
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
	     var  istar  =  newvalue.substr(byteLength  *   1   -   1 ,  1 ); // У����Ƿ�Ϊ������
	  
	     // if �����ǡ�; �ж��ڻ������С�Ϊż����������
	    if  (count  %   2   ==   0 ) {
	       // ��Ϊż��ʱ
	       size  =  count  /   2   +  (byteLength  *   1   -  count);
	       limitvalue  =  value.substr( 0 , size);
	    }  else  {
	       // ��Ϊ����ʱ
	       size  =  (count  -   1 )  /   2   +  (byteLength  *   1   -  count);
	       limitvalue  =  value.substr( 0 , size);
	    }
	   msg = title  +   " ������� "   +  byteLength  +   " ���ֽڣ��൱�� " + byteLength  / 2 + " �����֣��� ";
	   return msg;
    }
}

//���������ַ�
function trimContent3(tmp) { 
   var content = new String(tmp);
   while(content.indexOf("<") != -1) { content = content.replace("<", "��"); }
   while(content.indexOf(">") != -1) { content = content.replace(">", "��"); }
   while(content.indexOf("\"") != -1) { content = content.replace("\"", "��");  }
   while(content.indexOf("\'") != -1) { content = content.replace("\'", "��"); }  
   while(content.indexOf("&") != -1) { content = content.replace("&", "��"); }  
   return content; 
}
//�滻�����ַ���
String.prototype.replaceAll = function(s1,s2) { 
    return this.replace(new RegExp(s1,"gm"),s2); 
}

/**
 * 27����ʾ���ص���
 * ˵������������Ѿ���ʾ����ø÷���������ص��壬�������û����ʾ����ø÷��������ʾ����
 * @param msg ����������Ҫ��ʾ����ʾ���֣���������ַ�����Ĭ��Ϊ������ִ���������Եȡ�����
 * @return ���ݲ����Զ���ʾ�����ص���
 */
function showHideOverlayer(msg){
	if(msg == null || msg == ""){
		msg = "����ִ���������Եȡ���";
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
 * 27.1����ʾ���ص���(���ݲ�����ȷ��)
 * ˵�������ݵڶ���������ȷ������ʾ��������
 * @param msg ����������Ҫ��ʾ����ʾ���֣���������ַ�����Ĭ��Ϊ������ִ���������Եȡ�����
 * @param sfxs ���ΪY����ʾ�����ΪN������
 * @return ���ݲ����Զ���ʾ�����ص���
 */
function showHideOverlayer2(msg,sfxs){
	if(msg == null || msg == ""){
		msg = "����ִ���������Եȡ���";
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
		initValue = "-��ѡ��-";
	}
	$("#"+selId).append( "<option value=\""+initKey+"\">"+initValue+"</option>" );
	$.each(valArray,function(key,obj) {
		$("#"+selId).append( "<option value=\""+obj.dM+"\">"+obj.mC+"</option>" );
    });
}