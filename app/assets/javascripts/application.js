// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require ckeditor/init
//= require_tree .

$(document).ready(function(){
    $("a[rel^='prettyPhoto']").prettyPhoto({
        theme:'light_rounded',
        social_tools:false,
        deeplinking:false,
    });

    var url = window.location;
    var element = $('ul.nav.menu_active a').filter(function() {
        return this.href == url || url.href.indexOf(this.href) == 0;
    }).addClass('active').parent().addClass('active').parent().addClass('in').parent();
    if (element.is('li')) {
        element.addClass('active');
    }

    var element2 = $('ul.nav.navbar-left a').filter(function() {
        var url_head = url.href.split('#', 1)[0];
        return this.href ==url_head;
    }).parent().addClass('active');

    $('#show_comment_form').on('click', function(){
        $('.new_comment').show("slow");
        $('#show_comment_form').hide();
    });
});
