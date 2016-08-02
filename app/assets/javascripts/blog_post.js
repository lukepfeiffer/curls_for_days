$(document).ready(function(){
  $('#assignments').on('submit', '.edit_form', function(event){
    event.preventDefault();
    var form = $(this)
    $.ajax({type: "patch",
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response){
        var response = $(response)
        form
          .closest('dl')
          .replaceWith(response)
        response
          .find('dd')
          .toggle();
      }
    })
  });
  $('.comment-detail').on('click', '.edit_button', function(event){
    event.preventDefault();
    $(this).closest('dd').find('form, .content').toggle();
  });
});
