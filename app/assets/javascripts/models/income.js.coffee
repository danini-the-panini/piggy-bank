class RailsThing.Models.Income extends Backbone.Model

  defaults: ->
    amount: 0
    lastPayed: new Date
    auto: false
    date: new Date
    period: 'month'

  initialize: ->
    @set(period: 'day') unless @get('auto')

  pay: (envelopes) ->
    envelope = new RailsThing.Models.Envelope
      amount: @get('amount')
      name: @get('name')
      period: @get('period')
      date: new Date()

    @set(lastPayed: envelope.get('date'))

    envelopes.add envelope