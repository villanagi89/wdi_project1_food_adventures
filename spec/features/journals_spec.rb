require 'rails_helper'

RSpec.feature 'Managing entries' do
  scenario 'List all entries' do
    Journal.create!(title: 'Park Hyatt Resort (California)', date: 'March 2015')

    visit '/journals'
    expect(page).to have_content 'My adventures'
    expect(page).to have_selector 'journal', count: 1
  end









end
