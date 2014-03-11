class RailsThing.Views.Envelope extends Backbone.View

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
    $(@el).addClass('edit')
    @$('input').focus()

  inputKeyPress: (e) ->
    switch e.keyCode
      when 13
        @doneCollecting()

  doneCollecting: ->
    if @transferIntoWad(parseInt @$('input').val())
      $(@el).removeClass('edit')
    else
      # do something?
      alert "Bad command or filename."
      @$('input').val(@model.get 'amount').focus()

  emptyIntoWad: ->
    window.wad.set 
      amount: window.wad.get('amount') + @model.get('amount')
    @model.destroy()

  transferIntoWad: (amount) ->
    if @model.get('amount') >= amount
      @model.set('amount', @model.get('amount') - amount)
      window.wad.set('amount', window.wad.get('amount') + amount)
      true
    else
      false

  events:
    'click .empty': 'emptyIntoWad'
    'click .collect': 'collect'
    'click .submit_collect': 'doneCollecting'
    'keypress': 'inputKeyPress'