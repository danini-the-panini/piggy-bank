class RailsThing.Views.NewDay extends Backbone.View

  template: JST['envelopes/new_day']

  initialize: ->
    _.bindAll

    @render()

  render: =>
    $(@el).html( @template() )

    @

  unrender: =>
    $('.create-buttons').removeClass('hidden')
    $(@el).remove()

  submit: ->
    @collection.add new RailsThing.Models.Envelope
      name: @$('#name').val()
      date: new Date(moment().format(@$('#date').val(), "YYYY/MM/DD"))
      period: 'day'
    @unrender()

  keypress: (e) ->
    @submit() if e.keyCode is 13

  events:
    'click #cancel': 'unrender'
    'click #add': 'submit'
    'keypress input': 'keypress'