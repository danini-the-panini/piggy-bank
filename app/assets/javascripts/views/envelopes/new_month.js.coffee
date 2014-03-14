class RailsThing.Views.NewMonth extends RailsThing.View

  template: JST['envelopes/new_month']

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
    envelope = new RailsThing.Models.Envelope
      name: @$('#name').val()
      date: moment(@$('#date').val(), "YYYY/MM").toDate()
      period: 'month'

    if @doneSomethingEL(window.wad, envelope, @$('#amount'))
      @collection.add envelope
      @unrender()

  keypress: (e) ->
    switch e.keyCode
      when 13 then @submit()
      when 27 then @unrender()

  events:
    'click #cancel': 'unrender'
    'click #add': 'submit'
    'keyup input': 'keypress'