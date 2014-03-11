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

  submit: (event) ->
    @collection.add new Envelope
      name: @$('#name').val()
      date: new Date(@$('#date').val)
      period: 'day'
    @unrender()

  events:
    'click #cancel': 'unrender'
    'submit .envelope-form': 'submit'