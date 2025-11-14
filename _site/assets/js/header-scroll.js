$(window).scroll(function() {
    var scroll = $(window).scrollTop();
    if (scroll >= 60) {
        $('header').addClass("scroll");
    } else {
        $('header').removeClass("scroll");
    }
});