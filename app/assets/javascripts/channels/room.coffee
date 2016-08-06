connected = false
followed = false

App.subscribe_to_room_channel = (room_id) ->
  App.room = App.cable.subscriptions.create "RoomChannel",
    # TODO: DRY
    connected: ->
      connected = true
      @follow room_id
      label = $("label#channel-status")
      return unless label
      label.removeClass()
      label.addClass "label"
      label.addClass "label-success"
      label.text "Connected"

    disconnected: ->
      connected = false
      label = $("label#channel-status")
      return unless label
      label.removeClass()
      label.addClass "label"
      label.addClass "label-danger"
      label.text "Disconnected"

    rejected: ->
      connected = false
      label = $("label#channel-status")
      return unless label
      label.removeClass()
      label.addClass "label"
      label.addClass "label-warning"
      label.text "Rejected"

    is_connected: ->
      connected

    is_followed: ->
      followed

    received: (data) ->
      console.log data
      div = $("div#messages")
      return unless div
      div.prepend(
        $("<div>", { class: "row" }).append(
          $("<div>", { class: "col-sm-2" }).text(data["message"]["created_at"])
        ).append(
          $("<div>", { class: "col-sm-1" }).append(
            $("<span>", { class: "bold" }).text(data["message"]["user_name"])
          )
        ).append(
          $("<div>", { class: "col-sm-9" }).text(data["message"]["body"])
        )
      )

    follow: (room_id) ->
      @perform "follow", room_id: room_id
      followed = true

    post_message: (message, room_id) ->
      @perform "post_message", message: message, room_id: room_id
