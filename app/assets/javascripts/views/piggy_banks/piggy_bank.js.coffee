class RailsThing.Views.PiggyBank extends RailsThing.View

    el: '.piggy'

    template: JST['piggy_bank/piggy_bank']

    initialize: ->
      _.bindAll

      @model = new RailsThing.Models.PiggyBank

      window.wad.bind 'change', @render

      @render()

    render: =>
      $(@el).html @template( @model.attributes )