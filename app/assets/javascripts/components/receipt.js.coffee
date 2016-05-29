@Receipt = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/receipts/#{ @props.receipt.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteReceipt @props.receipt
  handleEdit: (e) ->
    e.preventDefault()
    data =
      title: ReactDOM.findDOMNode(@refs.title).value
      date: ReactDOM.findDOMNode(@refs.date).value
      amount: ReactDOM.findDOMNode(@refs.amount).value
    $.ajax
      method: 'PUT'
      url: "/receipts/#{ @props.receipt.id }"
      dataType: 'JSON'
      data:
        receipt: data
      success: (data) =>
        @setState edit: false
        @props.handleEditReceipt @props.receipt, data
  receiptRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.receipt.date
      React.DOM.td null, @props.receipt.title
      React.DOM.td null, amountFormat(@props.receipt.amount)
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
  receiptForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.receipt.date
          ref: 'date'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.receipt.title
          ref: 'title'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'float'
          defaultValue: @props.receipt.amount
          ref: 'amount'
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'
  render: ->
    if @state.edit
      @receiptForm()
    else
      @receiptRow()
