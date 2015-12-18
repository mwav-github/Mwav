// JavaScript Document
//----Responsive web [Responsive section and image]----
// Bang In Hye  14.07.23
$(document).on('ready', function() {

	// global variables(window)
	orgwindowWidth = 996;// 996 ,1280
	orgwindowHeight = 700;// 800, 720

	// Set section background
	secbackground();
	// Resize with loading

	do_All();
	// variable for checking time
	var autoTime;
	$(window).on('resize', function() {
		// reset time
		clearTimeout(autoTime);
		// After 0.3sec, do resize all
		autoTime = setTimeout(function() {
			do_All();
		}, 300);
		// Trigger resize handlers.
	}).trigger('resize');
	// ready
});



/**
 * //------------------jquery.flexverticalcenter.js---------------------
 */
/*global jQuery */
/*!
 * FlexVerticalCenter.js 1.0
 *
 * Copyright 2011, Paul Sprangers http://paulsprangers.com
 * Released under the WTFPL license
 * http://sam.zoy.org/wtfpl/
 *
 * Date: Fri Oct 28 19:12:00 2011 +0100
 */
(function($) {

	$.fn.flexVerticalCenter = function(options) {
		var resizer;
		var settings = $.extend({
			// the attribute to apply the calculated value to
			cssAttribute : 'margin-top',
			//the number of pixels to offset the vertical alignment by
			verticalOffset : 0,
			// a selector representing the parent to vertically center this element within
			parentSelector : null,
			// a default debounce timeout in milliseconds (controlTime 지정으로 필요 없다.)
			debounceTimeout : 3000
		}, options || {});

		//debounce : 바운스 효과 제거 
		var debounce;

		var size1 = $(".ver_align1");
		return this.each(function() {

			// store the object
			var $this = $(this);
			//위치 조정을 적합하기 위해 임의 지정
			if (size1) {
				size1.css('top', "5%");
			}

			// recalculate the distance to the top of the element to keep it centered
			resizer = function() {

				var parentHeight = (settings.parentSelector) ? $this.parents(
						settings.parentSelector).first().height() : $this
						.parent().height();
				$this.css(settings.cssAttribute, (((parentHeight - $this
						.height()) / 2) + parseInt(settings.verticalOffset)));
			};

			// Call once to set.
			//한 article 에서 여러번 호출
			resizer();

			// Apply a load event to images within the element so it fires again after an image is loaded
			$this.find('img').load(resizer);
		});
	};

})(jQuery);


/**
 * //------------------jquery.parallxscrolling.js---------------------
 */
/*! Copyright (c) 2013 Brandon Aaron (http://brandon.aaron.sh)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Version: 3.1.12
 *
 */
/*! Copyright (c) 2013 Brandon Aaron (http://brandon.aaron.sh)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Version: 3.1.12
 *
 */
