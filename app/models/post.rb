class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :likes
  has_many :comments

  after_save :update_posts_counter

  validate :title, presence: true, length: { maximum: 250 }
  validate :comments_counter , numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :likes_counter , numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def five_recent_comments
    comments.order('created_at Desc').limit(5)
  end
end
