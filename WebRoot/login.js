//文本框得到失去焦点
$(document).ready(function(){
  $(".user_name").focus(function(){
	  $(".user_name").css("border","2px solid red");
  });
  $(".user_name").blur(function(){
	  $(".user_name").css("border","1px solid gray");
  });
  $(".user_pwd").focus(function(){
	  $(".user_pwd").css("border","2px solid red");
  });
  $(".user_pwd").blur(function(){
	  $(".user_pwd").css("border","1px solid gray");
  });
});
//提交登录
$(document).ready(function(){
	  $(".submit_login").click(function(){
		  if($(".user_name").val()==''){
			  alert("用户名不能为空");
			  return false;
		  }
		  if($(".user_pwd").val()==''){
			  alert("密码不能为空");
			  return false;
		  }
		  var name=$(".user_name").val();
		  var pwd=$(".user_pwd").val();
		  var realpath=$(".realpath").val();
		  $.get(realpath+"/login.do",{p:'checknameandpwd',name:name,pwd:pwd,r:Math.random()},function(n){
				if(n==0){
					alert("用户名或密码错误");
					return false;
				}
				 if(n==1){
					 var fromu=$(".fromu").val();
					 if(fromu==1){
						 fromu=1
					 }else{fromu=0}
					  var url=realpath+"/login.do?p=loginnow&name="+name+"&fromu="+fromu;
					  location=url;
					 }
			});
	  });
	  
	});
curvyCorners.addEvent(window, 'load', initCorners);  //触发事件，调用initCorners方法
function initCorners() {
    var settings = {              //圆角设置
        tl: { radius: 25 },       //左上圆角半径
        tr: { radius: 25 },       //右上圆角半径
        bl: { radius: 25 },       //左下圆角半径
        br: { radius: 25 },       //右下圆角半径
        antiAlias: true           //圆角部分的状态 true：完美圆角 false：失真圆角
     }
  curvyCorners(settings, ".write_kuang"); //操作对象为id="myBox"的DIV
}
//破解miniui
var WinAlerts = window.alert;
window.alert = function (e) {
if (e != null && e.indexOf("试用到期 www.miniui.com")>-1)
{ 
return false;
}
else
{
WinAlerts (e);
}

};