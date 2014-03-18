class RailsThing.Views.EnvelopesIndex extends RailsThing.View

  el: '.envelopes'

  template: JST['envelopes/index']

  initialize: ->
    _.bindAll

    @collection = new RailsThing.Collections.Envelopes
    @collection.bind 'add', @render

    @render()

  render: =>
    $(@el).html( @template() )
    @collection.forEach (envelope) ->
      enView = new RailsThing.Views.Envelope( model: envelope )
      $('ul.envelopes').append enView.render().el

  createDay: ->
    @$('.create-buttons').addClass('hidden')
    newView = new RailsThing.Views.NewDay { collection: @collection}
    @$('.new-envelope').html newView.render().el
    @$('.new-envelope #name').focus();

  createDays: ->
    @$('.create-buttons').addClass('hidden')
    newView = new RailsThing.Views.NewDays { collection: @collection}
    @$('.new-envelope').html newView.render().el
    @$('.new-envelope #name').focus();

  createMonth: ->
    @$('.create-buttons').addClass('hidden')
    newView = new RailsThing.Views.NewMonth { collection: @collection}
    @$('.new-envelope').html newView.render().el
    @$('.new-envelope #name').focus();

  envelopes: ->
    @collection

  events:
    'click .create-day': 'createDay'
    'click .create-days': 'createDays'
    'click .create-month': 'createMonth'