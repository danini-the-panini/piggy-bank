class RailsThing.Views.Envelope extends RailsThing.View

  tagName: 'li'

  template: JST['envelopes/envelope']

  initialize: ->
    _.bindAll

    @model.bind 'change', @render
    @model.bind 'remove', @unrender

    window.wad.bind 'change', @render

  render: =>
    $(@el).html @template( @model.attributes )

    @

  unrender: =>
    $(@el).remove()

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
    @cancelPay if e.keyCode is 27

  doneCollecting: ->
    @doneSomething(@model, window.wad, 'collect')

  donePaying: ->
    @doneSomething(window.wad, @model, 'pay')

  removeSafely: ->
    @transfer(@model, window.wad)

    @model.destroy()

  events:
    'click .collect': 'collect'
    'click .pay': 'pay'
    'click .cancel_pay': 'cancelPay'
    'click .cancel_collect': 'cancelCollect'
    'click .submit_collect': 'doneCollecting'
    'click .submit_pay': 'donePaying'
    'click .delete': 'removeSafely'
    'keyup .collect_input': 'collectKeyPress'
    'keyup .pay_input': 'payKeyPress'