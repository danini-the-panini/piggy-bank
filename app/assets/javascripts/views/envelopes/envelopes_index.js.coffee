class RailsThing.Views.EnvelopesIndex extends Backbone.View

  el: '#content'

  template: JST['envelopes/index']

  initialize: ->
    _.bindAll

    @collection = new RailsThing.Collections.Envelopes
    @collection.bind 'add', @appendEnvelope, @

    @render()

  render: =>
    alert "render #{@el}"
    alert @template()
    $(@el).html( @template() )
    alert $(@el).html()
    _.each @collection, (envelope) -> appendEnvelope envelope

  appendEnvelope: (envelope) =>
    enView = new RailsThing.Views.Envelope( model: envelope )
    $('ul').append enView.render().el

