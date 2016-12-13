//= require active_admin/base

var i = $('.photo-inputs p').size() + 1;

function removeInput() {
  $('.remove-field').click(function (ee) {
    ee.preventDefault();
      $(this).parents('p').remove();
      i--;
  });
}

$(document).ready(function () {
  $('.add_another_photo_btn').click(function (e) {
    e.preventDefault();
    $('<p><input type="file"' + 'name="gallery[photo-' + i + "]" + '"' + ' ' +
      'class="gallery-photo"><a href="#" class="remove-field">Видалити поле</a><br><br></p>').appendTo('.photo-inputs');
    i++;
    removeInput();
  });
});
