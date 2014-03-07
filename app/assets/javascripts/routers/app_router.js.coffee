class RailsThing.Routers.App extends Backbone.Router

  routes:
    '*actions': 'defaultRoute'

  defaultRoute: ->
    enView = new RailsThing.Views.EnvelopesIndex

    enView.collection.add( new RailsThing.Models.Envelope( amount: 100 ))
    enView.collection.add( new RailsThing.Models.Envelope( amount: 120 ))
    enView.collection.add( new RailsThing.Models.Envelope( amount: 36.48 ))

    payView = new RailsThing.Views.PaychecksIndex

    payView.collection.add( new RailsThing.Models.Paycheck( amount: 4000 ))

