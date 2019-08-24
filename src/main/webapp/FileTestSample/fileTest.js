(function($) {
	// UPLOAD CLASS DEFINITION
	// ======================
	var dropZone;
	var uploadForm;

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
			e.preventDefault();
			this.className = 'upload-drop-zone';

			tempUpload(e.dataTransfer.files);
		}

		dropZone.ondragover = function() {
			this.className = 'upload-drop-zone drop';
			return false;
		}

		dropZone.ondragleave = function() {
			this.className = 'upload-drop-zone';
			return false;
		}
	}

	var tempUpload = function(files) {
		console.log(files);
		tempFileUpload(files);
		setSuccessBar(files);
	}

	var setSuccessBar = function(files) {
		var success_tag = "";
		for (var i = 0; i < files.length; i++) {
			success_tag += "<a href='#' class='list-group-item list-group-item-success'><span class='badge alert-success pull-right'>Success</span>"
					+ files[i].name + "</a>";
		}

		if (success_tag != null) {
			$("#upload-finish-file").append(success_tag);
		}
	}

	function tempFileUpload(files) {
		if (files == null || files.length == 0) {
			alert('파일이 없습니다.');
			return;
		}
		
		var fd = new FormData();
		fd.append(files[0].name, files[0]);		
		
		$.ajax({
			type : "POST",
			url : "/FileTestSample/TempUpload.mwav", //Upload URL
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

	}

})(jQuery);