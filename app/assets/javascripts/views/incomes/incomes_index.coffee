class RailsThing.Views.IncomesIndex extends Backbone.View

  el: '.incomes'

  template: JST['incomes/index']

  initialize: ->
    _.bindAll

    @collection = new RailsThing.Collections.Incomes
    @collection.bind 'add', @appendIncome, @

    @render()

  render: =>
    $(@el).html( @template() )
    _.each @collection, (income) -> appendIncome income

  appendIncome: (income) =>
    view = new RailsThing.Views.Income( model: income )
    $('ul.incomes').append view.render().el

  createOnceOff: ->
    @$('.create-buttons').addClass('hidden')
    newView = new RailsThing.Views.NewOnceOff { collection: @collection}
    @$('.new-income').html newView.render().el
    @$('.new-income #name').focus();

  createSalary: ->
    @$('.create-buttons').addClass('hidden')
    newView = new RailsThing.Views.NewSalary { collection: @collection}
    @$('.new-income').html newView.render().el
    @$('.new-income #name').focus();

  events:
    'click .create-once-off': 'createOnceOff'
    'click .create-salary': 'createSalary'