require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  subject do
    User.new(name: 'Esi Ogagaoghene', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Nigeria.',
             posts_counters: 0)
  end

  before { subject.save }

  describe 'GET index' do
    before(:each) do
      get "/users/#{subject.id}/posts"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders index' do
      expect(response).to render_template(:index)
    end

    it 'renders view to include posts by id' do
      expect(response.body).to include("List of all Posts by #{subject.id}")
    end
  end

  describe 'GET show' do
    before(:each) do
      new_post = Post.create(author: subject, title: 'Hello', text: 'This is my first post', likes_counter: 0,
                             comments_counter: 0)
      get "/users/#{subject.id}/posts/#{new_post.id}"
    end

    it 'returns http success' do
      expect(response).to have_http_status :ok
    end

    it 'renders the view' do
      expect(response).to render_template('show')
    end

    it 'renders post details ' do
      expect(response.body).to include('Post')
    end
  end
end
