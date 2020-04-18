//文本框得到失去焦点
$(document).ready(function(){
  $(".regist_name").focus(function(){
	  $(".regist_name").css("border","2px solid red");
	  $("#p_name").html("&nbsp;&nbsp;4到24位字符");
		$("#p_name").css("color","orange");
  });
  $(".regist_name").blur(function(){
	  $(".regist_name").css("border","1px solid gray");
  });
  $(".regist_pwd").focus(function(){
	  if($("#p_pwd").next().val()=='0'){
	  $("#p_pwd").html("&nbsp;&nbsp;数字，字母，特殊字符组成，<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6到30位");
		$("#p_pwd").css("color","orange");
	  }
	  $(".regist_pwd").css("border","2px solid red");
  });
  $(".regist_pwd").blur(function(){
	  $(".regist_pwd").css("border","1px solid gray");
	  if($(".regist_pwd2").val()!=''){
	  if( $(".regist_pwd2").val()== $(".regist_pwd").val()){
		  $("#p_pwd2").html("&nbsp;&nbsp;Good！");
			$("#p_pwd2").css("color","green");
			$("#p_pwd2").next().val('1');
	  }
	  else{$("#p_pwd2").html("&nbsp;&nbsp;两次密码不符");
		$("#p_pwd2").css("color","red");$("#p_pwd2").next().val('0');}
	  }
  });
  $(".regist_pwd2").focus(function(){
	  $(".regist_pwd2").css("border","2px solid red");
	  $("#p_pwd2").html("&nbsp;&nbsp;请再次确认密码");
		$("#p_pwd2").css("color","orange");
  });
  $(".regist_pwd2").blur(function(){
	  $(".regist_pwd2").css("border","1px solid gray");
	  if( $(".regist_pwd2").val()== $(".regist_pwd").val()){
		  $("#p_pwd2").html("&nbsp;&nbsp;Good！");
			$("#p_pwd2").css("color","green");
			$("#p_pwd2").next().val('1');
	  }
	  else{$("#p_pwd2").html("&nbsp;&nbsp;两次密码不符");
		$("#p_pwd2").css("color","red");$("#p_pwd2").next().val('0');}
  });
  $(".regist_pho").focus(function(){
	  $(".regist_pho").css("border","2px solid red");
	  $("#p_pho").html("&nbsp;&nbsp;用于获取验证码");
		$("#p_pho").css("color","orange");
  });
  $(".regist_pho").blur(function(){
	  $(".regist_pho").css("border","1px solid gray");
  });
  $(".regist_code").focus(function(){
	  $(".regist_code").css("border","2px solid red");
	  $("#p_code").html("&nbsp;&nbsp;点击获取验证码得到");
		$("#p_code").css("color","orange");
  });
  $(".regist_code").blur(function(){
	  $(".regist_code").css("border","1px solid gray");
	  $("#p_code").html("&nbsp;&nbsp;验证码不能为空");
		$("#p_code").css("color","red");
  });
});
//密码框非空打开确认密码框,空就关闭密码框
//判断名字长度,判断是否为空，判断数据库是否已存在
$(document).ready(function(){  
	$(".regist_name").blur(function(){
		//判断是否为空
		if($(".regist_name").val()==''){
			$("#p_name").html("&nbsp;&nbsp;用户名不能为空");
			$("#p_name").css("color","red");
			return false;
		}
		//判断数据库是否已存在
		
		//判断名字长度
		var len=$(".regist_name").val();   
		var w=0;
		for (var i=0; i<len.length; i++) {   
		   var c = len.charCodeAt(i);   
		   //汉字两个字符
		   if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {   
		    w++;   
		   }   
		   else {   
		    w+=2;   
		   }   
		}   
		if (w > 24) { 
			$("#p_name").html('&nbsp;&nbsp;用户名超过长度限制');
			$("#p_name").css("color","red");
		   return false;   
		}   
		else if(w<4){
			$("#p_name").html('&nbsp;&nbsp;亲，太短了不行哟');
			$("#p_name").css("color","red");
			return false
		}
		else{
			$("#p_name").html('&nbsp;&nbsp;Good！');
			$("#p_name").next().val('1');
			$("#p_name").css("color","green");
			return true;
			}
	});
})	  
//判断密码是否为空，密码长度，密码强弱
$(document).ready(function(){
	
	$(".regist_pwd").blur(function(){
	if($(".regist_pwd").val()==''){
		$("#p_pwd").html("&nbsp;&nbsp;密码不能为空");
		$("#p_pwd").css("color","red");
		$("#p_pwd").next().val('0');
		return false;
		}
	});
})	
$(document).ready(function(){
	$(".regist_pwd").keyup(function(){
	var pwd=$(".regist_pwd").val();
	var len2=$(".regist_pwd").val().length;
	if(len2>30){
		$("#p_pwd").next().val('0');
		$("#p_pwd").html("&nbsp;&nbsp;密码超过长度限制");
		$("#p_pwd").css("color","red");
		return false;
	}
	if(len2<6){
		$("#p_pwd").css("color","red");
     		$(".regist_pwd2").val('');
     		$("#p_pwd").next().val('0');
			$(".regist_pwd2").attr("disabled",true);
			$(".regist_pwd2").css("background-color","#F5F5F5");
			$("#p_pwd2").html("");
			$("#p_pwd").html("不能少于6位数");
		return false;
	}
    if(len2==6){
    	$("#p_pwd").html("&nbsp;&nbsp;密码强度：弱");
    	$("#p_pwd").next().val('1');
		$("#p_pwd").css("color","green");
		$(".regist_pwd2").attr("disabled",false);
		$(".regist_pwd2").css("background-color","white");
		return false;
    }
    if(len2>6){
    var score=0;
    var reg1=/[a-z]/;
    var reg2=/[A-Z]/;
    var reg3=/[0-9]/;
    var reg4=/[!,@,#,$,%,^,&,*,(,),<,>,?,',;,=,-,\/,\\,\[,\],\{,\},+,_]/;//与任何由字母和数字组成的字符串
    if ( ( reg1.test(pwd) )||( reg2.test(pwd) )) {
    	score=1;
    	}
    if(reg3.test(pwd)){score=1}
    if((( reg1.test(pwd) )||( reg2.test(pwd)))&&(reg3.test(pwd))){score=2}
    if((( reg1.test(pwd) )||( reg2.test(pwd)))&&pwd.length > 12){score=2}
    if((( reg1.test(pwd) )||( reg2.test(pwd)))&&reg4.test(pwd)){score=2}
    if((reg3.test(pwd))&&pwd.length > 12){score=2}
    if((reg3.test(pwd))&&reg4.test(pwd)){score=2}
    if((reg3.test(pwd))&&(pwd.length > 12)&&reg4.test(pwd)){score=3}
    if((( reg1.test(pwd))||( reg2.test(pwd)))&&pwd.length > 12&&reg4.test(pwd)){score=3}
    if((( reg1.test(pwd))||( reg2.test(pwd)))&&(reg3.test(pwd))&&reg4.test(pwd)){score=3}
    if(score==1){
    	$("#p_pwd").html("&nbsp;&nbsp;密码强度：弱");
        	 $("#p_pwd").next().val('1');
     		 $("#p_pwd").css("color","green");
     		$(".regist_pwd2").attr("disabled",false);
			$(".regist_pwd2").css("background-color","white");
		}
    if(score==2){
    	 $("#p_pwd").html("&nbsp;&nbsp;密码强度：中");
        	$("#p_pwd").next().val('1');
     		$("#p_pwd").css("color","green");  
     		$(".regist_pwd2").attr("disabled",false);
			$(".regist_pwd2").css("background-color","white");
     }
     if(score==3){
    	$("#p_pwd").html("&nbsp;&nbsp;密码强度：强");
     		$("#p_pwd").css("color","green");    
     		$("#p_pwd").next().val('1');
     		$(".regist_pwd2").attr("disabled",false);
			$(".regist_pwd2").css("background-color","white");
     }
    }

});
})	
//电话号码
$(document).ready(function(){
	$(".regist_pho").blur(function(){
	if($(".regist_pho").val()==''){
		$("#p_pho").next().val('0');
		$("#p_pho").html("&nbsp;&nbsp;手机号码不能为空");
		$("#p_pho").css("color","red");
		return false;
	}
	var tel = /^(13[0-9]|15[0|3|6|7|8|9]|18[3|6|7|8|9])\d{8}$/;
	if(tel.test($(".regist_pho").val())){
		$("#p_pho").html("&nbsp;&nbsp;手机号码正确");
		$("#p_pho").css("color","green");
		$("#p_pho").next().val('1');
	}else{$("#p_pho").html("&nbsp;&nbsp;手机号码不正确");
	$("#p_pho").css("color","red");$("#p_pho").next().val('0');}
	});
})	
function submit_r(){
		if($("#p_name").next().val()=='0'){
			alert("请检查名字填写是否符合条件");
			return false;
		}
		if($("#p_pwd").next().val()=='0'){
			alert("请检查密码填写是否符合条件");
			return false;
		}
		if($("#p_pwd2").next().val()=='0'){
			alert("两次密码不符");
			return false;
		}
		if($("#p_pho").next().val()=='0'){
			alert("手机号码不正确");
			return false;
		}
		if($("#p_code").html()==''){
			alert("请填写验证码")
			return false;
		}
		alert("注册成功");
	}	
curvyCorners.addEvent(window, 'load', initCorners);  //触发事件，调用initCorners方法
function initCorners() {
    var settings = {              //圆角设置
        tl: { radius: 35 },       //左上圆角半径
        tr: { radius: 35 },       //右上圆角半径
        bl: { radius: 35 },       //左下圆角半径
        br: { radius: 35 },       //右下圆角半径
        antiAlias: true           //圆角部分的状态 true：完美圆角 false：失真圆角
     }
  curvyCorners(settings, ".Big_regist"); //操作对象为id="myBox"的DIV
}