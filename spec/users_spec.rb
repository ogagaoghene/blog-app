require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before(:all) do
    @lilly = User.create(name: 'Lilly',
                         photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Poland.', posts_counters: 0)
    User.create(name: 'Tom',
                photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'Teacher from Mexico.', posts_counters: 0)
    Post.create(author: @lilly, title: 'Post 1 by Lilly', text: 'This is the third post test by Lilly', likes_counter: 0,
                comments_counter: 0)
    Post.create(author: @lilly, title: 'Post 2 by Lilly', text: 'TThis is the fourth post test by Lilly', likes_counter: 0,
                comments_counter: 0)
  end

  describe 'index page' do
    it 'should render names of users' do
      visit users_path
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it 'should display the picture in users profile' do
      visit users_path
      images = page.all('img')
      expect(images[0]['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
      expect(images[1]['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'should redirect to the page of a user when clicked' do
      visit users_path
      link = page.first('a')
      link.click
      expect(page).to have_current_path('/users/1')
    end

    describe 'show page' do
      it 'should render the profile page of the user' do
        visit '/users/1'
        image = page.find('img')
        expect(image['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
      end

      it 'should display the name of the user' do
        visit '/users/1'
        expect(page).to have_content('Tom')
      end

      it 'should display the post counter of the user' do
        visit '/users/1'
        expect(page).to have_content('Number of posts: 2')
      end

      it 'should display the bio of users' do
        visit '/users/1'
        expect(page).to have_content('Teacher from Mexico.')
      end
    end
  end
end
