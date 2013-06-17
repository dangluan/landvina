// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.layout
//= require ruby_gallery/app
//= require locations
//= require script
//= require tiny.editor
//= require form.jquery
//= require jquery.fancybox
//= require jquery.fancybox.pack


$(document).ready(function(){

	$(document.body).delegate('.dynamic-link', 'click', function(e){
		var _this = this;
		var dom = $(this).attr('data-element');
		$("ul.tree li").removeClass("active");
		$(this).addClass("active");
		
		$.ajax({
			url : $(_this).attr("data-url"),
			type: $(_this).attr("data-method"),
			success: function(response){
				$(dom).html(response);
			}
		});
		e.preventDefault();
		return false;
	});
	
	$(document.body).delegate('.ajax-link', 'click', function(e){
		var _this = this;
		var dom = $(this).attr('data-element');
		$.ajax({
			url : $(_this).attr("data-url"),
			type: $(_this).attr("data-method"),
			success: function(response){
				$(dom).html(response);
			}
		});
		return false;
	});
	
	$(document.body).delegate(".fancy-admin-link", 'click', function(){
		$.fancybox({
			width: 500,
			height: 500,
			type: "ajax",
			padding: 0,
			margin: 0,
			scrolling: 'no',
			href: $(this).attr("data-url")
		});
		return false;
	});
	
	
});
