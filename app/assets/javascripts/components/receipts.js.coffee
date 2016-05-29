@Receipts = React.createClass
  getInitialState: ->
    receipts: @props.data
  getDefaultProps: ->
    receipts: []
  addReceipt: (receipt) ->
    receipts = React.addons.update(@state.receipts, { $push: [receipt] })
    @setState receipts: receipts
  credits: ->
    credits = @state.receipts.filter (val) -> val.amount >= 0
    credits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0
  debits: ->
    debits = @state.receipts.filter (val) -> val.amount < 0
    debits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0
  balance: ->
    @debits() + @credits()
  deleteReceipt: (receipt) ->
    index = @state.receipts.indexOf receipt
    receipts = React.addons.update(@state.receipts, { $splice: [[index, 1]] })
    @replaceState receipts: receipts
  render: ->
    React.DOM.div
      className: 'receipts'
      React.DOM.h2
        className: 'title'
        'Your Receipts'
      React.DOM.div
        className: 'row'
        React.createElement AmountBox, type: 'success', amount: @credits(), text: 'Credit'
        React.createElement AmountBox, type: 'danger', amount: @debits(), text: 'Debit'
        React.createElement AmountBox, type: 'info', amount: @balance(), text: 'Balance'
      React.createElement ReceiptForm, handleNewReceipt: @addReceipt
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Title'
            React.DOM.th null, 'Amount'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for receipt in @state.receipts
            React.createElement Receipt, key: receipt.id, receipt: receipt, handleDeleteReceipt: @deleteReceipt
