//= require components/receipt
//= require jquery
//= require react
jest.unmock('../CheckboxWithLabel');

import React from 'react';
import ReactDOM from 'react-dom';
import TestUtils from 'react-addons-test-utils';
import Receipt from '../Receipt';

describe 'receipt', ->
  it 'should be a new receipt successfully', ->
    const sum = require('../sum')
    expect( receipt(1, 2) ).toEqual(3)

  it 'changes the text after click' ->
    const checkbox = TestUtils.renderIntoDocument(<CheckboxWithLabel labelOn="On" labelOff="Off" />)
    const checkboxNode = ReactDOM.findDOMNode(checkbox);
    expect(checkboxNode.textContent).toEqual('Off');

    TestUtils.Simulate.change(TestUtils.findRenderedDOMComponentWithTag(checkbox, 'input'))
    expect(checkboxNode.textContent).toEqual('On');
