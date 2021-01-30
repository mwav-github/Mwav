<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<style>
body {
	padding: 30px 0px;
}

#lightbox .modal-content {
	display: inline-block;
	text-align: center;
}

#lightbox .close {
	opacity: 1;
	color: rgb(255, 255, 255);
	background-color: rgb(25, 25, 25);
	padding: 5px 8px;
	border-radius: 30px;
	border: 2px solid rgb(255, 255, 255);
	position: absolute;
	top: -15px;
	right: -55px;
	z-index: 1032;
}
</style>
</head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="/resources/JsFramework/Bootstrap/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="/resources/JsFramework/jQuery/jquery-1.11.0.js"></script>

<script>
	$(document).ready(function() {
		var $lightbox = $('#lightbox');

		$('[data-target="#lightbox"]').on('click', function(event) {
			var $img = $(this).find('img'), src = $img.attr('src'), alt = $img.attr('alt'), css = {
				'maxWidth' : $(window).width() - 100,
				'maxHeight' : $(window).height() - 100
			};

			$lightbox.find('.close').addClass('hidden');
			$lightbox.find('img').attr('src', src);
			$lightbox.find('img').attr('alt', alt);
			$lightbox.find('img').css(css);
		});

		$lightbox.on('shown.bs.modal', function(e) {
			var $img = $lightbox.find('img');

			$lightbox.find('.modal-dialog').css({
				'width' : $img.width()
			});
			$lightbox.find('.close').removeClass('hidden');
		});
	});
</script>
<div id="lightbox" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<button type="button" class="close hidden" data-dismiss="modal" aria-hidden="true">×</button>
		<div class="modal-content">
			<div class="modal-body">
				<img src="" alt="" />
			</div>
		</div>
	</div>
</div>
</html>