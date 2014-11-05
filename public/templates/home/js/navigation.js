!function($){
	$(document).ready(function(){
		$('.carousel').carousel();
		recalculateWindows();
		handlers();
		destroyLessCache('/templates/home/less/');
		/*Показ всплывающих меню*/
		$('.dotts').click(function(){
			$(this).parent('*').find('.action_menu').toggleClass('active');
		});
		$('.gender-icon').click(function(){
			$(this)
				.addClass('active')
				.siblings().removeClass('active');
		});
	});

	var handlers = function(){
		var handlers = $('.handler');
		$.each(handlers, function(key, handler){
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
		$(target).toggleClass(classname); 
		if($(target).hasClass(classname) && option !== 'multiple'){
			$('body').click(function(event){
          		if ($(event.target).closest(target).length || $(event.target).closest(handler).length) return;
          		$(target).removeClass(classname);
          	});
		}
	}

	var toggle = function(handler){
		var target = $(handler).attr('data-target');
		$(target).slideToggle(300); 
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
				top: '50%',
				marginTop: win.outerHeight() / 2 * (-1) + 'px',
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