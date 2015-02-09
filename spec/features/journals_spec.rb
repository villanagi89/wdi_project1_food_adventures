require 'rails_helper'

RSpec.feature 'Managing journal entries' do
  scenario 'List all journal entries' do
    Journal.create!(event_title: 'Park Hyatt Resort (California)', event_date: 'March 2015')

    visit '/journals'
    expect(page).to have_content 'Journal Entries'
    expect(page).to have_selector 'ul', count: 1
  end

  scenario 'Create a new journal entry' do
    visit '/journals/new'
    #save_and_open_page
    fill_in 'journal_event_title', with: 'Park Hyatt Resort (California)'
    fill_in 'journal_event_date', with: 'March 2015'
    click_button 'Create Journal'
  end
end



