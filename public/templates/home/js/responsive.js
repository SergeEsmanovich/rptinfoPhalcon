!function($){
	$(document).ready(function(){
		$("#e10").select2({
		    data:[{id:0,text:'enhancement'},{id:1,text:'bug'},{id:2,text:'duplicate'},{id:3,text:'invalid'},{id:4,text:'wontfix'}]
		});
		var select2 = $('.select2');
		if(select2.length !== 0){
			$.each(select2, function(){
				$(this).select2();
			});
		}
		window.timer = 0;
		tabs();
		
		scrolling(30);
		setTimeout(function(){
			smartFloat();
			calculateHeight();
			verticalAlign();
		}, 300);
		
	});
	$(window).resize(function(){
		clearTimeout(timer);
		timer = setTimeout(function(){
			tabs();
			scrolling(30);
			calculateHeight();
			verticalAlign();
			setTimeout(function(){
				smartFloat();
			}, 300);
		}, 300);
		
	});

	var verticalAlign = function(){
		var elements = $('.valign-c');
		$.each(elements, function(key, element){
			$(this)
				.css({
					marginTop: ($(this).parent().innerHeight() / 2) - ($(this).outerHeight() / 2) + 'px'
				});
		});
	}

	var calculateHeight = function(){
		var elements = $('.calculate-height');
		$.each(elements, function(key, element){
			$(element).css({
				height: $(this).outerHeight() + 'px',
				position: 'relative'
			});
			$(this).find('.slide-content-wrapper').animate({opacity:1}, 300);
		});
	}

	var tabs = function(){
		var tabsContainer = $('.tabs-panel');
		$.each(tabsContainer, function(key, container){
			var panel = $(this);
			var tabsNav = $(panel).find('.tab');
			tabsNav.click(function(){
				
				$(this)
					.addClass('active')
					.siblings('.tab').removeClass('active');
				$(panel).find('.tab-content').eq($(this).index())
					.addClass('active')
					.siblings('.tab-content').removeClass('active');
				smartFloat();
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
			if(!container.hasClass('wrapped')){
				$(targetElements).wrapAll("<div class='scroll-wrapper' style='position:relative; top:0; padding-top:1px; padding-bottom:1px'></div>");
			}
			container.addClass('wrapped');
			var scrollBlock = $(container).find('.scroll-wrapper');
			
			if(!$(container).hasClass('mouseover')){
				var eventTarget = $(document);
			} else{
				var eventTarget = $(container);
			}
			var wrapper = $(container).find('.scroll-wrapper');
			var relativeHeight = wrapper.outerHeight() / $(container).outerHeight();
			if($(container).hasClass('scrollbar')){
				if(relativeHeight >= 1){
					wrapper.css({
						boxSizing: 'border-box',
						paddingRight: '10px'
					});
					$(wrapper).after('<div class="scrollbar" style="position: absolute; border-radius: 4px; display:none; width:4px; height:100%; right: 0; top: 0; background: #b9d7ec"></div>');
				
					var scrollbar = $(wrapper).siblings('.scrollbar');
					var scrollbarHeight = scrollbar.outerHeight();
					var scrollbarHandlerPosition = 0;
					var scrollbarHandlerHeight = scrollbarHeight / relativeHeight;
					$(wrapper).siblings('.scrollbar').html('<div class="scrollbar-handler" style="width:100%; border-radius: 4px; position:relative; top:0; background:#13639a; height:' + scrollbarHandlerHeight + 'px"></div>');
					var scrollbarHandler = scrollbar.find('.scrollbar-handler')

					$(wrapper).hover(function(){
						$(this).siblings('.scrollbar').stop().fadeIn(200);
					}, function(){
						$(this).siblings('.scrollbar').stop().fadeOut(200);
					});
					eventTarget.off('mousewheel');
					eventTarget.mousewheel(function(e){
						moveWrapper(container, scrollBlock, scrollbar, scrollbarHandler, scrollbarHandlerPosition, speed, e);
					});
				}
			}else{
				eventTarget.off('mousewheel');
				eventTarget.mousewheel(function(e){
					moveWrapper(container, scrollBlock, scrollbar, scrollbarHandler, scrollbarHandlerPosition, speed, e);
				});
			}
			
			var moveWrapper = function(container, scrollBlock, scrollbar, scrollbarHandler, scrollbarHandlerPosition, speed, e){
				var scrollBlockPosition = parseInt(scrollBlock.css('top'));
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
						'top': ($(scrollbar).outerHeight() - scrollbarHandler.outerHeight()) * relativeWrapperPosition + 'px'
					}, 200);
				}
			}
		});
	}
}(jQuery);