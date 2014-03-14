class RailsThing.Views.EnvelopesIndex extends RailsThing.View

  el: '.envelopes'

  template: JST['envelopes/index']

  initialize: ->
    _.bindAll

    @collection = new RailsThing.Collections.Envelopes
    @collection.bind 'add', @appendEnvelope, @

    @render()

  render: =>
    $(@el).html( @template() )
    _.each @collection, (envelope) -> appendEnvelope envelope

  appendEnvelope: (envelope) =>
    enView = new RailsThing.Views.Envelope( model: envelope )
    $('ul.envelopes').append enView.render().el

  createDay: ->
    @$('.create-buttons').addClass('hidden')
    dayView = new RailsThing.Views.NewDay { collection: @collection}
    @$('.new-envelope').html dayView.render().el
    @$('.new-envelope #name').focus();

  events:
    'click .create-day': 'createDay'