$(function() {
	(function($) {
		var types = [ 'DOMMouseScroll', 'mousewheel' ];
		if ($.event.fixHooks) {
			for ( var i = types.length; i;) {
				$.event.fixHooks[types[--i]] = $.event.mouseHooks; /* http://learn.jquery.com/events/event-extensions/*/
			}
			//휠 클릭 금지 메서드 
			//click이벤트는 좌클릭만 가능하므로, mousedown이벤트를 사용
			$(document).mousedown(function(e) {  
			
			// 1:좌클릭, 2:휠클릭, 3:우클릭
			if(e.which === 2){

			//파이어폭스   , 윈도우 제공 등 기본이벤트를 막는다.	
			e.preventDefault();  
			
			//사용자 정의 이벤트 막는다.
			e.stopPropagation();
			
			e.returnValue=false; //IE
			}
			
		});
		}
		$.event.special.mousewheel = {
			setup : function() {
				if (this.addEventListener) {
					for ( var i = types.length; i;) {
						this.addEventListener(types[--i], handler, false);
					}
				} else {
					this.onmousewheel = handler;
				}
			},
			teardown : function() {
				if (this.removeEventListener) {
					for ( var i = types.length; i;) {
						this.removeEventListener(types[--i], handler, false);
					}
					//alert('3');
				} else {
					//alert('4');
					this.onmousewheel = null;
				}
			}
		};
		//두 개 이상 객체는 합친다.
		$.fn.extend({  
			resize : function(fn) {
				return fn ? this.on("resize", fn) : this
						.trigger("resize");
			},
			mousewheel : function(fn) {
				return fn ? this.on("mousewheel", fn) : this
						.trigger("mousewheel");
			},
			// 이전에 연결된 이벤트를 해제한다.
			unmousewheel : function(fn) {
				return this.off("mousewheel", fn); 
			}
		});
		function handler(event) {
			var orgEvent = event || window.event, args = [].slice.call(
					arguments, 1), delta = 0, returnValue = true, deltaX = 0, deltaY = 0;
			event = $.event.fix(orgEvent);
			event.type = "mousewheel";
			if (orgEvent.wheelDelta) {
				delta = orgEvent.wheelDelta / 120;
			}
			if (orgEvent.detail) {
				delta = -orgEvent.detail / 3;
			}
			deltaY = delta;
			if (orgEvent.axis !== undefined
					&& orgEvent.axis === orgEvent.HORIZONTAL_AXIS) {
				deltaY = 0;
				deltaX = -1 * delta;
			}
			if (orgEvent.wheelDeltaY !== undefined) {
				deltaY = orgEvent.wheelDeltaY / 120;
			}
			if (orgEvent.wheelDeltaX !== undefined) {
				deltaX = -1 * orgEvent.wheelDeltaX / 120;
			}
			args.unshift(event, delta, deltaX, deltaY); 
			return ($.event.dispatch || $.event.handle).apply(this, args);
		}
	})(jQuery);



//resize 에 대해서 유지를 못하는 부분을 해소 하기 위한 Function 
//: 즉 scrolling 과 분리 

	var lastAnimation = 0;
	var animationTime = 1000; // in ms
	var quietPeriod = 200; // in ms, time after animation to ignore mousescroll

	
	
	//스크롤링에 관한 이벤트 Function
	var Parallax = {  
			
		utils : {
			doSlide : function(aa) {
				/* position() : DOM(Document Object Model)에 포함되는 요소의 좌표 */
				var top = aa.position().top; 
				/*alert('1'+top1);
				var top2 = $('.slided').scrollTop();
				alert('2'+top2);
				=> 위에 것은 안나온다.
				*/
				//진행 중이 이벤트 정지효과 setting
				$('#section-wrapper').stop().animate(  
						{
							top : -top  
						},
						// 속도 1/1000단위
						1000,  	
						// 효과
						'swing', 
						//callback Function
						function() { 
							//.siblings()-DOM 트리 상의 형제 요소들을 찾는다.
							aa.addClass('slided').siblings(    
									// 조건에 일치하는 요소 집합의 각 요소들의 클래스를 DOM에서 제거
									'section.sec').removeClass('slided');  
									}); //animate 종료 
				
			}
		},
		//최초 1회 or reload 즉 자바스크립트 실행시 적용
		fn : {  
			//최초 1회
			setHeights : function() { 		
			},
			
			onSiteScroll : function() {
				var aa = null;
				$('#section-wrapper').mousewheel( 
						
						//delta는 up = 1 // down = -1 이다.
						function(event, delta) {  
							var timeNow = new Date().getTime();// 내부에 선언해줘야 한다. ~! 위에 전역변수 위치에 하면 안된다.
							/*//이벤트를 취소할 수 있는 경우, 이벤트의 전파를 막지않고 그 이벤트를 취소
							event.preventDefault();*/
							// Cancel scroll if currently animating or within quiet period
						    if(timeNow - lastAnimation < quietPeriod + animationTime) { // => 이벤트가 종료 되지 않았을 경우
						    	/*console.log('11');
						    	console.log('timeNow'+timeNow);
						    	console.log('lastAnimation'+lastAnimation);
						    	console.log('timeNow-lastAnimation '+Number(timeNow-lastAnimation));
						    	
						    	console.log('quietPeriod'+animationTime);
						    	console.log('animationTime'+animationTime);*/
						        event.preventDefault();
						        return;
						        
						    }
							
						
							//scroll = down
							if (delta < 0) {  
								//삼항연산자, 길이가 있으면 slided 선택 / 없으면 section1 선택
								aa = ($('.slided').length) ? $('.slided')
										: $('#section1');
								lastAnimation = timeNow;
								//console.log('lastAnimation'+lastAnimation);
								
								////next() .next() 함수는 DOM 트리를 기준으로 하여 바로 다음 요소를 새로운 jQuery 객체로 생성
								var next = (aa.next().length) ? aa
										.next() : $('#section1');  
								Parallax.utils.doSlide(next); 
								
							} else if (delta > 0) {
								aa = ($('.slided').length) ? $('.slided')
										: $('#section1');
								lastAnimation = timeNow;
								
								var prev = (aa.prev().length) ? aa
										.prev() : $('#section5');   
								Parallax.utils.doSlide(prev);
								
								/*
							          객체 안의 값 출력할 때 
							
								   for (myKey in next){
                    	           alert ("next["+myKey +"] = "+next[myKey]);
                                   }
                            	*/
							}
						});

			}
		},

		init : function() {
			// 연산차 타입 일치여부 확인
			for ( var prop in this.fn) {
				if (typeof this.fn[prop] === 'function') {    
					this.fn[prop]();
				}
			}
		}
	};
	//초기화 시키는과 동시에 시작한다. 
	Parallax.init();  	
//]]>  
});

