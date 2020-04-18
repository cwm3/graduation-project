var date = $('.multiple');
$(function () {
	$('.multiple').pickmeup({
		flat	: true,
		mode	: 'multiple',
	});
	 $('#dateget').click(function(){
	       alert(date.pickmeup('getDate'));
    });
});
