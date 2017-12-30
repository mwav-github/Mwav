<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script type="text/javascript">

$(document).ready(function() {
    var $lightbox = $('#lightbox');
   
    $('[data-target="#lightbox"]').on('click', function(event) {
        var $img = $(this).find('img'), 
            src = $img.attr('data-image'),
            alt = $img.attr('alt');
           /*  css = {
                //'maxWidth': $(window).width() - 100,
                'maxHeight': $(window).height() - 100
            }; */
    
        
        $lightbox.find('.close').addClass('hidden');
        $lightbox.find('img').attr('src', src);
        $lightbox.find('img').attr('alt', alt);
        //$lightbox.find('.modal-body').css(css);
        //$lightbox.find('img').css(css);
    });
    
    $lightbox.on('shown.bs.modal', function (e) {
        var $img = $lightbox.find('img');
        
        //$lightbox.find('.modal-dialog').css({'width': $img.width()});
        $lightbox.find('.modal-body').css({'max-height': ($(window).height() * 0.8)});
        //$lightbox.find('.modal-body').css({'max-height': '70%'});
        $lightbox.find('.close').removeClass('hidden');
    });
});
</script>

<style>
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
	right: 0px;
	z-index: 1032;
}

#lightbox a.zoom:hover img {
	transform: scale(1.3);
	-ms-transform: scale(1.3);
	-webkit-transform: scale(1.3);
	-o-transform: scale(1.3);
	-moz-transform: scale(1.3);
}

#lightbox a.zoom span.overlay {
	position: absolute;
	top: 0;
	left: 0;
	visibility: hidden;
	height: 100%;
	width: 100%;
	background-color: #000;
	opacity: 0;
	transition: opacity .25s ease-out;
	-moz-transition: opacity .25s ease-out;
	-webkit-transition: opacity .25s ease-out;
	-o-transition: opacity .25s ease-out;
}
</style>


<%--modal-open이 보통 열리면서 body의 스크롤을 감쳐줜다 !! 
    추가로 모달을 오픈하는곳에 아래 저것까지 설정해야 body역시 먹는다. 
 --%>
 
 
<div id="lightbox" class="modal fade lightbox" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true" style="overflow:hidden;">
	<div class="modal-dialog">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<i class="fa fa-times" aria-hidden="true"></i>
		</button>
		<div class="modal-content">
			<div class="modal-body" style="overflow:auto" >
				<img src="" alt="" class="img-responsive" />
			</div>
		</div>
	</div>
</div>

