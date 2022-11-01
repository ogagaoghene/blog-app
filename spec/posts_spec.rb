require 'rails_helper'

RSpec.describe 'Posts', type: :system do 
  scenario 'index page' do 
    visit '/users/1/posts'
    sleep(5)
    img = page.find('img')
    expect(img['src']).to(have_content('https://unsplash.com/photos/F_-0BxGuVvo'))
  end 
end 

# RSpec.describe 'My Blog Post View', type: :system do 
#   subject do
#     User.create(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Nigeria.',
#              posts_counters: 0)
#   end

#   describe 'posts index page' do
#     before do
#       visit 'users/1/posts'
#     end

#     it 'contains names of users' do
#       expect(page).to(have_content('Tom'))
#     end 
#   end
# end 