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
    $(@el).addClass('edit')
    @$('input').focus()

  spendAll: =>
    console.log 'spend all'
    @model.set('amount', 0)
    $(@el).removeClass('edit')

  doneSpending: ->
    if @doSpend(parseInt @$('input').val())
      $(@el).removeClass('edit')
    else
      # do something?
      alert "Invalid value"
      @$('input').val(@model.get 'amount').focus()

  doSpend: (amount) ->
    if @model.get('amount') >= amount
      @model.set('amount', @model.get('amount') - amount)
      true
    else
      false

  events:
    'click .spend': 'spend'
    'click .spend_all': 'spendAll'
    'click .submit_spend': 'doneSpending'
    'keypress': 'inputKeyPress'