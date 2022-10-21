require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.new(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                    posts_counters: 0)
    post = Post.new(user_id: user, title: 'Rails Recipe', text: 'Learning the fundamentals of Rails', comments_counter: 3,
                    likes_counter: 0)
    Like.new(author: user, post: post)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it '# likes_counter gets incremented by 1' do
    expect(subject.post.likes_counter) == 1
  end

end

