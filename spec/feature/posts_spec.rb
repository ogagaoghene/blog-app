require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  let(:user) do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'Teacher from Mexico.', posts_counters: 0)
  end

  let(:post) do
    Post.create(user_id: user.id, title: 'Post #1 by Tom', text: 'This is the first post test by Tom',
                likes_counter: 0, comments_counter: 0)
  end

  let(:commenter) do
    User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                posts_counters: 0)
  end

  let(:comment) do
    Comment.create(user_id: commenter.id, post_id: post.id, text: 'Comment 1')
  end

  feature 'index page' do
    scenario 'page should render the profile image of the user' do
      visit user_posts_path(user.id)
      img = page.find('img')
      expect(img['src']).to(have_content('https://unsplash.com/photos/F_-0BxGuVvo'))
    end

    scenario 'page should display name of user' do
      visit user_posts_path(user.id)
      expect(page).to have_content('Tom')
    end

    scenario 'page should display the author of the posts' do
      visit user_posts_path(user.id)
      expect(page).to have_content('Tom')
    end

    scenario 'page should render the number of posts the user has written' do
      visit user_posts_path(user.id)
      expect(page).to(have_content(user.posts_counters))
    end

    scenario 'page should render the number of comments' do
      visit user_posts_path(user.id)
      expect(page).to have_content(post.comments_counter)
    end

    scenario 'page should display the number of likes' do
      visit user_posts_path(user.id)
      expect(page).to have_content(post.likes_counter)
    end

    scenario 'page should display number of posts' do
      visit user_posts_path(post.user_id)
      expect(page).to have_content(user.posts_counters)
    end

    scenario 'page should show the description of a post' do
      visit user_posts_path(post.user_id)
      expect(page).to have_content(post.text)
    end

    scenario 'page should show the first comment of a post' do
      visit user_posts_path(comment.post.user_id)
      expect(page).to have_content(comment.text)
    end

    scenario 'page should show the name of a user that makes a comment' do
      visit user_posts_path(comment.post.user_id)
      expect(page).to have_content(commenter.name)
    end

    feature 'show page' do
      scenario 'should render the title of the post' do
        visit user_posts_path(post.user_id)
        expect(page).to have_content('Post #7')
      end

      scenario 'should render who wrote the post' do
        visit user_posts_path(post.user_id)
        expect(page).to have_content('Tom')
      end

      scenario 'should show the number of comments it has' do
        visit user_posts_path(post.user_id)
        expect(page).to(have_content(post.comments_counter))
      end

      scenario 'should show the number of likes it has' do
        visit user_posts_path(post.user_id)
        expect(page).to(have_content(post.likes_counter))
      end

      scenario 'should render the username of each commetator' do
        visit user_posts_path(post.user_id)
        expect(page).to have_content('Tom')
      end
    end
  end
end
