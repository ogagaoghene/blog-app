class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :likes
  has_many :comments

  validates :title, presence: true,
                    length: { in: 3...250, too_short: 'Title must not be shorter than 3 characters.',
                              too_long: 'Title must not exceed 250 characters.' }
  validates :text, presence: true
  validates :comments_counter, :likes_counter, presence: true,
                                               numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_posts_counter
  after_initialize :init

  def five_recent_comments
    comments.order('created_at Desc').limit(5)
  end

  private
  def update_posts_counter
    author.increment!(:posts_counters)
  end

  def init
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end
end
