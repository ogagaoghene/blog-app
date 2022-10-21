require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Esi Ogagaoghene', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Nigeria.',
             posts_counters: 0)
  end

  before { subject.save }

  it 'name is not blank' do
    expect(subject.name).to eq('Esi Ogagaoghene')
  end

  it 'post_counter is an integer' do
    Post.new do |post|
      post.title = 'Hello World'
      post.text = 'This is my first post'
      post.user_id = subject.id
      post.save
    end
    expect(subject.posts_counters).to be_an(Integer)
  end

  it 'blank name raises error' do
    subject.name = ''
    expect { subject.save! }.to raise_error(ActiveModel::StrictValidationFailed)
  end

  it 'post_counter thats not an integer raises error' do
    subject.posts_counters = 'a'
    expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
