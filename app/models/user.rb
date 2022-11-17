class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  validates :name, presence: { strict: true }
  validates :posts_counters, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_initialize :init
  
  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
  
  def init
    self.posts_counters ||= 0
  end

end
