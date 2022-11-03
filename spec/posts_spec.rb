require 'rails_helper'

RSpec.describe 'Posts', type: :system do 
  scenario 'index page' do 
    visit '/users/1/posts'
    sleep(5)
    img = page.find('img')
    expect(img['src']).to(have_content('https://unsplash.com/photos/F_-0BxGuVvo'))
  end 

  scenario 'display name of user' do
    visit '/users/1/posts'
    sleep(5)
    expect(page).to(have_content('Tom'))
  end

  scenario 'display user posts counter' do
    visit '/users/1/posts'
    sleep(5)
    expect(page).to(have_content('Number of posts: 4'))
  end

  scenario 'display title of post' do
    visit '/users/1/posts'
    sleep(5)
    expect(page.to(have_content('enter title here'))
  end

  scenario 'display the body of post' do
    visit '/users/1/posts'
    sleep(5)
    expect(page).to(have_content('I love posting'))
  end

  scenario 'display the first comment of a post' do
    visit '/users/1/posts'
    sleep(5)
    expect(page).to have_content('I love comments')
  end

  scenario 'shows how many comments a post has' do
    visit '/users/1/posts'
    sleep(5)
    expect(page).to(have_content('Comments: 1'))
  end

  scenario 'shows how many comments a post has' do
    visit '/users/1/posts'
    sleep(5)
    expect(page).to(have_content('Comments: 1'))
  end

  scenario 'shows how many likes a post has' do
    visit '/users/1/posts'
    sleep(5)
    expect(page).to(have_content('Likes: 0'))
  end

  scenario 'redirects me to the post show page when clicking on a post' do
    visit '/users/1/posts'
    sleep(5)
    expect(page).to(have_current_path('users/1/posts/1'))
  end

  scenario 'displays the posts title' do
    visit '/users/1/posts/1'
    expect(page).to have_content('new post')
  end

  scenario 'displays the posts author' do
    visit '/users/1/posts/1'
    expect(page).to have_content('Lilly')
  end

  scenario 'shows the number of comments' do
    visit '/users/1/posts/1'
    expect(page).to(have_content('Comments: 1'))
  end

  scenario 'displays the number of likes' do
    visit '/users/1/posts/1'
    expect(page).to(have_content('Likes: 0'))
  end

  # it 'displays the body of posts' do
  #   visit '/users/1/posts/1'
  #   expect(page).to(have_content('I love posting'))
  # end

  # it 'displays name of user that makes a comment' do
  #   visit '/users/1/posts/1'
  #   expect(page).to(have_content('Lilly'))
  # end

  # it 'shows' do
  #   visit '/users/1/posts/1'
  #   expect(page).to(have_content('I love comments'))
  # end
  
end 