require 'rails_helper'

RSpec.feature 'Managing journal entries' do
  scenario 'User sign in' do
    visit '/users/sign_in'
    fill_in 'user_email', with: 'joe.nolastname@hotmail.com'
    fill_in 'user_password', with: 'password123'
    click_button 'Log in'
    expect(page).to have_content 'Welcome to Food adventures'
  end
  scenario 'List all journal entries' do
    Journal.create!(event_title: 'Park Hyatt Resort (California)', event_date: 'March 2015')
    visit '/journals'
    expect(page).to have_content 'Welcome to Food adventures'
    expect(page).to have_selector 'ul', count: 1
  end

  scenario 'Create a new journal entry' do
    visit '/journals/new'
    fill_in 'journal_event_title', with: 'Park Hyatt Resort (California)'
    fill_in 'journal_event_date', with: 'March 2015'
    click_button 'Create Journal'
    #expect(page).to have_content(/success/i)
  end

  scenario 'Visit the Journal show page' do
    journal = Journal.create!(event_title: 'Park Hyatt Resort', event_date: '2015, 1, 12')
    visit "/journals/#{journal.id}"
    expect(page.find('h1')).to have_content 'Park Hyatt Resort'
  end
  scenario 'Update Journal title' do
    journal = Journal.create!(event_title: 'Park Hyatt Resort', event_date: '2015, 1, 12')
    visit "/journals/#{journal.id}/edit"

    fill_in 'journal_event_title', with: 'Boston wine convention'
    fill_in 'journal_event_date', with: 'June 2015'
    click_button 'Update Journal'
    expect(page).to have_content 'Boston wine convention'
  end
  scenario 'Delete a Journal entry' do
    journal = Journal.create!(event_title: 'Park Hyatt Resort', event_date: '2015, 1, 12')
    visit "/journals/#{journal.id}"
    #save_and_open_page
    click_on 'Delete this journal entry'
  end
end



