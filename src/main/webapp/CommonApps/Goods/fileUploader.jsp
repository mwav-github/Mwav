<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>drag_drop</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />

<link rel="stylesheet" href="/resources/JsFramework/Bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/CommonApps/Goods/fileUploader.css">

<script src="/resources/JsFramework/jQuery/jquery-1.11.0.js"></script>
<script src="/resources/JsFramework/Bootstrap/bootstrap.min.js"></script>
<script src="/CommonApps/Common/upload.js"></script>
<script src="/CommonApps/Goods/fileUploader.js"></script>
<script>
	
</script>
</head>
<body>
	<div class="container">
		<div class="modal fade modalUploadImages" id="modalUploadImages">
			<div class="modal-dialog">
				<div class="modal-content">
					<input type="hidden" id="images_position" name="images_position" value="" />

					<%--GdsCellForm.jsp와 다른 페이지만 한페이지에서 include 하기 때문에 아래와 같이 goods_id 호출이 가능하다.--%>
					<input type="hidden" name="goods_id" id="goods_id" value="${updateGdsForm.goods_id}" /> 
					<input type="hidden" name="file_classification" value="goods" />
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<strong>FileUpload</strong>
						</h4>
					</div>
					<div class="modal-body">
						<div class="panel panel-default">
							<div class="panel-heading">
								<strong>Drag & Drop or click to upload</strong>
							</div>
							<div class="panel-body">
								<!-- Drop Zone -->
								<div class="upload-drop-zone" id="drop-zone">Drag & drop files here …</div>
								<!-- Standar Form -->
								<form action="" method="post" enctype="multipart/form-data" id="js-upload-form">
									<div class="col-xs-12 col-md-12">
										<!-- image-preview-filename input [CUT FROM HERE]-->
										<div class="input-group image-preview">
											<input type="text" class="form-control image-preview-filename" disabled="disabled">
											<!-- don't give a name === doesn't send on POST/GET -->
											<span class="input-group-btn"> <!-- image-preview-clear button -->
												<button type="button" class="btn btn-default image-preview-clear" style="display: none;">
													<span class="glyphicon glyphicon-remove"></span> Clear
												</button> <!-- image-preview-input -->

												<div class="btn btn-default image-preview-input">
													<span class="glyphicon glyphicon-folder-open"></span> 
													<span class="image-preview-input-title">Browse</span> 
													<input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview" id="js-upload-files" />
													<input type="hidden" id="imgLocation" value="" />													
												</div>
												<button type="submit" class="btn btn-primary" id="js-upload-submit">Upload files</button>
											</span>
										</div>
										<!-- /input-group image-preview [TO HERE]-->
									</div>
								</form>
							</div>
							<div class="panel-footer">
								<!-- Upload Finished -->
								<div class="js-upload-finished">
									<div class="list-group" id="upload-finish-file"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- /container -->

</body>
</html>