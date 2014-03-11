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

  inputKeyPress: (e) ->
    @doneSpending() if e.keyCode is 13

  spend: =>
    $(@el).addClass('spend')
    @$('input').focus()

  spendAll: =>
    @model.set('amount', 0)
    $(@el).removeClass('spend')

  doneSpending: ->
    @doneSomething(window.wad, null, 'spend')

  events:
    'click .spend': 'spend'
    'click .spend_all': 'spendAll'
    'click .submit_spend': 'doneSpending'
    'keypress': 'inputKeyPress'