textarea_helpers =
  fire_tab: ->
    textarea = $("#post_body")
    pos      = textarea.prop("selectionStart")
    str      = textarea.val()
    pre      = str.substr(0, pos)
    post     = str.substr(pos)
    textarea.val(pre + "  " + post)


posts_requests =
  preview: ->
    text = $("#post_body").val()
    $.post '/posts/preview', ( text: text ), ((data) ->
          $("#post_preview").html(data)), "html"

$(document).ready ->
  # time = null
  # $("#post_body").bind 'keyup', (event) ->
    # clearTimeout(time)
    # time = setTimeout posts_requests.preview, 5000
  $(".preview").bind 'click', (event) ->
    posts_requests.preview()

  $(".post_read_more").bind 'keyup', (event) ->
    ajaxRequest = ->
      $.get $(this).attr("href") ->

  $("#post_body").bind 'keydown', (event) ->
    if event.keyCode == 9
      textarea_helpers.fire_tab()
      return false



