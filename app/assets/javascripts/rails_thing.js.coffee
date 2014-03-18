window.RailsThing =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->

    # for now until we get the rails backend
    Backbone.sync = (method, model, success, error) ->
      success()

    app_router = new RailsThing.Routers.App

    appView = new RailsThing.Views.Application
    
    # testing wad
    wadView = new RailsThing.Views.WadIndex

    # piggies!!
    piggyView = new RailsThing.Views.PiggyBank

    # testing envelopes
    enView = new RailsThing.Views.EnvelopesIndex

    enView.collection.add(
      new RailsThing.Models.Envelope( name: 'daily', amount: 10000, date: moment().toDate() ))
    enView.collection.add(
      new RailsThing.Models.Envelope( name: 'daily', amount: 12000, date: moment().add('d',1).toDate() ))
    enView.collection.add(
      new RailsThing.Models.Envelope( name: 'daily', amount: 3648, date: moment().add('d',2).toDate() ))

    payday = moment().subtract('d',20).toDate()

    enView.collection.add(
      new RailsThing.Models.Envelope( name: 'paycheck', amount: 400000, date: payday))

    # testing income(s)
    inView = new RailsThing.Views.IncomesIndex

    inView.collection.add( new RailsThing.Models.Income( amount: 400000, lastPayed: payday ))

    # NB: values are represented in cents

    Backbone.history.start()

$(document).ready ->
  RailsThing.initialize()
