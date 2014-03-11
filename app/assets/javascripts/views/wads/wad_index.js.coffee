class RailsThing.Views.WadIndex extends Backbone.View

  el: '.wad'

  initialize: ->
    _.bindAll
    window.wad = new RailsThing.Models.Wad

    @render()

  render: =>
    wadView = new RailsThing.Views.Wad( model: window.wad )
    $(@el).html wadView.render().el