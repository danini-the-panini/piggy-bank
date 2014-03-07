class RailsThing.Views.Envelope extends Backbone.View

  tagName: 'li'

  template: JST['envelopes/envelope']

  initialize: ->
    _.bindAll

  render: =>
    $(@el).html @template( @model.attributes )

    @