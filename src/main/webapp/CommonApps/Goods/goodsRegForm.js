// http://bootsnipp.com/snippets/featured/carousel-extended-320-compatible
// https://codepen.io/dbgomez/pen/PowdgPB
$(function() {
	$('#myCarousel').carousel({
		interval : false
	});
	$('#carousel-text').html($('#slide-content-0').html());

	//Handles the carousel thumbnails
	$('[id^=carousel-selector-]').click(function() {
		var id = this.id.substr(this.id.lastIndexOf("-") + 1);
		var id = parseInt(id);
		//console.log(id);
		$('#myCarousel').carousel(id);
	});

	// When the carousel slides, auto update the text
	$('#myCarousel').on('slid.bs.carousel', function(e) {
		var id = $('.item.active').data('slide-number');
		$('#carousel-text').html($('#slide-content-' + id).html());
	});
});

$(function() {
	const imgMng = new ImageMng();

	$(document).ready(function() {
		initImgs();
	});

	var initImgs = function() {
		//small images
		const smallImgIDs = [ '#s-Base', '#s-Front', '#s-Rear', '#s-Right', '#s-Left', '#s-Top', '#s-Bottom' ];
		smallImgIDs.forEach(function(smallImgId) {
			var smallImgs = document.querySelectorAll(smallImgId);
			smallImgs.forEach(function(smallImg) {
				smallImg.src = imgMng.getResizeDataurl(smallImg, '95', '56', 'jpeg');
			});
		});

		//medium images	
		const mediumImgIDs = [ '#m-Base', '#m-Front', '#m-Rear', '#m-Right', '#m-Left', '#m-Top', '#m-Bottom' ];
		mediumImgIDs.forEach(function(mediumImgID) {
			var mediumImgs = document.querySelectorAll(mediumImgID);
			mediumImgs.forEach(function(mediumImg) {
				mediumImg.src = imgMng.getResizeDataurl(mediumImg, '232', '232', 'jpeg');
			});
		});
	}
});

//goods-form handling
$(function() {
	var isError = {
		isErr : false,
		errString : ""
	};

	var goodsForm;

	$(document).ready(function() {
		goodsForm = document.getElementById('goods-form');
		eventBind();
	});

	var eventBind = function() {
		goodsForm.addEventListener("submit", function(e) {
			e.preventDefault();

			// construct a FormData object, which fires the formdata event
			new FormData(goodsForm);
		});

		// Get the form data from the event object		
		goodsForm.addEventListener("formdata", function(e) {
			/*
			 * 사전에 validation 체크를 해야한다
			 * 날짜,숫자,이미지 정합성과 포함되어 있는지 체크해야함
			 * 여기에 추가되어야 한다.
			*/
			let fd = e.formData;
			if ($("#isM").val()) {
				goodsUpdate(fd);
			} else {
				goodsRegist(fd);
			}
		});
	}

	var regist = function(fd, url, isError) {
		$.ajax({
			type : "POST",
			url : url,
			data : fd,
			contentType : false,
			processData : false,
			cache : false,
			success : function(data) {
				if (data) {
					isError.isErr = false;
				} else {
					isError.isErr = true;
					isError.errString = "상품등록 실패";
				}
			},
		/*
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}*/
		});
	}

	var update = function(fd, url, isError) {
		$.ajax({
			type : "POST",
			url : url,
			data : fd,
			contentType : false,
			processData : false,
			cache : false,
			success : function(data) {
				if (data) {
					isError.isErr = false;
				} else {
					isError.isErr = true;
					isError.errString = "상품수정 실패";
				}
			},
		/*error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}*/
		});
	}

	var goodsRegist = function(fd) {
		isError.isErr = false;
		regist(fd, "/admins/goods/goodsRegist.mwav", isError);

		if (!isError.isErr) {
			alert("상품등록 성공");
			window.location.href = "/admins/goods/goodsList.mwav";
		} else {
			alert(isError.errString);
		}
	}

	var goodsUpdate = function(fd) {
		isError.isErr = false;
		update(fd, "/admins/goods/goodsUpdate.mwav", isError);

		if (!isError.isErr) {
			alert("상품수정 성공");
			window.location.href = "/admins/goods/goodsList.mwav";
		} else {
			alert(isError.errString);
		}
	}

});