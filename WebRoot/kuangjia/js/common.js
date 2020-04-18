//JS
$(function(){
	$(".menu h2").click(function(){
		//$(".menu ul").hide();
		$(this).next().slideToggle(200);
	}) 
	
	$(".menu ul li a").click(function(){
		$(".menu ul li a").removeClass("on");
		$(this).addClass("on");
	})
	
	   	
})



//弹窗
function boxw(id){
	var left = ($(window).width() - $(id).width())/2;
	var top  = ($(window).height() - $(id).height())/2;
	$(id).css({left:left,top:top});	
}
function showalert(id){
	boxw(id);
	$(".mainmask").show();
	$(id).addClass("on");
}
function closealert(obj){
	$(".mainmask").hide();
	$(obj).parent().removeClass("on");
}

$(function(){  
   boxw('#add');
   $(window).resize(function(){
		boxw('#add');
   })	
});

//滚动特效
if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
	var wow = new WOW({
		offset:50
	});
	wow.init();
};
