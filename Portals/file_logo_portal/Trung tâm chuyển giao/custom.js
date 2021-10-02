$(document).ready(function(){
  $("#home-new-slide").owlCarousel({
    autoPlay: true,
    autoplayTimeout: 5000,
    slideSpeed: 500,
    items: 3,
    navigation: false,
    itemsDesktop: [1376, 3],
    itemsDesktopSmall: [1375, 3],
    itemsMobile: [1024, 1],
    itemsMobile: [768, 1],
    itemsMobile: [767, 1],
    navigationText: ["", ""],
  });
  $("#slider").owlCarousel({
    autoPlay: false,
    autoplayTimeout: 5000,
    slideSpeed: 500,
    items: 4,
    navigation: true,
    itemsDesktop: [1376, 4],
    itemsDesktopSmall: [1375, 3],
    itemsMobile: [1024, 3],
    itemsMobile: [768, 2],
    itemsMobile: [767, 1],
    navigationText: ["", ""],
  });
  var stickyTop = $("#navbar").offset().top;
   var idMenu =  $("#navbar");
   if(window.outerWidth <= 1200)
   {
       idMenu =  $("#navbar-mb");
       stickyTop = idMenu.offset().top;
   }

   $(window).scroll(function () {
       if ($(window).scrollTop() >=  stickyTop) {
           idMenu.addClass("sticky");
       } else {
           idMenu.removeClass('sticky');
       }
   });
  $(".box-tab .tab-heading-item").on("click", function () {
    var me = $(this);
    var idSource = me.data("target");
    me.parents(".box-tab")
      .find(".tab-heading-item")
      .removeClass("active");
    me.addClass("active");
    me.parents(".box-tab").find(".tab-content-item").hide();
    me.parents(".box-tab")
      .find('.tab-content-item[data-source="' + idSource + '"]')
      .show();
  });
  $(".sub-tab .sub-tab-item").on("click", function () {
    var me = $(this);
    var idSource = me.data("target");
    me.parents(".sub-tab").find(".sub-tab-item").removeClass("active");
    me.addClass("active");
    me.parents(".box-tab").find(".sub-tab-content-item").hide();
    me.parents(".box-tab")
      .find('.sub-tab-content-item[data-source="' + idSource + '"]')
      .show();
  });

  $(".btn-search").on("click", function () {
    var me = $(this);
    me.parents(".search").toggleClass("active");
  });
  $('.btn-menu').on("click",function()
  {
      $('#menu-mobile .head-menu').addClass("open");
  });
  $('#closemenu').on("click",function(){
    $('#menu-mobile .head-menu').removeClass("open");
  });

  $('.btn-search-mobile a').on("click",function()
  {
      $('.search-box').toggleClass("open");
      $('.opacity').toggleClass("hidden");
  });
});
