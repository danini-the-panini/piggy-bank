class RailsThing.View extends Backbone.View

  inputError: (el) ->
    alert "Invalid value"
    el.val(el.attr('data-default')).focus()

  doneSomething: (x, y, input) ->
    inputEl = @$(".#{input}_input")
    if @doneSomethingEL x, y, inputEl
      $(@el).removeClass(input)
      true
    else
      false

  doneSomethingEL: (x, y, el) ->
    if @transfer(x, y, parseRands el.val())
      true
    else
      # do something?
      @inputError el
      false

  transfer: (x, y, amount) ->
    amount ?= x.get('amount')
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