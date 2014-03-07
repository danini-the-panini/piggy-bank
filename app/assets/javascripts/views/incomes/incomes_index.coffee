class RailsThing.Views.IncomesIndex extends Backbone.View

  el: '#content'

  template: JST['incomes/index']

  initialize: ->
    _.bindAll

    @collection = new RailsThing.Collections.Incomes
    @collection.bind 'add', @appendIncome, @

    @render()

  render: =>
    $(@el).append( @template() )
    _.each @collection, (income) -> appendIncome income

  appendIncome: (income) =>
    view = new RailsThing.Views.Income( model: income )
    $('ul.incomes').append view.render().el

