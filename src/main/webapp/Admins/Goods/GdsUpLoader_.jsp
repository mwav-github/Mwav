<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- html 추가시키면 이상하게 꼬인다.  --%>


<script src="//oss.maxcdn.com/jquery.form/3.50/jquery.form.min.js"></script>
<%--http://malsup.github.io/jquery.form.js 
    https://github.com/malsup/form/
    
    자바스크립트 formdata
    
    및 위와 같이 jquery 플러그인 두가지방법이 크게있다 그러나 문제는 자바스크립트 formdata의 경우 ie9이하는 지원하지 않는다.
    http://malsup.com/jquery/form/
    http://stackoverflow.com/questions/5392344/sending-multipart-formdata-with-jquery-ajax
    http://hmkcode.com/spring-mvc-upload-file-ajax-jquery-formdata/
    
    progressbar
    http://www.danmorgan.net/programming/file-upload-progress-twitter-bootstrap-php/
--%>

<script>
	+function($) {
		'use strict';

		// UPLOAD CLASS DEFINITION
		// ======================

		var dropZone = document.getElementById('drop-zone');
		var uploadForm = document.getElementById('js-upload-form');

		var startUpload = function(files) {
			console.log(files)
		}

		uploadForm.addEventListener('submit', function(e) {
			var uploadFiles = document.getElementById('js-upload-files').files;
			e.preventDefault()

			startUpload(uploadFiles)
		})

		dropZone.ondrop = function(e) {
			e.preventDefault();
			this.className = 'upload-drop-zone';

			startUpload(e.dataTransfer.files)
		}

		dropZone.ondragover = function() {
			this.className = 'upload-drop-zone drop';
			return false;
		}

		dropZone.ondragleave = function() {
			this.className = 'upload-drop-zone';
			return false;
		}

	}(jQuery);
</script>


<script type="text/javascript">
	$(document).on('click', '#close-preview', function() {
		$('.image-preview').popover('hide');
		// Hover befor close the preview
		$('.image-preview').hover(function() {
			$('.image-preview').popover('show');
		}, function() {
			$('.image-preview').popover('hide');
		});
	});

	$(function() {
		// Create the close button
		var closebtn = $('<button/>', {
			type : "button",
			text : 'x',
			id : 'close-preview',
			style : 'font-size: initial;',
		});
		closebtn.attr("class", "close pull-right");
		// Set the popover default content
		$('.image-preview').popover({
			trigger : 'manual',
			html : true,
			title : "<strong>Preview</strong>" + $(closebtn)[0].outerHTML,
			content : "There's no image",
			placement : 'bottom'
		});
		// Clear event  콤마로 다중 사용 가능 or 조건
		$('.image-preview-clear, .fileclear').click(function() {
			$('.image-preview').attr("data-content", "").popover('hide');
			$('.image-preview-filename').val("");
			$('.image-preview-clear').hide();
			$('.image-preview-input input:file').val("");
			$(".image-preview-input-title").text("Browse");
			$("#messages").hide(); // browse 누를때는 show
		});

		// Create the preview image
		$(".image-preview-input input:file").change(
				function() {
					var img = $('<img/>', {
						id : 'dynamic',
						width : 250,
						height : 200
					});
					var file = this.files[0];
					var reader = new FileReader();
					// Set preview image into the popover data-content
					reader.onload = function(e) {
						$(".image-preview-input-title").text("Change");
						$(".image-preview-clear").show();
						$(".image-preview-filename").val(file.name);
						img.attr('src', e.target.result);
						$(".image-preview").attr("data-content",
								$(img)[0].outerHTML).popover("show");
					}
					reader.readAsDataURL(file);
				});
	});
</script>

<style>
/* layout.css Style */
.upload-drop-zone {
	height: 200px;
	border-width: 2px;
	margin-bottom: 20px;
}

/* skin.css Style*/
.upload-drop-zone {
	color: #ccc;
	border-style: dashed;
	border-color: #ccc;
	line-height: 200px;
	text-align: center
}

.upload-drop-zone.drop {
	color: #222;
	border-color: #222;
}
</style>
<div class="container">
	<div class="modal fade modalUploadImages" id="modalUploadImages">
		<div class="modal-dialog">
			<div class="modal-content">
				<form id="insertFileForm" method="post"
					enctype="multipart/form-data" role="form"
					action="/common/fileUpLoader.mwav">


					<input type="hidden" id="images_position" name="images_position"
						value="" />

					<%--
					 GdsCellForm.jsp와 다른 페이지만 한페이지에서 include 하기 때문에 아래와 같이 goods_id 호출이 가능하다.
					 --%>
					<input type="hidden" name="goods_id" id="goods_id"
						value="${updateGdsForm.goods_id}" /> <input type="hidden"
						name="file_classification" value="goods" />
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">Upload Photo</h4>
					</div>
					<div class="modal-body">
						<div id="messages"></div>
						<div class="enter"></div>
						<div
							class="col-xs-12 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2"
							id="filebody">
							<!-- image-preview-filename input [CUT FROM HERE]-->

							<div class="panel panel-default">
								<div class="panel-heading">
									<strong>Upload Files</strong> <small>Bootstrap files
										upload</small>
								</div>
								<div class="panel-body">
									<div
										class="col-xs-12 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2"
										id="filebody">
										<!-- Standar Form -->
										<h4>Select files from your computer</h4>
										<form action="" method="post" enctype="multipart/form-data"
											id="js-upload-form">
											<!-- Drop Zone -->
											<h4>Or drag and drop files below</h4>
											<div class="upload-drop-zone" id="drop-zone">Just drag
												and drop files here</div>
										</form>
									</div>
								</div>
							</div>


							<!-- /input-group image-preview [TO HERE]-->

						</div>
					</div>
					<div class="enter"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary" id="fileUploaderBtn"
							onclick="insertFileUploader()">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
