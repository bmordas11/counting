@Receipt = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.receipt.date
      React.DOM.td null, @props.receipt.title
      React.DOM.td null, amountFormat(@props.receipt.amount)
