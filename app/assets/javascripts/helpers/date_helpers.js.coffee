window.truncateDate = (date, period) ->
  switch period
    when 'day' then moment(date).format('dddd Do of MMMM, YYYY')
    when 'month' then moment(date).format('MMMM YYYY')