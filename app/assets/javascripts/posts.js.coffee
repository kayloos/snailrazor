$(document).ready ->
  time = null
  $("#post_body").bind 'keyup', (event) ->
    text = $("#post_body").val()
    clearTimeout(time)

    ajaxRequest = ->
      $.post '/posts/preview', ( text: text ), ((data) ->
            $("#post_preview").html(data)), "html"

    time = setTimeout ajaxRequest, 5000
