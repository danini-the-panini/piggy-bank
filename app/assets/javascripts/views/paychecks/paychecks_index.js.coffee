class RailsThing.Views.PaychecksIndex extends Backbone.View

  el: '#content'

  template: JST['paychecks/index']

  initialize: ->
    _.bindAll

    @collection = new RailsThing.Collections.Paychecks
    @collection.bind 'add', @appendPaycheck, @

    @render()

  render: =>
    $(@el).append( @template() )
    _.each @collection, (paycheck) -> appendPaycheck paycheck

  appendPaycheck: (paycheck) =>
    enView = new RailsThing.Views.Paycheck( model: paycheck )
    $('ul.paychecks').append enView.render().el

