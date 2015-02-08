require 'rails_helper'

RSpec.describe 'routes for journals' do
  it 'routes GET/journals to the journals controller' do
  expect(get('/journals')).to route_to ('journals#index')
  end

end
