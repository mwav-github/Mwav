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
<link rel="stylesheet" href="fileTest.css">

<script src="/resources/JsFramework/jQuery/jquery-1.11.0.js"></script>
<script src="/resources/JsFramework/Bootstrap/bootstrap.min.js"></script>
<script src="fileTest.js"></script>

</head>
<body>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<strong>Upload Files</strong>
			</div>
			<div class="panel-body">

				<!-- Standar Form -->
				<h4>Select files from your computer</h4>
				<form action="" method="post" enctype="multipart/form-data" id="js-upload-form">
					<div class="form-inline">
						<div class="form-group">
							<input type="file" name="files" id="js-upload-files">
						</div>
							<button type="submit" class="btn btn-sm btn-primary" id="js-upload-submit">Upload files</button>
						</div>
				</form>

				<!-- Drop Zone -->
				<h4>Or drag and drop files below</h4>
				<div class="upload-drop-zone" id="drop-zone">Just drag and drop files here</div>

				<!-- Progress Bar
				<div class="progress">
					<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
						<span class="sr-only">60% Complete</span>
					</div>
				</div>
				-->

				<!-- Upload Finished -->
				<div class="js-upload-finished">
					<h3>Processed files</h3>
					<div class="list-group" id="upload-finish-file">
						<!-- 
						<a href="#" class="list-group-item list-group-item-success">image-02.jpg
							<button type="button" aria-label="Close" class="close pull-right"><span aria-hidden="true"></span></button> 
							<span class="badge alert-success pull-right">Success </span>
						</a>
						-->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->

</body>
</html>
