class RailsThing.Views.PiggyBank extends RailsThing.View

  el: '.piggy'

  template: JST['piggy_bank/piggy_bank']

  initialize: ->
    _.bindAll

    @model = new RailsThing.Models.PiggyBank

    @model.bind 'change', @render
    window.wad.bind 'change', @render

    @render()

  render: =>
    $(@el).html @template( @model.attributes )

  collect: ->
    $(@el).addClass('collect')
    @$('.collect_input').focus()

  pay: ->
    $(@el).addClass('pay')
    @$('.pay_input').focus()

  cancelPay: ->
    $(@el).removeClass('pay')

  cancelCollect: ->
    $(@el).removeClass('collect')

  collectKeyPress: (e) ->
    @doneCollecting() if e.keyCode is 13
    @cancelCollect() if e.keyCode is 27

  payKeyPress: (e) ->
    @donePaying() if e.keyCode is 13
    @cancelPay() if e.keyCode is 27

  doneCollecting: ->
    @doneSomething(@model, window.wad, 'collect')

  donePaying: ->
    @doneSomething(window.wad, @model, 'pay')

  events:
    'click .collect': 'collect'
    'click .pay': 'pay'
    'click .cancel_pay': 'cancelPay'
    'click .cancel_collect': 'cancelCollect'
    'click .submit_collect': 'doneCollecting'
    'click .submit_pay': 'donePaying'
    'keyup .collect_input': 'collectKeyPress'
    'keyup .pay_input': 'payKeyPress'