function do_top(){
	
	var aa = ($('.slided').length) ? $('.slided'): $('#section1');
		var top = aa.position().top; /* position() : DOM(Document Object Model)에 포함되는 요소의 좌표,  offset()은 document 안에서 현재 위치 이다. */
		$('#section-wrapper').css("top", -top);	
}




//jQueryMobile-SwipeUpDown
//----------------------------------
//
//Copyright (c)2012 Donnovan Lewis
//Distributed under MIT license
//
(function() {
	// initializes touch and scroll events
	var supportTouch = $.support.touch, scrollEvent = "touchmove scroll", 
	        touchStartEvent = supportTouch = "touchstart", 
			touchStopEvent = supportTouch = "touchend", 
			touchMoveEvent = supportTouch = "touchmove"; //오른쪽 저거 함으로써 피시에서도 클릭후 드래그하면 된다.  안먹히고 싶으면 삭제해라

	// handles swipeup and swipedown
	$.event.special.swipeupdown = {
		setup : function() {
			var thisObject = this;
			var $this = $(thisObject);

			$this
					.bind(
							touchStartEvent,
							function(event) {
								var data = event.originalEvent.touches ? event.originalEvent.touches[0]
										: event, start = {
									time : (new Date).getTime(),
									coords : [ data.pageX, data.pageY ],
									origin : $(event.target)
								}, stop;

								function moveHandler(event) {
									if (!start) {
										return;
									}

									var data = event.originalEvent.touches ? event.originalEvent.touches[0]
											: event;
									stop = {
										time : (new Date).getTime(),
										coords : [ data.pageX, data.pageY ]
									};

									// prevent scrolling
									if (Math.abs(start.coords[1]
											- stop.coords[1]) > 10) {
										event.preventDefault();
									}
								}

								$this
										.bind(touchMoveEvent, moveHandler)
										.one(
												touchStopEvent,
												function(event) {
													$this.unbind(
															touchMoveEvent,
															moveHandler);
													if (start && stop) {
														if (stop.time
																- start.time < 1000
																&& Math
																		.abs(start.coords[1]
																				- stop.coords[1]) > 30
																&& Math
																		.abs(start.coords[0]
																				- stop.coords[0]) < 75) {
															start.origin
																	.trigger(
																			"swipeupdown")
																	.trigger(
																			start.coords[1] > stop.coords[1] ? "swipeup"
																					: "swipedown");
															
														} /*else {
															start.origin.event
																	.preventDefault();

															
															 
															// Original swipe event, which doesn’t seem to include swipe direction
															if ( stop.time - start.time < 1000 && 
																Math.abs( start.coords[0] - stop.coords[0]) > 30 &&
																Math.abs( start.coords[1] - stop.coords[1]) < 75 ) {
															start.origin
															.trigger( "swipe" )
															
															.trigger( start.coords[0] > stop.coords[0] ? "swipeleft" : "swiperight" );
															}
															 

														}*/
													}
													start = stop = undefined;
												});
							});
		}
	};

	//Adds the events to the jQuery events special collection
	$.each({
		swipedown : "swipeupdown",
		swipeup : "swipeupdown"
	}, function(event, sourceEvent) {
		$.event.special[event] = {
			setup : function() { //위에 setup 부분에서 
				$(this).bind(sourceEvent, $.noop);
			}
		};
		
	});
	function m_doTop(aa) {
		//alert('출력');

	    

		/* position() : DOM(Document Object Model)에 포함되는 요소의 좌표 */
		var top = aa.position().top;
		 /*alert('top'+top);*/
		$('#section-wrapper').stop().animate({
			top : -top
		},
		// 속도 1/1000단위
		1000,
		// 효과
		'swing',
		//callback Function
		function() {
			//console.log('1');
			//.siblings()-DOM 트리 상의 형제 요소들을 찾는다.
			aa.addClass('slided').siblings(
			// 조건에 일치하는 요소 집합의 각 요소들의 클래스를 DOM에서 제거
			'section.sec').removeClass('slided');
		}); //animate 종료 

		
	}
		var aa= null;
	    $(document).on('swipedown', '.sec', function() {   // 이벤트가 여기에 넣으면 계속 감지가 아니라 1회 감지후 결과물 제출이라 !! => 계속 감지로 할 수 있겠금 변경해줘야 한다. 
			//alert("swipeup..");
	    	aa = ($('.slided').length) ? $('.slided') : $('#section1');

			var prev = (aa.prev().length) ? aa.prev() : $('#section5');

			aa = prev;
			
			m_doTop(aa);
			
		});
			
		$(document).on('swipeup', '.sec', function() {
			aa = ($('.slided').length) ? $('.slided') : $('#section1');
			//alert('1 :aa='+aa);

			var next = (aa.next().length) ? aa.next() : $('#section1');

			aa = next;
			//alert('2 :aa='+aa);
			m_doTop(aa);

		});
		
})();


