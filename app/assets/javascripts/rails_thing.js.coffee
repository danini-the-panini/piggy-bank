window.RailsThing =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    app_router = new RailsThing.Routers.App
    
    # testing wad
    wad = new RailsThing.Models.Wad( amount: 13.95 )

    wadView = new RailsThing.Views.Wad( model: wad )

    # testing envelopes
    enView = new RailsThing.Views.EnvelopesIndex

    enView.collection.add( new RailsThing.Models.Envelope( amount: 100 ))
    enView.collection.add( new RailsThing.Models.Envelope( amount: 120 ))
    enView.collection.add( new RailsThing.Models.Envelope( amount: 36.48 ))

    # testing paycheck(s)
    payView = new RailsThing.Views.PaychecksIndex

    payView.collection.add( new RailsThing.Models.Paycheck( amount: 4000 ))

    Backbone.history.start()

$(document).ready ->
  RailsThing.initialize()
