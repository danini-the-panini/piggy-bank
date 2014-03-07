window.RailsThing =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    app_router = new RailsThing.Routers.App

    Backbone.history.start()

$(document).ready ->
  RailsThing.initialize()
