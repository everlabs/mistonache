//= require active_admin/base


var i = 2;

function remove () {
  $('.remove-field').click( function(ee) {
    console.log('!!!!');
    ee.preventDefault();
    if (i > 1) {
      $(this).parents('p').remove();
      i--;
    }
  });
}


$(document).ready( function () {
  $('.add_another_photo_btn').click( function (e) {
    e.preventDefault();
    $('<p><input type="file" id="photo-' + i + '"' + 'name="gallery[photo-' + i + "]" + '"' + ' ' +
      'class="gallery-photo"><a href="#" class="remove-field">Видалити поле</a><br><br></p>').appendTo('.photo-inputs');
    i++;

    remove();
  });



});
