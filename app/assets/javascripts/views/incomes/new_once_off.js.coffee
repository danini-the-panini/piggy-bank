class RailsThing.Views.NewOnceOff extends RailsThing.NewView

  template: JST['incomes/new_once_off']

  initialize: (options) ->
    @envelopes = options.envelopes

  submit: ->

    income = new RailsThing.Models.Income
      name: @$('#name').val()
      amount: parseRands @$('#amount').val()
      auto: false

    income.pay(@envelopes)

    @collection.add income
    @unrender()