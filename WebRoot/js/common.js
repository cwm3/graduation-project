
// ��������
var XMLHttpReq;
var currentSort;
// ����XMLHttpRequest����
function createXMLHttpRequest() {
	if (window.XMLHttpRequest) { // Mozilla �����
		XMLHttpReq = new XMLHttpRequest();
	} else if (window.ActiveXObject) { // IE�����
		try {
			XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
			}
		}
	}
}


// ����������
function sendRequest(url) {
	createXMLHttpRequest();
	XMLHttpReq.open("GET", url, false);
	XMLHttpReq.onreadystatechange = processResponse;// ָ����Ӧ����
	XMLHttpReq.send(null); // ��������
}