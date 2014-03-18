class RailsThing.Views.NewMonth extends RailsThing.NewView

  template: JST['envelopes/new_month']

  submit: ->
    envelope = new RailsThing.Models.Envelope
      name: @$('#name').val()
      date: moment(@$('#date').val(), "YYYY/MM").toDate()
      period: 'month'

    if @doneSomethingEL(window.wad, envelope, @$('#amount'))
      @collection.add envelope
      @unrender()