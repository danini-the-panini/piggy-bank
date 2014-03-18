class RailsThing.Models.Income extends Backbone.Model

  defaults: ->
    amount: 0
    lastPayed: new Date
    auto: false
    date: new Date
    period: 'month'
