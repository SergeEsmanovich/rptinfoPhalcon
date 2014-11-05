!function($){
	$(document).ready(function(){
		var slider = $('div.slider');
		var slides = slider.find('.slide');
		var nav = $('.slider-nav ul');
		$.each(slides, function(key,value){
			nav.append('<li></li>');
		});
		slides.first().addClass('active');
		nav.find('li').first().addClass('active');
		var controls = nav.children('li');
		
		slideShow();
		
		controls.click(function(){
			if(typeof(timer) !== 'undefined'){
				clearInterval(timer);
			}
			var nextIndex = $(this).index();
			if(nextIndex != $('.slide.active').index()){
				changeSlide(nextIndex, slides);
			}
			slideShow();
		}); 

		function slideShow(){
			window.timer = setInterval(function(){
				var currentIndex = $('.slide.active').index();
				var nexIndex;
				if(currentIndex < slides.length - 1){
					nextIndex = currentIndex + 1;
				} else{
					nextIndex = 0;
				}
				changeSlide(nextIndex, slides);
			}, 8000);
		}

		function changeSlide(nextIndex, slides){
			$('.slider-nav ul').children('li').eq(nextIndex)
				.addClass('active')
				.siblings('li').removeClass('active');

			$('.slide.active')
				.removeClass('active')
				.stop().fadeOut(300, function(){
				$(slides)
					.eq(nextIndex).stop().fadeIn(300)
					.addClass('active');
			});
		}
	});
}(jQuery);