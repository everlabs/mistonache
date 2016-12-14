//= require active_admin/base


function removeInput() {
  $('.remove-field').click(function (ee) {
    ee.preventDefault();
      $(this).parents('p').remove();
  });
}

$(document).ready(function () {
  $('.add_another_photo_btn').click(function (e) {
    e.preventDefault();
    $('<p><input type="file"' + 'name="gallery[photo][]' + '"' + ' ' +
      'class="gallery-photo"><a href="#" class="remove-field">Видалити поле</a><br><br></p>').appendTo('.photo-inputs');
    removeInput();
  });
});
