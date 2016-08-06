room_id = null

$(document).ready ->
  div = $("div#subscribe-to-room-channel")
  console.log div
  if div.length > 0
    room_id = $(div).attr("room_id")
    App.subscribe_to_room_channel room_id

$(document).on "keypress", "form#form-room-message", (e) ->
  if e.which == 13 # enter
    input = $("input#input-message")
    if input.val() != "" && App.room && App.room.is_connected() && App.room.is_followed()
      name_input = $("input#input-name")
      App.room.post_message { body: input.val(), name: name_input.val() }, room_id
      input.val ""
    false
