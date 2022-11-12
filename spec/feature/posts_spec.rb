require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before(:all) do
    @lilly = User.create(name: 'Lilly',
                         photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Poland.', posts_counters: 0)
    @first_post = Post.create(author: @lilly, title: 'Post 1 by Lilly', text: 'This is the third post test by Lilly',
                              likes_counter: 0, comments_counter: 0)
    Comment.create(author: @lilly, post: @first_post, text: 'Comment 3')
    Post.create(author: @lilly, title: 'Post 2 by Lilly', text: 'This is the fourth post test by Lilly',
                likes_counter: 0, comments_counter: 0)
  end

  feature 'index page' do
    scenario 'should rednder the profile of the user' do
      visit '/users/1/posts'
      img = page.find('img')
      expect(img['src']).to(have_content('https://unsplash.com/photos/F_-0BxGuVvo'))
    end

    scenario 'should render the users username' do
      visit '/users/1/posts'
      expect(page).to(have_content('Tom'))
    end

    scenario 'should render the number of posts the user has written' do
      visit '/users/2/posts'
      expect(page).to(have_content('Number of posts: 3'))
    end

    scenario 'should render the title of a post' do
      visit '/users/1/posts'
      expect(page).to have_content('Post #2')
    end

    scenario 'should render some of the posts body' do
      visit '/users/1/posts'
      expect(page).to have_content('This is the first post test by Tom')
    end

    scenario 'should render the first comments on a post' do
      visit '/users/1/posts'
      expect(page).to have_content('Comment 3')
    end

    scenario 'should render how many comments a post has' do
      visit '/users/1/posts'
      expect(page).to have_content('Comments: 2')
    end

    scenario 'should render how many likes a post has' do
      visit '/users/1/posts'
      expect(page).to have_content('Likes: 0')
    end

    feature 'show page' do
      scenario 'should render the title of the post' do
        visit '/users/1/posts/1'
        expect(page).to have_content('Post #1')
      end

      scenario 'should render who wrote the post' do
        visit '/users/1/posts/1'
        expect(page).to have_content('Tom')
      end

      scenario 'should show the number of comments it has' do
        visit '/users/1/posts/1'
        expect(page).to(have_content('Comments: 2'))
      end

      scenario 'should render how many likes it has' do
        visit '/users/1/posts/1'
        expect(page).to(have_content('Likes: 0'))
      end

      scenario 'should render the body of the post' do
        visit '/users/1/posts/1'
        expect(page).to have_content('Comment 1')
      end

      scenario 'should render the username of each commetator' do
        visit '/users/1/posts/1'
        expect(page).to have_content('Tom')
        expect(page).to have_content('Lilly')
      end
    end
  end
end
