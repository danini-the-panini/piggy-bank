class RailsThing.Views.Application extends Backbone.View

    el: '#content'

    template: JST['application/application']

    initialize: ->
      _.bindAll

      @render()

    render: =>
      $(@el).append @template()