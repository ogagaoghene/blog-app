require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom',
                              photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.', posts_counters: 0)

    @second_user = User.create(name: 'Lilly',
                               photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                               bio: 'Teacher from Poland.', posts_counters: 0)

    Post.create(author: @first_user, title: 'Post 1 by Tom', text: 'This is the first post test by Tom',
                likes_counter: 0,
                comments_counter: 0)

    Post.create(author: @first_user, title: 'Post 2 by Tom', text: 'This is the second post test by Tom',
                likes_counter: 0,
                comments_counter: 0)

    Post.create(author: @first_user, title: 'Post 5 by Tom', text: 'This is the fifth post test by Tom',
                likes_counter: 0,
                comments_counter: 0)

    @second_post = Post.create(author: @second_user, title: 'Post 2 by Lilly',
                               text: 'This is the first post test by Lilly',
                               likes_counter: 0, comments_counter: 0)
  end

  describe 'index page' do
    it 'should render the names of all other users' do
      visit users_path
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it 'should render the profile picture for each user' do
      visit users_path
      expect(page).to have_css("img[src*='#{@first_user.photo}']")
      expect(page).to have_css("img[src*='#{@second_user.photo}']")
    end

    it 'shows the number of posts each user has written' do
      visit users_path
      expect(page).to have_content(@first_user.posts_counters)
      expect(page).to have_content(@second_user.posts_counters)
    end

    it 'when I click on a user, I am redirected to that users show page' do
      visit users_path
      click_link(@first_user.name)
      expect(page).to have_content(@first_user.name)
    end

    describe 'show page' do
      it 'should redirect to the show page of a user when I clicked on a user ' do
        visit users_path
        link = page.first('a')
        link.click
        expect(page).to have_current_path(user_path(@first_user.id))
      end

      it 'should render the username of all other users' do
        visit user_path(@first_user.id)
        username = page.find('.users_name')
        expect(username).to have_content(@first_user.name)
      end

      it 'should render the profile page of the user' do
        visit user_path(@first_user.id)
        image = page.find('img')
        expect(image['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
      end

      it 'should render the name of the user' do
        visit user_path(@first_user.id)
        expect(page).to have_content(@first_user.name)
      end

      it 'should display the post counter of the user' do
        visit user_path(@first_user.id)
        expect(page).to have_content(@first_user.posts_counters)
      end

      it 'should render the users first 3 posts' do
        visit user_path(@first_user.id)
        posts = page.all('.post_list')
        expect(posts[0]).to have_content('This is the fifth post test by Tom')
        expect(posts[1]).to have_content('This is the second post test by Tom')
        expect(posts[2]).to have_content('This is the first post test by Tom')
      end

      it 'should display the bio of users' do
        visit user_path(@first_user.id)
        expect(page).to have_content(@first_user.bio)
      end
    end
  end
end
