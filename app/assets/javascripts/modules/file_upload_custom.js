$(function() {
  $(".file_button").fileupload({
    dataType: "script"
  , dropZone: $(".dropzone")
  , add: addfile
  })
  .bind('dragover', function (e) {
    var dropZone = $('.dropzone'),
        timeout = window.dropZoneTimeout;
    if (timeout) {
        clearTimeout(timeout);
    }
    if (e.target === dropZone[0]) {
        dropZone.addClass('hover');
    } else {
        dropZone.removeClass('hover');
    }
    window.dropZoneTimeout = setTimeout(function () {
        window.dropZoneTimeout = null;
        dropZone.removeClass('in hover');
    }, 100);
  });

  if($(".dropzone").length) {
    $(document).bind('drop dragover', function (e) {
        e.preventDefault();
    });
  }
});

function addfile(e, data) {
  var file = data.files[0];
  name = file.name;
  data.submit();
}