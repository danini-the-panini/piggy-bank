class RailsThing.View extends Backbone.View

  # Displays an error and resets the input to the default value.
  inputError: (el) ->
    alert "Invalid value"
    el.val(el.attr('data-default')).focus()

  # Transfers from X to Y, doing error checking
  # and removing the appropriate class from the enclosing div
  doneSomething: (x, y, input) ->
    inputEl = @$(".#{input}_input")
    if @doneSomethingEL x, y, inputEl
      $(@el).removeClass(input)
      true
    else
      false

  # Transfers from X to Y, displaying error messages if appropriate
  doneSomethingEL: (x, y, el) ->
    if @transfer(x, y, parseRands el.val())
      true
    else
      # do something?
      @inputError el
      false

  # Transfer amount from X to Y
  # only if X has more than amount
  # if X is nil then Y gets it from nowhere
  # if Y is nil then X get's taken from and put into nowhere
  # if amount is nil, then it takes everything.
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

  # Takes an amount from X if X has enough to take
  take: (x, amount) ->
    if x.get('amount') >= amount
      x.set 'amount', x.get('amount') - amount
      true
    else
      false

  # Gives an amount to X
  give: (x, amount) ->
    if x?
      x.set 'amount', x.get('amount') + amount
      true
    else
      false