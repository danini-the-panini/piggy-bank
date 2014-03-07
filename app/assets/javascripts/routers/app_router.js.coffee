class RailsThing.Routers.App extends Backbone.Router

  routes:
    '*actions': 'defaultRoute'

  defaultRoute: ->
    index = new RailsThing.Views.EnvelopesIndex

    index.collection.add( new RailsThing.Models.Envelope( amount: 100 ))
    index.collection.add( new RailsThing.Models.Envelope( amount: 120 ))
    index.collection.add( new RailsThing.Models.Envelope( amount: 36.48 ))