// resize 대상 함수
function do_All() {

	// section image size 조정
	do_ResizeAll();

	do_top();

	//modalimage(); 추후 적용 내용

	// text size 조정
	res_Text();

	$('.itemTest').flexVerticalCenter({
		cssAttribute : 'padding-top'
	});

};

/**
 * //------------------res_orientation.js---------------------
 * 유의사항 : 해당함수 호출지점보다 위에 와야 한다.
 */

function orientation_Ch(status, num1Method, num2Method) {

	// PC 종류
	var filter = "win16|win32|win64|mac|macintel";

	// jquery.mobile orientationchange event
	$(window)
			.on(
					'orientationchange',
					function(event) {
						// pc 및 device check
						if (navigator.platform) {
							// 모바일 접속
							if (event.orientation
									&& (filter.indexOf(navigator.platform
											.toLowerCase()) < 0)) {
								if (event.orientation == 'portrait') { // 수직
									// do something
									num2Method();
								} else if (event.orientation == 'landscape') { // 수평
									// do something else
									num1Method();
								}
								// PC접속
							} else {
								// 조건 일치
								if (status == 1) {
									num1Method();
								}
								// 조건 불일치
								else {
									num2Method();
								}
							}
						}
					}).trigger('orientationchange');
}


/**
 * //------------------res_image.js---------------------
 */
/*Functions*/

