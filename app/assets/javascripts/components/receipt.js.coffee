@Receipt = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/receipts/#{ @props.receipt.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteReceipt @props.receipt
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.receipt.date
      React.DOM.td null, @props.receipt.title
      React.DOM.td null, amountFormat(@props.receipt.amount)
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
