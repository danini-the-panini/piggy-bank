class RailsThing.View extends Backbone.View

  doneSomething: (x, y, input) ->
    inputEl = @$(".#{input}_input")
    if @transfer(x, y, parseFloat inputEl.val())
      $(@el).removeClass(input)
    else
      # do something?
      alert "Invalid value"
      inputEl.val(@model.get 'amount').focus()

  transfer: (x, y, amount) ->
    if x?
      if @take(x, amount)
        @give y, amount
        true
      else
        false
    else
      @give y, amount
      true

  take: (x, amount) ->
    if x.get('amount') >= amount
      x.set 'amount', x.get('amount') - amount
      true
    else
      false

  give: (x, amount) ->
    if x?
      x.set 'amount', x.get('amount') + amount
      true
    else
      false