!function($){
	$(document).ready(function(){
		recalculateWindows();
		handlers();
		destroyLessCache('/templates/deftpl/less/');
		/*Показ всплывающих меню*/
		$('.dotts').click(function(){
			$(this).parent('*').find('.action_menu').toggleClass('active');
		});
		$('.gender-icon').click(function(){
			$(this)
				.addClass('active')
				.siblings().removeClass('active');
		});

		var systemMessageContainer = $('#system-message-container');
		//console.log($(systemMessageContainer).children().length);
		if($(systemMessageContainer).children().length){
			$(systemMessageContainer).parent('.row').css('display', 'block');
			setTimeout(function(){
				$(systemMessageContainer).parent('.row').fadeOut(500);
			}, 3000);
		}
	});

	var handlers = function(){
		var handlers = $('.handler');
		$.each(handlers, function(key, handler){
			var target = $(handler).attr('data-target');
			console.log($.session.get($(target).attr('id')));
			if($.session.get($(target).attr('id')) === 'hide'){
				$(target).attr('data-state', 'hide');				
			}else if($.session.get($(target).attr('id')) === 'show'){
				$(target).attr('data-state', 'show');
				$(target).addClass('active');
			}
			$(handler).click(function(){
				var action = $(this).attr('data-action');
				
				switch(action){
					case 'toggleClass':
						toggleClass(handler);
					break;
					case 'toggle':
						toggle(handler);
					break;
					case 'translateToValue':
						translateToValue(handler);
					break;
				}
			});
		});
	}

	var toggleClass = function(handler){
		var target = $(handler).attr('data-target');
		var classname = $(handler).attr('data-var');
		var option = $(handler).attr('data-option');
		
		if($(target).attr('data-savestate')){
			if(!$(target).hasClass('active')){
				$(target).attr('data-state', 'show');
			}else{
				$(target).attr('data-state', 'hide');
			}
			$.session.set($(target).attr('id'), $(target).attr('data-state'));
		}
		$(target).toggleClass(classname); 
		if($(target).hasClass(classname) && option !== 'multiple'){
			$('body').click(function(event){
				console.log(!$(target).attr('data-hide'));
          		if ($(target).attr('data-hide') || ($(event.target).closest(target).length || $(event.target).closest(handler).length)) return;
          		$(target).removeClass(classname);
          	});
		}
	}

	var toggle = function(handler){
		var target = $(handler).attr('data-target');
		$(target).slideToggle(0); 
	}

	var translateToValue = function(handler){
		var target = $(handler).attr('data-target');
		var value = $(handler).attr('data-var');
		$(target).val(value); 
	}

	window.recalculateWindows = function(){
		console.log('1');
		$.each($('.modalwindow'), function(key, val){
			var win = $(this);
			win.stop().animate({
				left: '50%',
				marginLeft: win.outerWidth() / 2 * (-1) + 'px'
			},500);
		});
	}

	function destroyLessCache(pathToCss) { // e.g. '/css/' or '/stylesheets/'
 
      var host = window.location.host;
      var protocol = window.location.protocol;
      var keyPrefix = protocol + '//' + host + pathToCss;
 
      for (var key in window.localStorage) {
        if (key.indexOf(keyPrefix) === 0) {
          delete window.localStorage[key];
        }
      }
    }
}(jQuery);