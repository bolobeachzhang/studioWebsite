/*
* wordlimitor 1.0.1
* Date: 2011-08-01
* (c) 20011 gudufy,http://gudufy.cnblogs.com/
*
* This is licensed under the GNU LGPL, version 2.1 or later.
* For details, see: http://creativecommons.org/licenses/LGPL/2.1/
*/
$(function () {
    $.fn.wordlimitor = function () {
        $(this).each(function (i) {
            if ($(this).nextAll('div.textlimit').size() == 0) {
                $(this).after('<div class="textlimit">0</div>');
            }

            $(this).bind('propertychange focus keyup input paste', function () {
                var _max = $(this).attr('max');
                var _length = $(this).val().length;
                if (_length > _max) {
                    $(this).val($(this).val().substring(0, _max));
                }
                _left = $(this).offset().left;
                _top = $(this).offset().top;
                _width = $(this).width();
                _height = $(this).height();

                $(this).nextAll('div.textlimit').html(_length + '/' + _max);
                $(this).nextAll('div.textlimit').css({
                    'left': _left + _width + 15,
                    'top': _top + _height - 12
                });
            });

            $(this).focus(function () {
                $(this).nextAll('div.textlimit').fadeIn('slow');
            });

            $(this).blur(function () {
                $(this).nextAll('div.textlimit').fadeOut('slow');
            });

        });
    };

    $('textarea[max],input[max]').wordlimitor();
});