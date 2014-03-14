class RailsThing.Collections.Envelopes extends Backbone.Collection

  model: RailsThing.Models.Envelope

  comparator: (a,b) ->
    aTime = a.get('date').getTime()
    bTime = b.get('date').getTime()
    if aTime < bTime
      return -1
    else if aTime > bTime
      return 1
    else
      return a.get('name').localeCompare(b.get('name'))
