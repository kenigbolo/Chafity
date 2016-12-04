// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require semantic-ui
//= require_tree .

$(function() {
    $('#messages-form').hide();
    $("#message_form").hide();
    $("#new_message").click(function() {
        $("#message_form").show();
        $("#new_reply").hide();
        $("#message_options").hide();
        $("#replies").hide();
    });

    $("#cancel").click(function() {
        $("#message_form").hide();
        $("#new_message").show();
    });

    $("#reply").click(function() {
        $("#message_body").hide();
        $("#new_reply").show();
    });

    $('#keywords').autocomplete({
        source: $('#keywords').data('autocomplete-source')
    });

    $('#advanced_keywords').autocomplete({
        source: $('#advanced_keywords').data('autocomplete-source')
    });

    // semantic-ui

    $('.popup-message')
        .popup({
            inline: true,
            hoverable: true,
            position: 'bottom right',
            on: 'click',
            delay: {
                show: 500,
                hide: 500
            }
        });

    $('.popup-response')
        .popup({
            inline: true,
            hoverable: true,
            position: 'bottom left',
            on: 'click',
            delay: {
                show: 500,
                hide: 500
            }
        });

    $('.popup-schedule')
        .popup({
            inline: true,
            hoverable: true,
            position: 'bottom left',
            on: 'click',
            delay: {
                show: 500,
                hide: 500
            }
        });
});
