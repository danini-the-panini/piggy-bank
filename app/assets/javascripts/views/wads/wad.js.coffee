class RailsThing.Views.Wad extends Backbone.View

  el: '#content'

  template: JST['wad/wad']

  initialize: ->
    _.bindAll

    @model.bind 'change', 'render'

    @render()

  render: =>
    $(@el).append @template( @model.attributes )