//set section background
function secbackground() {
	// change properties of background
	$(".sec").css('background-size', "cover");
	$(".sec").css('background-repeat', "no-repeat");
	$(".sec").css('background-position', "center");
}
// Resize all elements
function do_ResizeAll() {
	// resize section size
	changeSectionSize();

	// table24(4 column) reposition
	tableRepos();

	// resize image size
	resizeImageSize();
}
// resize section size
function changeSectionSize() {
	// get window size
	var windowW = $(window).width();
	var windowH = $(window).height();
	// change width and height of section
	$(".sec").css('width', windowW);
	$(".sec").css('height', windowH);
}
// table24(4 column) reposition
function tableRepos() {
	var secW = $(".sec").width();
	var status = 600;

	if (secW > 600) {
		status = 1; // 넘을때
	} else {
		status = 0; // 넘지 않을때 
	}

	function num1() {
		$(".res_table24 #res_trinner").slice(2).appendTo(".res_trinner1");
	}
	;
	function num2() {
		$(".res_table24 #res_trinner").slice(2).appendTo(".res_trinner2");
	}
	;

	orientation_Ch(status, num1, num2);
}
// resize image size
function resizeImageSize() {

	var secW = $(".sec").width();
	var secH = $(".sec").height();
	// 사이즈의 최대치는 선호 해상도로 설정
	if (secW > orgwindowWidth) {
		secW = orgwindowWidth;
	}
	if (secH > orgwindowHeight) {
		secH = orgwindowHeight;
	}
	var image = $(".res_image");// array of class="res_image"

	// 선호 해상도 (이미지가 정상적으로 보이는 기준점 해상도)
	var preferredSize = orgwindowWidth * orgwindowHeight;// 800, 720
	// 현재 해상도
	var currentSize = secW * secH;
	// 비율
	var scalePercentage = Math.sqrt(currentSize) / Math.sqrt(preferredSize);

	// max ofscalePercentage :1
	if (scalePercentage > 1) {
		scalePercentage = 1;
	}
	// 설정한 윈도우 사이즈에서의 이미지가 가장 큰 이미지 사이즈가 된다.
	if (secW > orgwindowWidth) {
		secW = orgwindowWidth;
	}
	// 현재 화면 비율
	var ratioW = secW / orgwindowWidth;

	for ( var i = 0; i < image.length; i++) {

		console.log('이미지 크기중');
		var imgwidth = image[i].naturalWidth;// 이미지 원본사이즈 너비
		// 이미지 사이즈가 선호사이즈보다 클수 없도록!!
		console.log('imgwidth종류'+image[i]);
		console.log('imgwidth'+image[i].naturalWidth);
		if (imgwidth > orgwindowWidth) {
			imgwidth = orgwindowWidth;
		}
		// 너비와 해상도 비율 고려(높이까지 고려하여 크기조절)
		if (imgwidth * scalePercentage < imgwidth * ratioW) {// 해상도 비율 고려
			$(image[i]).css('width', imgwidth * scalePercentage);
			$(image[i]).css('height', "auto");
		} else {// 현재 화면 비율 고려
			$(image[i]).css('width', imgwidth * ratioW);
			$(image[i]).css('height', "auto");
		}
	}
}

/**
 * //------------------res_font.js---------------------
 */

function res_Text() {

	//선호 해상도 (이미지가 정상적으로 보이는 기준점 해상도-자동화 예정)
	var preferredSize = 1280 * 720;

	var secW = $(".sec").width();
	var secH = $(".sec").height();

	//현재  해상도 
	var currentSize = secW * secH;

	//해상도에 따른 이미지 비율
	var scalePercentage = Math.sqrt(currentSize) / Math.sqrt(preferredSize);

	//지정 폰트
	var newFontSize = 0;

	//선호 폰트 사이즈 (자동화 예정)
	var preferredFontSize = [ 650, 460, 185, 153, 139, 108 ]; // 선호폰트 사이즈 % (/100 하면 em)

	newFontSize = (preferredFontSize[0] * scalePercentage) / 100;
	$(".large1").css("font-size", newFontSize + 'em');

	//큰 폰트 (기존 60px)
	newFontSize = (preferredFontSize[1] * scalePercentage) / 100;
	$(".large2").css("font-size", newFontSize + 'em');

	//중간 폰트 (기존 24px) 
	newFontSize = (preferredFontSize[2] * scalePercentage) / 100;
	$(".medium1").css("font-size", newFontSize + 'em');

	//중간 폰트 (기존 20px)
	newFontSize = (preferredFontSize[3] * scalePercentage) / 100;
	$(".medium2").css("font-size", newFontSize + 'em');

	//작은 폰트 (기존 18px)
	newFontSize = (preferredFontSize[4] * scalePercentage) / 100;
	$(".small1").css("font-size", newFontSize + 'em');

	//작은 폰트 (기존 14px)
	newFontSize = (preferredFontSize[5] * scalePercentage) / 100;
	$(".small2").css("font-size", newFontSize + 'em');
}

/**
 * //------------------res_modal.js---------------------
 */

function modalimage() {
	if ($(window).width() > 480) {
		$('img.abc.change').addClass('itemTest');
		$('p.change').addClass('itemTest');
		if ($(window).width() > 600) {
			$('p.change').removeClass("small2").addClass("small1");

		}
	} else {
		$('img.abc.change').removeClass('itemTest');
		$('p.change').removeClass('itemTest');
	}
}

//------------------jquery.remodal.js---------------------
/*! Remodal - v0.1.7 - 2014-07-14
 * https://github.com/VodkaBears/remodal
 * Copyright (c) 2014 VodkaBears; */
