require 'rails_helper'

feature 'user can view a list of receipts', js: true do
  let!(:receipt1) { FactoryGirl.create(:receipt) }
  let!(:receipt2) { FactoryGirl.create(:receipt) }
  scenario 'sees a list of receipts' do
    visit root_path

    save_and_open_page
    expect(page).to have_content(receipt1.title)
    expect(page).to have_content(receipt2.title)
    expect(page).to have_content(receipt1.amount)
    expect(page).to have_content(receipt2.amount)
  end
end
