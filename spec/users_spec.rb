require 'rails_helper'
require 'webdrivers'

RSpec.describe 'My Blog Post View', type: :system do 
  subject do
    User.new(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Nigeria.',
             posts_counters: 0)
  end

  before { subject.save }

  describe 'users index page' do
    before do
      visit "/users/#{subject.id}/posts"
    end

    it 'contains names of users' do
      expect(page).to(have_content('Tom'))
    end 
  end
end 