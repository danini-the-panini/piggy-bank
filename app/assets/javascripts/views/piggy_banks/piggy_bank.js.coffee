class RailsThing.Views.PiggyBank extends Backbone.View

    el: '#content'

    template: JST['piggy_bank/piggy_bank']

    initialize: ->
      _.bindAll

      @model = new RailsThing.Models.PiggyBank

      @render()

    render: =>
      $(@el).append @template( @model.attributes )