class RailsThing.Views.Envelope extends Backbone.View

  tagName: 'li'

  template: JST['envelopes/envelope']

  initialize: ->
    _.bindAll

    @model.bind 'change', @render
    @model.bind 'remove', @unrender

  render: =>
    $(@el).html @template( @model.attributes )

    @

  unrender: =>
    $(@el).remove()

  transferToWad: ->
    window.wad.set 
      amount: window.wad.get('amount') + @model.get('amount')
    @model.destroy()

  events:
    'click .collect': 'transferToWad'