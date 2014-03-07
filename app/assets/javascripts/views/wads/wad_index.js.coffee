class RailsThing.Views.WadIndex extends Backbone.View

  el: '#content'

  initialize: ->
    _.bindAll
    window.wad = new RailsThing.Models.Wad

    @render()

  render: =>
    wadView = new RailsThing.Views.Wad( model: window.wad )
    $(@el).append wadView.render().el