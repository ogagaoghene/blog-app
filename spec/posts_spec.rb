require 'rails_helper'

RSpec describe 'My Blog Post View', type: :feature do 
  scenario 'index page' do 
    visit 
    expect(page).to have_content('Tom')
  end 
end 