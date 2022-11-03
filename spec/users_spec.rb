require 'rails_helper'

RSpec.describe 'Users', type: :system do 
  subject do 
    User.create(name: "Tom", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Mexico.", psots_counters: 0)
  end 
  # before(:all) do
  #   lilly = User.create( name: "Lilly",
  #     photo: "https://unsplash.com/photos/F_-0BxGuVvo",
  #     bio: "Teacher from Poland.",)
  #   User.create(name: "Tom",
  #     photo: "https://unsplash.com/photos/F_-0BxGuVvo",
  #     bio: "Teacher from Mexico.",)
  #     Post.create(author: lilly, title: 'first post', text: 'This is my first post')
  #     Post.create(author: lilly, title: 'second post', text: 'This is my second post')
  #     Post.create(author: lilly, title: 'third post', text: 'This is my third post')
  #     Post.create(author: lilly, title: 'fourth post', text: 'This is my fourth post')
  # end

  scenario 'index page' do 
    visit '/'
    sleep(5)
    expect(page).to(have_content('Tom'))
  end 
end 