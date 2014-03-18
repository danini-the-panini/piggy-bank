class RailsThing.Views.NewOnceOff extends RailsThing.NewView

  template: JST['incomes/new_once_off']

  submit: ->

    income = new RailsThing.Models.Income
      name: @$('#name').val()
      amount: parseRands @$('#amount').val()
      date: moment(@$('#date').val(), "YYYY/MM/DD").toDate()
      auto: false

    @collection.add income
    @unrender()