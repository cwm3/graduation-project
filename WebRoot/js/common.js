
// 发送请求
var XMLHttpReq;
var currentSort;
// 创建XMLHttpRequest对象
function createXMLHttpRequest() {
	if (window.XMLHttpRequest) { // Mozilla 浏览器
		XMLHttpReq = new XMLHttpRequest();
	} else if (window.ActiveXObject) { // IE浏览器
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


// 发送请求函数
function sendRequest(url) {
	createXMLHttpRequest();
	XMLHttpReq.open("GET", url, false);
	XMLHttpReq.onreadystatechange = processResponse;// 指定响应函数
	XMLHttpReq.send(null); // 发送请求
}