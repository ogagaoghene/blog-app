require 'rails_helper'

RSpec.describe 'Users', type: :request do
  subject do
    User.new(name: 'Esi Ogagaoghene', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Nigeria.',
             posts_counters: 0)
  end

  before { subject.save }

  describe 'GET index' do
    before do
      get '/users'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns index rendering' do
      expect(response).to render_template(:index)
    end

    it 'returns rendering of users' do
      expect(response.body).to include('Welcome to user index page')
    end
  end

  describe 'GET show' do
    before do
      get "/users/#{subject.id}"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns a view listing of users' do
      expect(response).to render_template(:show)
    end

    it 'returns user details by a specific id' do
      expect(response.body).to include("User info. by #{subject.id}")
    end
  end
end
