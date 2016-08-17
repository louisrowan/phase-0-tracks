$(function() {


$('.colors').on('click', function(){
	var color = $(this).attr('id');
	$('body').css("backgroundColor", color);
});

$('.animals').on('mouseover', function(){
	$(this).css("color", "red");
	var animal = $(this).attr('id');
	$('#' + animal + 'img').css("opacity", ".5");
});

$('.animalsclass').on('mouseover', function(){
	$(this).css("opacity", "1")

});

$('h1').css("color", "blue");

$('#hide').on('click', function(){
	$('.animalsclass').css("opacity", "0")
	$('.animals').css("color", "black")
})


});