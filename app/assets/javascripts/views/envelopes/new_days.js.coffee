class RailsThing.Views.NewDays extends RailsThing.View

  template: JST['envelopes/new_days']

  initialize: ->
    _.bindAll

    @render()

  render: =>
    $(@el).html( @template() )

    @

  unrender: =>
    $('.create-buttons').removeClass('hidden')
    $(@el).remove()

  submit: ->

    amount = parseFloat @$('#amount').val()
    if @take(window.wad, amount)

      a = moment(@$('#from').val(), "YYYY/MM/DD")
      console.log a
      b = moment(@$('#until').val(), "YYYY/MM/DD")
      console.log b
      [a,b] = [b,a] if b.isBefore(a)
      days = b.diff(a,'days')
      console.log days
      day_amount = amount/days

      console.log day_amount

      while a.isBefore(b)

        envelope = new RailsThing.Models.Envelope
          name: @$('#name').val()
          date: a.toDate()
          period: 'day'
          amount: day_amount

        @collection.add envelope

        a.add('days', 1)

      @unrender()

  keypress: (e) ->
    switch e.keyCode
      when 13 then @submit()
      when 27 then @unrender()

  events:
    'click #cancel': 'unrender'
    'click #add': 'submit'
    'keyup input': 'keypress'