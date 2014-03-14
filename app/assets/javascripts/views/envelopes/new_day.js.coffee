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
    switch e.keyCode
      when 13 then @submit()
      when 27 then @unrender()

  events:
    'click #cancel': 'unrender'
    'click #add': 'submit'
    'keyup input': 'keypress'