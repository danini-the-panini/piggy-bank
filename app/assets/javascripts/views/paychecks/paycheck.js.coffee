class RailsThing.Views.Paycheck extends Backbone.View

  tagName: 'li'

  template: JST['paychecks/paycheck']

  initialize: ->
    _.bindAll

  render: =>
    $(@el).html @template( @model.attributes )

    @