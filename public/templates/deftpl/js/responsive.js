!function($){
	$(document).ready(function(){
		var select2 = $('.select2');
		if(select2.length !== 0){
			$.each(select2, function(){
				$(this).select2();
			});
		}
		window.timer = 0;
		tabs();
		
		$('textarea.redactor').redactor({
			maxHeight: 400 // pixels
		});
		setTimeout(function(){
			smartFloat();
		}, 300);
		
	});
	$(window).load(function(){
		scrolling(90);
	});
	$(window).resize(function(){
		clearTimeout(timer);
		timer = setTimeout(function(){
			tabs();
			scrolling(90);
			setTimeout(function(){
				smartFloat();
			}, 300);
		}, 300);
		
	});

	var tabs = function(){
		var tabsContainer = $('.tabs-panel');
		$.each(tabsContainer, function(key, container){
			var panel = $(this);
			var tabsNav = $(panel).find('.tab');
			tabsNav.click(function(){
				smartFloat();
				$(this)
					.addClass('active')
					.siblings('.tab').removeClass('active');
				$(panel).find('.tab-content').eq($(this).index())
					.addClass('active')
					.siblings('.tab-content').removeClass('active');
			});
		});
	}

	var smartFloat = function(){
		var source = $('.smart-float');
		$.each(source, function(){
			var sourceMargins = parseInt($(this).css('marginLeft')) + parseInt($(this).css('marginRight'));
			var sourceWidth = $(this).outerWidth() + sourceMargins;
			var parent = $(this).parent();
			var parentWidth = parent.innerWidth() - (parseInt(parent.css('paddingLeft')) + parseInt(parent.css('paddingRight')));
			var targets = parent.children('*:not(.smart-float)');
			var targetsCount = targets.length;
			$.each(targets, function(){
				var margins = parseInt($(this).css('marginLeft')) + parseInt($(this).css('marginRight')); 
				$(this).css({
					width: (parentWidth - sourceWidth) / targetsCount - margins - 1 + 'px',
					boxSizing: 'border-box',
					display: 'block',
					float: 'left'
				});
			});
		});
	}
	window.scrolling = function(speed){
		var containers = $('.scrolltarget');
		$.each(containers, function(key, container){
			$(this).css({
				overflow: 'hidden',
				position: 'relative'
			});
			var targetElements = $(container).children('*');
			if(!$(container).hasClass('wrapped')){
				$(targetElements).wrapAll("<div class='scroll-wrapper' style='position:relative; top:0; padding-top:1px; padding-bottom:1px; overflow:hidden'></div>");
			}
			$(container).addClass('wrapped');
			var scrollBlock = $(container).find('.scroll-wrapper');
			
			if(!$(container).hasClass('mouseover')){
				var eventTarget = $(document);
			} else{
				var eventTarget = $(container);
			}
			var wrapper = $(container).find('.scroll-wrapper');
			var relativeHeight = wrapper.outerHeight() / $(container).outerHeight();
			// var editorIframeContent = $(container).find('.editor iframe').contents().find('body').html();
			if(relativeHeight < 1 && $(container).hasClass('wrapped')){
				$(container)
					.removeClass('wrapped')
					.children('.scrollbar').remove();
				$(container).find('.scroll-wrapper').children().unwrap();
			}
			if($(container).hasClass('scrollbar')){
				if(relativeHeight >= 1){
					wrapper.css({
						boxSizing: 'border-box',
						paddingRight: '10px'
					});
					$(wrapper).after('<div class="scrollbar" style="position: absolute; border-radius: 4px; cursor: pointer; width:6px; height:100%; right: 0; top: 0; background: #b9d7ec"></div>');
				
					var scrollbar = $(wrapper).siblings('.scrollbar');
					var scrollbarHeight = scrollbar.outerHeight();
					var scrollbarHandlerPosition = 0;
					var scrollbarHandlerHeight = scrollbarHeight / relativeHeight;
					$(wrapper).siblings('.scrollbar').html('<div class="scrollbar-handler" style="width:100%; border-radius: 4px; position:relative; top:0; background: center center no-repeat #13639a; height:' + scrollbarHandlerHeight + 'px"></div>');
					var scrollbarHandler = scrollbar.find('.scrollbar-handler');
					var dragged = false, relativeStep, currentScrollBlockPosition;
					var currentCursorPosition, currentHandlerPosition;

					// $(container).hover(function(){
					// 	$(this).find('.scrollbar').stop().fadeIn(200);
					// }, function(){
					// 	if(!dragged){
					// 		$(this).find('.scrollbar').stop().fadeOut(200);
					// 	}
					// });
					$(scrollbarHandler).hover(function(){
						$(this)
							.css('backgroundImage', 'url(../images/scroll-arrows.png)')
							.stop().animate({
								width: '15px',
								left: '-9px',
								borderTopRightRadius: '0px',
								borderBottomRightRadius: '0px',
						},50);
					}, function(){
						if(!dragged){
							$(this)
								.css('backgroundImage', 'none')
								.stop().animate({
									width: '100%',
									left: '0px',
									borderTopRightRadius: '4px',
									borderBottomRightRadius: '4px',
									backgroundPosition: '200% center'
							},50);	
						}
					});
					$(scrollbarHandler).mousedown(function(e){
						currentCursorPosition = e.pageY;
						currentHandlerPosition = parseInt($('.scrollbar-handler').css('top'));
						currentScrollBlockPosition = scrollBlock.position().top;
						dragged = true;
						$('body').css('userSelect', 'none');
					});
					$(document).mouseup(function(){
						$(scrollbarHandler)
							.css('backgroundImage', 'none')
							.stop().animate({
								width: '100%',
								left: '0px',
								borderTopRightRadius: '4px',
								borderBottomRightRadius: '4px'
						},50);
						dragged = false;
						$('body').css('userSelect', 'text');
					});
					$(document).mousemove(function(e){
						if(dragged){
							relativeStep = (e.pageY - currentCursorPosition) / ((scrollbarHeight - scrollbarHandlerHeight) / 100);
							moveWrapper(container, true);
						}
					});
					eventTarget.off('mousewheel');
					eventTarget.mousewheel(function(e){
						if($('.select2-drop-mask').css('display') !== 'block' && (typeof($(e.toElement).closest('.redactor_editor')[0]) === 'undefined' || $(e.toElement).closest('.redactor_editor')[0].scrollHeight < 400)){
							moveWrapper(container, false, speed, e);	
						}
					});
				}
			}else{
				eventTarget.off('mousewheel');
				eventTarget.mousewheel(function(e){
					moveWrapper(container, false, speed, e);
				});
			}
			
			var moveWrapper = function(container, drag, speed, e){
				var scrollBlockPosition = parseInt(scrollBlock.css('top'));
				if(drag){
					var newPosition = currentScrollBlockPosition - relativeStep * ((wrapper.outerHeight() - $(container).outerHeight()) / 100);
					if(newPosition <= 0 && newPosition >= (wrapper.outerHeight() - $(container).outerHeight()) * (-1)){
						scrollBlock.css('top', newPosition + 'px');
					}else{
						if(newPosition > 0) {
							scrollBlock.css('top', '0px');
						}else{
							scrollBlock.css('top', (wrapper.outerHeight() - $(container).outerHeight()) * (-1)+ 'px');
						}
					}
					if($(container).hasClass('scrollbar')){
						var relativeWrapperPosition = $(scrollBlock).position().top * (-1) / ($(scrollBlock).outerHeight() - $(container).outerHeight());
						$(scrollbarHandler).css({
							'top': ($(scrollbar).outerHeight() - scrollbarHandler.outerHeight()) * relativeWrapperPosition + 'px'
						});
					}
				}else{
					
					switch(e.deltaY){
						case -1:
							if(scrollBlockPosition * (-1) < scrollBlock.outerHeight() - $(container).outerHeight() - speed){
								scrollBlock.css('top', scrollBlockPosition - speed);
							}else{
								scrollBlock.css('top', (scrollBlock.outerHeight() - $(container).outerHeight()) * (-1));
							}
						break;
						case 1:
							if(scrollBlockPosition <  0 - speed){
								scrollBlock.css('top', scrollBlockPosition + speed);
							}else{
								scrollBlock.css('top', 0);
							}
						break;
					}
					if($(container).hasClass('scrollbar')){
						var relativeWrapperPosition = $(scrollBlock).position().top * (-1) / ($(scrollBlock).outerHeight() - $(container).outerHeight());
						$(scrollbarHandler).stop().animate({
							'top': ($(scrollbar).outerHeight() - scrollbarHandler.outerHeight()) * relativeWrapperPosition  + 'px'
						}, 200);
					}
				}
			}
		});
	}
}(jQuery);