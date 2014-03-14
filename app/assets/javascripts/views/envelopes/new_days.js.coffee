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

    amount = parseRands @$('#amount').val()
    if @take(window.wad, amount)

      a = moment(@$('#from').val(), "YYYY/MM/DD")
      b = moment(@$('#until').val(), "YYYY/MM/DD")

      # make sure diff is positive
      [a,b] = [b,a] if b.isBefore(a)

      # days = b - a (in days)
      days = b.diff(a,'days')

      # the amount of exact cents per day
      day_amount = Math.floor(amount/days)

      # remaining cents to be added to the last envelope
      day_residual = amount % days

      name = @$('#name').val()

      # coffeescript's stupid scoping...@#$%#$%!!! /rant
      envelope = 0

      # for each day from a to b
      while a.isBefore(b)

        # find any DAY envelopes with the same name on the same day
        envelope = @collection.find (x) ->
          x.get('period') is 'day' && x.get('name') is name && a.isSame(x.get('date'), 'day')

        if envelope?
          envelope.set('amount', envelope.get('amount') + day_amount)
        else
          # make a new envelope if there isn't one matching the criteria
          envelope = new RailsThing.Models.Envelope
            name: name
            date: moment(a).toDate()
            period: 'day'
            amount: day_amount

          @collection.add envelope

        # increment a by one day
        a.add('d', 1)

      # add the residual amount to the last envelope
      envelope.set('amount', envelope.get('amount') + day_residual)

      @unrender()

  keypress: (e) ->
    switch e.keyCode
      when 13 then @submit()
      when 27 then @unrender()

  events:
    'click #cancel': 'unrender'
    'click #add': 'submit'
    'keyup input': 'keypress'