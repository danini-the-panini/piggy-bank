class RailsThing.Views.Income extends Backbone.View

  tagName: 'li'

  template: JST['incomes/income']

  initialize: ->
    _.bindAll

  render: =>
    $(@el).html @template( @model.attributes )

    @