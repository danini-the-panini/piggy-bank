class RailsThing.Views.Wad extends RailsThing.View

  tagName: 'span'

  template: JST['wad/wad']

  initialize: ->
    _.bindAll

    @model.bind 'change', @render

    @render()

  render: =>
    $(@el).html @template( @model.attributes )

    @

  spendKeyPress: (e) ->
    @doneSpending() if e.keyCode is 13
    @cancelSpend() if e.keyCode is 27

  spend: =>
    $(@el).addClass('spend')
    @$('input').focus()

  cancelSpend: ->
    $(@el).removeClass('spend')

  doneSpending: ->
    @doneSomething(window.wad, null, 'spend')

  events:
    'click .spend': 'spend'
    'click .submit_spend': 'doneSpending'
    'click .cancel_spend': 'cancelSpend'
    'keyup': 'spendKeyPress'