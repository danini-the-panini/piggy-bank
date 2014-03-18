class RailsThing.Views.NewSalary extends RailsThing.NewView

  template: JST['incomes/new_salary']

  submit: ->

    income = new RailsThing.Models.Income
      name: @$('#name').val()
      amount: parseRands @$('#amount').val()
      date: moment(@$('#date').val(), "YYYY/MM/DD").toDate()
      auto: true
      period: @$('#period').val()

    @collection.add income
    @unrender()