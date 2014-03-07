class RailsThing.Views.Wad extends Backbone.View

  tagName: 'span'

  template: JST['wad/wad']

  initialize: ->
    _.bindAll

    @model.bind 'change', @render

    @render()

  render: =>
    $(@el).html @template( @model.attributes )

    @