// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets

//= require turbolinks
//= require_tree .
//= require popper


$(document).on('turbolinks:load',function(){
  $(".fadeInDown").hide().fadeIn(4000);
});

$(document).on('turbolinks:load', function () {
	$('#zip').jpostal({
		postcode : [
			'#zip'
		],
		address : {
			'#address' : '%3%4%5'
		}
	});
});

// スクロールのフェードイン
$(window).scroll(function (){
	$('.fadein').each(function(){
		var elemPos = $(this).offset().top,
		scroll = $(window).scrollTop(),
		windowHeight = $(window).height();

			if (scroll > elemPos - windowHeight + 150){
				$(this).addClass('scrollin');
			}
	});
});

// 入力フォーム
$(document).on('turbolinks:load',function(){
  $('.form-js-input').on('keyup', function () {
    if ($(this).val()) {
      $(this).addClass('not-empty');
      console.log('true')
    } else {
      $(this).removeClass('not-empty');
      console.log('false')
    }
  });
});

// TOP main_visual skippr
$(document).on('turbolinks:load', function(){
  $(".main_visual_images").skippr({
    // スライドショーの変化 ("fade" or "slide")
    transition : 'fade',
    // 変化に係る時間(ミリ秒)
    speed : 1000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形("block" or "bubble")
    navType : 'block',
    // 子要素の種類("div" or "img")
    childrenElementType : 'div',
    // ナビゲーション矢印の表示(trueで表示)
    arrows : false,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : true,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 5000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : false,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
  });
});