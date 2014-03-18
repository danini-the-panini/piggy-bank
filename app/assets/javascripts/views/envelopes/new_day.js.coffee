class RailsThing.Views.NewDay extends RailsThing.NewView

  template: JST['envelopes/new_day']

  submit: ->
    envelope = new RailsThing.Models.Envelope
      name: @$('#name').val()
      date: moment(@$('#date').val(), "YYYY/MM/DD").toDate()
      period: 'day'

    if @doneSomethingEL(window.wad, envelope, @$('#amount'))
      @collection.add envelope
      @unrender()