connected = false

App.subscribe_to_lounge_channel = ->
  App.lounge = App.cable.subscriptions.create "LoungeChannel",
    connected: ->
      connected = true
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

    is_connected: ->
      connected

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

    post_message: (message) ->
      @perform "post_message", message: message
