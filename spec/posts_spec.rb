require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before(:all) do
    @lilly = User.create(name: 'Lilly',
                         photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Poland.', posts_counters: 0)
    @first_post = Post.create(author: @lilly, title: 'first post', text: 'This is my first post', likes_counter: 0,
                              comments_counter: 0)
    Comment.create(author: @lilly, post: @first_post, text: 'Your comment is on point')
    Post.create(author: @lilly, title: 'second post', text: 'This is my second post', likes_counter: 0,
                comments_counter: 0)
  end

  scenario 'page should have images of users' do
    visit '/users/1/posts'
    img = page.find('img')
    expect(img['src']).to(have_content('https://unsplash.com/photos/F_-0BxGuVvo'))
  end

  scenario 'page should display name of user' do
    visit '/users/1/posts'
    expect(page).to(have_content('Lilly'))
  end

  scenario 'page should display the author of the posts' do
    visit '/users/1/posts/1'
    expect(page).to have_content('Lilly')
  end

  scenario 'page should show the number of comments' do
    visit '/users/1/posts/1'
    expect(page).to(have_content('Comments: 1'))
  end

  scenario 'page should display the number of likes' do
    visit '/users/1/posts/1'
    expect(page).to(have_content('Likes: 1'))
  end

  scenario 'display number of posts' do
    visit '/users/1/posts'
    expect(page).to(have_content('Number of posts: 2'))
  end

  scenario 'page should display number of comments' do
    visit '/users/1/posts'
    expect(page).to(have_content('Comments: 1'))
  end

  scenario 'page should show the number of comments for a post' do
    visit '/users/1/posts'
    expect(page).to(have_content('Comments: 1'))
  end

  scenario 'page should display the number of likes for a post' do
    visit '/users/1/posts'
    expect(page).to(have_content('Likes: 1'))
  end

  scenario 'page should display the body of post' do
    visit '/users/1/posts'
    expect(page).to(have_content('This is my first post'))
  end

  scenario 'page should display the first comment of a post' do
    visit '/users/1/posts'
    expect(page).to have_content('Hi Ronaldo!')
  end
end
