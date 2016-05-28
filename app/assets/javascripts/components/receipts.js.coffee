@Receipts = React.createClass
  getInitialState: ->
    receipts: @props.data
  getDefaultProps: ->
    records: []
  render: ->
    React.DOM.div
      className: 'receipts'
      React.DOM.h2
        className: 'title'
        'Receipts'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Title'
            React.DOM.th null, 'Amount'
        React.DOM.tbody null,
          for receipt in @state.receipts
            React.createElement Receipt, key: receipt.id, receipt: receipt
