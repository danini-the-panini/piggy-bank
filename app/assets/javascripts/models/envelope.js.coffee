class RailsThing.Models.Envelope extends Backbone.Model

  defaults: ->
    name: 'envelope'
    amount: 0
    date: new Date
    period: 'day'
