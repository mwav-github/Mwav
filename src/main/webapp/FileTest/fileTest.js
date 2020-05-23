
(function($) {

	var dropZone;
	var uploadForm;
	var uploadFiles;

	$(document).ready(function() {
		dropZone = document.getElementById('drop-zone');
		uploadForm = document.getElementById('js-upload-form');		
		uploadFiles = document.getElementById('js-upload-files');
		eventBind();
	});

	var eventBind = function() {
		uploadForm.addEventListener("submit", function(e) {			
	        e.preventDefault();
	        tempUpload(uploadFiles.files);
		});

		dropZone.ondrop = function(e) {			
			this.className = 'upload-drop-zone';
			
			e.preventDefault();
			var files = e.dataTransfer.files;
			uploadFiles.files = files;
			
			setPreview(files);
		}

		dropZone.ondragover = function() {
			this.className = 'upload-drop-zone drop';
			return false;
		}

		dropZone.ondragleave = function() {
			this.className = 'upload-drop-zone';
			return false;
		}
		
//		uploadFiles.change = function(e) {
//			e.preventDefault();
//			var files = e.dataTransfer.files;
//			this.files = files;
//		}
	}

	var tempUpload = function(files) {
		
		if (files == null || files.length == 0) {
			alert('파일이 없습니다.');
			return;
		}			
		
		// 폼에 데이터를 추가하기 위해 (파일을 전송하기 전 정보 유지)
		var fd = new FormData();
		fd.append(files[0].name, files[0]);		
		
		$.ajax({
			type : "POST",
			//url : "/FileTestV2/TempUpload.mwav", //Upload URL
			// url : "/FileTestV2/DeleteFile.mwav", //Upload URL
			url : "/FileTestV2/Test.mwav", //Upload URL
			data : fd,
			contentType : false,
			processData : false,
			cache : false,
			success : function(data) {
				if (data) {
					alert('성공');
				} else {
					alert('실패');
				}
			}
		});
		
		$('#modalUploadImages').modal('hide');
		
		// 읽기
	    var reader = new FileReader();
	    reader.readAsDataURL(files[0]);

	    //로드 한 후
	    var imgVal = $("#images_position").val();
	    var imgId = "#";
	    imgId = imgId.concat(imgVal);
	    
	    var smallImgId = "#s-";
	    smallImgId = smallImgId.concat(imgVal);
	    
	    reader.onload = function  () {
	        var img = document.querySelector(imgId);
	        img.src = reader.result;	        
	        
	        var smallImg = document.querySelector(smallImgId);
	        smallImg.src = reader.result;	
	        resizeImage(smallImg);
	    };
	}	
	
	function resizeImage(img) {
		var imgSrc = img.src;
		var canvas = document.createElement("canvas");        
		canvas.width = '154';
        canvas.height = '90';
		
		var ctx = canvas.getContext("2d");
        ctx.drawImage(img, 0, 0, '154', '90');
        
        var dataurl = canvas.toDataURL("image/jpeg");
        img.src = dataurl;
	}	

	var setPreview = function(files) {
		var img = $('<img/>', {
			id : 'dynamic',
			width : 250,
			height : 200
		});
		var file = files[0];
		var reader = new FileReader();
		// Set preview image into the popover data-content
		reader.onload = function(e) {
			$(".image-preview-input-title").text("Change");
			$(".image-preview-clear").show();
			$(".image-preview-filename").val(file.name);
			img.attr('src', e.target.result);
			$(".image-preview").attr("data-content", $(img)[0].outerHTML).popover("show");
		}
		reader.readAsDataURL(file);
	}
	
})(jQuery);
