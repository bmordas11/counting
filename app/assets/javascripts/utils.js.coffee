@amountFormat = (amount) ->
  if amount % 1 != 0
    '$ ' + Number(amount).toFixed(2).toLocaleString()
  else
    '$ ' + Number(amount).toLocaleString()
