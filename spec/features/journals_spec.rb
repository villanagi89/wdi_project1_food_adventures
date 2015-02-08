require 'rails_helper'

RSpec.feature 'Managing journal entries' do
  scenario 'List all journal entries' do
    Journal.create!(event_title: 'Park Hyatt Resort (California)', event_date: 'March 2015')

    visit '/journals'
    expect(page).to have_content 'Journal Entries'
    expect(page).to have_selector 'ul', count: 1
  end









end
