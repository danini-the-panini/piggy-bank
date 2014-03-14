window.toCents = (rands) ->
  Math.floor(rands*100.0)

window.toRands = (cents) ->
  cents/100.0

window.parseRands = (val) ->
  toCents( parseFloat val )