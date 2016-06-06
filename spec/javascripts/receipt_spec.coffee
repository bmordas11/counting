//= require components/receipt
//= require jquery
//= require react

describe "Receipt", ->
  beforeEach ->
    @receipt = new Receipt( title: "Barbados", amount: 23.31, date: "2-5-2009" )

  it "should be able to add a new valid Receipt", ->
    # Receipt barbados = new Receipt( title: "Barbados", amount: 23.31, date: "2-5-2009" )
    # React.createElement Receipt, key: receipt.
    # id, receipt: receipt, handleDeleteReceipt: @deleteReceipt, handleEditReceipt: @updateReceipt
    # Receipt barbados = React.CreateElement( Receipt, title: "Barbados", amount: 23.31, date: "2-5-2009" )
    # expect(barbados.title).toEqual("Barbados")
    # expect(barbados.amount).toEqual(23.31)

  it "will change the world", ->
    expect(true).toBe(true)
    expect(jQuery).toBeDefined()
