class RailsThing.Views.EnvelopesIndex extends Backbone.View

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

