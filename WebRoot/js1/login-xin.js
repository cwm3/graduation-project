var code ; //在全局 定义验证码      
function createCode(){       
code = "";      
var codeLength = 4;//验证码的长度      
var checkCode = document.getElementById("checkCode");      
checkCode.value = "";      
var selectChar = new Array(1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f','g','h','j','k','l','m','n','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');      
      
for(var i=0;i<codeLength;i++) {      
   var charIndex = Math.floor(Math.random()*60);      
  code +=selectChar[charIndex];      
}      
if(code.length != codeLength){      
  createCode();      
}      
checkCode.value = code;      
}          

function validate () {    
	
var mobile = $("#mobile").val();
var password = $("#password").val();
var checkCode = $("#input1").val();	
if(mobile==""||mobile==null||mobile=="商户号或注册邮箱"){
//	$('#mobile-tip').append("<span class='formtips onError' style='color:red'>请输入商户号或注册邮箱</span>");
$("#m-tip").html("请输入商户号或注册邮箱");
	return false;
}
else{	
	$("#m-tip").html("");
	
var inputCode = document.getElementById("input1").value.toUpperCase();      
var codeToUp=code.toUpperCase();  
if(inputCode.length <=0) {      
//alert("请输入验证码！");      
$("#c-tip").html("请输入验证码！");
  return false;      
}      
else if(inputCode != codeToUp ){      
// alert("验证码输入错误！");      
$("#c-tip").html("验证码输入错误！");
   createCode();      
   return false;      
}      
else {$("#c-tip").html("");}if(password==""||password==null){      
//alert("输入正确，输入的验证码为："+inputCode);
$("#p-tip").html("请输入密码！")

  return false;      
}
$("#p-tip").html("")
return true;
}  

}