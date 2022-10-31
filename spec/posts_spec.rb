require 'rails_helper'

RSpec.describe 'My Blog Post View', type: :system do 
  subject do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Nigeria.',
             posts_counters: 0)
  end

  before { subject.save }

  describe 'posts index page' do
    before do
      visit '/users/#{subject.id}/posts/'
    end

    it 'contains names of users' do
      expect(page).to(have_content('Tom'))
    end 
  end
end 