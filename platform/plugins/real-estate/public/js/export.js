/******/ (() => { // webpackBootstrap
var __webpack_exports__ = {};
/*!********************************************************************!*\
  !*** ./platform/plugins/real-estate/resources/assets/js/export.js ***!
  \********************************************************************/
$(function () {
  var isExporting = false;
  $(document).on('click', '.btn-export-data', function (event) {
    event.preventDefault();
    if (isExporting) {
      return;
    }
    var $currenTarget = $(event.currentTarget);
    var $content = $currenTarget.html();
    $.ajax({
      url: $currenTarget.attr('href'),
      method: 'POST',
      xhrFields: {
        responseType: 'blob'
      },
      beforeSend: function beforeSend() {
        $currenTarget.prop('disabled', true).addClass('button-loading');
        isExporting = true;
      },
      success: function success(data) {
        var a = document.createElement('a');
        var url = window.URL.createObjectURL(data);
        a.href = url;
        a.download = $currenTarget.data('filename');
        document.body.append(a);
        a.click();
        a.remove();
        window.URL.revokeObjectURL(url);
      },
      error: function error(data) {
        Botble.handleError(data);
      },
      complete: function complete() {
        setTimeout(function () {
          $currenTarget.prop('disabled', false).removeClass('button-loading');
          isExporting = false;
        }, 500);
      }
    });
  });
});
/******/ })()
;