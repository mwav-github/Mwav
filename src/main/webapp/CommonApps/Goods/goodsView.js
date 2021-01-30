// http://bootsnipp.com/snippets/featured/carousel-extended-320-compatible
$(function() {

	$('#myCarousel').carousel({
		interval : false
	});

	$('#carousel-text').html($('#slide-content-0').html());

	//Handles the carousel thumbnails
	$('[id^=carousel-selector-]').click(function() {
		var id = this.id.substr(this.id.lastIndexOf("-") + 1);
		var id = parseInt(id);
		$('#myCarousel').carousel(id);
	});

	// When the carousel slides, auto update the text
	$('#myCarousel').on('slid.bs.carousel', function(e) {
		var id = $('.item.active').data('slide-number');
		$('#carousel-text').html($('#slide-content-' + id).html());
	});
});

function showImageWindow(position) {
	var modalUploadImages = position;
	$("#modalUploadImages").modal("show");
	$("#images_position").val(modalUploadImages);

	//기존 정보 초기화 
	$('#filebody').empty();
}