(function($) {
	"use strict";

	/**
	 * Remodal settings
	 */
	var pluginName = "remodal", defaults = {
		hashTracking : true,
		closeOnConfirm : true,
		closeOnCancel : true
	};

	/**
	 * Special plugin object for instances.
	 * @type {Object}
	 */
	$[pluginName] = {
		lookup : []
	};

	var current, // current modal
	scrollTop; // scroll position

	/**
	 * Get transition duration in ms
	 * @return {Number}
	 */
	var getTransitionDuration = function($elem) {
		var duration = $elem.css('transition-duration')
				|| $elem.css('-webkit-transition-duration')
				|| $elem.css('-moz-transition-duration')
				|| $elem.css('-o-transition-duration')
				|| $elem.css('-ms-transition-duration') || 0;
		var delay = $elem.css('transition-delay')
				|| $elem.css('-webkit-transition-delay')
				|| $elem.css('-moz-transition-delay')
				|| $elem.css('-o-transition-delay')
				|| $elem.css('-ms-transition-delay') || 0;

		return (parseFloat(duration) + parseFloat(delay)) * 1000;
	};

	/**
	 * Get a scrollbar width
	 * @return {Number}
	 */
	var getScrollbarWidth = function() {
		if ($(document.body).height() <= $(window).height()) {
			return 0;
		}

		var outer = document.createElement("div");
		outer.style.visibility = "hidden";
		outer.style.width = "100px";
		document.body.appendChild(outer);

		var widthNoScroll = outer.offsetWidth;
		// force scrollbars
		outer.style.overflow = "scroll";

		// add innerdiv
		var inner = document.createElement("div");
		inner.style.width = "100%";
		outer.appendChild(inner);

		var widthWithScroll = inner.offsetWidth;

		// remove divs
		outer.parentNode.removeChild(outer);

		return widthNoScroll - widthWithScroll;
	};

	/**
	 * Lock screen
	 */
	var lockScreen = function() {
		$(document.body).css("padding-right", "+=" + getScrollbarWidth());
		$("html, body").addClass(pluginName + "_lock");
	};

	/**
	 * Unlock screen
	 */
	var unlockScreen = function() {
		$(document.body).css("padding-right", "-=" + getScrollbarWidth());
		$("html, body").removeClass(pluginName + "_lock");
	};

	/**
	 * Remodal constructor
	 */
	function Remodal(modal, options) {
		this.settings = $.extend({}, defaults, options);
		this.modal = modal;
		this.buildDOM();
		this.addEventListeners();
		this.index = $[pluginName].lookup.push(this) - 1;
		this.busy = false;
	}

	/**
	 * Build required DOM
	 */
	Remodal.prototype.buildDOM = function() {
		this.body = $(document.body);
		this.bg = $("." + pluginName + "-bg");
		this.modalClose = $("<a href='#'>").addClass(pluginName + "-close");
		this.overlay = $("<div>").addClass(pluginName + "-overlay");
		if (!this.modal.hasClass(pluginName)) {
			this.modal.addClass(pluginName);
		}

		this.modal.css("visibility", "visible");
		this.modal.append(this.modalClose);
		this.overlay.append(this.modal);
		this.body.append(this.overlay);

		this.confirm = this.modal.find("." + pluginName + "-confirm");
		this.cancel = this.modal.find("." + pluginName + "-cancel");

		var tdOverlay = getTransitionDuration(this.overlay), tdModal = getTransitionDuration(this.modal), tdBg = getTransitionDuration(this.bg);
		this.td = tdModal > tdOverlay ? tdModal : tdOverlay;
		this.td = tdBg > this.td ? tdBg : this.td;
	};

	/**
	 * Add event listeners to the current modal window
	 */
	Remodal.prototype.addEventListeners = function() {
		var self = this;

		this.modalClose.bind("click." + pluginName, function(e) {
			e.preventDefault();
			self.close();
		});

		this.cancel.bind("click." + pluginName, function(e) {
			e.preventDefault();
			self.modal.trigger("cancel");
			if (self.settings.closeOnCancel) {
				self.close();
			}
		});

		this.confirm.bind("click." + pluginName, function(e) {
			e.preventDefault();
			self.modal.trigger("confirm");
			if (self.settings.closeOnConfirm) {
				self.close();
			}
		});

		$(document).bind('keyup.' + pluginName, function(e) {
			if (e.keyCode === 27) {
				self.close();
			}
		});

		this.overlay.bind("click." + pluginName, function(e) {
			var $target = $(e.target);
			if (!$target.hasClass(pluginName + "-overlay")) {
				return;
			}

			self.close();
		});
	};

	/**
	 * Open modal window
	 */
	Remodal.prototype.open = function() {
		// check if animation is complete
		if (this.busy) {
			return;
		}
		this.busy = true;

		this.modal.trigger("open");

		var id = this.modal.attr("data-" + pluginName + "-id");
		if (id && this.settings.hashTracking) {
			scrollTop = $(window).scrollTop();
			location.hash = id;
		}

		if (current && current !== this) {
			current.overlay.hide();
			current.body.removeClass(pluginName + "_active");
		}
		current = this;

		lockScreen();
		this.overlay.show();

		var self = this;
		setTimeout(function() {
			self.body.addClass(pluginName + "_active");

			setTimeout(function() {
				self.busy = false;
				self.modal.trigger("opened");
			}, self.td + 50);
		}, 25);

	};

	/**
	 * Close modal window
	 */
	Remodal.prototype.close = function() {
		// check if animation is complete
		if (this.busy) {
			return;
		}
		this.busy = true;

		this.modal.trigger("close");

		if (this.settings.hashTracking
				&& this.modal.attr("data-" + pluginName + "-id") === location.hash
						.substr(1)) {
			location.hash = "";
			$(window).scrollTop(scrollTop);
		}

		this.body.removeClass(pluginName + "_active");

		var self = this;
		setTimeout(function() {
			self.overlay.hide();
			unlockScreen();

			self.busy = false;
			self.modal.trigger("closed");
		}, self.td + 50);
	};

	if ($) {
		$["fn"][pluginName] = function(opts) {
			var instance;
			this["each"]
					(function(i, e) {
						var $e = $(e);
						if ($e.data(pluginName) == null) {
							instance = new Remodal($e, opts);
							$e.data(pluginName, instance.index);

							if (instance.settings.hashTracking
									&& $e.attr("data-" + pluginName + "-id") === location.hash
											.substr(1)) {
								instance.open();
							}
						}
					});

			return instance;
		};
	}

	$(document).ready(
			function() {

				/**
				 * data-remodal-target opens a modal window with a special id without hash change.
				 */
				$(document).on(
						"click",
						"[data-" + pluginName + "-target]",
						function(e) {
							e.preventDefault();

							var elem = e.currentTarget, id = elem
									.getAttribute("data-" + pluginName
											+ "-target"), $target = $("[data-"
									+ pluginName + "-id=" + id + "]");

							$[pluginName].lookup[$target.data(pluginName)]
									.open();
						});

				/**
				 * Auto initialization of modal windows.
				 * They should have the 'remodal' class attribute.
				 * Also you can pass params into the modal throw the data-remodal-options attribute.
				 * data-remodal-options must be a valid JSON string.
				 */
				$(document).find("." + pluginName).each(
						function(i, container) {
							var $container = $(container), options = $container
									.data(pluginName + "-options");

							if (!options) {
								options = {};
							}

							$container[pluginName](options);
						});
			});

	/**
	 * Hashchange handling to show a modal with a special id.
	 */
	var hashHandler = function(e, closeOnEmptyHash) {
		var id = location.hash.replace("#", "");

		if (typeof closeOnEmptyHash === "undefined") {
			closeOnEmptyHash = true;
		}

		if (!id) {
			if (closeOnEmptyHash) {
				// check if we have currently opened modal and animation is complete
				if (current && !current.busy && current.settings.hashTracking) {
					current.close();
				}
			}
		} else {
			var $elem;

			// Catch syntax error if your hash is bad
			try {
				$elem = $("[data-" + pluginName + "-id="
						+ id.replace(new RegExp('/', 'g'), "\\/") + "]");
			} catch (e) {
			}

			if ($elem && $elem.length) {
				var instance = $[pluginName].lookup[$elem.data(pluginName)];

				if (instance && instance.settings.hashTracking) {
					instance.open();
				}
			}

		}
	};
	$(window).bind("hashchange." + pluginName, hashHandler);
})(window["jQuery"] || window["Zepto"]);
