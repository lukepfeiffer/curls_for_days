$(document).ready(function(){
  $('.subscribe_button').click(function(){
    var blogger_id = $(this).data('blogger-id')
    var user_id = $(this).data('user-id')
    $.ajax({type: "get",
      url: ("/create_subscription?user_id=" + user_id + "&blogger_id=" + blogger_id),
      success: function(){
        $('.subscribe_button').replaceWith("<a class= 'unsubscribe_button', data: {user_id: current_user.id, blogger_id: blogger.id}> Unsubscribe </a>")
        $('.blogger_show').prepend("<div class= 'flash-success alert'> <span> Subscribed!</span></div>")
        setTimeout(function(){
          var query = window.location.search.substring(1)

          if(query.length) {
            if(window.history != undefined && window.history.pushState != undefined) {
              window.history.pushState({}, document.title, window.location.pathname);
            }
          }
          $('.alert').fadeOut('slow');
        }, 4000);
      }
    })
  })

  $('.unsubscribe_button').click(function(){
    var delete_path = $(this).data('url')
    $.ajax({type: "delete",
      url: delete_path,
      success: function(){
        $('.unsubscribe_button').replaceWith("<a class= 'subscribe_button', data: {user_id: current_user.id, blogger_id: blogger.id}> Subscribe </a>")
        $('.blogger_show').prepend("<div class= 'flash-success alert'> <span> Unsubscribed!</span></div>")
        setTimeout(function(){
          var query = window.location.search.substring(1)

          if(query.length) {
            if(window.history != undefined && window.history.pushState != undefined) {
              window.history.pushState({}, document.title, window.location.pathname);
            }
          }
          $('.alert').fadeOut('slow');
        }, 4000);
      }
    })
  })
});
