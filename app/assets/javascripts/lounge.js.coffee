$(document).ready ->
  if $("div#subscribe-to-lounge-channel").length > 0
    App.subscribe_to_lounge_channel()

$(document).on "keypress", "form#form-message", (e) ->
  if e.which == 13 # enter
    input = $("input#input-message")
    if input.val() != "" && App.lounge && App.lounge.is_connected()
      name_input = $("input#input-name")
      App.lounge.post_message { body: input.val(), name: name_input.val() }
      input.val ""
    false
