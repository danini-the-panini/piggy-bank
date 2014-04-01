class RailsThing.Views.Income extends RailsThing.View

  tagName: 'li'

  template: JST['incomes/income']

  initialize: (options) ->
    _.bindAll

    @envelopes = options.envelopes

    @model.bind 'change', @render
    @model.bind 'remove', @unrender

  render: =>
    $(@el).html @template( @model.attributes )

    @ # <- to allow chaining

  collectIncome: ->
    @model.pay(@envelopes);

  events:
    'click #collect_income': 'collectIncome'