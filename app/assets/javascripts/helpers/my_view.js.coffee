class RailsThing.View extends Backbone.View

  doneSomething: (x, y, input) ->
    inputEl = @$(".#{input}_input")
    if @transferFromXtoY(x, y, parseInt inputEl.val())
      $(@el).removeClass(input)
    else
      # do something?
      alert "Invalid value"
      inputEl.val(@model.get 'amount').focus()

  transferFromXtoY: (x, y, amount) ->
    if x.get('amount') >= amount
      x.set('amount', x.get('amount') - amount)
      y.set('amount', y.get('amount') + amount)
      true
    else
      false